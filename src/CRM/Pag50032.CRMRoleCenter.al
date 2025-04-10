page 52193913 "CRM Role Center"
{
    ApplicationArea = All;
    Caption = 'CRM Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Relationship Mgt.")
            {
                ApplicationArea = Basic, Suite;
            }
            part(CRM; "CRM Cues")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }
    actions
    {
        area(Embedding)
        {
            action(Contacts)
            {
                ApplicationArea = Basic;
                RunObject = Page "Contact List";
            }
        }
        area(Sections)
        {
            group("Complaints & Enquiries")
            {
                group(Complaints1)
                {
                    Caption = 'Complaints';
                    action(Complaints)
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Complaints list";
                        RunPageView = where(Status = filter(Open), "Interaction Type" = filter(Complaint));
                    }
                    action("Escalated Complaints")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Complaints list";
                        RunPageView = where(Status = filter(Assigned), "Interaction Type" = filter(Complaint));
                    }
                    action("Closed Complaints")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Closed Complaints list";
                        RunPageView = where(Status = filter(Resolved | Closed), "Interaction Type" = filter(Complaint));
                    }
                }
                group(Enquiries1)
                {
                    Caption = 'Enquiries';
                    action(Enquiries)
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Enquiry list";
                        RunPageView = where(Status = filter(Open), "Interaction Type" = filter(Enquiry));
                    }
                    action("Escalated Enquiries")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Enquiry list";
                        RunPageView = where(Status = filter(Assigned), "Interaction Type" = filter(Enquiry));
                    }
                    action("Closed Enquiries")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Enquiry list";
                        RunPageView = where(Status = filter(Resolved | Closed), "Interaction Type" = filter(Enquiry));
                    }
                }
            }
            group("Feedback & Suggestions")
            {
                group(Feedback1)
                {
                    Caption = 'Feedback';
                    action(Feedback)
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Feedback list";
                        RunPageView = where(Status = filter(Open), "Interaction Type" = filter(Feedback));
                    }
                    action("Relayed Feedback")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Feedback list";
                        RunPageView = where(Status = filter(Assigned | Resolved | Closed), "Interaction Type" = filter(Feedback));
                    }
                }
                group(Suggestions1)
                {
                    Caption = 'Suggestions';
                    action(Suggestions)
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Suggestions list";
                        RunPageView = where(Status = filter(Open), "Interaction Type" = filter(Suggestion));
                    }
                    action("Relayed Suggestions")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Suggestions list";
                        RunPageView = where(Status = filter(Assigned | Resolved | Closed), "Interaction Type" = filter(Suggestion));
                    }
                }

            }
            group(Compliments)
            {
                action(Compliments1)
                {
                    Caption = 'Compliments';
                    ApplicationArea = Basic;
                    RunObject = Page "Compliments list";
                }
            }
            group(Surveys)
            {
                action("Customer Experience")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Customer Experiences";
                }
                action("Approved Customer Experience")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Customer Experiences";
                }
                action("Customer Survey Responses")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Customer Survey Responses";
                }
                action("Archived Customer Surveys")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Archived Customer Surveys";
                }

            }

            group(Setups)
            {
                action(Cases)
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Case set-ups";
                }
                action("Complaints Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Complaints set-ups";
                }
                action("CRM Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "CRM Setup List";
                }
                action("Communication Channels")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Customer Group & Mode";
                }

            }
        }
    }
}
profile "CRM Role Center"
{
    Caption = 'CRM Role Center';
    RoleCenter = "CRM Role Center";
    ProfileDescription = 'CRM Role Center';
}
