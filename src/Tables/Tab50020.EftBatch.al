 
   table 50020 "EFT Batch"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Minimum Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Maximum Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
        fieldgroup(DropDown; Code, "Minimum Amount", "Maximum Amount")
        {
        }
    }
}