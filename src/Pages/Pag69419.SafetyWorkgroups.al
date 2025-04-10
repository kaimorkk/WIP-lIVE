

page 69419 "Safety Workgroups"
{
    CardPageID = "Safety Workgroup";
    PageType = List;
    SourceTable = "Safety Workgroup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workgroup ID"; Rec."Workgroup ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Category"; Rec."Stakeholder Category")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("OSH Plan Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = Accounts;
                RunObject = Page "HSE Plan Emergency Contacts";
                RunPageLink = "Safety Workgroup ID" = field("Workgroup ID");
            }
            action("Emergency Drill Records")
            {
                ApplicationArea = Basic;
                Image = Reconcile;
                RunObject = Page "Emergency Drill Logs";
            }
            action("Risk Incident Logs")
            {
                ApplicationArea = Basic;
                Image = Log;
                RunObject = Page "Risk Incident Logss";
            }
            action("Safe Work Permit Applications")
            {
                ApplicationArea = Basic;
                Image = ApplicationWorksheet;
                RunObject = Page "Safe Work Permit Application";
                RunPageView = where("Document Type" = filter("Safe Work Permit Application"));
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("OSH Plan Emergency Contacts_Promoted"; "OSH Plan Emergency Contacts")
                {
                }
                actionref("Emergency Drill Records_Promoted"; "Emergency Drill Records")
                {
                }
                actionref("Risk Incident Logs_Promoted"; "Risk Incident Logs")
                {
                }
                actionref("Safe Work Permit Applications_Promoted"; "Safe Work Permit Applications")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

