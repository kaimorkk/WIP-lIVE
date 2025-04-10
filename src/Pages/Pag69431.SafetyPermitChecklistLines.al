

page 69431 "Safety Permit Checklist Lines"
{
    PageType = ListPart;
    SourceTable = "Safety Permit Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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

