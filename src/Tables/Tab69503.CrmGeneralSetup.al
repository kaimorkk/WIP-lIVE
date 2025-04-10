
table 69503 "Crm General Setup."
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary key"; Code[10])
        {
        }
        field(2; "Lead Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(3; "General Enquiries Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(4; "Cases nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(5; "Crm logs Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6; "Training Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7; "Customer App Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(8; "Customer Feedback Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

