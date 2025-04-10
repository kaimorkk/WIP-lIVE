Page 52194158 "Training Template"
{
    ApplicationArea = Basic;
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Training Evaluation Template1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LineNo; "Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Question; Question)
                {
                    ApplicationArea = Basic;
                }
                field(AnswerType; "Answer Type")
                {
                    ApplicationArea = Basic;
                }
                field(Bold; Bold)
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

