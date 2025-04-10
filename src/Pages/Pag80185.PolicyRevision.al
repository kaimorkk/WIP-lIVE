

page 80185 "Policy Revision"
{
    PageType = Card;
    SourceTable = "Policy Revision";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Revision No."; Rec."Revision No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Type"; Rec."Revision Type")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field("External Ref No"; Rec."External Ref No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Policy Dev Institution ID"; Rec."Policy Dev Institution ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Policy Overview"; Rec."Policy Overview")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Purpose"; Rec."Policy Purpose")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Objective';
                    MultiLine = true;
                }
                field("Policy Rationale"; Rec."Policy Rationale")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    MultiLine = true;
                    Visible = false;
                }
                field("Policy Scope"; Rec."Policy Scope")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Process Owner ID"; Rec."Process Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field("Process Owner Name"; Rec."Process Owner Name")
                {
                    ApplicationArea = Basic;
                }
                field("Process Owner Title"; Rec."Process Owner Title")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                }
                field("Approver Name"; Rec."Approver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Stage"; Rec."Policy Stage")
                {
                    ApplicationArea = Basic;
                }
                field("Total Implementation Status"; Rec."Total Implementation Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Implementation Status %';
                }
                field("Revised By"; Rec."Revised By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control10; "Policy Revision Info Sources")
            {
                SubPageLink = "Revision No." = field("Revision No."),
                              "Policy ID" = field("Policy ID");
                ApplicationArea = Basic;
            }
            part(Control11; "Policy Thematic Area Revision")
            {
                SubPageLink = "Policy ID" = field("Policy ID"),
                              "Revision No." = field("Revision No.");
                ApplicationArea = Basic;
            }
            group("Key Dates")
            {
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Date"; Rec."Revision Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Duration"; Rec."Policy Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(creation)
        {
            group(Entities)
            {
                Caption = 'Entities';
                action("Policy Core Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Core Values';
                    Image = PostDocument;
                    RunObject = Page "Policy Core Value Revisions";
                    //  RunPageLink = "Score (%)" = field("Revision No.");
                }
                action("Policy Objective Revision")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    RunObject = Page "Policy Objective Revision";
                    RunPageLink = "Revision No." = field("Revision No.");
                }
                action("Revision Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    RunObject = Page "Policy Stakeholder Revision";
                    RunPageLink = "Revision No." = field("Revision No."),
                                  "Policy ID" = field("Policy ID");
                }
                action("Revision Policy Info Sources")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    RunObject = Page "Policy Revision Info Sources";
                    RunPageLink = "Revision No." = field("Revision No."),
                                  "Policy ID" = field("Policy ID");
                }
                action("Policy Revision Committee")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    RunObject = Page "Policy Revision Committee";
                    RunPageLink = "Revision No." = field("Revision No."),
                                  "Policy ID" = field("Policy ID");
                }
                action("Policy Guiding Principle")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Guiding Principle';
                    Image = PostDocument;
                    RunObject = Page "Policy Guiding Principle Rev";
                    RunPageLink = "Revision No." = field("Revision No.");
                }
                action("Policy Related Framework")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy Related Framework';
                    Image = PostDocument;
                    RunObject = Page "Policy Related Framework Rev";
                    RunPageLink = "Revision No." = field("Revision No.");
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approval;

                    trigger OnAction()
                    begin
                        // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin

                        Rec."Approval Status" := Rec."approval status"::Released;
                        Rec.Modify;

                        Message('Document has been approved Automatically');

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;

                    trigger OnAction()
                    begin
                        if (Rec."Approval Status" = Rec."approval status"::Released) then
                            Rec."Approval Status" := Rec."approval status"::Open;
                        Rec.Modify;
                        Message('Document has been Re-Opened');
                    end;
                }
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Update Policy ")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Update Policy';
                    Ellipsis = true;
                    Image = CreateDocument;
                    ToolTip = 'Update Policy';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        Policy.Reset;
                        Policy.SetRange(Code, Rec."Policy ID");
                        if Policy.Find('-') then begin
                            Policy."Policy Name" := Rec."Policy Name";
                            Policy."External Ref No" := Rec."External Ref No";
                            Policy."Policy Dev Institution ID" := Rec."Policy Dev Institution ID";
                            Policy."Policy Overview" := Rec."Policy Overview";
                            Policy."Policy Goal" := Rec."Policy Goal";
                            Policy."Policy Purpose" := Rec."Policy Purpose";
                            Policy."Policy Rationale" := Rec."Policy Rationale";
                            Policy."Policy Scope" := Rec."Policy Scope";
                            Policy."Primary Directorate" := Rec."Primary Directorate";
                            Policy."Primary Department" := Rec."Primary Department";
                            Policy."Policy Stage" := Rec."Policy Stage";
                            Policy.Modify;
                        end;

                        PolicyVersion.Reset;
                        PolicyVersion.SetRange("Policy Id", Rec."Policy ID");
                        if PolicyVersion.Find('-') then begin
                            VersionNumber := PolicyVersion."Version Id";
                        end;

                        PolicyVersion.Init;
                        PolicyVersion."Policy Id" := Rec."Policy ID";
                        PolicyVersion."Version Id" := VersionNumber + 1;
                        PolicyVersion.Description := Rec."Policy Name";
                        PolicyVersion."Revision Date" := Today;
                        PolicyVersion."Policy Revision Code" := Rec."Revision No.";
                        PolicyVersion.Insert;

                        PolicyObjectiveRevision.Reset;
                        PolicyObjectiveRevision.SetRange("Revision No.", Rec."Revision No.");
                        if PolicyObjectiveRevision.FindFirst then begin
                            repeat
                                PolicyObjective.Reset;
                                PolicyObjective.SetRange("Policy ID", PolicyObjectiveRevision."Policy ID");
                                PolicyObjective.SetRange(Code, PolicyObjectiveRevision.Code);
                                if PolicyObjective.Find('-') then begin
                                    PolicyObjective."Policy ID" := Rec."Policy ID";
                                    PolicyObjective.Code := PolicyObjectiveRevision.Code;
                                    PolicyObjective.Description := PolicyObjectiveRevision.Description;
                                    PolicyObjective.Modify;
                                end;
                            until PolicyObjectiveRevision.Next = 0;
                        end;


                        PolicyStakeholderRevision.Reset;
                        PolicyStakeholderRevision.SetRange("Revision No.", Rec."Revision No.");
                        if PolicyStakeholderRevision.FindFirst then begin
                            repeat
                                PolicyStakeholder.Reset;
                                PolicyStakeholder.SetRange("Policy ID", PolicyStakeholderRevision."Policy ID");
                                PolicyStakeholder.SetRange(Code, PolicyStakeholderRevision.Code);
                                if PolicyObjective.Find('-') then begin
                                    PolicyStakeholder.Code := PolicyStakeholderRevision.Code;
                                    PolicyStakeholder."Stakeholder Group ID" := PolicyStakeholderRevision."Stakeholder Group ID";
                                    PolicyStakeholder.Description := PolicyStakeholderRevision.Description;
                                    PolicyStakeholder.Modify;
                                end;


                                RevisionStakeholderRole.Reset;
                                RevisionStakeholderRole.SetRange("Revision No.", PolicyStakeholderRevision."Revision No.");
                                RevisionStakeholderRole.SetRange("Policy ID", Rec."Policy ID");
                                RevisionStakeholderRole.SetRange(Code, PolicyStakeholder.Code);
                                if RevisionStakeholderRole.Find('-') then begin
                                    repeat
                                        NextEntryNo := Rec.FnGetEntryNumber(PolicyStakeholderRole, Rec."Revision No.");
                                        if NextEntryNo = 0 then
                                            NextEntryNo := 1
                                        else
                                            NextEntryNo := NextEntryNo + 1;

                                        PolicyStakeholderRole.Init;
                                        PolicyStakeholderRole."Policy ID" := PolicyStakeholderRole."Policy ID";
                                        PolicyStakeholderRole.Code := PolicyStakeholderRole.Code;
                                        PolicyStakeholderRole."Entry No" := NextEntryNo;
                                        PolicyStakeholderRole.Responsibility := PolicyStakeholderRole.Responsibility;
                                        PolicyStakeholderRole.Insert;
                                    until PolicyStakeholderRole.Next = 0;
                                end;

                            until RevisionStakeholderRole.Next = 0;
                        end;

                        NextEntryNo := 0;
                        PolicyInformationSources.Reset;
                        PolicyInformationSources.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyInformationSources.Find('-') then begin
                            repeat
                                NextEntryNo := Rec.FnGetEntryNumber2(PolicyInformationSources, Rec."Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;

                                PolicyRevisionInfoSources.Init;
                                PolicyRevisionInfoSources."Revision No." := Rec."Revision No.";
                                PolicyRevisionInfoSources."Policy ID" := PolicyInformationSources."Policy ID";
                                PolicyRevisionInfoSources."Line No." := NextEntryNo;
                                PolicyRevisionInfoSources."Source Type" := PolicyInformationSources."Source Type";
                                PolicyRevisionInfoSources.Description := PolicyInformationSources.Description;
                                PolicyRevisionInfoSources."URL Link" := PolicyInformationSources."URL Link";
                                PolicyRevisionInfoSources.Insert;
                            until PolicyInformationSources.Next = 0;
                        end;

                        PolicyGuidingPrinciple.Reset;
                        PolicyGuidingPrinciple.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyGuidingPrinciple.Find('-') then begin
                            repeat
                                PolicyGuidingPrincipleRev.Init;
                                PolicyGuidingPrincipleRev."Revision No." := Rec."Revision No.";
                                PolicyGuidingPrincipleRev."Policy ID" := PolicyGuidingPrinciple."Policy ID";
                                PolicyGuidingPrincipleRev.Code := PolicyGuidingPrinciple.Code;
                                PolicyGuidingPrincipleRev.Description := PolicyGuidingPrinciple.Description;
                                PolicyGuidingPrincipleRev.Insert;
                            until PolicyGuidingPrinciple.Next = 0;

                        end;

                        PolicyCoreValue.Reset;
                        PolicyCoreValue.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyCoreValue.Find('-') then begin
                            repeat
                                PolicyCoreValueRevision.Init;
                                PolicyCoreValueRevision."Revision No." := Rec."Revision No.";
                                PolicyCoreValueRevision."Policy ID" := PolicyCoreValue."Policy ID";
                                PolicyCoreValueRevision."Core Value" := PolicyCoreValue."Core Value";
                                PolicyCoreValueRevision.Description := PolicyCoreValue.Description;
                                PolicyCoreValueRevision.Insert;
                            until PolicyCoreValue.Next = 0;

                        end;

                        NextEntryNo := 0;
                        PolicyRelatedFramework.Reset;
                        PolicyRelatedFramework.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyRelatedFramework.Find('-') then begin
                            repeat
                                NextEntryNo := Rec.FnGetEntryNumber3(PolicyRelatedFramework, Rec."Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;

                                PolicyRelatedFrameworkRev.Init;
                                PolicyRelatedFrameworkRev."Revision No." := Rec."Revision No.";
                                PolicyRelatedFrameworkRev."Policy ID" := PolicyRelatedFramework."Policy ID";
                                PolicyRelatedFrameworkRev."Line No" := NextEntryNo;
                                PolicyRelatedFrameworkRev."Framework Code" := PolicyRelatedFramework."Framework Code";
                                PolicyRelatedFrameworkRev.Description := PolicyRelatedFramework.Description;
                                PolicyRelatedFrameworkRev.Insert;
                            until PolicyRelatedFramework.Next = 0;
                        end;


                        NextEntryNo := 0;
                        PolicyFrameworkArticle.Reset;
                        PolicyFrameworkArticle.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyFrameworkArticle.Find('-') then begin
                            repeat
                                NextEntryNo := Rec.FnGetEntryNumber4(PolicyFrameworkArticle, Rec."Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;
                                PolicyFrameworkArticleRev.Init;
                                PolicyFrameworkArticleRev."Revision No." := Rec."Revision No.";
                                PolicyFrameworkArticleRev."Policy ID" := Rec."Policy ID";
                                PolicyFrameworkArticleRev."Line No" := NextEntryNo;
                                PolicyFrameworkArticleRev.Description := PolicyFrameworkArticle.Description;
                                PolicyFrameworkArticleRev."External Document No." := PolicyFrameworkArticle."External Document No.";
                                PolicyFrameworkArticleRev.Insert;
                            until PolicyFrameworkArticle.Next = 0;
                        end;


                        PolicyThematicArea.Reset;
                        PolicyThematicArea.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyThematicArea.Find('-') then begin
                            repeat
                                PolicyThematicAreaRevision.Init;
                                PolicyThematicAreaRevision."Revision No." := Rec."Revision No.";
                                PolicyThematicAreaRevision."Policy ID" := Rec."Policy ID";
                                PolicyThematicAreaRevision.Code := PolicyThematicArea.Code;
                                PolicyThematicAreaRevision.Description := PolicyFrameworkArticle.Description;
                                PolicyThematicAreaRevision.Insert;
                            until PolicyThematicArea.Next = 0;
                        end;


                        NextEntryNo := 0;
                        PolicyCommitteeMember.Reset;
                        PolicyCommitteeMember.SetRange("Policy ID", Rec."Policy ID");
                        if PolicyCommitteeMember.Find('-') then begin
                            repeat
                                NextEntryNo := Rec.FnGetEntryNumber5(PolicyCommitteeMember, Rec."Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;
                                PolicyRevisionCommittee.Init;
                                PolicyRevisionCommittee."Revision No." := Rec."Revision No.";
                                PolicyRevisionCommittee."Policy ID" := Rec."Policy ID";
                                PolicyRevisionCommittee."Line No" := NextEntryNo;
                                PolicyRevisionCommittee."Policy Committee Type" := PolicyCommitteeMember."Policy Committee Type";
                                PolicyRevisionCommittee."Resource No." := PolicyCommitteeMember."Resource No.";
                                PolicyRevisionCommittee.Name := PolicyCommitteeMember.Name;
                                PolicyRevisionCommittee.Role := PolicyCommitteeMember.Role;
                                PolicyRevisionCommittee."Tenure Start Date" := PolicyCommitteeMember."Tenure Start Date";
                                PolicyRevisionCommittee."Tenure End Date" := PolicyCommitteeMember."Tenure End Date";
                                PolicyRevisionCommittee.Insert;
                            until PolicyCommitteeMember.Next = 0;
                        end;

                        Message('Policy Updated Successfully');
                    end;
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
                actionref("Policy Objective Revision_Promoted"; "Policy Objective Revision")
                {
                }
                actionref("Policy Guiding Principle_Promoted"; "Policy Guiding Principle")
                {
                }
                actionref("Policy Related Framework_Promoted"; "Policy Related Framework")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Revision Policy Stakeholder_Promoted"; "Revision Policy Stakeholder")
                {
                }
                actionref("Revision Policy Info Sources_Promoted"; "Revision Policy Info Sources")
                {
                }
                actionref("Policy Revision Committee_Promoted"; "Policy Revision Committee")
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
            group(Category_Category7)
            {
                actionref("Update Policy _Promoted"; "Update Policy ")
                {
                }
            }
        }
    }

    var
        Policy: Record Policy;
        PolicyRevisionVoucher: Record "Policy Revision";
        VersionNumber: Integer;
        PolicyObjectiveRevision: Record "Policy Objective Revision";
        PolicyStakeholderRevision: Record "Policy Stakeholder Revision";
        RevisionStakeholderRole: Record "Revision Stakeholder Role";
        PolicyRevisionStatementArea: Record "Policy Revision Statement Area";
        PolicyRevisionCommittee: Record "Policy Revision Committee";
        PolicyVersion: Record "Policy Version";
        PolicyInformationSources: Record "Policy Information Sources";
        PolicyRevisionInfoSources: Record "Policy Revision Info Sources";
        PolicyCommitteeMember: Record "Policy Committee Member";
        PolicyObjective: Record "Policy Objective";
        PolicyStakeholder: Record "Policy Stakeholder";
        PolicyStakeholderRole: Record "Policy Stakeholder Role";
        PolicyThematicArea: Record "Policy Thematic Area";
        PolicyThematicAreaRevision: Record "Policy Thematic Area Revision";
        PolicyStatement: Record "Policy Statement";
        PolicyStatementRevision: Record "Policy Statement Revision";
        PolicyGuidingPrinciple: Record "Policy Guiding Principle";
        PolicyGuidingPrincipleRev: Record "Policy Guiding Principle Rev";
        PolicyRelatedFramework: Record "Policy Related Framework";
        PolicyRelatedFrameworkRev: Record "Policy Related Framework Rev";
        PolicyFrameworkArticle: Record "Policy Framework Article";
        PolicyFrameworkArticleRev: Record "Policy Framework Article Rev";
        NextEntryNo: Integer;
        PolicyCoreValue: Record "Policy Core Value";
        PolicyCoreValueRevision: Record "Policy Core Value Revision";


    procedure FnGetEntryNumber(PolicyStakeholderRole: Record "Policy Stakeholder Role"; RevisionCode: Code[30]) EntryNo: Integer
    var
        RevisionStakeholderRole: Record "Revision Stakeholder Role";
    begin
        RevisionStakeholderRole.Reset;
        if RevisionStakeholderRole.FindLast then begin
            EntryNo := RevisionStakeholderRole."Entry No";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber2(PolicyInformationSources: Record "Policy Information Sources"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyRevisionInfoSources: Record "Policy Revision Info Sources";
    begin
        PolicyRevisionInfoSources.Reset;
        if PolicyRevisionInfoSources.FindLast then begin
            EntryNo := PolicyRevisionInfoSources."Line No.";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber3(PolicyRelatedFramework: Record "Policy Related Framework"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyRelatedFrameworkRev: Record "Policy Related Framework Rev";
    begin
        PolicyRelatedFrameworkRev.Reset;
        if PolicyRelatedFrameworkRev.FindLast then begin
            EntryNo := PolicyRelatedFrameworkRev."Line No";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber4(PolicyFrameworkArticle: Record "Policy Framework Article"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyFrameworkArticleRev: Record "Policy Framework Article Rev";
    begin
        PolicyRelatedFrameworkRev.Reset;
        if PolicyRelatedFrameworkRev.FindLast then begin
            EntryNo := PolicyRelatedFrameworkRev."Line No";
        end;
        exit(EntryNo);
    end;


    procedure FnGetEntryNumber5(PolicyCommitteeMember: Record "Policy Committee Member"; RevisionCode: Code[30]) EntryNo: Integer
    var
        PolicyRevisionCommittee: Record "Policy Revision Committee";
    begin
        PolicyRevisionCommittee.Reset;
        if PolicyRevisionCommittee.FindLast then begin
            EntryNo := PolicyRevisionCommittee."Line No";
        end;
        exit(EntryNo);
    end;
}

#pragma implicitwith restore

