
table 69019 "Scale Benefits"
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

    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer", "ED Code")
        {
            Clustered = true;
        }
    }



    fieldgroups
    {
    }

    var
        EarningRec: Record "PR Transaction Codes";

    trigger OnModify()
    var
        HistoricalBenefits: Record "Scale Benefits Historical";
        EntryNo: Integer;
    begin
        if (Rec.Amount <> xRec.Amount) or (Rec."ED Code" <> xRec."ED Code") then begin
            HistoricalBenefits.Reset();
            if HistoricalBenefits.FindLast() then
                EntryNo := HistoricalBenefits."Entry No" + 1
            else
                EntryNo := 1;
            HistoricalBenefits.Init();
            HistoricalBenefits.TransferFields(xRec);
            historicalBenefits."Entry Type" := 'Out Going';
            HistoricalBenefits."Entry No" := EntryNo;
            HistoricalBenefits.insert(true);
        end;
    end;
}

