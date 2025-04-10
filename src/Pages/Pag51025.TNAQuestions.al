page 51025 "TNA Questions"
{
    Caption = 'TNA Questions';
    PageType = ListPart;
    SourceTable = "TNA Questions";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Question; Rec.Question)
                {
                    ApplicationArea = All;
                }
                field(Answer; Rec.Answer)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
