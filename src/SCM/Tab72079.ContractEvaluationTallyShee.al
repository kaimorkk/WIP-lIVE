
table 72079 "Contract Evaluation Tally Shee"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project No"; Code[10])
        {
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Project Title"; Text[250])
        {
        }
        field(4; "Road Authority Code"; Code[20])
        {
        }
        field(5; "Road Authority Name"; Text[250])
        {
        }
        field(6; "Contractor No"; Code[20])
        {
        }
        field(7; "Contractor Name"; Text[250])
        {
        }
        field(8; "Date of Commencement"; Date)
        {
        }
        field(9; "No. of elapsed months"; Integer)
        {
        }
        field(10; "Project Manager Code"; Code[10])
        {
        }
        field(11; "Project Manager Name"; Text[250])
        {
        }
        field(12; "Road Manager Code"; Code[20])
        {
        }
        field(13; "Road Manager Name"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

