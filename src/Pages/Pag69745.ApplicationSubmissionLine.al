

page 69745 "Application Submission Line"
{
    Caption = 'Application Submission Line';
    PageType = ListPart;
    SourceTable = "Hr Screening Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Category field.';
                }
                field("Question Id"; Rec."Question Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Id field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

