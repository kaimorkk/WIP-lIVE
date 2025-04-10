page 52193512 "Training Approval Committee"
{
    Caption = 'Training Approval Committee';
    PageType = Card;
    SourceTable = "Training Approval Committee";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Committee; Rec.Committee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committee field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created by field.';
                }
            }
            part(Control25; "Training Approval Lines")
            {
                SubPageLink = "Document No" = field("No");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action("Import Lines")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Requests: Record "Training Requests";
                    Lines: Record "Training Approval Lines";
                begin
                    if Confirm('Do you want to import training application lines') then begin
                        Requests.Reset();
                        Requests.SetRange(Status, Requests.Status::"Pending Commitee");
                        if Requests.FindSet() then
                            repeat
                                Lines.init();
                                Lines."Document No" := Rec.No;
                                Lines."Application No" := Requests.Code;
                                Lines."Employee No" := Requests."Employee No.";
                                Lines."Employee Name" := Requests."Employee Name";
                                Lines.Course := Requests."Course Title";
                                Lines."Start Date" := Requests."Start Date";
                                Lines."End Date" := Requests."End Date";
                                Lines.Insert();
                            until Requests.Next() = 0;
                    end;
                end;

            }
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
            group(Category_Process)
            {
                actionref("Import Lines_Promoted"; "Import Lines")
                {
                }
            }
        }
    }
}
