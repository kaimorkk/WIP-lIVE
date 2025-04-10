
table 80108 "SPE Committee"
{
    DrillDownPageID = "SPE Commitee";
    LookupPageID = "SPE Commitee";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Minimum Members"; Integer)
        {
        }
        field(4; "Process Type"; Option)
        {
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI;
        }
        field(5; "RFQ Same Openinng_ Evaluation"; Boolean)
        {
        }
        field(6; "RFP Same Openinng_ Evaluation"; Boolean)
        {
        }
        field(7; "Tend Same Openinng_ Evaluation"; Boolean)
        {
        }
        field(8; "Evaluation Opening"; Boolean)
        {
        }
        field(9; "Evaluation Process"; Boolean)
        {
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

