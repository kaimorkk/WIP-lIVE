
table 80039 "Stakeholder Analysis Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Entry No"; Integer)
        {
        }
        field(3; "Stakeholder Group"; Code[50])
        {
        }
        field(4; "Stakeholder Sub-Group"; Code[50])
        {
        }
        field(5; "Stakeholder Description"; Text[255])
        {
        }
        field(6; "Stakeholder Power Level"; Option)
        {
            OptionCaption = 'High,Low';
            OptionMembers = High,Low;
        }
        field(7; "Power/Influence Description"; Text[255])
        {
        }
        field(8; "Stakeholder Interests Level"; Option)
        {
            OptionCaption = 'Low,High';
            OptionMembers = Low,High;
        }
        field(9; "Interests & Expectations"; Text[255])
        {
        }
        field(10; "Management Strategy"; Option)
        {
            OptionCaption = 'Monitor,Keep Informed,Keep Satisfied,Manage Closely';
            OptionMembers = Monitor,"Keep Informed","Keep Satisfied","Manage Closely";
        }
        field(11; "Engagement Strategy"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

