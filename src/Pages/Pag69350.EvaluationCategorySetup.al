

page 69350 "Evaluation Category Setup"
{
    PageType = List;
    SourceTable = "Rating Category Setup";
    SourceTableView = where(Type = const(Evaluation));
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Rating Category"; Rec."Rating Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Category field.';
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
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Evaluation;
    end;
}

#pragma implicitwith restore

