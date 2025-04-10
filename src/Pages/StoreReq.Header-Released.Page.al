Page 52193927 "Store Req.Header-Released"
{
    PageType = Card;
    SourceTable = "Requisition Header1";
    SourceTableView = where("Requisition Type" = const("Store Requisition"),
                            Posted = const(false),
                            Status = const(Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reason; Reason)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProcurementPlan; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000016; "Store Requisition Line")
            {
                SubPageLink = "Requisition No" = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Requisition)
            {
                Caption = 'Requisition';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        if Status = Status::Open then
                            RequsitionLines.Reset;
                        RequsitionLines.SetRange(RequsitionLines."Requisition No", "No.");
                        if RequsitionLines.Find('-') then begin
                            repeat
                                QtyDiff := RequsitionLines."Quantity in Store" - RequsitionLines.Quantity;
                                if (RequsitionLines."Quantity in Store" < 0) or (QtyDiff < 0) then begin

                                    Message('Procurement Notified ! The stock item: %1 is out of stock, The quantity in store is %2 ,'
                                    , RequsitionLines.Description, RequsitionLines."Quantity in Store");

                                    // //Mail.NewIncidentMail('', RequsitionLines.Description + ' is Out of stock  ', "Employee Name"
                                    // + 'Has Requested' + Format(RequsitionLines.Quantity) + RequsitionLines.Description + ' but it is out of stock');
                                    exit;
                                end;
                            until RequsitionLines.Next = 0;
                        end;
                        //EXIT;




                        // //if ApprovalMgt.FindProbaApproverAppraisal(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.FinishProbApprovalEntryAppraisal(Rec, true, true) then;
                    end;
                }
                action(Issue)
                {
                    ApplicationArea = Basic;
                    Caption = 'Issue';
                    Image = ReleaseDoc;

                    trigger OnAction()
                    begin


                        if Status <> Status::Released then
                            Error('The Requisition cannot be posted before it is fully approved');



                        RequsitionLines.Reset;
                        RequsitionLines.SetRange(RequsitionLines."Requisition No", "No.");
                        if RequsitionLines.Find('-') then
                            repeat

                                ItemJournaline.Init;
                                ItemJournaline."Journal Template Name" := 'ITEM';
                                ItemJournaline."Journal Batch Name" := 'ISSUE';
                                ItemJournaline."Line No." := ItemJournaline."Line No." + 10000;
                                ItemJournaline."Posting Date" := Today;
                                ItemJournaline."Entry Type" := ItemJournaline."entry type"::"Negative Adjmt.";
                                ItemJournaline."Document No." := RequsitionLines."Requisition No";
                                ItemJournaline."External Document No." := RequsitionLines."Requisition No";
                                ItemJournaline."Item No." := RequsitionLines.No;
                                ItemJournaline.Validate(ItemJournaline."Item No.");
                                ItemJournaline.Quantity := RequsitionLines."Quantity Approved";
                                ItemJournaline.Validate(ItemJournaline.Quantity);
                                if ItemJournaline.Quantity <> 0 then
                                    ItemJournaline.Insert(true);
                            //ItemPostline.RUN(ItemJournaline);
                            until RequsitionLines.Next = 0;
                        ItemJournaline.SetRange(ItemJournaline."Journal Template Name", 'ITEM');
                        ItemJournaline.SetRange(ItemJournaline."Journal Batch Name", 'ISSUE');
                        Codeunit.Run(Codeunit::"Item Jnl.-Post+Print", ItemJournaline);
                        CurrentJnlBatchName := ItemJournaline.GetRangemax("Journal Batch Name");
                        Posted := true;
                        Modify;
                        CurrPage.Update(false);
                    end;
                }
            }
        }
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511004, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Issue_Promoted; Issue)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Requisition Type" := "requisition type"::"Store Requisition";
    end;

    trigger OnOpenPage()
    begin
        SetRange("Raised by", UserId);

        if UserSetup.Get(UserId) then begin

            if UserSetup."Approver ID" = UserId then
                SetRange("Raised by");
            // ApprovalTemplate.Reset;
            // // ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::Table59018);
            // ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
            // if ApprovalTemplate.Find('-') then begin
            //     AdditionalApprovers.Reset;
            //     AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
            //     AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID", UserId);
            //     if AdditionalApprovers.Find('+') then
            //         SetRange("Raised by");
            // end;
            // if ApprovalSetup.Get then
            //     if ApprovalSetup."Approval Administrator" = UserId then
            //         SetRange("Raised by");


            // ApprovalTemplate.Reset;
            // // ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::Table59018);
            // ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
            // if ApprovalTemplate.Find('-') then begin
            //     AdditionalApprovers.Reset;
            //     AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
            //     if AdditionalApprovers.Find('-') then
            //         repeat

            //             UserSetupRec.Reset;
            //             UserSetupRec.SetRange(UserSetupRec.Substitute, AdditionalApprovers."Approver ID");
            //             if UserSetupRec.Find('-') then
            //                 SetRange("Raised by");
            //         until AdditionalApprovers.Next = 0;

            //end;




        end;
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        RequsitionLines: Record "Requisition Lines1";
        ItemJournaline: Record "Item Journal Line";
        CurrentJnlBatchName: Code[10];
        ItemPostline: Codeunit "Item Jnl.-Post Line";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        QtyDiff: Integer;
        Mail: Codeunit Mail;
}

