
table 70062 "Business Types"
{
    DrillDownPageID = "Business Types";
    LookupPageID = "Business Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Ownership Type"; Option)
        {
            OptionCaption = ',Sole Ownership,Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership",Partnership,"Registered Company";
        }
        field(5; "No. of Active Vendors"; Integer)
        {
            CalcFormula = count(Vendor where("Business Type" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
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
}

