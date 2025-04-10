

page 75107 "Project Staff Template Qualif"
{
    PageType = List;
    SourceTable = "Project Staff Template Qualifi";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key Staff Template ID"; Rec."Key Staff Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Qualification Req"; Rec."Minimum Qualification Req")
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

