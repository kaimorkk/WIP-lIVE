Table 52193462 "Security and Attachment Items"
{
    DrillDownPageID = "Security and Attachment Items";
    LookupPageID = "Security and Attachment Items";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;"Used on Loans";Boolean)
        {
        }
        field(4;"Item No";Code[20])
        {
        }
        field(5;"Used on Member Application";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Charges: Record Charges;
        CustPost: Record "Customer Posting Group";
}

