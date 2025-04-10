

page 80425 "Additional Performance Ind"
{
    PageType = List;
    SourceTable = "additional Performance Ind";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(KPI; Rec.KPI)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KPI field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

