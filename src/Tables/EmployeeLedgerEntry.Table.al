Table 52193534 "Employee Ledger Entry1"
{
    DrillDownPageID = "Receipt Linesx Block Schedule";
    LookupPageID = "Receipt Linesx Block Schedule";

    fields
    {
        field(1; Loan; Code[10])
        {
            TableRelation = DeductionsL;
        }
        field(2; Employee; Code[10])
        {
            NotBlank = true;
            //TableRelation = "Loans transactions";
        }
        field(3; "Repayment Date"; Date)
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Principal Amount"; Decimal)
        {
        }
        field(6; "Outstanding Amount"; Decimal)
        {
        }
        field(7; Type; Option)
        {
            OptionMembers = Loan,Advance,"Staff Dues","Union Dues";
        }
        field(8; Description; Text[80])
        {
        }
        field(9; "Basic Pay"; Decimal)
        {
        }
        field(10; "Income Tax"; Decimal)
        {
        }
        field(11; "Payroll Period"; Date)
        {
            NotBlank = true;
            TableRelation = "Payroll Period";
        }
        field(12; "Net Pay"; Decimal)
        {
        }
        field(13; Quarters; Decimal)
        {
        }
        field(14; BfMpr; Decimal)
        {
        }
        field(15; "Posting Group"; Code[10])
        {
            TableRelation = "Employee Posting Group";
        }
        field(16; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(17; CFWD; Decimal)
        {
        }
        field(18; "Owner Occupier"; Decimal)
        {
        }
        field(19; TotalAllowance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field(Employee),
                                                                Type = const(Payment),
                                                                "Payroll Period" = field("Payroll Period")));
            FieldClass = FlowField;
        }
        field(20; "Low Interest Benefits"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Employee, "Payroll Period", "Net Pay")
        {
            Clustered = true;
            SumIndexFields = "Basic Pay", "Income Tax", "Net Pay", Quarters, BfMpr, "Owner Occupier";
        }
        key(Key2; "Posting Group")
        {
            SumIndexFields = "Basic Pay", "Income Tax", "Net Pay", Quarters, BfMpr;
        }
        key(Key3; "Department Code")
        {
            SumIndexFields = "Basic Pay", "Income Tax", "Net Pay", Quarters, BfMpr;
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('Cannot delete entries for previous periods');
    end;

    trigger OnModify()
    begin
        Error('Cannot modify entries for previous periods');
    end;
}

