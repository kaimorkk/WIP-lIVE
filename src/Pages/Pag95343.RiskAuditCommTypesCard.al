

page 95343 "Risk & Audit Comm Types Card"
{
    PageType = Card;
    SourceTable = "Audit Committee Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Mandate Type"; Rec."Mandate Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Title of Appointing Officer"; Rec."Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Non-Staff Allowed"; Rec."Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                }
                field("Min. No. of Members"; Rec."Min. No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Appointments Made"; Rec."No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control16; "Risk & Audit Comm Composition")
            {
                SubPageLink = "Committee Type" = field("Committee Type");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup18)
            {
                action("Committee Mandate/Functions")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    RunObject = Page "Audit Committee Function";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
                action("Committee Appointments")
                {
                    ApplicationArea = Basic;
                    Image = ConfidentialOverview;
                    RunObject = Page "Risk & Audit Committee";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
                action(Members)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    RunObject = Page "Audit Committee Member";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Committee Mandate/Functions_Promoted"; "Committee Mandate/Functions")
                {
                }
                actionref("Committee Appointments_Promoted"; "Committee Appointments")
                {
                }
                actionref(Members_Promoted; Members)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

