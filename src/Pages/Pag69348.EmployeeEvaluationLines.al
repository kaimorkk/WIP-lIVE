

page 69348 "Employee Evaluation Lines"
{
    Caption = 'Self Training Impact Assessment';
    PageType = ListPart;
    SourceTable = "Training Evaluations";
    SourceTableView = where(Type = filter(Self));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Category field.';
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Description field.';
                    MultiLine = true;
                }
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Code field.';
                    Visible = false;
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Description field.';
                    Visible = false;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Self;
    end;
}

#pragma implicitwith restore

