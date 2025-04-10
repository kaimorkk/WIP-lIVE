

page 59127 "Fleet Vehicle Allocation"
{
    PageType = ListPart;
    SourceTable = "Fleet Vehicle Allocation";
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                /* field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                } */
                field("Vehicle Req. No"; Rec."Vehicle Req. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Req. No field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    Caption = 'Passenger Capacity';
                    ToolTip = 'Specifies the value of the Passenger Capacity field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

