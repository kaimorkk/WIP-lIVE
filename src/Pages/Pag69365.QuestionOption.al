page 69365 "Question Option"
{
    Caption = 'Question Option';
    PageType = ListPart;
    SourceTable = "Closed Qn Response Option";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type ID"; Rec."Type ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type ID field.';
                }

                field("Option Code"; Rec."Option Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Option Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Points"; Rec."Default Points")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Points field.';
                }

            }
        }
    }
}
