
table 95206 "Audit Proj  Procedure Control"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
        }
        field(2; "Business Risk ID"; Integer)
        {
        }
        field(3; "Control ID"; Integer)
        {
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Nature of Control"; Option)
        {
            OptionCaption = ' ,Manual Control,Automated Control,Hybrid Control';
            OptionMembers = " ","Manual Control","Automated Control","Hybrid Control";
        }
        field(6; "Control Frequency"; Option)
        {
            OptionCaption = ' ,N/A,Multple times a day,Daily,Weekly,Monthly,Quarterly,Semi-Annual,Annual,At all times';
            OptionMembers = " ","N/A","Multple times a day",Daily,Weekly,Monthly,Quarterly,"Semi-Annual",Annual,"At all times";
        }
        field(7; "Control Owner ID"; Code[20])
        {
        }
        field(8; "Internal Control Type"; Option)
        {
            OptionCaption = ' ,Preventive,Detective,Corrective';
            OptionMembers = " ",Preventive,Detective,Corrective;
        }
        field(9; "Audit Procedure ID"; Integer)
        {
        }
        field(10; "Audit Objective ID"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Business Risk ID", "Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

