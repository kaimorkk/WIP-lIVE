tableextension 50003 "Vendor Bank Account Ext" extends "Vendor Bank Account"
{
    fields
    {
        modify("Bank Branch No.")
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank Code"));
            trigger OnAfterValidate()
            var
                PRBankBranches: Record "PR Bank Branches";
            begin
                if PrBankBranches.Get("Bank Branch No.", "Bank Code") then
                    "Bank Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(70000; "Available Credit Line Valu"; Decimal)
        {
            Caption = 'Available Credit Line Value (LCY)';
            DataClassification = CustomerContent;
            Description = 'Customized field used to track the available credit line value for each bank (e.g. OD value). It is vital during bid assessment for Work IFSs where financiing is a factor to consider when evaluating the vendor''s financial capacity';
        }
        field(70001; "Bank Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "PR Bank Accounts"."Bank Code";

            trigger OnValidate()
            var
                PRBanks: Record "PR Bank Accounts";
            begin
                if PRBanks.Get("Bank Code") then
                    "Bank Name" := PRBanks."Bank Name";
            end;
        }
        field(70002; "Bank Branch Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70003; "Bank Account Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70004; Blocked; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(7005; "Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
