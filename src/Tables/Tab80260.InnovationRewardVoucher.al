Table 80260 "Innovation Reward Voucher"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    InnovationSetup.Get;
                    NoSeriesMgt.TestManual(InnovationSetup."Inno Reward Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Evaluation ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation";
        }
        field(4; "Idea ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation Line";
        }
        field(5; "Idea Originator"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(6; Name; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Idea Summary"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Innovation Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Category";
        }
        field(9; "Innovation Rating Template ID"; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Rating Template";
        }
        field(10; "Overall Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Final Committee Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Recommended for Implementation,Archived';
            OptionMembers = " ","Recommended for Implementation",Archived;
        }
        field(12; "Directorate ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(13; "Department ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(14; "Region ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Invitation No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Solicitation";
        }
        field(16; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.")
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
            InnovationSetup.TestField("Inno Reward Nos.");
            NoSeriesMgt.InitSeries(InnovationSetup."Inno Reward Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        InnovationSetup: Record "Innovation Setup";
}

