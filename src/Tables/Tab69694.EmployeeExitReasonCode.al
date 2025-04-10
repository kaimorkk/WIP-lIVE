
table 69694 "Employee Exit Reason Code"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Separation Category"; Option)
        {
            OptionCaption = ' ,Retirement,Resignation,Layoff,Termination By Mutual Agreement,Dismissal,Death';
            OptionMembers = " ",Retirement,Resignation,Layoff,"Termination By Mutual Agreement",Dismissal,Death;
        }
        field(4; "Turnover Type"; Option)
        {
            OptionCaption = ' ,Involuntary Turnover,Voluntary Turnover';
            OptionMembers = " ","Involuntary Turnover","Voluntary Turnover";
        }
        field(5; "Consider for Rehire"; Boolean)
        {
        }
        field(6; "No. of exited employees"; Integer)
        {
        }
        field(7; Blocked; Boolean)
        {
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

