
table 70120 "Tender Document Source"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Tender Site table';
        }
        field(2; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Url Link"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Default IFS Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Charge Schedule to determine default charges for accessing/obtaining tender documents';
            TableRelation = "Bid Charges Schedule".Code;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
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

