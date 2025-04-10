
table 95165 "Audit Charter Component"
{
    DrillDownPageID = "Audit Charter Components";
    LookupPageID = "Audit Charter Components";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Charter ID"; Code[20])
        {
        }
        field(2; "Component Type"; Option)
        {
            OptionCaption = ' ,Mission,Purpose,Standards,Authority,Independence,Scope,Responsibility,Quality Assurance,Other';
            OptionMembers = " ",Mission,Purpose,Standards,Authority,Independence,Scope,Responsibility,"Quality Assurance",Other;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Audit Charter ID", "Component Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

