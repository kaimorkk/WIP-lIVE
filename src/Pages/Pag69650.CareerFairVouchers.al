

page 69650 "Career Fair Vouchers"
{
    CardPageID = "Career Fair";
    Editable = false;
    PageType = List;
    SourceTable = "Vacancy Announcement";
    SourceTableView = where("Posting Type" = filter("Career Fair"));
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
                    ToolTip = 'Specifies the value of the Announcement No. field.';
                }
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
                field("Recruitment Agency No."; Rec."Recruitment Agency No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Agency No. field.';
                }
                field("Agency Name"; Rec."Agency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agency Name field.';
                }
                field("Actual Recruiter Fees"; Rec."Actual Recruiter Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Recruiter Fees field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("HR Officer User ID"; Rec."HR Officer User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Officer User ID field.';
                }
                field("HR Officer Staff No."; Rec."HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Officer Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
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
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                }
                field("Application Closing  Time"; Rec."Application Closing  Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing  Time field.';
                }
                field("No. of Job Vacancies"; Rec."No. of Job Vacancies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Job Vacancies field.';
                }
                field("Advertisement Cost"; Rec."Advertisement Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Advertisement Cost (LCY) field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
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

