table 57028 "Store Requisition Notes"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document No"; Code[20])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Qty. Requested"; Decimal)
        {
        }
        field(4; "Qty. Approved"; Decimal)
        {
        }
        field(5; "Qty. Issued"; Decimal)
        {
        }
        field(6; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(7; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; Selected; Boolean)
        {
        }
        field(9; "Item No"; Code[20])
        {
        }
        field(10; Description; Text[100])
        {
        }
        field(11; "Unit Measures"; Code[40])
        {
        }
        field(12; "Remaining Qty"; Decimal)
        {
        }
        field(13; "Requisition Date"; Date)
        {
            CalcFormula = lookup("Purchase Header"."Document Date" where("No." = field("Document No")));
            FieldClass = FlowField;
        }
        field(14; "Requsted By"; Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Request-By Name" where("No." = field("Document No")));
            FieldClass = FlowField;
        }
        field(15; Dept; Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Department Code" where("No." = field("Document No")));
            FieldClass = FlowField;
        }
        field(16; "Issue Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

