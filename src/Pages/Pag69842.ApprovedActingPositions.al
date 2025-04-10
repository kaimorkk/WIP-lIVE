page 69842 "Approved Acting Positions"
{

    PageType = List;
    SourceTable = "Employee Acting Position";
    SourceTableView = where("Promotion Type" = filter("Acting Position"),
                            Status = filter(Approved));

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
                field(Position; Position)
                {
                    ToolTip = 'Specifies the value of the Position field';
                    ApplicationArea = All;
                }
                field("Relieved Employee"; "Relieved Employee")
                {
                    ToolTip = 'Specifies the value of the Relieved Employee field';
                    ApplicationArea = All;
                }
                field("Relieved Name"; "Relieved Name")
                {
                    ToolTip = 'Specifies the value of the Relieved Name field';
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field';
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field';
                    ApplicationArea = All;
                }
                field("Employee No."; "Employee No.")
                {
                    Caption = 'Reliever';
                    ToolTip = 'Specifies the value of the Reliever field';
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
                field("Promotion Type"; "Promotion Type")
                {
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                field("Acting Amount"; "Acting Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

