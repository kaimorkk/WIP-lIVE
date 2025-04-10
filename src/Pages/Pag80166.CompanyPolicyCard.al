

page 80166 "Company Policy Card"
{
    PageType = Card;
    SourceTable = Policy;
    SourceTableView = where(Type = const(Internal),
                            "Approval Status" = const(Open));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Ref No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Policy Ref No field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Policy Ref No"; Rec."Policy Ref No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Policy Ref No field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field("External Ref No"; Rec."External Ref No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the External Ref No field.';
                }
                field("Policy Overview"; Rec."Policy Overview")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Overview field.';
                }
                field("Policy Purpose"; Rec."Policy Purpose")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Purpose field.';
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Objectives';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Objectives field.';
                }
                field("Policy Dev Institution ID"; Rec."Policy Dev Institution ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Policy Dev Institution ID field.';
                }
                field("Policy Scope"; Rec."Policy Scope")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Scope field.';
                }
                field("Policy Rationale"; Rec."Policy Rationale")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Guidelines';
                    MultiLine = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Policy Guidelines field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Process Owner ID"; Rec."Process Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Owner ID field.';
                }
                field("Process Owner Name"; Rec."Process Owner Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Process Owner Name field.';
                }
                field("Process Owner Title"; Rec."Process Owner Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Process Owner Title field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
                field("Approver Name"; Rec."Approver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approver Name field.';
                }
                field("Total Implementation status %"; Rec."Total Implementation status %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Implementation status % field.';
                }
                field("Policy Stage"; Rec."Policy Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Stage field.';
                }
                field("No. of Policy Revisions"; Rec."No. of Policy Revisions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Policy Revisions field.';
                }
                field("Employee Policy Attestations"; Rec."Employee Policy Attestations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Policy Circulation';
                    ToolTip = 'Specifies the value of the Employee Policy Circulation field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part("External Reference Links"; "Policy Information Sources")
            {
                Caption = 'External Reference Links';
                SubPageLink = "Policy ID" = field(Code);
                ApplicationArea = Basic;
            }
            part(Control55; "Related Policies")
            {
                ApplicationArea = Basic;
            }
            part(Control42; "Policy Thematic Area")
            {
                Caption = 'Policy Thematic Area';
                SubPageLink = "Policy ID" = field(Code);
                ApplicationArea = Basic;
            }
            group("Key Dates")
            {
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Date field.';
                }
                field("Last Revision Date"; Rec."Last Revision Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Revision Date field.';
                }
                field("Employee Attestation Due Date"; Rec."Employee Attestation Due Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Circulation  Date';
                    ToolTip = 'Specifies the value of the Circulation  Date field.';
                }
                field("Policy Duration"; Rec."Policy Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Duration field.';
                }
                field("Drafting Date"; Rec."Drafting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Expiry Date';
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
            }
            group("Company Information")
            {
                Caption = 'Kasneb  Information';
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision Statement field.';
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission Statement field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Performance)
            {
                Caption = 'Performance';
                Image = Vendor;
                action("Policy Core Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Organization Core Values';
                    Image = PostDocument;
                    RunObject = Page "Core Values";
                    ToolTip = 'Executes the Organization Core Values action.';
                }
                action("Policy Objectives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Objectives';
                    Image = PostDocument;
                    RunObject = Page "Policy Objectives";
                    RunPageLink = "Policy ID" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Policy Objectives action.';
                }
                action("Policy Guiding Principle")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Guiding Principle';
                    Image = PostDocument;
                    RunObject = Page "Policy Guiding Principle";
                    RunPageLink = "Policy ID" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Policy Guiding Principle action.';
                }
                action("Policy Related Framework")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Related Framework';
                    Image = PostDocument;
                    RunObject = Page "Policy Related Framework";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Related Framework action.';
                }
                separator(Action49)
                {
                }
                action("Policy Development Partners")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Development Partners';
                    Image = PostDocument;
                    RunObject = Page "Policy Development Institution";
                    ToolTip = 'Executes the Policy Development Partners action.';
                }
                action("Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Stakeholder';
                    Image = PostDocument;
                    ToolTip = 'Executes the Policy Stakeholder action.';
                }
                action("Policy Committee Member")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    RunObject = Page "Policy Committee Member";
                    RunPageLink = "Policy ID" = field(upperlimit(Code));
                    ToolTip = 'Executes the Policy Committee Member action.';
                }
            }
            separator(Action23)
            {
            }
            action("Related Policies")
            {
                ApplicationArea = Basic;
                Caption = 'Related Internal Policies';
                Image = PostMail;
                RunObject = Page "Related Policies";
                RunPageLink = "Main Policy" = field(Code);
                Visible = false;
                ToolTip = 'Executes the Related Internal Policies action.';
            }
            separator(Action27)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Document has been approved Automatically');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //ApprovalsMgmt.""(Rec);*/
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action21)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    //MESSAGE('Testing');
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(80014, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Employees to be notified")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees to be notified';
                    Image = Allocations;
                    RunObject = Page "Notify Employees(Policy Check)";
                    RunPageLink = "Document No." = field(Code);
                    ToolTip = 'Executes the Employees to be notified action.';
                }
                action("Generate Attestation Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Circulation Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    //    RunObject = Report "Create Attestation Invites";
                    ToolTip = 'Generate Attestation Invites';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                    end;
                }
                action("Attestation Invitations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Circulation  Invitations';
                    Image = Allocations;
                    RunObject = Page "Attestation Invitations";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Circulation  Invitations action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Policy Core Value_Promoted"; "Policy Core Value")
                {
                }
                actionref("Policy Objectives_Promoted"; "Policy Objectives")
                {
                }
                actionref("Policy Guiding Principle_Promoted"; "Policy Guiding Principle")
                {
                }
                actionref("Policy Related Framework_Promoted"; "Policy Related Framework")
                {
                }
                actionref("Policy Development Partners_Promoted"; "Policy Development Partners")
                {
                }
                actionref("Policy Stakeholder_Promoted"; "Policy Stakeholder")
                {
                }
                actionref("Policy Committee Member_Promoted"; "Policy Committee Member")
                {
                }
                actionref("Related Policies_Promoted"; "Related Policies")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Employees to be notified_Promoted"; "Employees to be notified")
                {
                }
                actionref("Generate Attestation Invites_Promoted"; "Generate Attestation Invites")
                {
                }
                actionref("Attestation Invitations_Promoted"; "Attestation Invitations")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Internal;
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::Internal;
    end;

    var
        PolicyVersion: Record "Policy Version";
}

#pragma implicitwith restore

