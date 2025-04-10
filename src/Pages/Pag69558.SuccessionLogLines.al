

page 69558 "Succession  Log Lines"
{
    PageType = ListPart;
    SourceTable = "Succession  Log Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative Category"; Rec."Initiative Category")
                {
                    ApplicationArea = Basic;
                }
                field(Initiative; Rec.Initiative)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer"; Rec."Responsible Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
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

