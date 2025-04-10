
table 80254 "Innovation Evaluation Comm"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation"."Document No";

            trigger OnValidate()
            begin
                InnovationSetup.Get;
                NoSeriesMgt.TestManual(InnovationSetup."Inno Eval Committe  Nos.");
                "No. Series" := '';
            end;
        }
        field(2; "Committee Voucher ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Committee"."Document No.";
        }
        field(3; "Member ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Member"."Member No." where("Document No." = field("Document No."));
        }
        field(4; Name; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chair,Secretary,Treasurer,Consultant/Expert';
            OptionMembers = Member,Chair,Secretary,Treasurer,"Consultant/Expert";
        }
        field(6; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Committee Voucher ID", "Member ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Document No." = '' then begin
            InnovationSetup.Get;
            InnovationSetup.TestField("Inno Eval Committe  Nos.");
            NoSeriesMgt.InitSeries(InnovationSetup."Inno Eval Committe  Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
    end;

    var
        InnovationSetup: Record "Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

