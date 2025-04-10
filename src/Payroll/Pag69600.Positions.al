

page 52193707 "Positions"
{
    CardPageID = "Position Card";
    Editable = false;
    PageType = List;
    SourceTable = "Company Positions";
    SourceTableView = where("Position Category" = filter("Management Trainee" | Intern | Employee));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary/Job Purpose"; Rec."Executive Summary/Job Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service"; Rec."Default Terms of Service")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
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

                field("Minimum Work Experience"; Rec."Minimum Work Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Default Probation Period"; Rec."Default Probation Period")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; Links)
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

