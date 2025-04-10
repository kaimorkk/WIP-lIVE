Table 52193832 BidderRegistration1
{

    fields
    {
        field(3;Companyemail;Text[100])
        {
        }
        field(4;Password;Text[50])
        {
        }
        field(5;Telephone;Code[10])
        {
        }
        field(6;PostalAddress;Text[50])
        {
        }
        field(7;PostalCode;Code[10])
        {
        }
        field(8;Town;Text[50])
        {
        }
        field(9;Country;Text[50])
        {
        }
        field(10;VendorName;Text[100])
        {
        }
        field(11;CountryID;Integer)
        {
        }
        field(12;ContactPerson;Text[100])
        {
        }
        field(13;Status;Integer)
        {
        }
        field(14;BidderID;Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;BidderID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

