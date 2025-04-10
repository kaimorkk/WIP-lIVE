

page 80007 "Stakeholder Sub-Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Sub-Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Group"; Rec."Stakeholder Group")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Stakeholders"; Rec."No. of Stakeholders")
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

