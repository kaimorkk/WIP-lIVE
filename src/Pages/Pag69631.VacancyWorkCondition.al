

page 69631 "Vacancy Work Condition"
{
    Caption = 'Vacancy Work Condition';
    PageType = List;
    SourceTable = "Recruitment Req Work Condition";
    SourceTableView = where("Document Type" = filter("Job Vacancy"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Working Condition Category"; Rec."Working Condition Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

#pragma implicitwith restore

