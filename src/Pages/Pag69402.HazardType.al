

page 69402 "Hazard Type"
{
    PageType = Card;
    SourceTable = "Hazard Type";

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
            part(Control8; "Hazard Control Measure Lines")
            {
                Caption = 'Hazard Control Measures';
                SubPageLink = "Hazard Type" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

