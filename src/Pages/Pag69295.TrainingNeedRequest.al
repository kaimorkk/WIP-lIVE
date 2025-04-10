

page 69295 "Training Need Request"
{
    PageType = Card;
    SourceTable = "Training Needs Header1";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Duty Station"; Rec."Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = All;
                    Editable=false;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                // field("Date of First Appointment"; Rec."Date of First Appointment")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purpose';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employment Date field.';
                }

                field("Training Plan No"; Rec."Training Plan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
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
            }
            group("Training Needs")
            {

                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
            part(Control9; "Need Requests")
            {
                SubPageLink = "Training Header No." = field(Code);
                ApplicationArea = Basic;
                Visible = false;
            }
            // part(Control19; "Training History")
            // {
            //     // SubPageLink = "Training No" = field(Code), "Employee No" = field("Employee No");
            //     // ApplicationArea = Basic;
            // }
            part(Control20; "Current Skills Assessment")
            {
                SubPageLink = "Training No" = field(Code);
                ApplicationArea = Basic;
            }
            part(TNAQ; "TNA Questions")
            {
                SubPageLink = "Training No" = field(Code);
                ApplicationArea = Basic;
            }

        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; MyNotes)
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
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Dimensions;
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    // Report.Run(Report::"Draft TNA Form", true, true, Rec)
                end;

            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Submit';
                Image = Dimensions;
                trigger OnAction()
                var

                begin
                    if not Confirm('Do you want to submit your application to the head of your department?') then begin
                        Message('Action Aborted');
                        exit;
                    end;
                    if Rec.Submitted then
                        Error('The training needs have already been submitted');
                    Rec.TestField("Employee No");
                    Rec.TestField("Course ID");
                    Rec.TestField("Duty Station");
                    Rec.TestField("Financial Year");

                    TrainingNeedsRequests.Init();
                    TrainingNeedsRequests."Course ID" := Rec."Course ID";
                    TrainingNeedsRequests.Description := Rec."Course Description";
                    TrainingNeedsRequests.Department := Rec.Department;
                    TrainingNeedsRequests."Duty Station" := Rec."Duty Station";
                    TrainingNeedsRequests."Employee No" := Rec."Employee No";
                    TrainingNeedsRequests."Employee Name" := Rec."Employee Name";
                    TrainingNeedsRequests."Job Title" := Rec."Job Title";
                    TrainingNeedsRequests.Source := Rec.Source;
                    TrainingNeedsRequests."Financial Year" := Rec."Financial Year";
                    TrainingNeedsRequests."Training Header No." := Rec.Code;
                    if TrainingNeedsRequests.Insert(true) then begin
                        Rec.Submitted := true;
                        Message('Your request has been submitted.');
                    end;
                end;

            }
            group("Need Application")
            {
                Caption = 'Need Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        docu: enum "Approval Document Type";
                    begin
                        Docu := Docu::"Training Needs";
                        ApprovalEntries.SetRecordFilters(Database::"Training Needs Header", docu, Rec.Code);
                        ApprovalEntries.Run;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Visible = false;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you want to send training need request for approval?') then begin
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
                    Enabled = true;
                    Image = Cancel;
                    Visible = false;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Visible = false;
                    //Visible = Rec.Status = Rec.Status::Released;

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        Rec.TestField("Training Plan No");
                        TrainingNeedsRequests.Reset;
                        TrainingNeedsRequests.SetRange("Training Header No.", Rec.Code);
                        if TrainingNeedsRequests.FindSet then begin
                            repeat
                                TrainingPlanLines.Reset;
                                TrainingPlanLines.SetRange("Training Plan Code", Rec."Training Plan No");
                                TrainingPlanLines.SetRange("Course Title", TrainingNeedsRequests."Course ID");
                                if not TrainingPlanLines.FindSet then begin
                                    TrainingPlanLines2.Init;
                                    TrainingPlanLines3.Reset;
                                    if TrainingPlanLines3.FindLast then
                                        TrainingPlanLines2."Task No" := TrainingPlanLines3."Task No" + 1;
                                    TrainingPlanLines2."Training Plan Code" := Rec."Training Plan No";
                                    TrainingPlanLines2."Course Title" := TrainingNeedsRequests."Course ID";
                                    TrainingPlanLines2."Course Description" := TrainingNeedsRequests.Description;
                                    TrainingPlanLines2.Insert(true);
                                end;
                                TrainingNeedsRegister.Init;
                                TrainingNeedsReg.Reset;
                                if TrainingNeedsReg.FindLast then
                                    TrainingNeedsRegister."Entry No." := TrainingNeedsReg."Entry No." + 1;
                                TrainingNeedsRegister."Training Plan No" := Rec."Training Plan No";
                                TrainingNeedsRegister."Course ID" := TrainingNeedsRequests."Course ID";
                                TrainingNeedsRegister.Description := TrainingNeedsRequests.Description;
                                TrainingNeedsRegister.Source := TrainingNeedsRequests.Source;
                                TrainingNeedsRegister.Comments := TrainingNeedsRequests.Comments;
                                TrainingNeedsRegister."Training Header No." := Rec.Code;
                                TrainingNeedsRegister."Employee No" := Rec."Employee No";
                                TrainingNeedsRegister."Employee Name" := Rec."Employee Name";
                                TrainingNeedsRegister.Insert(true);
                            until TrainingNeedsRequests.Next = 0;
                        end;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Message('Posted Successfully');
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Post_Promoted; Post)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Submit_Promoted; Submit)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Plan: Record "Training Plan Header";
    begin
        Plan.Reset();
        Plan.SetRange("Approved Status", Plan."Approved Status"::Open);
        if Plan.FindFirst() then
            Rec."Training Plan No" := Plan.No
        else
            Error('There is no open training plan. Either the period for request submission has elapsed or not started. Please contact you training administrator.');
    end;

    var
        TrainingNeedsRegister: Record "Training Needs Register";
        TrainingNeedsRequests: Record "Training Needs Requests";
        TrainingNeedsReg: Record "Training Needs Register";
        TrainingPlanLines: Record "Training Plan Lines";
        TrainingNeedsReq: Record "Training Needs Requests";
        TrainingPlanLines2: Record "Training Plan Lines";
        TrainingPlanLines3: Record "Training Plan Lines";
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        Generalsetup: Record "General Ledger Setup";
        VarVariant: Variant;
}

#pragma implicitwith restore

