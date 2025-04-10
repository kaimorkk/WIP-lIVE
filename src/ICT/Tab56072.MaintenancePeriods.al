
table 56072 "Maintenance Periods"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
            TableRelation = "ICT Maintenance Schedule".Code;
        }
        field(2; Period; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";

            trigger OnValidate()
            begin
                AccountingPeriod.Reset;
                AccountingPeriod.SetRange("Starting Date", Period);
                if AccountingPeriod.FindSet then
                    Description := AccountingPeriod.Name;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Type; Option)
        {
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(5; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Maintenance Code"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No", "Maintenance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AccountingPeriod: Record "Accounting Period";
}

