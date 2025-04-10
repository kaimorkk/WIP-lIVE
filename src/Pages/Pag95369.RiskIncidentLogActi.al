

page 95369 "Risk Incident Log Acti"
{
    CardPageID = "Risk Incident Log Action";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Risk Incident Log Action";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("% Complete"; Rec."% Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

