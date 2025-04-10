

page 69611 "Ethics & Integrity"
{
    PageType = List;
    SourceTable = "Position Requirement";
    SourceTableView = where("Qualification Category" = const("Ethics & Integrity"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Substitute Qualification"; Rec."Substitute Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Substitute Qualification field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Qualification Category" := Rec."qualification category"::"Ethics & Integrity";
    end;
}

#pragma implicitwith restore

