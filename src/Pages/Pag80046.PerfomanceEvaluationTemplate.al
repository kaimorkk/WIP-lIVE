

page 80046 "Perfomance Evaluation Template"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("General Instructions"; Rec."General Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Global?"; Rec."Global?")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Model"; Rec."Performance Rating Model")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Total Score Model"; Rec."Total Score Model")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Default Competency A_Template"; Rec."Default Competency A_Template")
                {
                    ApplicationArea = Basic;
                }
                field("General A_Questionnaire"; Rec."General A_Questionnaire")
                {
                    ApplicationArea = Basic;
                }
                field("Peer Reviewer FB_Questionnaire"; Rec."Peer Reviewer FB_Questionnaire")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allocated Weight (%)"; Rec."Total Allocated Weight (%)")
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
        area(creation)
        {
            action("Performance Evaluation Weight")
            {
                ApplicationArea = Basic;
                Image = UnitConversions;
                RunObject = Page "Performance Evaluation Weight";
                RunPageLink = "Per_Evaluation Template ID" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Performance Evaluation Weight_Promoted"; "Performance Evaluation Weight")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

