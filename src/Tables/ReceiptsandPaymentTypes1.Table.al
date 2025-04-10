Table 52193678 "Receipts and Payment Types1"
{
    DrillDownPageID = "Receipts and Payment Typesx";
    LookupPageID = "Receipts and Payment Typesx";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(4; Type; Option)
        {
            OptionMembers = " ",Receipt,Payment;
        }
        field(5; "VAT Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(6; "Withholding Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(7; "VAT Code"; Code[20])
        {
            //TableRelation = Table50022;
        }
        field(8; "Withholding Tax Code"; Code[20])
        {
            //TableRelation = Table50022;
        }
        field(9; "Default Grouping"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(10; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

