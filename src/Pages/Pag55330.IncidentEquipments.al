page 55330 "Incident Equipments"
{
    ApplicationArea = All;
    Caption = 'Incident Equipments';
    PageType = List;
    SourceTable = "Incident Equipments";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Equipment ID field.';
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Equipment Name field.';
                }
                field("Used Quantity"; Rec."Used Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Used Quantity field.';
                }
            }
        }
    }
}
