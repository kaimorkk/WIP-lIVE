page 51019 "Induction Lines"
{
    Caption = 'Induction Lines';
    PageType = ListPart;
    SourceTable = "Induction Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {

                    ApplicationArea = All;
                    Editable = false;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Cost Center Name"; Rec."Cost Center Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cost Center Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
            }
        }
    }
}
