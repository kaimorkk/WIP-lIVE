TableExtension 52193461 tableextension52193461 extends "General Ledger Setup"
{
    fields
    {

        //Unsupported feature: Property Deletion (Editable) on ""Global Dimension 1 Code"(Field 79)".


        //Unsupported feature: Property Deletion (Editable) on ""Global Dimension 2 Code"(Field 80)".


        //Unsupported feature: Code Modification on ""Prepayment Unrealized VAT"(Field 151).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Unrealized VAT" AND xRec."Prepayment Unrealized VAT" THEN
          ERROR(DependentFieldActivatedErr,FIELDCAPTION("Prepayment Unrealized VAT"),FIELDCAPTION("Unrealized VAT"));

        IF NOT "Prepayment Unrealized VAT" THEN BEGIN
          VATPostingSetup.SETFILTER(
        #6..16
              TaxJurisdiction.Code,TaxJurisdiction.FIELDCAPTION("Unrealized VAT Type"),
              TaxJurisdiction."Unrealized VAT Type");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Unrealized VAT" AND xRec."Prepayment Unrealized VAT" THEN
          ERROR(Text024,FIELDCAPTION("Prepayment Unrealized VAT"),FIELDCAPTION("Unrealized VAT"));
        #3..19
        */
        //end;
        field(50000; "PV Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50002; "Petty Cash Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50003; "Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50007; "File Directory"; Text[100])
        {
        }
        field(50008; "Change Request No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50009; "Share Top Up Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(51000; "Payments No"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(51001; "Withholding Agent"; Boolean)
        {
        }
        field(51002; "Cash Limit"; Decimal)
        {
        }
        field(51003; "Default Bank Account"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(51004; "Default Cash Account"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(51005; "Attachments Path"; Text[250])
        {
        }
        field(51006; "Current Budget"; Code[100])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(51007; "Commissioner Letters"; Text[250])
        {
        }
        field(51008; "DMS Imprest Claim Link"; Text[250])
        {
        }
        field(51009; "DMS PV Link"; Text[250])
        {
        }
        field(51010; "DMS Imprest Link"; Text[250])
        {
        }
        field(51011; "Remittance Sender Name"; Text[30])
        {
        }
        field(51012; "Remittance Sender Address"; Text[80])
        {
        }
        field(51013; "Claim Nos"; Code[20])
        {
        }
        field(51014; "Imprest Nos"; Code[20])
        {
        }
        field(51015; "Levy Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(51016; "Receipt No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(51017; "Current Budget Start Date"; Date)
        {
        }
        field(51018; "Current Budget End Date"; Date)
        {
        }
        field(51019; "EFT File Path"; Code[30])
        {
        }
        field(51020; "Journal Numbers"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68000; "Company Bankers Cheque Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(68001; "Internal Salary Tr No"; Code[10])
        {
        }
        field(68002; "Cheque Control Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(68003; "Payment Vouchers No"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(68004; "Petty Cash Payments No"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(68005; "PV LIne Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(59002; "Service Nos."; Code[10])
        {
            Caption = 'Service Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(59003; "File Movement Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(59004; "DMS Link"; Text[70])
        {
            DataClassification = CustomerContent;
        }
        field(59005; "Tax Rounding Precision (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Tax Rounding Precision (LCY)';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Amount Rounding Precision" <> 0 then
                    if "Inv. Rounding Precision (LCY)" <> ROUND("Inv. Rounding Precision (LCY)", "Amount Rounding Precision") then
                        Error('', FieldCaption("Inv. Rounding Precision (LCY)"), "Amount Rounding Precision");
            end;
        }
        field(59006; "Tax Rounding Type (LCY)"; Option)
        {
            Caption = 'Tax Rounding Type (LCY)';
            DataClassification = CustomerContent;
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(59007; "Budget Reallocation Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(59008; "Supplementary Budget Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(59009; "Reallocation Consolidation Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    var
        Text024: label 'You cannot change the contents of the %1 field because the %2 is activated.';
}

