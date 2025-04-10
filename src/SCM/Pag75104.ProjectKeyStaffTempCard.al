

page 75104 "Project Key Staff Temp Card"
{
    PageType = Card;
    SourceTable = "Project Key Staff Template";

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
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
            part(Control17; "Project Staff Template Line")
            {
                Caption = 'Staffing Requirements';
                SubPageLink = "Key Staff Template ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup19)
            {
                action("Purchase requisitions")
                {
                    ApplicationArea = Basic;
                    Image = ReviewWorksheet;
                    RunObject = Page "IFS Purchase Requisitions";
                    RunPageLink = "Document Type" = const("Purchase Requisition"),
                                  "Project Staffing Template ID" = field(Code);
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

