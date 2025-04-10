
table 70007 "Procurement Method"
{
    DrillDownPageID = "Procurement method";
    LookupPageID = "Procurement method";

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
        }
        field(9; "Process Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI,Special RFQ';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI,"Special RFQ";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

