Page 52193947 "Store Requisition Approval"
{
    PageType = Card;
    SourceTable = "Requisition Header1";
    // SourceTableView = where("Requisition Type" = const(Contributions),
    //                         Posted = const(false),
    //                         Status = filter(<> Archived));

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
                    Editable = true;
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
                    Visible = false;

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

                                    // Mail.NewIncidentMail('', RequsitionLines.Description + ' is Out of stock  ', "Employee Name"
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
                    Visible = false;

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
                    Visible = true;

                    trigger OnAction()
                    begin


                        RequsitionLines.Reset;
                        RequsitionLines.SetRange(RequsitionLines."Requisition No", "No.");
                        if RequsitionLines.Find('-') then begin
                            repeat
                                QtyDiff := RequsitionLines."Quantity in Store" - RequsitionLines.Quantity;
                                if (RequsitionLines."Quantity in Store" < 0) or (QtyDiff < 0) then begin

                                    Message('Procurement Notified ! The stock item: %1 is out of stock, The quantity in store is %2 ,'
                                    , RequsitionLines.Description, RequsitionLines."Quantity in Store");

                                    // Mail.NewIncidentMail('deborah.masara@attain-es.com', RequsitionLines.Description + ' is Out of stock  ', "Employee Name"
                                    // + 'Has Requested' + Format(RequsitionLines.Quantity) + RequsitionLines.Description + ' but it is out of stock');
                                    exit;
                                end;
                            until RequsitionLines.Next = 0;
                        end;


                        if Posted then
                            Error('Requisition %1 is already posted', "No.");

                        if Status <> Status::Released then
                            Error('The Requisition cannot be posted before it is fully approved');


                        RequsitionLines.Reset;
                        RequsitionLines.SetRange(RequsitionLines."Requisition No", "No.");
                        if RequsitionLines.Find('-') then
                            repeat

                                RequsitionLines.Validate(Quantity);

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

                        ItemLedger.Reset;
                        ItemLedger.SetRange(ItemLedger."Entry Type", ItemLedger."entry type"::"Negative Adjmt.");
                        ItemLedger.SetRange(ItemLedger."Document No.", "No.");
                        if ItemLedger.Find('-') then begin

                            Posted := true;
                            Modify;
                            CurrPage.Update(false);
                        end;
                    end;
                }
                action(Archive1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';
                    Visible = true;

                    trigger OnAction()
                    begin
                        Archive();
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
            group(Attachments)
            {
                Caption = '&Attachments';
                Visible = true;
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Reason;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Reason;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Reason;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
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
        // "Requisition Type" := "requisition type"::Contributions;
    end;

    trigger OnOpenPage()
    begin
        /*
         SETRANGE("Raised by",USERID);

        IF UserSetup.GET(USERID) THEN
        BEGIN

        IF UserSetup."Approver ID"=USERID THEN
        SETRANGE("Raised by");
        ApprovalTemplate.RESET;
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
        ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
        IF ApprovalTemplate.FIND('-') THEN
        BEGIN
        AdditionalApprovers.RESET;
        AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
        AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
        IF AdditionalApprovers.FIND('+') THEN
        SETRANGE("Raised by");
        END;
        IF ApprovalSetup.GET THEN
        IF ApprovalSetup."Approval Administrator"=USERID THEN
        SETRANGE("Raised by");


        ApprovalTemplate.RESET;
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
        ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
        IF ApprovalTemplate.FIND('-') THEN
        BEGIN
        AdditionalApprovers.RESET;
        AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
        IF AdditionalApprovers.FIND('-') THEN
        REPEAT

         UserSetupRec.RESET;
         UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
         IF UserSetupRec.FIND('-') THEN
         SETRANGE("Raised by");
        UNTIL AdditionalApprovers.NEXT=0;

        END;




        END;
     */

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
        ItemLedger: Record "Item Ledger Entry";
        Trash: Record "Requisition Header1";


    procedure Archive()
    begin

        if Rec.Status = Rec.Status::Open then begin
            Trash.Reset;
            Trash.SetRange(Trash."No.", Rec."No.");
            Rec.Status := Rec.Status::Archived;
            Rec."Document Type" := Rec."document type"::"Purchase Requisition";
            Modify;
            Message('The Stores Requisition has been Archived');
        end;
    end;
}

