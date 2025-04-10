

page 69647 "Approved  Vacancy Ann Voucher"
{
    PageType = Card;
    SourceTable = "Vacancy Announcement";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Announcement No."; Rec."Announcement No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Announcement No. field.';
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
            group("Announcement Details")
            {
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
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
            }
            part(Control18; "Announcement Lines")
            {
                SubPageLink = "Announcement No." = field("Announcement No."),
                              "Posting Type" = field("Posting Type");
                ApplicationArea = Basic;
            }
            group("Organization Details")
            {
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Organization Overview"; Rec."Organization Overview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Overview field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control4; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control2; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Caption = 'Publish to E-Recruitment Portal';
                Image = PostedPutAway;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                    Recruitment: Codeunit Recruitment;
                begin
                    if Confirm('Are you sure you want to advertise the vacancies on this document?') = true then begin
                        Recruitment.AdvertiseVacancy(Rec);
                    end
                    //create ledger entries
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Publish to E-Recruitment Portal_Promoted"; "Publish to E-Recruitment Portal")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

