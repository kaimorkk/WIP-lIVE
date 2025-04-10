

page 80412 "Policy Sub Thematic Area rev"
{
    PageType = Card;
    SourceTable = "Policy Sub Thematic Area rev";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Introduction; Rec.Introduction)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Application; Rec.Application)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy statement"; Rec."Policy statement")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Guideline"; Rec."Policy Guideline")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

