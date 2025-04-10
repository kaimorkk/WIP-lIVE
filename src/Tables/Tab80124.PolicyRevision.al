Table 80124 "Policy Revision"
{

    fields
    {
        field(1; "Revision No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ("Revision No." <> xRec."Revision No.") then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Policy Revision No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Policy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;

            trigger OnValidate()
            begin
                if Policy.Get("Policy ID") then begin
                    "Policy Name" := Policy."Policy Name";
                    "Policy Dev Institution ID" := Policy."Policy Dev Institution ID";
                    Summary := Policy.Summary;
                    "Policy Goal" := Policy."Policy Goal";
                    "Applies-To" := Policy."Applies-To";
                    "Responsibility Center" := Policy."Responsibility Center";
                    "Responsible Person" := Policy."Responsible Person";
                    Name := Policy.Name;
                    Title := Policy.Title;
                    "External Ref No" := Policy."External Ref No";
                    "Policy Overview" := Policy."Policy Overview";
                    "Policy Purpose" := Policy."Policy Purpose";
                    "Policy Rationale" := Policy."Policy Rationale";
                    "Policy Scope" := Policy."Policy Scope";
                    "Primary Directorate" := Policy."Primary Directorate";
                    "Primary Department" := Policy."Primary Department";
                end;

                PolicyObjective.Reset;
                PolicyObjective.SetRange("Policy ID", "Policy ID");
                if PolicyObjective.FindFirst then begin
                    repeat
                        PolicyObjectiveRevision.Init;
                        PolicyObjectiveRevision."Revision No." := "Revision No.";
                        PolicyObjectiveRevision."Policy ID" := "Policy ID";
                        PolicyObjectiveRevision.Code := PolicyObjective.Code;
                        PolicyObjectiveRevision.Description := PolicyObjective.Description;
                        PolicyObjectiveRevision.Insert;
                    until PolicyObjective.Next = 0;
                end;


                PolicyStakeholder.Reset;
                PolicyStakeholder.SetRange("Policy ID", "Policy ID");
                if PolicyStakeholder.FindFirst then begin
                    repeat
                        PolicyStakeholderRevision.Init;
                        PolicyStakeholderRevision."Revision No." := "Revision No.";
                        PolicyStakeholderRevision."Policy ID" := PolicyStakeholder."Policy ID";
                        PolicyStakeholderRevision.Code := PolicyStakeholder.Code;
                        PolicyStakeholderRevision."Stakeholder Group ID" := PolicyStakeholder."Stakeholder Group ID";
                        PolicyStakeholderRevision.Description := PolicyStakeholder.Description;
                        PolicyStakeholderRevision.Insert;

                        NextEntryNo := 0;
                        PolicyStakeholderRole.Reset;
                        PolicyStakeholderRole.SetRange("Policy ID", "Policy ID");
                        PolicyStakeholderRole.SetRange(Code, PolicyStakeholder.Code);
                        if PolicyStakeholderRole.Find('-') then begin
                            repeat
                                NextEntryNo := FnGetEntryNumber(PolicyStakeholderRole, "Revision No.");
                                if NextEntryNo = 0 then
                                    NextEntryNo := 1
                                else
                                    NextEntryNo := NextEntryNo + 1;

                                RevisionStakeholderRole.Init;
                                RevisionStakeholderRole."Revision No." := "Revision No.";
                                RevisionStakeholderRole."Policy ID" := PolicyStakeholderRole."Policy ID";
                                RevisionStakeholderRole.Code := PolicyStakeholderRole.Code;
                                RevisionStakeholderRole."Entry No" := NextEntryNo;
                                RevisionStakeholderRole.Responsibility := PolicyStakeholderRole.Responsibility;
                                RevisionStakeholderRole.Insert;
                            until PolicyStakeholderRole.Next = 0;
                        end;

                    until PolicyStakeholder.Next = 0;
                end;

                NextEntryNo := 0;
                PolicyInformationSources.Reset;
                PolicyInformationSources.SetRange("Policy ID", "Policy ID");
                if PolicyInformationSources.Find('-') then begin
                    repeat
                        NextEntryNo := FnGetEntryNumber2(PolicyInformationSources, "Revision No.");
                        if NextEntryNo = 0 then
                            NextEntryNo := 1
                        else
                            NextEntryNo := NextEntryNo + 1;

                        PolicyRevisionInfoSources.Init;
                        PolicyRevisionInfoSources."Revision No." := "Revision No.";
                        PolicyRevisionInfoSources."Policy ID" := PolicyInformationSources."Policy ID";
                        PolicyRevisionInfoSources."Line No." := NextEntryNo;
                        PolicyRevisionInfoSources."Source Type" := PolicyInformationSources."Source Type";
                        PolicyRevisionInfoSources.Description := PolicyInformationSources.Description;
                        PolicyRevisionInfoSources."URL Link" := PolicyInformationSources."URL Link";
                        PolicyRevisionInfoSources.Insert;
                    until PolicyInformationSources.Next = 0;
                end;

                PolicyGuidingPrinciple.Reset;
                PolicyGuidingPrinciple.SetRange("Policy ID", "Policy ID");
                if PolicyGuidingPrinciple.Find('-') then begin
                    repeat
                        PolicyGuidingPrincipleRev.Init;
                        PolicyGuidingPrincipleRev."Revision No." := "Revision No.";
                        PolicyGuidingPrincipleRev."Policy ID" := PolicyGuidingPrinciple."Policy ID";
                        PolicyGuidingPrincipleRev.Code := PolicyGuidingPrinciple.Code;
                        PolicyGuidingPrincipleRev.Description := PolicyGuidingPrinciple.Description;
                        PolicyGuidingPrincipleRev.Insert;
                    until PolicyGuidingPrinciple.Next = 0;

                end;

                /*
                PolicyCoreValue.RESET;
                PolicyCoreValue.SETRANGE("Policy ID","Policy ID");
                IF PolicyCoreValue.FIND('-') THEN BEGIN
                   REPEAT
                     PolicyCoreValueRevision.INIT;
                     PolicyCoreValueRevision."Score (%)":="Revision No.";
                     PolicyCoreValueRevision.Code:=PolicyCoreValue."Policy ID";
                     PolicyCoreValueRevision.Description:=PolicyCoreValue."Core Value";
                     PolicyCoreValueRevision."Rating Type":=PolicyCoreValue.Description;
                     PolicyCoreValueRevision.INSERT;
                   UNTIL PolicyCoreValue.NEXT=0;
                
                END;
                */

                NextEntryNo := 0;
                PolicyRelatedFramework.Reset;
                PolicyRelatedFramework.SetRange("Policy ID", "Policy ID");
                if PolicyRelatedFramework.Find('-') then begin
                    repeat
                        NextEntryNo := FnGetEntryNumber3(PolicyRelatedFramework, "Revision No.");
                        if NextEntryNo = 0 then
                            NextEntryNo := 1
                        else
                            NextEntryNo := NextEntryNo + 1;

                        PolicyRelatedFrameworkRev.Init;
                        PolicyRelatedFrameworkRev."Revision No." := "Revision No.";
                        PolicyRelatedFrameworkRev."Policy ID" := PolicyRelatedFramework."Policy ID";
                        PolicyRelatedFrameworkRev."Line No" := NextEntryNo;
                        PolicyRelatedFrameworkRev."Framework Code" := PolicyRelatedFramework."Framework Code";
                        PolicyRelatedFrameworkRev.Description := PolicyRelatedFramework.Description;
                        PolicyRelatedFrameworkRev.Insert;
                    until PolicyRelatedFramework.Next = 0;
                end;


                NextEntryNo := 0;
                PolicyFrameworkArticle.Reset;
                PolicyFrameworkArticle.SetRange("Policy ID", "Policy ID");
                if PolicyFrameworkArticle.Find('-') then begin
                    repeat
                        NextEntryNo := FnGetEntryNumber4(PolicyFrameworkArticle, "Revision No.");
                        if NextEntryNo = 0 then
                            NextEntryNo := 1
                        else
                            NextEntryNo := NextEntryNo + 1;
                        PolicyFrameworkArticleRev.Init;
                        PolicyFrameworkArticleRev."Revision No." := "Revision No.";
                        PolicyFrameworkArticleRev."Policy ID" := "Policy ID";
                        PolicyFrameworkArticleRev."Line No" := NextEntryNo;
                        PolicyFrameworkArticleRev.Description := PolicyFrameworkArticle.Description;
                        PolicyFrameworkArticleRev."External Document No." := PolicyFrameworkArticle."External Document No.";
                        PolicyFrameworkArticleRev.Insert;
                    until PolicyFrameworkArticle.Next = 0;
                end;


                PolicyThematicArea.Reset;
                PolicyThematicArea.SetRange("Policy ID", "Policy ID");
                if PolicyThematicArea.Find('-') then begin
                    repeat
                        PolicyThematicAreaRevision.Init;
                        PolicyThematicAreaRevision."Revision No." := "Revision No.";
                        PolicyThematicAreaRevision."Policy ID" := "Policy ID";
                        PolicyThematicAreaRevision.Code := PolicyThematicArea.Code;
                        PolicyThematicAreaRevision.Description := PolicyFrameworkArticle.Description;
                        PolicyThematicAreaRevision.Insert;
                    until PolicyThematicArea.Next = 0;
                end;
                SubThematicRevision.Reset;
                SubThematicRevision.SetRange("Policy ID", "Policy ID");
                if SubThematicRevision.Find('-') then begin
                    repeat
                    //   SubThematicRevision.Init;
                    //   SubThematicRevision.Code:=SubThematicArea."Training Need Category";
                    //   SubThematicRevision.Introduction:=SubThematicArea.Description;
                    //   SubThematicRevision.Purpose:=SubThematicArea.Purpose;
                    //   SubThematicRevision.Scope:=SubThematicArea.Scope;
                    //   SubThematicRevision.Application:=SubThematicArea.Application;
                    //   SubThematicRevision."Policy statement":=SubThematicArea."Policy statement";
                    //   SubThematicRevision."Policy Guideline":=SubThematicArea."Policy Guideline";
                    //   SubThematicRevision.Insert;
                    until SubThematicArea.Next = 0;

                end;


                NextEntryNo := 0;
                PolicyCommitteeMember.Reset;
                PolicyCommitteeMember.SetRange("Policy ID", "Policy ID");
                if PolicyCommitteeMember.Find('-') then begin
                    repeat
                        NextEntryNo := FnGetEntryNumber5(PolicyCommitteeMember, "Revision No.");
                        if NextEntryNo = 0 then
                            NextEntryNo := 1
                        else
                            NextEntryNo := NextEntryNo + 1;
                        PolicyRevisionCommittee.Init;
                        PolicyRevisionCommittee."Revision No." := "Revision No.";
                        PolicyRevisionCommittee."Policy ID" := "Policy ID";
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

            end;
        }
        field(3; "Revision Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Minor Revision,Major Revision';
            OptionMembers = "Minor Revision","Major Revision";
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Policy Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Policy Dev Institution ID"; Text[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Policy Development Institution".Code;
        }
        field(7; Summary; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Policy Goal"; Text[1500])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Applies-To"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'All Staff,Some Staff,Public,Other';
            OptionMembers = "All Staff","Some Staff",Public,Other;
        }
        field(10; "Responsibility Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(11; "Responsible Person"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Responsible Person") then begin
                    Name := Employee.FullName;
                    Title := Employee.Title;
                end;
            end;
        }
        field(12; Name; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Title; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Revision Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(17; "External Ref No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Policy Overview"; Text[1500])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Policy Purpose"; Text[1500])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Policy Rationale"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Policy Scope"; Text[1500])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(23; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(2));
        }
        field(24; "Process Owner ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Process Owner Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Process Owner Title"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Approved By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Approver Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Policy Stage"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Agenda Setting,Policy Formulation,Implementation,Terminated';
            OptionMembers = "Agenda Setting","Policy Formulation",Implementation,Terminated;
        }
        field(30; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(31; "Approval Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Policy Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Revised By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Total Implementation Status"; Decimal)
        {
            //CalcFormula = sum("PolicyThematic Area Revision.."."Implementation Percentage" where ("Revision No."=field("Revision No.")));
            FieldClass = FlowField;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SPMSetup.Get;
        SPMSetup.TestField("Policy Revision No. Series");
        NoSeriesMgt.InitSeries(SPMSetup."Policy Revision No. Series", xRec."No. Series", 0D, "Revision No.", "No. Series");

        "Revised By" := UserId;
    end;

    var
        SPMSetup: Record "Policy Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        Policy: Record Policy;
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
        //PolicyCoreValueRevision: Record "BR Option Text Response Type";
        SubThematicRevision: Record "Policy Sub Thematic Area rev";
        SubThematicArea: Record "Evaluation Training needs";


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

