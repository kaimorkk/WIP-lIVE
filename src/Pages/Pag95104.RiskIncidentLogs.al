

page 95104 "Risk Incident Logs"
{
    Caption = 'Incidence Reporting';
    CardPageID = "Risk Incident Log";
    PageType = List;
    SourceTable = "Risk Incident Log";
    SourceTableView = where(Posted = const(false),
                            "Escalated?" = const(false),
                            "Document Status" = filter(Submitted | Draft),
                            "Document Type" = const("Risk Incident Report"));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Incident ID"; Rec."Incident ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Risk Incident Category"; Rec."Risk Incident Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Occurrence Type"; Rec."Occurrence Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Incident Start Time"; Rec."Incident Start Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Incident End Time"; Rec."Incident End Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Incident Location Details"; Rec."Incident Location Details")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Trigger ID"; Rec."Primary Trigger ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Root Cause Summary"; Rec."Root Cause Summary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Category of Person Reporting"; Rec."Category of Person Reporting")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Reported By (Name)"; Rec."Reported By (Name)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Incident Class"; Rec."Incident Class")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("HSE Management Plan ID"; Rec."HSE Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Hazard ID"; Rec."Hazard ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual Financial Impact (LCY)"; Rec."Actual Financial Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual Schedule Delay(Days)"; Rec."Actual Schedule Delay(Days)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual No. Injured Persons"; Rec."Actual No. Injured Persons")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual No. of Fatalities"; Rec."Actual No. of Fatalities")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Parties Involved"; Rec."No. of Parties Involved")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Corrective Actions"; Rec."No. of Corrective Actions")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Preventive Actions"; Rec."No. of Preventive Actions")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Police Report Reference No."; Rec."Police Report Reference No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Police Report Date"; Rec."Police Report Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Police Station"; Rec."Police Station")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Reporting Officer"; Rec."Reporting Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

