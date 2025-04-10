

page 75234 "Standard Purch Requsition Temp"
{
    PageType = Card;
    SourceTable = "Purchase Requisition Template";

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
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "BoQ Template Line1")
            {
                Caption = 'Requisition Lines';
                SubPageLink = "BoQ Template ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup10)
            {
                action("Purchase requisitions")
                {
                    ApplicationArea = Basic;
                    Image = ReviewWorksheet;
                    RunObject = Page "Open Purchase Requisitions";
                    RunPageLink = "Document Type" = const("Purchase Requisition"),
                                  "Requisition Template ID" = field(Code);
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Purchase requisitions_Promoted"; "Purchase requisitions")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

