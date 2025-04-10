
table 80011 "Strategy Core Value"
{
    DrillDownPageID = "Strategy Core Value";
    LookupPageID = "Strategy Core Value";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Strategic Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Core Value"; Code[255])
        {
            TableRelation = "Core Values".Code;

            trigger OnValidate()
            begin
                Corevalue.Reset;
                Corevalue.SetRange(Description, "Core Value");
                if Corevalue.Find('-') then begin
                    Description := Corevalue.Description;
                end;
            end;
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Priority Level"; Integer)
        {
        }
        // field(5; Scale; Decimal)
        // {

        // }
        field(5; Scale; Text[100])
        {
            InitValue = 'Rating';


        }
        field(6; Target; Decimal)
        {

        }
        field(7; Weight; Decimal)
        {

        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Core Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Corevalue: Record "Core Values";
}

