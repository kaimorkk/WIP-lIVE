

page 58416 "Key Performance Indicators"
{
    PageType = List;
    SourceTable = "Key Performance Indicator";

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
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field(Achievement; Rec.Achievement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievement field.';
                }
                field("Minimum Target"; Rec."Minimum Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Target field.';
                }
                field("Maximum Target"; Rec."Maximum Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maximum Target field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

