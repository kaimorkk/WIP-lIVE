 
   #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 50001 "Tariff Codes1"
{
    DrillDownPageID = "Tariff Codes1";
    LookupPageID = "Tariff Codes1";
    DataClassification = CustomerContent;
    Caption = 'Tariff Codes';

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Percentage; Decimal)
        {
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"."No." where("Direct Posting" = const(false))
            else
            if ("Account Type" = const(Vendor)) Vendor."No.";
        }
        field(5; Type; Option)
        {
            OptionMembers = " ","W/Tax",VAT,Excise,Others,Retention,Clevy,Scharge,PAYE,Penalty;
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Vendor Posting Group"; Code[40])
        {
            Description = 'Store the Retention Amount on Posting to Vendor Account';
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Posting Group".Code;
        }
        field(14; "Tax Obligation"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Tax Transaction Types";
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

