

page 75269 "Bid evaluation Criteria Group"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Bid Evaluation Criteria Group";

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
                field("No of Scored Criteria Groups"; Rec."No of Scored Criteria Groups")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Scored Criteria Groups field.';
                }
                field("No of Criteria Croups"; Rec."No of Criteria Croups")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Criteria Croups field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

