

page 52194316 "Leave Planner List"
{
    CardPageID = "Leave Planner Card";
    PageType = List;
    SourceTable = "HR Leave Planner Header";
    SourceTableView = where(Status = filter(<> Approved));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Leave Calendar"; Rec."Leave Calendar")
                {
                    ApplicationArea = Basic;

                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
                }
                field("Implementing Unit Name"; Rec."Implementing Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit Name field.';
                }



                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

