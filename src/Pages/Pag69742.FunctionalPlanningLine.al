

page 69742 "Functional Planning Line"
{
    PageType = ListPart;
    SourceTable = "Recruitment Planning Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {


                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position Category field.';
                }

                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }

                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Recruitment Reason field.';
                }

                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Establishment field.';
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Headcount field.';
                }
                field("No. of Planned New Hires"; Rec."No. of Planned New Hires")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned New Hires field.';
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Candidate Source field.';
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sourcing Method field.';
                }
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Cycle Type field.';
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                    Editable = false;
                }

            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

