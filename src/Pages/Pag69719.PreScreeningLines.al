

page 69719 "Pre-Screening Lines"
{
    PageType = ListPart;
    SourceTable = "Pre-Screen Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Id"; Rec."Question Id")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                }
                field("Close Ended Qn Type"; Rec."Close Ended Qn Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Options)
            {
                action("Answer Options")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Template Line Options";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Question ID" = field("Question Id");
                }
            }
        }
    }
}

#pragma implicitwith restore

