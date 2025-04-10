
table 70213 "Purchase Contract Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[80])
        {
        }
        field(3; "Procurement Type"; Code[30])
        {
        }
        field(4; "Procurement Doc Template ID"; Code[30])
        {
            Description = 'Procurement Document Template ID';
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(5; "Default Language Code"; Code[30])
        {
            TableRelation = Language.Code;
        }
        field(6; "Governing Laws"; Text[50])
        {
        }
        field(7; "Max Contract Variation %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Defects Liability Period"; DateFormula)
        {
            Caption = 'Default Defects Liability Period';
        }
        field(9; "Daily Liquidated Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(10; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "Payment Retention %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(12; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            Description = 'Retention Amount Limit % (Contract Value)';
        }
        field(13; "Minimum Interim Certificate"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            Description = 'Minimum Interim Certificate Amount (LCY)';
        }
        field(14; "Written Consent for 3rd Party"; Boolean)
        {
            Caption = 'Written Consent for 3rd Party Assignment';
            Description = 'Written Consent for 3rd Party Assignment';
        }
        field(15; "Limitation of Liability Clause"; Boolean)
        {
        }
        field(16; "Idemnification Clause"; Boolean)
        {
        }
        field(17; "Full Transfer of Ownership"; Boolean)
        {
            Caption = 'Full Transfer of Ownership  on Completion';
            Description = 'Full Transfer of Ownership  on Completion';
        }
        field(18; "Written Consent for Subcontr"; Boolean)
        {
            Caption = 'Written Consent for Subcontracting';
            Description = 'Written Consent for Subcontracting';
        }
        field(19; "Max Subcontractor Value %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(20; "Amicable Dispute Settlement"; Boolean)
        {
            Caption = 'Amicable Dispute Settlement Allowed';
            Description = 'Amicable Dispute Settlement Allowed';
        }
        field(21; "Appointer of Arbitrator"; Text[80])
        {
        }
        field(22; "Min Termination Notice Period"; Date)
        {
            Description = 'Minimum Termination Notice Period';
        }
        field(23; Blocked; Boolean)
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

