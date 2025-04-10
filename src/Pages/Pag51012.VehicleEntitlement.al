page 51012 "Vehicle Entitlement"
{
    ApplicationArea = All;
    Caption = 'Vehicle Entitlement';
    PageType = List;
    SourceTable = "Vehicle Entitlement";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Station No"; Rec."Station No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station No field.';
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                    TableRelation = "Vehicle Type";
                }
                field("No of Vehicles"; Rec."No of Vehicles")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Vehicles field.';
                }

            }
        }
    }
}
