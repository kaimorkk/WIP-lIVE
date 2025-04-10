Table 52193531 "Payroll Period"
{
    //LookupPageID = UnknownPage51507379;

    fields
    {
        field(1; "Starting Date"; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Name := Format("Starting Date", 0, '<Month Text>');
            end;
        }
        field(2; Name; Text[10])
        {
        }
        field(3; "New Fiscal Year"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField("Date Locked", false);
            end;
        }
        field(4; Closed; Boolean)
        {
            Editable = true;
        }
        field(5; "Date Locked"; Boolean)
        {
            Editable = true;
        }
        field(50000; "Pay Date"; Date)
        {
        }
        field(50001; "Close Pay"; Boolean)
        {
            Editable = true;

            trigger OnValidate()
            begin
                //TESTFIELD("Close Pay",FALSE);
            end;
        }
        field(50002; "P.A.Y.E"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1"."Income Tax" where("Payroll Period" = field("Starting Date")));
            FieldClass = FlowField;
        }
        field(50003; "Basic Pay"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1"."Basic Pay" where("Payroll Period" = field("Starting Date")));
            FieldClass = FlowField;
        }
        field(50004; "Market Interest Rate %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Starting Date")
        {
            Clustered = true;
        }
        key(Key2; "New Fiscal Year", "Date Locked")
        {
        }
        key(Key3; Closed)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TestField("Date Locked", false);
    end;

    trigger OnInsert()
    begin
        AccountingPeriod2 := Rec;
        if AccountingPeriod2.Find('>') then
            AccountingPeriod2.TestField("Date Locked", false);
    end;

    trigger OnRename()
    begin
        TestField("Date Locked", false);
        AccountingPeriod2 := Rec;
        if AccountingPeriod2.Find('>') then
            AccountingPeriod2.TestField("Date Locked", false);
    end;

    var
        AccountingPeriod2: Record "Payroll Period";
}

