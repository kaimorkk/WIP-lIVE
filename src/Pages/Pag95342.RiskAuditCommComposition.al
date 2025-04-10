

page 95342 "Risk & Audit Comm Composition"
{
    PageType = ListPart;
    SourceTable = "Risk & Audit Comm Composition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum No. of Members"; Rec."Minimum No. of Members")
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
            group(Line)
            {
                Caption = 'Line';
                action(Members)
                {
                    ApplicationArea = Basic;
                    Caption = 'Members';
                    RunObject = Page "Audit Committee Member";
                    RunPageLink = Role = field(Role),
                                  "Committee Type" = field("Committee Type");
                }
            }
        }
    }
}

#pragma implicitwith restore

