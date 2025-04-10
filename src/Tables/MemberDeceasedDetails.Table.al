Table 52193602 "Member Deceased Details"
{

    fields
    {
        field(1;"Member Code";Code[20])
        {
            NotBlank = true;
            TableRelation = Customer."No.";
        }
        field(2;Detail;Text[50])
        {
            NotBlank = true;
            TableRelation = "Death Certificate Details".Detail;
        }
        field(3;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Member Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

