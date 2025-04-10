
page 51003 "Published Ann Vouchers"
{
    CardPageID = "Published Announcement Voucher";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Vacancy Announcement";
    SourceTableView = where("Posting Type" = const("Direct Hire Announcement"),
                            "Approval Status" = const(Released));//,
                                                                 // "Vacancy Status"=filter(Published));
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Announcement No."; "Announcement No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Type"; "Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Agency No."; "Recruitment Agency No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Name"; "Agency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Recruiter Fees"; "Actual Recruiter Fees")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants"; "No. of Participants")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer User ID"; "HR Officer User ID")
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer Staff No."; "HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; "Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date Published"; "Date Published")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; "Application Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing  Time"; "Application Closing  Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Job Vacancies"; "No. of Job Vacancies")
                {
                    ApplicationArea = Basic;
                }
                field("Advertisement Cost"; "Advertisement Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control44; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

