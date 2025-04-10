Table 52193438 "Msacco User Profile"
{
    DrillDownPageID = "Msacco Profile List";
    LookupPageID = "Msacco Profile List";

    fields
    {
        field(1;"No.";Integer)
        {
        }
        field(2;UserName;Text[50])
        {
        }
        field(3;Password;Text[30])
        {
        }
        field(4;Email;Text[50])
        {
        }
        field(5;Reset;Boolean)
        {
        }
        field(6;Locked;Boolean)
        {
        }
        field(7;FailedAttempts;Integer)
        {
        }
        field(8;CreationDate;Date)
        {
        }
        field(9;MemberNo;Code[20])
        {
        }
        field(10;Status;Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved,Released,Active,Non-Active,Suspended,Deceased,Withdrawan,Retired,Termination,Family Member,Rejected,,,BOSA';
            OptionMembers = Open,"Pending Approval",Approved,Released,Active,"Non-Active",Suspended,Deceased,Withdrawan,Retired,Termination,"Family Member",Rejected,,,BOSA;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

