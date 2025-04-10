

page 69814 "Question Categories"
{
    PageType = List;
    SourceTable = "Candidate Interview Qn Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                }
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

