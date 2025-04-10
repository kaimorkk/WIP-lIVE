

page 69697 "Announcement Lines"
{
    PageType = ListPart;
    SourceTable = "Vacancy Announcement Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sourcing Method field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Category field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("No. of Openings"; Rec."No. of Openings")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Openings field.';
                }
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
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
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
                field("Line Budget Cost (LCY)"; Rec."Line Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Budget Cost (LCY) field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Related Information")
            {
                action("Position Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Vacancy ID");
                    ToolTip = 'Executes the Position Requirements action.';
                }
                action("Vacancy Substitutes")
                {
                    ApplicationArea = Basic;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Substitutes";
                    RunPageLink = "Document No." = field("Vacancy ID");
                    ToolTip = 'Executes the Vacancy Substitutes action.';
                }
                action("Position Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Responsibilities";
                    RunPageLink = "Document No." = field("Vacancy ID");
                    ToolTip = 'Executes the Position Responsibilities action.';
                }
                action("Position Work Condition")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Work Condition";
                    RunPageLink = "Document No" = field("Vacancy ID");
                    ToolTip = 'Executes the Position Work Condition action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

