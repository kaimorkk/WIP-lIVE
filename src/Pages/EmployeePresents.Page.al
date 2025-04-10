Page 52194195 "Employee Presents"
{
    // SearchUnit.RUN

    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Employee presents1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Startdate;"Start date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Location;Location)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OK)
            {
                ApplicationArea = Basic;
                Caption = 'View Report';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(OK_Promoted; OK)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
         SearchUnit.Run;
    end;

    var
        SearchUnit: Codeunit "Employee Presence";
}

