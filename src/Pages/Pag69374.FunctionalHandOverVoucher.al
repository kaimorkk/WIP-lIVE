page 69374 "Functional Hand Over Voucher"
{
    PageType = Card;
    SourceTable = "Employee Exit header";
    Caption = 'Clearance Form';
    layout
    {
        area(content)
        {
            group(General)
            {
                //Editable = false;
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNames; "Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ExitMethod; "Exit Method")
                {
                    ApplicationArea = Basic;
                }
                field(JobId; "Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReasonsCode; "Reasons Code")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDirectorate; "Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDirectorateName; "Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDepartment; "Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDepartmentName; "Primary Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibleEmployee; "Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Important Dates")
            {
                //Editable = false;
                field(DateofJoin; "Date of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LastworkingDate; "Last working Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoticeDate; "Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeExitDate; "Employee Exit Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Statistics)
            {
                Editable = false;
                field(NoofHandOverNotes; "No of Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofOpenHandOverNotes; "No of Open Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofOpenHandClearedNotes; "No of Open Hand Cleared Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Section)
            {
                Caption = 'Clearing Section';

                field("Clearing Section"; Rec."Clearing Section")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Clearing Section field.', Comment = '%';
                }
            }
            part(Control23; "Hand Over Item Lines")
            {
                SubPageLink = "Exit Header No" = field("Document No."), Type = field("Clearing Section");
                ApplicationArea = All;
            }
        }
        area(FactBoxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Employee Exit header"),
                              "No." = field("Document No.");
            }
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
            }
            action("Confirm Hand Over")
            {
                ApplicationArea = Basic;
                Image = Confirm;
                Visible = false;

                trigger OnAction()
                begin
                    HandoverItemLines.Reset;
                    HandoverItemLines.SetRange("Exit Header No", "Document No.");
                    HandoverItemLines.SetRange("Primary Department", "Primary Department");
                    if HandoverItemLines.FindSet then begin
                        repeat
                            if HandoverItemLines.Receiveved = false then
                                Error('each Item must be recieved');
                        until HandoverItemLines.Next = 0;
                    end;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Visible = false;

                trigger OnAction()
                begin
                    //ApprovalMgt.SendFATRANSFERRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                trigger OnAction()
                begin
                    // Rec.Reset();
                    // Rec.SetRange("Document No.", Rec."Document No.");
                    // report.Run(Report::"Clearance Certificate", true, false, Rec);
                end;
            }
            action(Start)
            {
                ApplicationArea = Basic;
                Caption = 'Initiate Handover';
                Image = PrintForm;
                trigger OnAction()
                var
                    Form: Record "Clearance Form Setup";
                    Lines: Record "Hand over Item Lines";
                begin
                    Form.Reset();
                    if Form.FindSet() then
                        repeat
                            Lines.Init();
                            Lines."Exit Header No" := Rec."Document No.";
                            Lines."Document Type" := Lines."Document Type"::"Exit Voucher";
                            Lines.Type := Form.Section;
                            Lines.No := Form.Description;
                            Lines."Line No" := Form."Entry No";
                            Lines.Insert();
                        until Form.Next() = 0;

                end;
            }
            action(Clear)
            {
                ApplicationArea = Basic;
                Caption = 'Clear Employee';
                Image = PrintForm;
                trigger OnAction()
                var
                    Form: Record "Clearance Form Setup";
                    Lines: Record "Hand over Item Lines";
                    UserSetup: Record "User Setup";
                begin
                    if Rec."Clearing Section" = Rec."Clearing Section"::Payroll then begin
                        Lines.Reset();
                        Lines.SetRange("Exit Header No", Rec."Document No.");
                        Lines.SetFilter(Type, '<>%1', Lines.Type::Payroll);
                        Lines.SetRange("Clearing Employee", '');
                        if Lines.FindFirst() then
                            Error('The employee has not been cleared by %1', Lines.Type);
                    end;
                    Lines.Reset();
                    Lines.SetRange(Type, Rec."Clearing Section");
                    Lines.SetRange("Exit Header No", Rec."Document No.");
                    if Lines.FindSet() then
                        repeat
                            Lines."Received By" := UserId;
                            if UserSetup.Get(Userid) then begin
                                Lines."Employee Name" := UserSetup."Employee Name";
                                Lines."Clearing Employee" := UserSetup."Employee No.";
                                Lines."Received Date" := Today;

                            end;
                            Lines.Modify();
                        until Lines.Next() = 0;
                    Message('Employee has been cleared successfully by %1', Rec."Clearing Section");
                    Lines.Reset();
                    Lines.SetRange("Exit Header No", Rec."Document No.");
                    Lines.SetFilter("Clearing Employee", '<>%1', '');
                    if Lines.IsEmpty then begin
                        Rec.Cleared := true;
                        Rec.Modify();
                        Message('The employee has been fully cleared!!');
                    end;
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Confirm Hand Over_Promoted"; "Confirm Hand Over")
                {
                }
                actionref(Start_Promoted; Start)
                {
                }
                actionref(Clear_Promoted; Clear)
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        "Document Type" := "document type"::"Hand Over Voucher";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Hand Over Voucher";
    end;

    trigger OnOpenPage()
    begin
        "Document Type" := "document type"::"Hand Over Voucher";
    end;

    var
        Recruitment: Codeunit Recruitment;
        HandoverItemLines: Record "Hand over Item Lines";
}

