
table 80067 "Perfomance Rating Scale"
{
    DrillDownPageID = "Perfomance Rating Scales";
    LookupPageID = "Perfomance Rating Scales";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[150])
        {
        }
        field(3; "Scale Type"; Option)
        {
            OptionCaption = 'Excellent-Poor(5-1),Excellent-Poor(1-5)';
            OptionMembers = "Excellent-Poor(5-1)","Excellent-Poor(1-5)";

            trigger OnValidate()
            begin
                if "Scale Type" = "scale type"::"Excellent-Poor(1-5)" then begin
                    "Max Excellent Raw Score" := 1;
                    "Least Poor Raw Score" := 5;
                end;

                if "Scale Type" = "scale type"::"Excellent-Poor(5-1)" then begin
                    "Max Excellent Raw Score" := 5;
                    "Least Poor Raw Score" := 1;
                end;
            end;
        }
        field(4; "Max Excellent Raw Score"; Decimal)
        {
        }
        field(5; "Least Poor Raw Score"; Decimal)
        {
        }
        field(6; "Effective Date"; Date)
        {
        }
        field(7; Blocked; Boolean)
        {
        }
        field(8; "Created By"; Code[100])
        {
        }
        field(9; "Created On"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created On" := Today;
    end;
}

