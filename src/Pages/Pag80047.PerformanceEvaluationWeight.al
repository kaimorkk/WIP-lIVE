

page 80047 "Performance Evaluation Weight"
{
    PageType = List;
    SourceTable = "Performance Evaluation Weight";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Per_Evaluation Template ID"; Rec."Per_Evaluation Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Key Evaluation Section"; Rec."Key Evaluation Section")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight (%)"; Rec."Total Weight (%)")
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

