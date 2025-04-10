
table 69027 "Payroll Pay Mode"
{
    DrillDownPageID = "Payroll Pay Mode";
    LookupPageID = "Payroll Pay Mode";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[150])
        {
        }
        // field(3; "Total Earnings"; Decimal)
        // {
        //     CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
        //                                                           "Pay Mode" = field(Code),
        //                                                           "Payroll Period" = field("Pay Period Filter"),
        //                                                           "Non-Cash Benefit" = const(false)));
        //     FieldClass = FlowField;
        // }
        // field(4; "Total Deductions"; Decimal)
        // {
        //     CalcFormula = - sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
        //                                                            "Pay Mode" = field(Code),
        //                                                            "Payroll Period" = field("Pay Period Filter")));
        //     FieldClass = FlowField;
        // }
        field(5; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

