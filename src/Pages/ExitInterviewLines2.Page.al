Page 52194281 "Exit Interview Lines 2"
{
    PageType = ListPart;
    SourceTable = "Exit Interview Lines1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Question;Question)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Answer;Answer)
                {
                    ApplicationArea = Basic;
                }
                field(Bold;Bold)
                {
                    ApplicationArea = Basic;
                }
                field(AnswerType;"Answer Type")
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

