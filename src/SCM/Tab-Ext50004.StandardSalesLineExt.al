tableextension 50004 "Standard Sales Line Ext" extends "Standard Sales Line"
{
    fields
    {
        field(13; "Method of Disposal"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = " ","Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(14; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            var
                Item: Record Item;
                IsHandled: Boolean;
            begin
            end;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(70000; "Disposal Plan"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70001; "Disposal Item No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70002; "Estimated current value"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70003; "Disposal Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Disposal Types".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                if DisposalTypes.Get("Disposal Type") then begin
                    "Method of Disposal" := DisposalTypes."Method of Disposal";
                end;
            end;
        }
        field(70004; "Disposal Methods"; Text[50])
        {
            CalcFormula = lookup("Disposal Types".Description where(Code = field("Disposal Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70005; "Disposal Requisition No"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70006; "Sell to Customer No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.", "Sell to Customer No");
                if Customer.FindSet then begin

                    "Customer Name" := Customer.Name;
                end;
            end;
        }
        field(70007; "Actual Unit Cost(LCY)"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Actual Total Cost(LCY)" := Quantity * "Actual Unit Cost(LCY)";
            end;
        }
        field(70008; "Actual Total Cost(LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70009; Generated; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70010; "Customer Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70011; "Sale Contract No"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70012; "Awarded Quote No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = if ("Method of Disposal" = const("Sale by Public Tender")) "Sales Header"."No." where("Document Type" = const(Quote),
                                                                                                                 "Disposal Invitation No" = field("Standard Sales Code"));

            trigger OnValidate()
            begin
                SalesHeader.Reset;
                SalesHeader.SetRange("Document Type", SalesHeader."document type"::Quote);
                SalesHeader.SetRange("No.", "Awarded Quote No");
                if SalesHeader.FindSet then begin
                    "Sell to Customer No" := SalesHeader."Sell-to Customer No.";
                    "Customer Name" := SalesHeader."Sell-to Customer Name";
                    SalesLine.Reset;
                    SalesLine.SetRange("Document No.", SalesHeader."No.");
                    SalesLine.SetRange(Type, Type);
                    SalesLine.SetRange("No.", "No.");
                    if SalesLine.FindSet then begin
                        "Actual Unit Cost(LCY)" := SalesLine."Unit Price";
                        "Location Code" := SalesLine."Location Code";
                        "Actual Total Cost(LCY)" := Quantity * "Actual Unit Cost(LCY)";
                    end else begin
                        Error('ERROR! The attached quote does not the quote for Item %1 ,Kindly Check ', "No.");
                    end;
                end;
            end;
        }
        field(70013; "Trade-in Asset No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange("No.", "Trade-in Asset No");
                if FixedAsset.FindSet then
                    "Trade-in Asset Description" := FixedAsset.Description;
            end;
        }
        field(70014; "Trade-in Asset Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        DisposalTypes: Record "Disposal Types";
        FixedAsset: Record "Fixed Asset";
}