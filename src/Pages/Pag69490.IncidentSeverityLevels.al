

page 69490 "Incident Severity Levels"
{
    CardPageID = "Incident Severity Level";
    PageType = List;
    SourceTable = "Incident Severity Level";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Of Reported Incidents"; Rec."No. Of Reported Incidents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Reported Incidents field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

