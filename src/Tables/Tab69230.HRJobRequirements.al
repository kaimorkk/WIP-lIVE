
table 69230 "HR Job Requirements"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job Id"; Code[50])
        {
            NotBlank = true;
            TableRelation = "ManPower Planning Lines"."Entry No";
        }
        field(2; "Qualification Type"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
        }
        field(3; "Qualification Code"; Code[30])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));

            trigger OnValidate()
            begin
                /*.SETFILTER(Requirments."Qualification Type","Qualification Type");
                Requirments.SETFILTER(Requirments.Code,"Qualification Code");
                IF Requirments.FIND('-') THEN
                 Qualification := Requirments.Description; */


                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    "Qualification Description" := HRQualifications.Description;

            end;
        }
        field(6; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(8; "Score ID"; Decimal)
        {
        }
        field(9; "Need code"; Code[10])
        {
            // TableRelation = Table0;
        }
        field(10; "Stage Code"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Scores));
        }
        field(11; Mandatory; Boolean)
        {
        }
        field(12; "Desired Score"; Decimal)
        {
        }
        field(13; "Total (Stage)Desired Score"; Decimal)
        {
        }
        field(14; "Qualification Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Job Id", "Qualification Type", "Qualification Code")
        {
            Clustered = true;
            SumIndexFields = "Score ID";
        }
    }

    fieldgroups
    {
    }

    var
        HRQualifications: Record "HR Job Qualifications";
}

