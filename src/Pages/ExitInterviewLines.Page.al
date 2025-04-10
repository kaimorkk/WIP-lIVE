Page 52194278 "Exit Interview Lines"
{
    PageType = ListPart;
    SourceTable = "Exit Interview Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
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

