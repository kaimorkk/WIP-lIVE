
table 85039 "Boq Template  Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(2; Examination; Code[30])
        {
            //TableRelation = Courses;

            trigger OnValidate()
            begin
                // if Courses.Get(Examination) then
                //     Description := Courses.Description;
            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "Effective Date"; Date)
        {
        }
        field(6; "Currency Code"; Code[30])
        {
            TableRelation = Currency;
        }
        field(7; "No. Series"; Code[30])
        {
        }
        field(8; "Created By"; Code[30])
        {
        }
        field(9; "Created On"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // ExaminationSetup.Get;
        // ExaminationSetup.TestField("BoQ Template Nos.");
        // if "Template ID" = '' then
        //     NoSeriesMgt.InitSeries(ExaminationSetup."BoQ Template Nos.", xRec."No. Series", 0D, "Template ID", "No. Series");
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        //ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    // Courses: Record Courses;
}

