Table 52194033 "Mail Log"
{

    fields
    {
        field(1;EntryNo;Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Alert Type";Option)
        {
            OptionCaption = 'Budget Alerts,Investment Alerts,Payroll Alerts,Commissioner,Procurement';
            OptionMembers = "Budget Alerts","Investment Alerts","Payroll Alerts",Commissioner,Procurement;
        }
        field(3;"Date Sent";Date)
        {
        }
        field(4;"Time Sent";Time)
        {
        }
        field(5;"Mail Receiver";Code[50])
        {
        }
        field(6;"Mail Sender";Code[50])
        {
        }
        field(7;"Email Message";Text[250])
        {
        }
        field(9;Department;Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('DEPARTMENTS'));
        }
        field(10;"Mail Subject";Text[250])
        {
        }
        field(11;"Sent By";Code[50])
        {
            TableRelation = "User Setup";
        }
    }

    keys
    {
        key(Key1;EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

