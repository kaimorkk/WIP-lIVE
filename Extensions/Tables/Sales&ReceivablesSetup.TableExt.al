TableExtension 52193525 tableextension52193525 extends "Sales & Receivables Setup"
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Allow Document Deletion Before"(Field 46)".

        field(50000; "Imprest Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50001; "Claim Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50002; "Imprest Surrender Period"; Integer)
        {
        }
        field(50003; "User Support Inc Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50004; "Imprest Accounting Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50005; "Default Transaction Type"; Code[20])
        {
            // TableRelation = "Loan Product Type1";
        }
        field(50006; "File Issue No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50007; "Litigation source code"; Code[30])
        {
        }
        field(50008; "Requisition No"; Code[30])
        {
        }
        field(50009; "Trip Nos"; Code[20])
        {
        }
        field(50010; "Tyre Nos"; Code[20])
        {
        }
        field(50011; "Levy Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50012; "Batch Invoice Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(53014; "Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(68000; "FOSA Loans Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68001; "Members Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68002; "BOSA Loans Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68003; "Loans Batch Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68004; "BOSA Applicant Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68005; "Micro Finance Loan Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68006; "Mf-Trans Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68009; "Imprest Card Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(69004; "Withholding Tax %"; Decimal)
        {
        }
        field(69005; "Withholding Tax Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(69006; "VAT %"; Decimal)
        {
        }
        field(69007; "VAT Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(69008; "Applicants Member Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(69009; "ICT Helpdesk Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69010; "Disposal No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}

