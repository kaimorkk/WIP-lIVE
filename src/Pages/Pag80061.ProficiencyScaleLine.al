

page 80061 "Proficiency Scale Line"
{
    PageType = List;
    SourceTable = "Proficiency Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Proficiency Scale ID"; Rec."Proficiency Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Level ID"; Rec."Level ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Score Value"; Rec."Default Score Value")
                {
                    ApplicationArea = Basic;
                }
                field("Behavioral Indicator"; Rec."Behavioral Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("General Recommendations"; Rec."General Recommendations")
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

