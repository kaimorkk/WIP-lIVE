
table 69081 "Scale Benefits Historical"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(2; "Salary Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer";
        }
        field(3; "ED Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = "PR Transaction Codes";

            trigger OnValidate()
            begin
                if EarningRec.Get("ED Code") then begin
                    "ED Description" := EarningRec."Transaction Name";
                end;
            end;
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "ED Description"; Text[30])
        {
        }
        field(6; "G/L Account"; Code[20])
        {
        }
        field(7; "Basic Salary"; Boolean)
        {
        }
        field(8; "Percentage"; Decimal)
        {
            trigger OnValidate()
            var
                Pointer: Record "Salary Pointers";
            begin
                if "Based On" = "Based On"::Percentage then begin
                    Pointer.Get("Salary Scale", "Salary Pointer");
                    Amount := Pointer."Gross Pay" * Percentage / 100;
                end;
            end;
        }
        field(9; "Based On"; Option)
        {
            OptionMembers = Amount,Percentage;
            OptionCaption = 'Flat Amount,Percentage of Gross';
        }
        field(10; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(11; "Entry Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer", "ED Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningRec: Record "PR Transaction Codes";
}

