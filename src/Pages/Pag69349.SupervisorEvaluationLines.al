

page 69349 "Supervisor Evaluation Lines"
{
    Caption = 'Supervisor Training Impact Assessment';
    PageType = ListPart;
    SourceTable = "Training Evaluations";
    SourceTableView = where(Type = filter(Supervisor));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Supervisor;
    end;
}

#pragma implicitwith restore

