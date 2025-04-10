

page 52194335 "Employee Leave Balances"
{
    PageType = List;
    SourceTable = Employee;
    SourceTableView = where(Status = filter(Active));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Implementing Unit Name"; Rec."Implementing Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit Name field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Duty Station field.';
                }
                // field(Division; Rec."Station Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Division field.';
                // }
                // field("Org Unit"; Rec."Org Unit")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Org Unit field.';
                // }
                // field("Organisation Unit Name"; Rec."Organisation Unit Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Organisation Unit Name field.';
                // }


            }
        }
        area(factboxes)
        {
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Links)
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

