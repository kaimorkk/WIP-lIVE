page 51024 "Current Skills Assessment"
{

    Caption = 'Current Skills Assessment';
    PageType = ListPart;
    SourceTable = "Current Skills Assessment";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Major Tasks"; Rec."Major Tasks")
                {
                    ApplicationArea = All;
                }
                field("Training Required"; Rec."Training Required")
                {
                    ApplicationArea = All;
                }
                field("Existing Training Needs"; Rec."Existing Training Needs")
                {
                    Editable = Rec."Training Required";
                    ApplicationArea = All;
                }
                field("Training Mode"; Rec."Training Mode")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = All;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
