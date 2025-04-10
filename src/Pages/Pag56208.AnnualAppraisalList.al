

page 56208 "Annual Appraisal List"
{
    CardPageID = "Annual Appraisal";
    Editable = false;
    PageType = List;
    SourceTable = "Annual Appraisal";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date created field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Overall Quartely score"; Rec."Overall Quartely score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Quartely score field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("Supervisor Designation"; Rec."Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Designation field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Notes)
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

