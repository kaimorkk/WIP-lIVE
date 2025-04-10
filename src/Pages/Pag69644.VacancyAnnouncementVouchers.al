

page 69644 "Vacancy Announcement Vouchers"
{
    CardPageID = "Vacancy Announcement Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Vacancy Announcement";
    SourceTableView = where("Posting Type" = filter("Direct Hire Announcement"));
    UsageCategory = Tasks;
    ApplicationArea = All;

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
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Agency No."; Rec."Recruitment Agency No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Name"; Rec."Agency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Recruiter Fees"; Rec."Actual Recruiter Fees")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer User ID"; Rec."HR Officer User ID")
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer Staff No."; Rec."HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing  Time"; Rec."Application Closing  Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Job Vacancies"; Rec."No. of Job Vacancies")
                {
                    ApplicationArea = Basic;
                }
                field("Advertisement Cost"; Rec."Advertisement Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; Links)
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

