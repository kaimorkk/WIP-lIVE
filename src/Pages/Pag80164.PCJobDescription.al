

page 80164 "PC Job Description"
{
    PageType = ListPart;
    SourceTable = "PC Job Description";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Number"; Rec."Line Number")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Line Number field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity field.';
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                    Visible = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                    Visible = false;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                    Visible = false;
                }
                field("Outcome Perfomance Indicator"; Rec."Key Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                    Visible = false;
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agreed Targets field.';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight (%) field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Sub JD Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    RunObject = Page "Sub JD Objectives";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                                  "Line Number" = field("Line Number");
                    ToolTip = 'Executes the Sub JD Objectives action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

