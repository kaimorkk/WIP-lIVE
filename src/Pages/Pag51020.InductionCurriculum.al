page 51020 "Induction Curriculum"
{
    Caption = 'Induction Objectives';
    PageType = ListPart;
    SourceTable = "Induction Curriculum";
    SourceTableView = where(Type = const(Objective));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = All;
                }

                field(Facilitator; Rec.Facilitator)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Facilitator field.';
                }
                field("Facilitator Name"; Rec."Facilitator Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Facilitator Name field.';
                }
                field("Objective Start Date"; Rec."Objective Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    Editable = false;
                    DrillDownPageId = "Induction Activities";
                    ToolTip = 'Specifies the value of the Objective Start Date field.';

                }
                field("Objective End Date"; Rec."Objective End Date")
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    Editable = false;
                    DrillDownPageId = "Induction Activities";
                    ToolTip = 'Specifies the value of the Objective End Date field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Activities)
            {
                Image = GiroPlus;
                Scope = Repeater;
                RunObject = page "Induction Activities";
                RunPageLink = Objective = field(Objective), "Induction No." = field("Induction No."), Type = filter(Activity);
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Update(false);
    end;
}
