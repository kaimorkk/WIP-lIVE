
page 75379 "Supplier Registration Periods"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Supplier Registration Periods";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

