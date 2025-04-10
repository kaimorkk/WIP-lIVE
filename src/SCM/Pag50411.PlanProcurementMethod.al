page 50411 "Plan Procurement Method"
{
    Caption = 'Plan Procurement Method';
    PageType = ListPart;
    SourceTable = "PP Plan Procurement Method";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Default Procurement Method"; Rec."Default Procurement Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Procurement Method field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
