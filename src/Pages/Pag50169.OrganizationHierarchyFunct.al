page 50169 "Organization Hierarchy Funct"
{
    Caption = 'Functional Organization Hierarchy Header';
    PageType = Card;
    SourceTable = "Organization Hierarchy Header";
    SourceTableView = where("Structure Type" = filter(Functional));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No"; Rec."Document No")
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Structure Type"; Rec."Structure Type")
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Structure Type field.';
                }
                field("Implementing Unit"; "Implementing Unit")
                {
                    ApplicationArea = All;
                }
                field("Implementing Unit Name"; "Implementing Unit Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Done By"; Rec."Done By")
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Done By field.';
                }
                field(Status; Rec.Status)
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }


            }

            part("Organization Hierarchy"; "Organization Hierarchy")
            {
                SubPageLink = "Document No." = field("Document No"), "Structure Type" = field("Structure Type");
                ApplicationArea = All;
            }


        }

        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50040),
                              "No." = field("Document No");
            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
            }
        }


    }
    actions
    {


        area(Creation)
        {


            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                        //Status := Status::Approved;
                    end;


                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                        ;
                        WorkflowWebhookManagement.FindAndCancel(RECORDID);
                    end;
                }
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

        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
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
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        myInt: Integer;
    begin
        "Structure Type" := "Structure Type"::Functional;
        Description := 'Functional Organization Structure';

    end;

    var
        StaffEstablishmentTaskLines: Record "Establishment Plan Position";
        Positions: Record "Company Positions";
        EntryNo: Integer;
        CadreHeader: Record "Cadre Header";
        HRSetup: Record "Human Resources Setup";
        VarVariant: Variant;
}
