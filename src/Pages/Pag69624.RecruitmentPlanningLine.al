

page 69624 "Recruitment Planning Line"
{
    PageType = ListPart;
    SourceTable = "Recruitment Planning Line";

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
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Planned New Hires"; Rec."No. of Planned New Hires")
                {
                    ApplicationArea = Basic;
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Hire Unit Cost"; Rec."Direct Hire Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Average Monthly Salary (LCY)"; Rec."Average Monthly Salary (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Months Recruiter Fees"; Rec."No. of Months Recruiter Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Recruiter Fees %"; Rec."Recruiter Fees %")
                {
                    ApplicationArea = Basic;
                }
                field("Rec Line Budget Cost (LCY)"; Rec."Rec Line Budget Cost (LCY)")
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

