

page 70105 "Asset Disposal Quotation"
{
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const("Low Value"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
            }
            part(Control1000000019; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Asset Disposal")
            {
                Caption = 'Asset Disposal';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                    ToolTip = 'Executes the Mandatory Requirements action.';
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    //   RunObject = Page "Asset Disposal Bidders";
                    //   RunPageLink = "Ref No." = field(No);
                    ToolTip = 'Executes the Bidders action.';
                }
                action("Generate Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Orders';
                    Visible = false;
                    ToolTip = 'Executes the Generate Orders action.';
                    trigger OnAction()
                    var
                        QuotationLines: Record "Sales Line";
                    begin
                        /*
                        QuotationLines.SETRANGE(QuotationLines."Asset Disposal No","Asset Disposal No");
                        IF QuotationLines.FINDFIRST THEN
                         BEGIN
                           REPEAT
                            QuotationLines.CreateSalesOrder(QuotationLines);
                           UNTIL QuotationLines.NEXT=0;
                          MESSAGE('Orders Created successfully');
                         END;
                        */

                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::"Low Value";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::"Low Value";
    end;
}

#pragma implicitwith restore

