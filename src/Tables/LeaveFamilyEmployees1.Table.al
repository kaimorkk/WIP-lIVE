Table 52193911 "Leave Family Employees1"
{

    fields
    {
        field(1;Family;Code[20])
        {
            NotBlank = true;
        }
        field(2;"Employee No";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(3;Remarks;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;Family,"Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

