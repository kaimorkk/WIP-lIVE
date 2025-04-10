

page 52193710 "Establishment Planning Lines"
{
    PageType = List;
    SourceTable = "Establishment Planning Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Location Details field.';
                }
                field("Optimal Staffing"; Rec."Optimal Staffing")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Optimal Staffing field.';
                }
                field(Justification; Rec.Justification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation Group field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                // field("Court Levels"; Rec."Court Levels")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Court Stations"; Rec."Court Stations")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }

                field("No. of Active Employees"; Rec."No. of Active Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Active Employees field.';
                }
                field(Blcoked; Rec.Blcoked)
                {
                    ApplicationArea = Basic;
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
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

