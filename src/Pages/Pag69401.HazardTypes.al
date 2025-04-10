

page 69401 "Hazard Types"
{
    CardPageID = "Hazard Type";
    PageType = List;
    SourceTable = "Hazard Type";
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
                field("Hazard Category"; Rec."Hazard Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Category field.';
                }
                field("No. of Reported Incidents"; Rec."No. of Reported Incidents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Reported Incidents field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

