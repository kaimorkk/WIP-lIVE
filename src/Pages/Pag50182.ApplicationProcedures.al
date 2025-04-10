page 50182 "Application Procedures"
{
    Caption = 'Application Procedures';
    PageType = CardPart;
    SourceTable = Vacancy;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Application Procedures';

                field("Application Procedure 1"; Rec."Application Procedure 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Procedure 1 field.';
                }
                field("Application Procedure 2"; Rec."Application Procedure 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Procedure 2 field.';
                }
                field("Application Procedure 3"; Rec."Application Procedure 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Procedure 3 field.';
                }
                field("Application Procedure 4"; Rec."Application Procedure 4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Procedure 4 field.';
                }
            }
        }
    }
}
