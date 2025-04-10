page 52193509 "Training Application External"
{
    Caption = 'Self-Sponsored Training Applications';
    PageType = Card;
    SourceTable = "Training Requests";

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
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee Department"; Rec."Employee Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Training Responsibility Code field.';
                }
                field("Training Responsibility"; Rec."Training Responsibility")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Training Responsibility field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
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
                    Caption = 'Duration (Days)';
                }

                field("Provider Name"; Rec."Provider Name")
                {
                    Caption = 'Venue';
                    ApplicationArea = Basic;
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;

                }
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Category field.';
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
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = All;
                    Caption = 'Training Cost';
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Training Time"; Rec."Training Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Time field.';
                }
                field("Training Types"; Rec."Training Types")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Types field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }

            }
        }

    }
    actions
    {
        area(Creation)
        {

            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                //Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Purpose);
                    Rec.TestField("Training Time");
                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                //Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Funding Source" := Rec."Funding Source"::Self;
        Rec."Created By" := UserId;
        Rec."Created On" := Today;

    end;
}
