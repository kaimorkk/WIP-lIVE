

page 69221 "Training Requisition"
{
    PageType = Card;
    SourceTable = "Training Requests";
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DStatus;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Plan No."; Rec."Training Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Department"; Rec."Employee Department")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Start DateTime"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    Caption = 'Duration (Days)';
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    ApplicationArea = All;
                    Caption = 'Duration';
                    ToolTip = 'Specifies the value of the Duration Type field.';
                }
                field("Training Region"; Rec."Training Region")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Region field.';
                }

                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Venue Region Code"; Rec."Training Venue Region Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Venue';
                }
                field("Training Venue Region"; Rec."Training Venue Region")
                {
                    ApplicationArea = Basic;
                    Caption = 'Venue Name';
                    Editable = false;

                }
                field("Training Responsibility Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Responsibility"; Rec."Training Responsibility")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Center Name';
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Training Duration Hrs"; Rec."Training Duration Hrs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Budget"; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned No. to be Trained"; Rec."Planned No. to be Trained")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Procurement Cost"; Rec."Total Procurement Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Other Costs"; Rec."Other Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Applying Employee';
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
            part(Control37; "Training Participants List")
            {
                Enabled = DStatus;
                SubPageLink = "Training Code" = field(Code);
                ApplicationArea = Basic;
            }
            group(Bonding)
            {
                Editable = false;
                field(Bonded; Rec.Bonded)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonded field.';
                }
                field("Bonding Period"; Rec."Bonding Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonding Period field.';
                }
                field("Expected Bond End"; Rec."Expected Bond End")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Bond End field.';
                }
                field("Expected Bond Start"; Rec."Expected Bond Start")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Bond Start field.';
                }
                field("Bond Penalty"; Rec."Bond Penalty")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bond Penalty field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {

            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        DocumentType: Enum "Approval Document Type";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        // DocumentType := DocumentType::"Training Application";
                        // ApprovalEntries.SetRecordFilters(DATABASE::"Training Requests", DocumentType, Rec.Code);
                        // ApprovalEntries.RUN;

                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to send training request for approval?') then begin
                            VarVariant := Rec;
                            if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                                ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                        end
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;

                    trigger OnAction()
                    begin


                        HRTrainingApplications.SetRange(HRTrainingApplications.Code, Rec.Code);
                        if HRTrainingApplications.Find('-') then
                            Report.Run(69122, true, true, HRTrainingApplications);
                    end;
                }

                action(ImportParticipants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Participants';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter(Code, Rec.Code);
                        Report.Run(69120, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = Calculate;
                    RunObject = Page "Training Cost";
                    RunPageLink = "Training ID" = field(Code);
                }
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                Visible = false;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Training Costs_Promoted"; "Training Costs")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Reports', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approvals', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        DStatus := true;
        if Rec.Status = Rec.Status::"Pending Approval" then
            DStatus := false;
    end;

    trigger OnOpenPage()
    begin
        DStatus := true;
        if Rec.Status = Rec.Status::"Pending Approval" then
            DStatus := false;
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "Training Requests";
        ApprovalComments: Page "Approval Comments";

        "Responsibility CenterEditable": Boolean;

        "Application NoEditable": Boolean;

        "Employee No.Editable": Boolean;

        "Employee NameEditable": Boolean;

        "Employee DepartmentEditable": Boolean;

        "Purpose of TrainingEditable": Boolean;

        "Course TitleEditable": Boolean;
        HRTrainingNeed: Record "Job Advert Header";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        CashMgt: Record "Cash Management Setup";
        ImpNo: Code[30];
        NotificationManagement: Codeunit "Notification Management";
        FileLocation: Text;
        Email1: Text;
        DStatus: Boolean;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
}

#pragma implicitwith restore

