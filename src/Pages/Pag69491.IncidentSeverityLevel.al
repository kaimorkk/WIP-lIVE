

page 69491 "Incident Severity Level"
{
    PageType = Card;
    SourceTable = "Incident Severity Level";

    layout
    {
        area(content)
        {
            group(General)
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

