

page 75054 "Bid Score Criteria Group"
{
    PageType = List;
    SourceTable = "Bid Score Criteria Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group ID field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Weight % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

