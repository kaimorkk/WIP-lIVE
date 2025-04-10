

page 80123 "Proficiency Evalulation-E"
{
    PageType = ListPart;
    SourceTable = "Proficiency Evaluation Result";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Evaluation ID"; Rec."Performance Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Competency Code"; Rec."Competency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Competency Description"; Rec."Competency Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Competency Category"; Rec."Competency Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Proficiency Direction"; Rec."Desired Proficiency Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Profiency Rating Scale"; Rec."Profiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("AppraiserReview Qty"; Rec."AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
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

