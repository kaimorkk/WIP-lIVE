

page 75220 "EOI Response Line"
{
    PageType = ListPart;
    SourceTable = "IFP Response Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Description field.';
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Document No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Special Group Reservation"; Rec."Special Group Reservation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Reservation field.';
                }
                field("Unique Category Requirements"; Rec."Unique Category Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unique Category Requirements field.';
                }
                field("Global RC Prequalification"; Rec."Global RC Prequalification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global RC Prequalification field.';
                }
                field("Restricted Responsbility Cente"; Rec."Restricted Responsbility Cente")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted Responsbility Center field.';
                }
                field("Restricted RC ID"; Rec."Restricted RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted RC ID field.';
                }
                field("Prequalification Start Date"; Rec."Prequalification Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Start Date field.';
                }
                field("Prequalification End Date"; Rec."Prequalification End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification End Date field.';
                }
                field("Evaluation Decision"; Rec."Evaluation Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Decision field.';
                }
                field("Evaluation Score %"; Rec."Evaluation Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Score % field.';
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
                action("RFI Category Requirement ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specific Requirement';
                    Image = Category;
                    RunObject = Page "RFI Category Requirement";
                    RunPageLink = "Requirement Code" = field("Procurement Category");
                    ToolTip = 'Executes the Specific Requirement action.';
                }
                action("Prequalified Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalified Responsibility Centers';
                    Image = Comment;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Document Type" = field("Document Type");
                    ToolTip = 'Executes the Prequalified Responsibility Centers action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

