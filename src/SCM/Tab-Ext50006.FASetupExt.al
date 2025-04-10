tableextension 50006 "FA Setup Ext" extends "FA Setup"
{
    fields
    {
        field(11; "Insurance Expiry Period"; DateFormula)
        {
            DataClassification = CustomerContent;
        }
        field(70000; "Reclass. Voucher Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70001; "ReClass Journal Template"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template".Name where(Type = const(Assets));
        }
        field(70002; "ReClass Journal Batch"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("ReClass Journal Template"));
        }
        field(70003; "Staff Insurance Nos."; Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70004; "Insurance Claim  Nos."; Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70005; "Gate Pass Nos."; Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70006; "Property Reports  Nos."; Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70007; "Maintenance Request  Nos."; Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}
