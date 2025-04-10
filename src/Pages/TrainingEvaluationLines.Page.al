Page 52194159 "Training Evaluation Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Training Evaluation Lines1";
    SourceTableView = where("Answer Type" = const(Selection));

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
                field(Selection; Selection)
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

