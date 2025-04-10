page 51018 "Induction Card"
{
    Caption = 'Induction Card';
    PageType = Card;
    SourceTable = "Induction Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = Rec."Approval Status" = Rec."Approval Status"::Open;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    TableRelation = "Salary Scales";
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Cost Center Name"; Rec."Cost Center Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost Center Name field.';
                }
                field(Workplan; Rec.Workplan)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan field.';
                }

                field(Venue; Rec.Venue)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Line field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budgeted Amount field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Editable = false;
                }

                field("Employment Start Date"; Rec."Employment Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employment Start Date field.';
                    Caption = 'Employment Start Date';
                }
                field("Employment End Date"; Rec."Employment End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employment End Date field.';
                    Caption = 'Employment End Date';
                }
            }
            part(Control25; "Induction Lines")
            {
                Editable = Rec."Approval Status" = Rec."Approval Status"::Open;
                SubPageLink = "Induction No." = field("No.");
                ApplicationArea = All;
            }
            part(Control26; "Induction Curriculum")
            {
                SubPageLink = "Induction No." = field("No.");
                Editable = Rec."Approval Status" = Rec."Approval Status"::Open;
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50041),
                              "No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetEmployees)
            {
                Caption = 'Get Induction Employees';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if not Confirm('Do you want to import employees that are due for induction?') then
                        exit;
                    //Overwrite existing
                    Rec.TestField("Employment Start Date");
                    Rec.TestField("Employment End Date");

                    InductionLines.Reset();
                    InductionLines.SetRange("Induction No.", Rec."No.");
                    if InductionLines.FindSet() then
                        InductionLines.DeleteAll();

                    Rec.TestField("Start Date");
                    EmploymentDate := CalcDate('-3M', Rec."Start Date");
                    Employee.Reset;
                    // Employee.SetRange(Inducted, false);
                    Employee.setrange(Status, Employee.Status::Active);
                    if Rec."Job Grade" <> '' then
                        Employee.SetRange("Current Job Grade", Rec."Job Grade");
                    // Employee.SetRange("Employment Date", 0D, EmploymentDate);
                    Employee.SetRange("Employment Date", Rec."Employment Start Date", Rec."Employment End Date");

                    if Rec."Global Dimension 1 Code" <> '' then
                        Employee.SetRange("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                    if Employee.FindSet() then
                        repeat
                            InductionLines.Init();
                            InductionLines."Induction No." := Rec."No.";
                            InductionLines.Validate("Employee No.", Employee."No.");
                            InductionLines."Employee Name" := Employee.FullName();
                            InductionLines."Employment Date" := Employee."Employment Date";
                            InductionLines.Insert();


                        until Employee.Next() = 0;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Induction Feedback';
                Image = Evaluate;
                trigger OnAction()
                var
                    trainingeval: Record "Training Evaluation Header";
                begin
                    trainingeval.Reset();
                    trainingeval.SetRange("Document Type", trainingeval."Document Type"::Induction);
                    trainingeval.SetRange("Application Code", Rec."No.");
                    if trainingeval.FindFirst() then;
                    // Report.Run(report::"Induction Evaluation Responses", true, true, trainingeval);
                end;

            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Process)
            {
                actionref(GetEmployees_Promoted; GetEmployees)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    var
        Employee: Record Employee;
        EmploymentDate: Date;
        InductionLines: Record "Induction Lines";
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}
