page 70146 "Disposal Plan Lines-f"
{

    PageType = ListPart;
    SourceTable = "Disposal Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(ItemNo; "Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(DescriptionofItem; "Description of Item")
                {
                    ApplicationArea = Basic;
                }
                field(UnitofIssue; "Unit of Issue")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(DateOfPurchase; "Date Of Purchase")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PurchaseUnitPrice; "Purchase Unit Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(TotalPurchasePrice; "Total Purchase Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Estimatedcurrentvalue; "Estimated current value")
                {
                    ApplicationArea = Basic;
                }
                field(TotalEstimatedcurrentvalue; "Total Estimated current value")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GeneralCondition; "General Condition")
                {
                    ApplicationArea = Basic;
                }
                field(ReserveValue; "Market Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reserve Value';
                }
                field(DisposalcommitteeRecommend; "Disposal committee Recommend")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(DisposalType; "Disposal Type")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(DisposalMethods; "Disposal Methods")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Disposal Catetory"; Rec."Disposal Catetory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Catetory field.', Comment = '%';
                    Editable = false;
                }
                field("Loaded to Consolidated Plan"; Rec."Loaded to Consolidated Plan")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Loaded to Consolidated Plan field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
    }
}

