
table 56056 "ICT Helpdesk Global Parameters"
{
    DrillDownPageID = "ICT Helpdesk Setups";
    LookupPageID = "ICT Helpdesk Setups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
        }
        field(2; "User Feedback Duration"; DateFormula)
        {
            Description = '//Gives the user a time for a feedback before the issue is closed completely.';
        }
        field(3; "Assigned Issue Duration"; DateFormula)
        {
        }
        field(4; "ICT Email"; Text[250])
        {
        }
        field(5; "ICT Issuance Voucher Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(6; "ICT Inventory Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(7; "Project Meeting Register Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(8; "ICT Project Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(9; "ICT Maintenance Schedule Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(10; Delegate; Boolean)
        {
        }
        field(11; "ICT Helpdesk Nos."; Code[20])
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

