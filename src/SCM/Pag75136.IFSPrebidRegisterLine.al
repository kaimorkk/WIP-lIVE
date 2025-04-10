

page 75136 "IFS Prebid Register Line"
{
    PageType = ListPart;
    SourceTable = "IFS Prebid Register Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID"; Rec."Prebid Register ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Register ID field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder No field.';
                }
                field("Name of Participating Bidder"; Rec."Name of Participating Bidder")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name of Participating Bidder field.';
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Email field.';
                }
                field("No. of Representatives"; Rec."No. of Representatives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Representatives field.';
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date/Time Notified field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                action(Representative)
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFS Prebid Bidder Attendance";
                    RunPageLink = "Prebid Register ID" = field("Prebid Register ID"),
                                  "IFS Code" = field("IFS Code"),
                                  "Bidder No" = field("Bidder No");
                    ToolTip = 'Executes the Representative action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

