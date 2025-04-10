
table 69610 "Employment Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Employee No."; Code[30])
        {
            TableRelation = Employee;
        }
        field(3; "Posting Date"; Date)
        {
        }
        field(4; "Document Type"; Option)
        {
            OptionCaption = 'Original Employment,Staff Promotion,Staff Transfer,Staff Exit';
            OptionMembers = "Original Employment","Staff Promotion","Staff Transfer","Staff Exit";
        }
        field(5; "Document No."; Code[30])
        {
        }
        field(6; Description; Text[50])
        {
        }
        field(7; "Employment Contract"; Code[30])
        {
        }
        field(8; Status; Option)
        {
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(9; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(10; "Duty Station"; Code[30])
        {
            TableRelation = "Duty Station";
        }
        field(11; "Job Grade"; Code[30])
        {
            TableRelation = "Salary Scales";
        }
        field(12; "Employee Posting Group"; Code[30])
        {
        }
        field(13; Blocked; Boolean)
        {
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(16; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Employee No.", "Posting Date", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Employment Ledger Entry", Format("Entry No"), FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Entry No"));
    end;
}

