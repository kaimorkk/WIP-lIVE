

page 80222 "Approved Internal Policy Card1"
{
    PageType = Card;
    SourceTable = Policy;
    SourceTableView = where(Type = const(Internal));

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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("External Ref No"; Rec."External Ref No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Ref No field.';
                }
                field("Policy Dev Institution ID"; Rec."Policy Dev Institution ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Dev Institution ID field.';
                }
                field("Policy Overview"; Rec."Policy Overview")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Overview field.';
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Goal field.';
                }
                field("Policy Purpose"; Rec."Policy Purpose")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Purpose field.';
                }
                field("Policy Rationale"; Rec."Policy Rationale")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Rationale field.';
                }
                field("Policy Scope"; Rec."Policy Scope")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Scope field.';
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
                    ToolTip = 'Specifies the value of the Process Owner Name field.';
                }
                field("Process Owner Title"; Rec."Process Owner Title")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the value of the Approver Name field.';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part(Control42; "Policy Thematic Area")
            {
                Caption = 'Policy Thematic AreaS';
                SubPageLink = "Policy ID" = field(Code);
                ApplicationArea = Basic;
            }
            group("Key Dates")
            {
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Drafting Date"; Rec."Drafting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Drafting Date field.';
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
                    ToolTip = 'Specifies the value of the Employee Attestation Due Date field.';
                }
            }
            group("Company Information")
            {
                Caption = 'Organization Information';
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
                    Caption = 'Organiation Core Values';
                    Image = PostDocument;
                    RunObject = Page "Policy Core Value";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Organiation Core Values action.';
                }
                action("Policy Objectives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Objectives';
                    Image = PostDocument;
                    RunObject = Page "Policy Objectives";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Objectives action.';
                }
                action("Policy Guiding Principle")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Guiding Principle';
                    Image = PostDocument;
                    RunObject = Page "Policy Guiding Principle";
                    RunPageLink = "Policy ID" = field(Code);
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
                action("Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Stakeholder';
                    Image = PostDocument;
                    RunObject = Page "Policy Stakeholder";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Stakeholder action.';
                }
                action("Policy Information Sources")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    RunObject = Page "Policy Information Sources";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Information Sources action.';
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
                    Message('Testing');
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Generate Attestation Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Circulation Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    //     RunObject = Report "Create Attestation Invites";
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
                actionref("Policy Stakeholder_Promoted"; "Policy Stakeholder")
                {
                }
                actionref("Policy Information Sources_Promoted"; "Policy Information Sources")
                {
                }
                actionref("Policy Committee Member_Promoted"; "Policy Committee Member")
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

