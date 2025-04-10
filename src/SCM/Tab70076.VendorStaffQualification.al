
table 70076 "Vendor Staff Qualification"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Vendor No"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(3; "Qualification Category"; Option)
        {
            OptionCaption = ',PHD,Masters,Post-Graduate Diploma,Undergraduate,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PHD,Masters,"Post-Graduate Diploma",Undergraduate,Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(4; "Qualification Name"; Text[50])
        {
        }
        field(5; Institution; Text[50])
        {
        }
        field(6; "Start Year"; Code[10])
        {
        }
        field(7; "End Year"; Code[10])
        {
        }
        field(8; "Outstanding Achievements"; Text[80])
        {
        }
        field(9; "Staff Id"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Staff Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

