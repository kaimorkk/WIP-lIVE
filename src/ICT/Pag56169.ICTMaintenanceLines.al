

page 56169 "ICT Maintenance Lines"
{
    PageType = ListPart;
    SourceTable = "ICT Maintenance Lines";
    Caption='Maintenance Schedule Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Maintenance Area"; Rec."Maintenance Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Area field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Inventory Category"; Rec."Inventory Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory Category field.';
                }
                field("No. of Planned Periods"; Rec."No. of Planned Periods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Periods field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Maintenance Periods")
            {
                ApplicationArea = Basic;
                Image = PeriodEntries;
                RunObject = Page "Maintenance Periods";
                RunPageLink = "Document No" = field("Document No"),
                              "Maintenance Code" = field("Maintenance Area");
                ToolTip = 'Executes the Maintenance Periods action.';
            }
            action("Maintenance Activities")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                RunObject = Page "Maintenance Activities";
                RunPageLink = "Document No" = field("Document No"),
                              "Maintenance Code" = field("Maintenance Area");
                ToolTip = 'Executes the Maintenance Activities action.';
            }
            action("ICT Inventory")
            {
                ApplicationArea = Basic;
                Image = FixedAssetLedger;
                RunObject = Page "ICT Maintenance Inventory";
                RunPageLink = "Document No" = field("Document No"),
                              "Mainatenance Code" = field("Maintenance Area");
                ToolTip = 'Executes the ICT Inventory action.';
            }
        }
    }
}

#pragma implicitwith restore

