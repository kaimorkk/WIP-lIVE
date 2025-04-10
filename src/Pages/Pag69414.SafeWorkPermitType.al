

page 69414 "Safe Work Permit Type"
{
    PageType = Card;
    SourceTable = "Safe Work Permit Type";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Permit Apps"; Rec."No. of Safe Work Permit Apps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Compl Reports"; Rec."No. of Safe Work Compl Reports")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control8; "Safety Permit Checklist Lines")
            {
                Caption = 'Permit Compliance Checklist';
                SubPageLink = "Permit Type" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Possible Consequence/Impact")
            {
                ApplicationArea = Basic;
                Caption = 'Possible Consequence/Impact';
                Image = EntriesList;
                RunObject = Page "Safety Permit Consequences";
                RunPageLink = "Permit Type" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Possible Consequence/Impact_Promoted"; "Possible Consequence/Impact")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

