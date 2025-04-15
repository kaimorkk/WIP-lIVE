 
    table 50025 "Default Dimension Custom"
{
    Caption = 'Default Dimension';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Default Dim Doc Type")
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set Id");
            end;
        }

        field(3; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set Id");
            end;
        }

        field(4; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(3, "Shortcut Dimension 3 Code", "Dimension Set Id");
            end;
        }
        field(5; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(4, "Shortcut Dimension 4 Code", "Dimension Set Id");
            end;
        }
        field(6; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(5, "Shortcut Dimension 5 Code", "Dimension Set Id");
            end;
        }
        field(7; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(6, "Shortcut Dimension 6 Code", "Dimension Set Id");
            end;
        }
        field(8; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(7, "Shortcut Dimension 8 Code", "Dimension Set Id");
            end;
        }
        field(9; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(8, "Shortcut Dimension 8 Code", "Dimension Set Id");
            end;
        }
        field(10; "Dimension Set Id"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Set Entry";
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    procedure GetDimensionCodes(DocType: Enum "Default Dim Doc Type"; var DimensionCodes: array[8] of Code[20])
    var
        DefaultDim: Record "Default Dimension Custom";
    begin
        Clear(DimensionCodes);
        if DefaultDim.Get(DocType) then begin
            DimensionCodes[1] := DefaultDim."Global Dimension 1 Code";
            DimensionCodes[2] := DefaultDim."Global Dimension 2 Code";
            DimensionCodes[3] := DefaultDim."Shortcut Dimension 3 Code";
            DimensionCodes[4] := DefaultDim."Shortcut Dimension 4 Code";
            DimensionCodes[5] := DefaultDim."Shortcut Dimension 5 Code";
            DimensionCodes[6] := DefaultDim."Shortcut Dimension 6 Code";
            DimensionCodes[7] := DefaultDim."Shortcut Dimension 7 Code";
            DimensionCodes[8] := DefaultDim."Shortcut Dimension 8 Code";
        end;
    end;

    var
        DimensionMgt: Codeunit DimensionManagement;

}