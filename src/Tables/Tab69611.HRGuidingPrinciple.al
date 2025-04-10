
table 69611 "HR Guiding Principle"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "HR Process"; Option)
        {
            OptionCaption = 'Recruitment & Selection,Staff Promotion,Staff Transfer,Leave Management,Training & Development,Disciplinary Management,Health & Safety,Staff Welfare,Compesation & Benefits,Performance Management,Employee Separation,Other';
            OptionMembers = "Recruitment & Selection","Staff Promotion","Staff Transfer","Leave Management","Training & Development","Disciplinary Management","Health & Safety","Staff Welfare","Compesation & Benefits","Performance Management","Employee Separation",Other;
        }
        field(3; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

