Table 52194103 Users
{

    fields
    {
        field(1;UserID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;UserName;Text[50])
        {
        }
        field(3;LastName;Text[50])
        {
        }
        field(4;FirstName;Text[50])
        {
        }
        field(5;MiddleName;Text[50])
        {
        }
        field(6;Telephone;Text[30])
        {
        }
        field(7;Mobile;Time)
        {
        }
        field(8;Email;Text[30])
        {
        }
        field(9;Url;Text[30])
        {
        }
        field(10;Password;Text[30])
        {
        }
        field(11;UserStatusID;Integer)
        {
        }
        field(12;CreatedDate;Date)
        {
        }
        field(13;CreatedUserID;Integer)
        {
        }
        field(14;EmployeeID;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

