Page 52193978 "Salary Scales List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Salary Scales1";
    UsageCategory = Administration;

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
                field(InPatientLimit;"In Patient Limit")
                {
                    ApplicationArea = Basic;
                }
                field(OutPatientLimit;"Out Patient Limit")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Pointers)
            {
                Caption = 'Pointers';
                action(Action1000000015)
                {
                    ApplicationArea = Basic;
                    Caption = 'Pointers';
                    RunObject = Page "Scale Benefits";
                    RunPageLink = "Salary Scale"=field(Scale);
                    RunPageView = sorting("Salary Scale","Salary Pointer","ED Code");
                }
            }
        }
    }
}

