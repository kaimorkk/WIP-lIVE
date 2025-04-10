

page 69415 "Safety Permit Checklists"
{
    CardPageID = "Safety Permit Checklist";
    PageType = List;
    SourceTable = "Safety Permit Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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

