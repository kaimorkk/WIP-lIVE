table 50131 "PMMU Activities"
{
    Caption = 'PMMU Activities';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(4; Outcome; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Theme"."Theme ID" where("Strategic Plan ID" = field("Strategy Plan ID"));
        }
        field(5; "Strategic Objective"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective"."Objective ID" where("Strategic Plan ID" = field("Strategy Plan ID"), "Theme Id" = field(Outcome));
        }
        field(6; Strategies; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy"."Strategy ID" where("Strategic Plan ID" = field("Strategy Plan ID"), "Theme Id" = field(Outcome), "Objective ID" = field("Strategic Objective"));
        }
        field(7; Activities; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Unit of Measure"; Code[50])
        {
            // TableRelation = "Unit of Measure" where("For Appraisal?" = const(true));
        }
        field(9; Weight; Decimal)
        {
            trigger OnValidate()
            begin
                if xRec.Weight <> Weight then
                    ValidateWeight();
                //rec."Achieved Target" := Score * Weight;

            end;
        }
        field(10; Target; Decimal)
        {
            trigger OnValidate()
            var
                PerfomanceContrHdr: Record "Perfomance Contract Header";
            begin
                PerfomanceContrHdr.Get("Contract No.");
                VerifyIsAMemberOfCommitee(PerfomanceContrHdr."Target Setting Commitee");
            end;
        }
        field(11; "Achieved Target"; Decimal)
        {
            trigger OnValidate()
            var
                PerfomanceContrHdr: Record "Perfomance Contract Header";
            begin
                if xRec."Achieved Target" <> "Achieved Target" then begin
                    PerfomanceContrHdr.Get("Contract No.");
                    VerifyIsAMemberOfCommitee(PerfomanceContrHdr."Evaluation Commitee");
                    Score := ("Achieved Target" / Target) * Weight;
                end;
            end;
        }
        field(12; "Key result Areas"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Key Indicators"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Baseline Target"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Perspectives"; Code[50])
        {
            // TableRelation = "HR Appraisal Perspectives".Code where("Strategy Plan ID" = field("Strategy Plan ID"));
            //"Strategic Theme"."Theme ID" where("Strategic Plan ID" = field("Strategy Plan ID"));
        }
        field(17; Outputs; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Output Indicators"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Strategy Output Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Output"."Strategy Output Code"
            where("Strategic Plan ID" = field("Strategy Plan ID"), "Strategy ID" = field(Strategies));
            trigger OnValidate()
            var
                StrategyOut: Record "Strategy Output";
            begin

                StrategyOut.Reset();
                StrategyOut.SetRange("Strategic Plan ID", "Strategy Plan ID");
                StrategyOut.SetRange("Strategy ID", Strategies);
                StrategyOut.SetRange("Strategy Output Code", "Strategy Output Code");
                if StrategyOut.FindFirst() then begin
                    "Output Indicators" := StrategyOut."Output Indicators";
                    Outputs := StrategyOut.Outputs;
                end;
            end;
        }
        field(20; Score; Decimal)
        {

        }

    }

    keys
    {
        key(PK; "Contract No.", "Strategy Plan ID", "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure VerifyIsAMemberOfCommitee(CommiteeCode: Code[30])
    var
        CommiteeAppointmentVoucher: Record "Commitee Appointment Voucher";
        CommiteeAppointedMember: Record "Commitee Appointed Member";
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        CommiteeAppointmentVoucher.Reset();
        CommiteeAppointmentVoucher.SetRange("Document No.", CommiteeCode);
        if CommiteeAppointmentVoucher.FindFirst() then begin
            CommiteeAppointedMember.Reset();
            CommiteeAppointedMember.SetRange("Document No.", CommiteeAppointmentVoucher."Document No.");
            CommiteeAppointedMember.SetRange("Member No.", UserSetup."Employee No.");
            if not CommiteeAppointedMember.FindFirst() then
                Error('Only members of the committee are allowed to edit!');
        end;
    end;


    local procedure ValidateWeight()
    var
        PMMUActivities: Record "PMMU Activities";
        HRAppraisalPerspectives: Record "HR Appraisal Perspectives";
    begin
        Rec.TestField(Perspectives);
        Rec.TestField("Contract No.");

        HRAppraisalPerspectives.Reset();
        HRAppraisalPerspectives.SetRange(Code, Rec.Perspectives);
        HRAppraisalPerspectives.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
        if HRAppraisalPerspectives.FindFirst() then begin
            PMMUActivities.Reset();
            PMMUActivities.SetRange("Contract No.", Rec."Contract No.");
            PMMUActivities.SetRange(Perspectives, Rec.Perspectives);
            PMMUActivities.CalcSums(Weight);
            if (PMMUActivities.Weight - xRec.Weight + Weight) > HRAppraisalPerspectives."Total Weight" then
                Error('The sum of the weights for the perspectives cannot exceed the total weight for the perspective in the HR Appraisal Perspectives table.');
        end;
    end;



}
