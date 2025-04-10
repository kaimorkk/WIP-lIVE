Table 52194070 LevySetup
{

    fields
    {
        field(1;LevySetupID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;LicenceTypeID;Integer)
        {
        }
        field(3;CreatedDate;DateTime)
        {
        }
        field(4;EffectiveDate;Date)
        {
        }
        field(5;UserID;Integer)
        {
        }
        field(7;ModuleID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;LevySetupID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //Percentage := CURRENTDATETIME;
    end;
}

