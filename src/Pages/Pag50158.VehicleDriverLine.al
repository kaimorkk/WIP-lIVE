page 50158 "Vehicle Driver Line"
{
    Caption = 'Vehicle Driver Line';
    PageType = ListPart;
    SourceTable = "Vehicle Drivers Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Driver Code"; Rec."Driver Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Code field.';
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                    Editable = false;
                }
                field("Licence Type"; Rec."Licence Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licence Type field.';
                }
            }
        }
    }
}
