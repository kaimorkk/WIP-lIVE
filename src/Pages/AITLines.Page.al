Page 52194279 "AIT Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "AIT Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Question; Question)
                {
                    ApplicationArea = Basic;
                }
                field(Answer; Answer)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        QuestionOnFormat;
    end;

    var

        QuestionEmphasize: Boolean;

    local procedure QuestionOnFormat()
    begin
        if Bold then
            QuestionEmphasize := true;
    end;
}

