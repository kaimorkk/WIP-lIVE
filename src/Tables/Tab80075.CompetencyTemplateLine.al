
table 80075 "Competency Template Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Competency Template ID"; Code[30])
        {
            TableRelation = "Competency Per Template".Code;
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Competency Code"; Code[100])
        {
            TableRelation = Competency."No.";

            trigger OnLookup()
            begin
                if Competency.Get("Competency Code") then begin
                    "Competency Description" := Competency.Description;
                end;
            end;
        }
        field(4; "Competency Description"; Text[100])
        {
        }
        field(5; "Competency Category"; Option)
        {
            OptionCaption = 'Core/Required,Desired/Added Advantage';
            OptionMembers = "Core/Required","Desired/Added Advantage";
        }
        field(6; Description; Text[255])
        {
        }
        field(7; "Weight %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Competency Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Competency: Record Competency;
}

