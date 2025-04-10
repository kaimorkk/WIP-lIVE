

page 75008 "Proc Regulation Version"
{
    PageType = List;
    SourceTable = "Proc Regulation Version";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Version Code"; Rec."Version Code")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
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

