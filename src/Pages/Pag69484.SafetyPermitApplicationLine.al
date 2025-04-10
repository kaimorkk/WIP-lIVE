

page 69484 "Safety Permit Application Line"
{
    PageType = ListPart;
    SourceTable = "Safety Permit Application Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Requirement"; Rec."Compliance Requirement")
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
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Compliance Notes"; Rec."Additional Compliance Notes")
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

