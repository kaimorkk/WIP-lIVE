page 50330 "Tyre Requisition"
{
    Caption = 'Tyre Requisition';
    PageType = Card;
    SourceTable = "Tyre Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }

                field("Reg No."; Rec."Reg No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reg No. field.';
                }

                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                    Caption = 'Make/Model';
                }
                field("Current Mileage"; Rec."Current Mileage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Mileage field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User field.';

                }

                field("Replacement Date"; Rec."Replacement Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Replacement Date field.';

                }
                field(Mileage; Rec.Mileage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage field.';
                }
                field(Reasons; Rec.Reasons)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reasons field.';
                    Caption = 'Replacement Reasons';
                }



            }

            part("Tyre Requisition Lines"; "Tyre Requisition Lines")
            {
                Caption = 'Tyre Requisition Lines';
                SubPageLink = "Lines No" = field("No.");
                ApplicationArea = All;
            }

            group(Officers)
            {

                field(Requester; Rec.Requester)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requester field.';
                }

                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mobile No. field.';
                    Caption = 'Requestor Mobile Number';
                }
                field("Transport Officer"; Rec."Transport Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Officer field.';

                }
                field("Issuing Officer"; Rec."Issuing Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issuing Officer field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
            }



        }


    }

    actions
    {

        area(navigation)
        {


            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    //Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        // ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    // Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        // ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }



            }




        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category9)
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



}
