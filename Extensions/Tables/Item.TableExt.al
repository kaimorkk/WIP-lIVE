TableExtension 52193436 tableextension52193436 extends Item
{
    fields
    {

        field(50000; Dummy; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(60000; "Contract No."; Code[20])
        {
            TableRelation = Contract;
        }
        field(70003; "Product Group"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(57001; "Vote Item"; Code[20])
        {
            CalcFormula = lookup("General Posting Setup"."Purch. Account" where("Gen. Prod. Posting Group" = field("Gen. Prod. Posting Group")));
            FieldClass = FlowField;
            TableRelation = "G/L Account";
        }
        field(70000; "Bill Item Group Code"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70001; Quantity; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70002; "Amount Excl. VAT"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70005; "Location Code"; Code[20])
        {
            CalcFormula = lookup("Item Ledger Entry"."Location Code" where("Item No." = field("No."),
                                                                            "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                            "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                            "Location Code" = field("Location Filter"),
                                                                            "Drop Shipment" = field("Drop Shipment Filter"),
                                                                            "Variant Code" = field("Variant Filter"),
                                                                            "Lot No." = field("Lot No. Filter"),
                                                                            "Serial No." = field("Serial No. Filter")));
            Caption = 'Location Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "Procurement Category"; Code[20])
        {
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
    }

}

