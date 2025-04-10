page 50156 "Vehicle Incidents Part"
{
    Caption = 'Vehicle Incidents Part';
    PageType = ListPart;
    SourceTable = "Vehicle Incident";
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Incident No."; Rec."Incident No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident No. field.';
                }
                field("Licence Plate Number"; Rec."Licence Plate Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licence Plate Number field.';
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver ID field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident Date field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Vehicle Incident Card")
            {
                RunObject = page "Vehicle Incident Card";
                RunPageLink = "Incident No." = field("Incident No.");
                ApplicationArea = All;
            }
        }
    }
}
