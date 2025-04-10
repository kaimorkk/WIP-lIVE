
table 69125 "Job Advert Lines"
{
    LookupPageID = "Training Feedback";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Job Advert No."; Code[30])
        {
            TableRelation = "Job Advert Header";
        }
        field(3; "Job Id"; Code[30])
        {
            TableRelation = Positions;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange("Job ID", "Job Id");
                if Positions.FindSet then begin
                    "Job Title" := Positions."Job Description";
                end
            end;
        }
        field(4; "Job Title"; Text[100])
        {
        }
        field(5; "Quantity Sought"; Integer)
        {
        }
        field(6; "Media Option"; Option)
        {
            OptionMembers = Print,TV,Online;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Positions: Record Positions;
}

