Table 52193722 "Vendor dates1"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            TableRelation = Vendor;
        }
        field(2;StartDate;Date)
        {
        }
        field(3;EndDate;Date)
        {

            trigger OnValidate()
            begin
                 if StartDate>EndDate then
                 Error('Start date cannot be greater than end date');
            end;
        }
    }

    keys
    {
        key(Key1;"Code",StartDate,EndDate)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

