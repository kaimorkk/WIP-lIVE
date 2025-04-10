

page 52193723 "Job Grade Pointers"
{
    PageType = ListPart;
    SourceTable = "Salary Pointers";
    SourceTableView = sorting("Salary Scale", Arrangement)
                      order(ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field(Arrangement; Rec.Arrangement)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arrangement field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Min Salary"; Rec."Min Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Salary field.';
                }
                field("Max Salary"; Rec."Max Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Salary field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Grades Benefits")
            {
                ApplicationArea = Basic;
                Image = BinLedger;
                RunObject = Page "Job Grades Benefits";
                RunPageLink = "Salary Scale" = field("Salary Scale"),
                              "Salary Pointer" = field("Salary Pointer");
                ToolTip = 'Executes the Job Grades Benefits action.';
            }
        }
    }
}

#pragma implicitwith restore

