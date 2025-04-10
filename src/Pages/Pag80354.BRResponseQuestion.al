

page 80354 "BR Response Question"
{
    PageType = List;
    SourceTable = "BR Response Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey Response ID"; Rec."Survey Response ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Response ID field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
                field("General Response Statement"; Rec."General Response Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Response Statement field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field(Mandatory; Rec.Mandatory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandatory field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Response Score Guide")
            {
                ApplicationArea = Basic;
                Image = Document;
                RunObject = Page "BR Response Score Guide";
                RunPageLink = "Survey Response ID" = field("Survey Response ID"),
                              "Section Code" = field("Section Code"),
                              "Question ID" = field("Question ID");
                ToolTip = 'Executes the BR Response Score Guide action.';
            }
            action("Related Question")
            {
                ApplicationArea = Basic;
                Image = Questionaire;
                RunObject = Page "BR Branch Response Questions";
                RunPageLink = "Response ID" = field("Survey Response ID"),
                              "Section Code" = field("Section Code"),
                              "Parent Question ID" = field("Question ID"),
                              "Parent Response" = field("Response Value");
                ToolTip = 'Executes the Related Question action.';
            }
            action("Multiple Responses")
            {
                ApplicationArea = Basic;
                Image = Document;
                RunObject = Page "BR Multiple Response";
                RunPageLink = "Survey Response ID" = field("Survey Response ID"),
                              "Section Code" = field("Section Code"),
                              "Question ID" = field("Question ID");
                ToolTip = 'Executes the Multiple Responses action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("BR Response Score Guide_Promoted"; "BR Response Score Guide")
                {
                }
                actionref("Multiple Responses_Promoted"; "Multiple Responses")
                {
                }
                actionref("Related Question_Promoted"; "Related Question")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

