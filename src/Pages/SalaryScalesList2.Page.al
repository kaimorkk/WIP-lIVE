Page 52194132 "Salary Scales List2"
{
    PageType = List;
    SourceTable = "Salary Scales21";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Scale;Scale)
                {
                    ApplicationArea = Basic;
                }
                field(MinimumPointer;"Minimum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumPointer;"Maximum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityAllowance;"Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                }
                field(CommuterAllowance;"Commuter Allowance")
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

