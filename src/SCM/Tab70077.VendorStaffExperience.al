
table 70077 "Vendor Staff Experience"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Enabled = true;
        }
        field(2; "Staff ID"; Code[20])
        {
        }
        field(3; "Vendor No"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(4; "Experience Category"; Option)
        {
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(5; "Experience Summary"; Text[100])
        {
        }
        field(6; "Assignment Description"; Text[100])
        {
        }
        field(7; "Years of Experience"; Decimal)
        {
        }
        field(8; "Start Year"; Code[10])
        {
        }
        field(9; "End Year"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Staff ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

