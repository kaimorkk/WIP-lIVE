page 52193653 "Staff Advance"
{
    PageType = List;
    SourceTable = "Staff Advance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No"; "Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; "Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Date Opened"; "Date Opened")
                {
                    ApplicationArea = Basic;
                }
                field("Period Name"; "Period Name")
                {
                    ApplicationArea = Basic;
                }
                field("Period Month"; "Period Month")
                {
                    ApplicationArea = Basic;
                }
                field("Period Year"; "Period Year")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; "Account No.")
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

