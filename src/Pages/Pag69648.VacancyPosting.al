

page 69648 "Vacancy Posting"
{
    PageType = List;
    SourceTable = "Vacancy Announcement Posting";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Announcement No."; Rec."Announcement No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Board ID"; Rec."Job Board ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Advertisment Cost"; Rec."Advertisment Cost")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Posting Link"; Rec."Job Posting Link")
                {
                    ApplicationArea = Basic;
                }
                field("Channel Category"; Rec."Channel Category")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

