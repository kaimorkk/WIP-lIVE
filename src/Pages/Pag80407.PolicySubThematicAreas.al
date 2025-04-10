

page 80407 "Policy Sub Thematic Areas"
{
    CardPageID = "Policy Sub Thematic Area";
    Editable = false;
    PageType = List;
    SourceTable = "Policy Sub Thematic Area";

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
                field(Introduction; Rec.Introduction)
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = Basic;
                }
                field(Application; Rec.Application)
                {
                    ApplicationArea = Basic;
                }
                field("Policy statement"; Rec."Policy statement")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Guideline"; Rec."Policy Guideline")
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

