page 50317 "Approved Leave Plans"
{
    Caption = 'Approved Leave Plans';
    CardPageID = "Approved Leave Plan";
    InsertAllowed=false;
    Editable=false;
    DeleteAllowed=false;
    ModifyAllowed=false;
    PageType = List;
    SourceTable = "HR Leave Planner Header";
    SourceTableView = where(Status = filter(Approved));


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