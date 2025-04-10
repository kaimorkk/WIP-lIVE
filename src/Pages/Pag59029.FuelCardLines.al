

page 59029 "Fuel Card Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Fuel Card Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reciept No"; Rec."Reciept No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reciept No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date of Fueling"; Rec."Date of Fueling")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Fueling field.';
                }
                field("Vehicle RegNo"; Rec."Vehicle RegNo")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                    ToolTip = 'Specifies the value of the Vehicle RegNo field.';
                }
                field("vehicle Make"; Rec."vehicle Make")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the vehicle Make field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Drivers List";
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Names"; Rec."Driver Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Names field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

