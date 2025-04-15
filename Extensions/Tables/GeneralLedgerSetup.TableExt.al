TableExtension 52193461 tableextension52193461 extends "General Ledger Setup"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Cust. Balances Due"(Field 44)".

        field(50009; "Posted Receipts No"; Code[20])
        {
            Caption = 'Receipts No';
            DataClassification = CustomerContent;
        }
        field(50146; "Bank Balances"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where("Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Posting Date" = field("Date Filter")));
            Caption = 'Bank Balances';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50147; "Pending L.O.P"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where("Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Expected Receipt Date" = field("Date Filter"),
                                                                                Amount = filter(<> 0),
                                                                                "Document Type" = filter(<> Quote)));
            FieldClass = FlowField;
        }
        field(50148; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
            DataClassification = CustomerContent;
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
        field(86000; "Imprest Nos"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(86001; "Current Budget Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(86003; "Receipt Nos"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(86004; "Current Budget End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(86005; "DMS PV Link"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(86006; "PV Nos"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(86007; "Receipt No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(86008; "Cash Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(86009; "Payments No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(860010; "Payment Vouchers No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(860011; "Petty Cash Payments No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(860012; "Company Bankers Cheque Account"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(860013; "Levy Nos"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(860014; "Claim Nos"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(860015; "Change Request No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(860016; "Attachments Path"; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(860017; "Petty Cash Nos"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8600018; "Journal Numbers"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
}

