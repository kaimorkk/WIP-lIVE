

page 69416 "Safety Permit Checklist"
{
    PageType = Card;
    SourceTable = "Safety Permit Checklist";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Condition Type"; Rec."Condition Type")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level for Violation"; Rec."Severity Level for Violation")
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

