page 51021 "Induction Activities"
{

    Caption = 'Induction Activities';
    PageType = List;
    SourceTable = "Induction Curriculum";
    SourceTableView = where(Type = const(Activity));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = All;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Start Date field.';
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        CurrPage.Update(false);
                    end;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Time field.';
                }



            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.type::Activity;
    end;
}
