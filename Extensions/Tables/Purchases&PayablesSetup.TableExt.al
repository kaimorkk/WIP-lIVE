TableExtension 52193526 tableextension52193526 extends "Purchases & Payables Setup" 
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Allow Document Deletion Before"(Field 46)".

        field(50000;"Purchase Req No";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(50001;"Effective Procurement Plan";Code[30])
        {
            TableRelation = "G/L Budget Name";
        }
        field(50002;"Store Requisition Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(50003;"Appointment Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(50004;"Request for Quotation Nos.";Code[50])
        {
            TableRelation = "No. Series";
        }
        field(50005;"Request for Proposals Nos.";Code[50])
        {
            TableRelation = "No. Series";
        }
        field(50006;"Tenders Nos";Code[50])
        {
            TableRelation = "No. Series";
        }
        field(50007;"Inspection Nos";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(50008;"Store Return Nos";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(50009;"Order Duration";DateFormula)
        {
        }
        field(50010;"Quote Evaluation Nos";Code[10])
        {
        }
        field(50012;"Contract Expiry Duration";DateFormula)
        {
        }
        field(50013;"Stores Issuer";Code[20])
        {
            TableRelation = "User Setup";
        }
        field(50014;"Finance Notification";Code[20])
        {
            TableRelation = "User Setup";
        }
        field(50015;"Item Issue Journal Template";Code[20])
        {
            TableRelation = "Item Journal Template";
        }
        field(50016;"Send Payment Notification";Boolean)
        {
        }
        field(50017;"Expression of Interest Nos.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50020;"Due Period";DateFormula)
        {
        }
        field(50021;"Payment Due Notification Email";Text[60])
        {
        }
        field(50022;"Penalty Amount Per Day";Decimal)
        {
        }
        field(68000;"Transaction Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68001;"Treasury Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68002;"Standing Orders Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68003;"FOSA Current Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68004;"BOSA Current Account";Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(68005;"Teller Transactions No";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68006;"Treasury Transactions No";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68007;"Applicants Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68008;"STO Register No";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68009;"EFT Header Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68010;"EFT Details Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68011;"Salaries Nos.";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68012;"Normal Cheque Transfers Nos";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(68013;"Direct Prcmnt Nos";Code[50])
        {
        }
        field(68014;"PDF Docs Path";Text[100])
        {
        }
        field(68015;"Asset Disposal Nos";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(68018;"Contract Notification Email";Text[30])
        {
        }
        field(68020;"Low Value Prcmnt Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(68021;"Specially Permitted Prcmnt Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(68022;"Pre-Qualification Batches";Integer)
        {
        }
        field(68023;"RFQ Documents Path";Text[250])
        {
        }
        field(59011; "LSO Nos."; Code[10])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'LSO Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(70012; "Contract Nos"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70013; "Legal Dept Code"; Code[50])
        {
            Caption = 'Legal Department Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(70001; "Procument Plan Nos"; Code[10])
        {
            Caption = 'Requisition No';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}

