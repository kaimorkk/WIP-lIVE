Table 70236 "Cost Comparison Sheet"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Bid Evaluation Register"; Code[20])
        {
        }
        field(3; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition","IEC Materials";
        }
        field(4; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            Editable = true;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                /*vendor.RESET;
                vendor.SETRANGE("No.", "Buy-from Vendor No.");
                IF vendor.FINDSET THEN BEGIN
                  "Gen. Bus. Posting Group":= vendor."Gen. Bus. Posting Group";
                  //"Gen. Prod. Posting Group
                
                END;*/

            end;
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Purchase Header"."No." where("Document Type" = field("Document Type"));
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(7; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item),Service';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)",Service;

            trigger OnValidate()
            var
                TempPurchLine: Record "Purchase Line" temporary;
            begin
            end;
        }
        field(8; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                TempPurchLine: Record "Purchase Line" temporary;
                FindRecordMgt: Codeunit "Find Record Management";
            begin
            end;
        }
        field(9; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            var
                Item: Record Item;
                ConfirmManagement: Codeunit "Confirm Management";
            begin
            end;
        }
        field(10; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = if (Type = const(Item)) "Inventory Posting Group"
            else
            if (Type = const("Fixed Asset")) "FA Posting Group";
        }
        field(11; "Expected Receipt Date"; Date)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Expected Receipt Date';
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            var
                Item: Record Item;
                ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
                FindRecordMgt: Codeunit "Find Record Management";
                ConfirmManagement: Codeunit "Confirm Management";
                ReturnValue: Text[50];
                DescriptionIsNo: Boolean;
            begin
            end;
        }
        field(14; "Unit of Measure"; Text[50])
        {
            Caption = 'Unit of Measure';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
            end;
        }
        field(16; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(17; "Qty. to Invoice"; Decimal)
        {
            Caption = 'Qty. to Invoice';
            DecimalPlaces = 0 : 5;
        }
        field(18; "Qty. to Receive"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Qty. to Receive';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(22; "Direct Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
        }
        field(23; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';

            trigger OnValidate()
            var
                Item: Record Item;
                IndirectCostPercent: Decimal;
            begin
            end;
        }
        field(25; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(28; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';
        }
        field(29; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            Editable = false;
        }
        field(30; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            Editable = false;
        }
        field(31; "Technical Specifications"; Text[2000])
        {
        }
        field(32; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(33; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(34; "Procurement Plan ID"; Code[10])
        {
            TableRelation = "Procurement Plan".Code;
        }
        field(35; "Procurement Plan Entry No"; Integer)
        {
        }
        field(36; "Quantity Partial Issued"; Decimal)
        {
        }
        field(37; Awarded; Boolean)
        {

            trigger OnValidate()
            begin
                // CostComparisonSheet.RESET;
                // CostComparisonSheet.SETRANGE("Bid Evaluation Register","Bid Evaluation Register");
                // CostComparisonSheet.SETRANGE(Description,Description);
                // CostComparisonSheet.SETRANGE("Technical Specifications","Technical Specifications");
                // CostComparisonSheet.SETRANGE(Awarded,TRUE);
                // IF CostComparisonSheet.FINDSET THEN BEGIN
                //  ERROR('%1-%2 item has already been awarded to another Supplier',Description,"Technical Specifications");
                //  END;
            end;
        }
        field(38; "IFS Created"; Boolean)
        {
        }
        field(39; "PP Planning Category"; Code[50])
        {
        }
        field(40; "PP Funding Source ID"; Code[20])
        {
            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(41; "PP Total Budget"; Decimal)
        {
            Editable = false;
        }
        field(42; "PP Total Actual Costs"; Decimal)
        {
        }
        field(43; "PP Total Commitments"; Decimal)
        {
            Editable = false;
        }
        field(44; "PP Total Available Budget"; Decimal)
        {
            Editable = false;
        }
        field(45; "PP Solicitation Type"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(46; "PP Procurement Method"; Option)
        {
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(47; "PP Preference/Reservation Code"; Code[10])
        {
            TableRelation = "Special Vendor Category".Code;
        }
        field(48; "IFS Code"; Code[20])
        {
        }
        field(49; "Bidder Name"; Text[250])
        {
        }
        field(50; "Unit of Measure Code"; Code[20])
        {
        }
        field(51; "Job No"; Code[20])
        {
        }
        field(52; "Job Task No"; Code[20])
        {
        }
        field(53; "Order Created"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Bid Evaluation Register", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
        CostComparisonSheet: Record "Cost Comparison Sheet";
}

