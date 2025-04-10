page 69843 "Rejected Promotion List"
{

    CardPageID = "Employee Promotion Card";
    PageType = List;
    SourceTable = "Employee Acting Position";
    SourceTableView = where("Promotion Type" = const(Promotion),
                            Status = filter(Rejected));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ToolTip = 'Specifies the value of the No field';
                    ApplicationArea = All;
                }
                field("Promotion Type"; "Promotion Type")
                {
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                field("Employee No."; "Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field';
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

