 
tableextension 52193471 "tableextension50030" extends "Purch. Inv. Header"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Currency Code"(Field 32)".

        field(50000; "Debit Note"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Remaining Amount LCY"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Document No." = field("No.")));
            Caption = 'Remaining Amount';
            Editable = false;
            FieldClass = FlowField;
        }

        field(50002; holdInvoice; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70217; "TCC Number"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        field(70218; "TCC Status"; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70219; "TCC Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70220; "PIN Status"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70221; "Vendor Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Purchase Requisition No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(8603724; "Source RecordID"; RecordId)
        {
            Editable = false;
        }


    }
}

