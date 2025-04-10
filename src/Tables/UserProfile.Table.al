Table 52193583 "User Profile"
{

    fields
    {
        field(1;UserId;Integer)
        {
            AutoIncrement = true;
        }
        field(2;UserName;Text[50])
        {
        }
        field(3;Password;Text[50])
        {
        }
        field(4;Email;Text[30])
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
        field(8;CreationDate;DateTime)
        {
        }
        field(9;MemberNo;Code[50])
        {
        }
        field(10;"PhoneNo.";Text[30])
        {
        }
        field(11;IDNo;Code[20])
        {
        }
        field(12;Picture;Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
    }

    keys
    {
        key(Key1;UserId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

