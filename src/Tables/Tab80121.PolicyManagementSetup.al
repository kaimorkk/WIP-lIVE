
table 80121 "Policy Management Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
        }
        field(2; "Internal Policy Development"; Code[30])
        {
            TableRelation = "Policy Development Institution".Code;
        }
        field(3; "Internal Policy No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(4; "External Policy No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(5; "Policy Revision No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(6; "Policy Attestation No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(7; "Enable Email Alerts"; Boolean)
        {
        }
        field(8; "Notification Email"; Code[50])
        {
        }
        field(9; "Policy Compliance Audit Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

