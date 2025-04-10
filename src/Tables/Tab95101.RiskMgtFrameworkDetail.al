
table 95101 "Risk Mgt Framework Detail"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "RMF Section"; Option)
        {
            OptionCaption = ' ,RMF Overview,Benefits/Importance,RMF Guiding Principle';
            OptionMembers = " ","RMF Overview","Benefits/Importance","RMF Guiding Principle";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Guiding Principle Statement"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Primary Key", "RMF Section", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

