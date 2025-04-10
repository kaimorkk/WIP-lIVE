

page 52193692 "HR Setup List"
{
    CardPageID = "Human Resources Setup";
    PageType = List;
    SourceTable = "Human Resources Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number series code to use when assigning numbers to employees.';
                }


                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the base unit of measure, such as hour or day.';
                }

            }
        }
        area(factboxes)
        {
            systempart(Control1000000088; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000089; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000090; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

