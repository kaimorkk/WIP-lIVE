

page 69636 "Vacancy Responsibilities"
{
    PageType = ListPart;
    SourceTable = "Recruitment Req Responsibility";
    SourceTableView = where("Document Type" = filter("Job Vacancy"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

