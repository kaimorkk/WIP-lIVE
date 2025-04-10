table 70048 "Disposal Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(3; "Fixed Asset/Item No."; Code[20])
        {
            TableRelation = if (Type = const(Item)) Item
            else
            if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(4; "FA Name"; Text[250])
        {
        }
        field(5; Location; Code[20])
        {
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(8; "Disposal Plan"; Code[20])
        {
        }
        field(9; "Disposal Item No"; Integer)
        {
            TableRelation = if (Type = const(Item)) "Disposal Plan Lines"."Line No." where("Disposal header" = field("Disposal Plan"),
                                                                                          Disposed = const(false),
                                                                                          Type = const(Item))
            else
            if (Type = const("Fixed Asset")) "Disposal Plan Lines"."Line No." where("Disposal header" = field("Disposal Plan"),
                                                                                                                                                                      Disposed = const(false),
                                                                                                                                                                      Type = const("Fixed Asset"));

            trigger OnValidate()
            begin
                DisposalPlan.Reset;
                DisposalPlan.SetRange(DisposalPlan."Line No.", "Disposal Item No");
                if DisposalPlan.Find('-') then begin
                    if DisposalPlan.Type = DisposalPlan.Type::Item then begin
                        Type := Type::Item;
                        "Fixed Asset/Item No." := DisposalPlan."Item No.";
                    end;
                    if DisposalPlan.Type = DisposalPlan.Type::"Fixed Asset" then begin
                        Type := Type::"Fixed Asset";
                        "Fixed Asset/Item No." := DisposalPlan."Item No.";
                        FixedAsset.Get("Fixed Asset/Item No.");
                        "FA Name" := FixedAsset.Description;
                        Location := FixedAsset."Location Code";
                    end;

                    "Description of Item" := DisposalPlan."Description of Item";
                    "Unit of Issue" := DisposalPlan."Unit of Issue";
                    "Estimated current value" := DisposalPlan."Estimated current value";
                    "Market Value" := DisposalPlan."Market Value";
                    Quantity := DisposalPlan.Quantity;
                    "Disposal Type" := DisposalPlan."Disposal Type";
                    "Method of Disposal" := DisposalPlan."Method of Disposal";
                end;
            end;
        }
        field(10; Type; Option)
        {
            OptionCaption = 'Fixed Asset,Item';
            OptionMembers = "Fixed Asset",Item;
        }
        field(11; "Unit of Issue"; Code[10])
        {
            Editable = false;
            TableRelation = "Unit of Measure";
        }
        field(12; Quantity; Decimal)
        {
            Editable = false;
        }
        field(13; "Estimated current value"; Decimal)
        {
            Editable = false;
        }
        field(14; "Description of Item"; Text[250])
        {
            Editable = false;
        }
        field(15; "Disposal Type"; Code[20])
        {
            TableRelation = "Disposal Types".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                if DisposalTypes.Get("Disposal Type") then begin
                    "Method of Disposal" := DisposalTypes."Method of Disposal";
                end;
            end;
        }
        field(16; "Disposal Methods"; Text[50])
        {
            CalcFormula = lookup("Disposal Types".Description where(Code = field("Disposal Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Method of Disposal"; Option)
        {
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = " ","Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(18; Generated; Boolean)
        {
        }
        field(19; "IFD No"; Code[30])
        {
        }
        field(20; "Market Value"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Fixed Asset/Item No.", "Disposal Plan")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        DisposalHeader.Get("Document No.");
        "Global Dimension 1 Code" := DisposalHeader."Global Dimension 1 Code";
        "Global Dimension 2 Code" := DisposalHeader."Global Dimension 2 Code";
        Validate("Global Dimension 1 Code");
        Validate("Global Dimension 2 Code");
        "Disposal Plan" := DisposalHeader."Disposal Plan";
    end;

    var
        DisposalHeader: Record "Disposal Header";
        FixedAsset: Record "Fixed Asset";
        DisposalPlan: Record "Disposal Plan Lines";
        DisposalTypes: Record "Disposal Types";
}

