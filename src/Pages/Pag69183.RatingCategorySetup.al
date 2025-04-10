

page 69183 "Rating Category Setup"
{
    PageType = List;
    SourceTable = "Rating Category Setup";
    SourceTableView = where(Type = filter(Feedback));
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
        Rec.Type := Rec.Type::Feedback;
    end;
}

#pragma implicitwith restore

