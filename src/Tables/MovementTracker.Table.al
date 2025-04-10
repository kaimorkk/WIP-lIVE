Table 52193481 "Movement Tracker"
{
    DrillDownPageID = "Movement Tracker";
    LookupPageID = "Movement Tracker";

    fields
    {
        field(1;"Document No.";Code[20])
        {
        }
        field(2;"Approval Type";Option)
        {
            OptionCaption = 'Loans,Withdrawals,Payment Voucher';
            OptionMembers = Loans,Withdrawals,"Payment Voucher";
        }
        field(3;Stage;Integer)
        {
        }
        field(4;Remarks;Text[50])
        {
        }
        field(5;Status;Option)
        {
            OptionCaption = 'Being Processed,Approved,Rejected';
            OptionMembers = "Being Processed",Approved,Rejected;
        }
        field(6;"Current Location";Boolean)
        {
        }
        field(7;"Date/Time In";DateTime)
        {
        }
        field(8;"Date/Time Out";DateTime)
        {
        }
        field(9;"USER ID";Code[20])
        {
        }
        field(10;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(11;Description;Text[50])
        {
        }
        field(12;Station;Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"Document No.","Approval Type","Entry No.",Stage)
        {
            Clustered = true;
        }
        key(Key3;"Document No.","Current Location")
        {
        }
    }

    fieldgroups
    {
    }
}

