

page 95085 "Impact Risk Rating Scale Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Rating Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Rating Scale Type field.';
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Rating Scale ID field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Rating Score"; Rec."Rating Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Score field.';
                }
                field("Actual Rating"; Rec."Actual Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Rating field.';
                }
                field("No. of Criteria"; Rec."No. of Criteria")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Criteria field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = '&Line';
                action("Impact Criteria")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    RunObject = Page "Risk Rating Criteria";
                    RunPageLink = "Risk Rating Scale Type" = filter("Impact Rating"),
                                  "Rating Scale ID" = field("Rating Scale ID"),
                                  Code = field(Code);
                    ToolTip = 'Executes the Impact Criteria action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

