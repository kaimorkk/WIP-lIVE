

page 69744 "Question Group"
{
    PageType = List;
    SourceTable = "Hr Screening Qn Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Template Line")
            {
                ApplicationArea = Basic;
                RunObject = Page "Application Submission Line";
                RunPageLink = "Line No." = field("Entry No.");
            }
        }
    }
}

#pragma implicitwith restore

