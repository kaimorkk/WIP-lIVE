Page 75158 "Bid Opening Tender Committee"
{
    PageType = List;
    SourceTable = "Bid Opening Tender Committee";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Role Type"; "Role Type")
                {
                    ApplicationArea = Basic;
                }
                field("Member No."; "Member No.")
                {
                    ApplicationArea = Basic;
                }
                field("Member Name"; "Member Name")
                {
                    ApplicationArea = Basic;
                }
                field("Nominated Bid Opening"; "Nominated Bid Opening")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; "Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff  No."; "Staff  No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Member Code"; "Member Code")
                {
                    ApplicationArea = all;
                    ExtendedDatatype = Masked;
                }
            }
        }
    }

    actions
    {
    }
}

