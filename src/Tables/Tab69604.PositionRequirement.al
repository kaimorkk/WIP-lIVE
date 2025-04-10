
table 69604 "Position Requirement"
{
    DrillDownPageID = "Position Substitutes";
    LookupPageID = "Position Substitutes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(2; "Requirement ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Qualification Category"; Option)
        {
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Professional Body';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Professional Body";
        }
        field(4; Description; Text[600])
        {
        }
        field(5; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Added Advantage,Affirmative Action';
            OptionMembers = Mandatory,"Added Advantage","Affirmative Action";
        }
        field(6; "Substitute Qualification"; Boolean)
        {
            CalcFormula = exist("Position Req Substitute" where("Position ID" = field("Position ID"),
                                                                 "Requirement ID" = field("Requirement ID")));
            FieldClass = FlowField;
        }
        field(7; "Qualification Code"; Code[30])
        {
            TableRelation = Qualification where("Qualification Category" = field("Qualification Category"));

            trigger OnValidate()
            begin
                if Qualification.Get("Qualification Code") then
                    Description := Qualification.Description;
            end;
        }
    }

    keys
    {
        key(Key1; "Position ID", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Qualification: Record Qualification;
}

