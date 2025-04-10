
table 80207 "e-BR & Innovation Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
        }
        field(3; "Employee Survey No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(4; "Customer Survey No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(5; "Post-Project Survey No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(6; "Stakeholder Survey No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(7; "Enable Email Alerts"; Boolean)
        {
        }
        field(8; "Notification Email"; Code[50])
        {
        }
        field(9; "BR Templates No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(10; "Surveys No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(11; "Survey Response No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(12; "Custom Surveys No. Series"; Code[30])
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

