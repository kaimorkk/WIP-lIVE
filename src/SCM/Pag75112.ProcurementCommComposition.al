

page 75112 "Procurement Comm Composition"
{
    PageType = ListPart;
    SourceTable = "Procurement Comm Composition";

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
                    RunObject = Page "IFS Tender Committee Member";
                    RunPageLink = Role = field(Role),
                                  "Committee Type" = field("Committee Type");
                }
            }
        }
    }
}

#pragma implicitwith restore

