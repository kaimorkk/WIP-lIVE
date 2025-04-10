Page 52193979 "Scale Benefits"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Scale Benefits1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SalaryScale;"Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryPointer;"Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field(EDCode;"ED Code")
                {
                    ApplicationArea = Basic;
                }
                field(EDDescription;"ED Description")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

