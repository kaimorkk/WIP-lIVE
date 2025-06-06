

page 50514 "IEC Material"
{
    Caption = 'IEC Material';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(Item)
            {
                Caption = 'Item';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the item.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies a description of the item.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that transactions with the item cannot be posted, for example, because the item is in quarantine.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the item card represents a physical item (Inventory) or a service (Service).';

                    trigger OnValidate()
                    begin
                        EnableControls;
                    end;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the unit in which the item is held in inventory.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                        Rec.Get(Rec."No.");
                    end;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies when the item card was last modified.';
                }
                field("Inventory Value Zero"; Rec."Inventory Value Zero")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory Value Zero field.';
                }
                field(GTIN; Rec.GTIN)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the item in connection with electronic document sending and receiving.';
                }
            }
            group(InventoryGrp)
            {
                Caption = 'Inventory';
                field(Control8; Rec."Assembly BOM")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Indicates if the item is an assembly BOM.';
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies where to find the item in the warehouse.';
                }
                field("Created From Nonstock Item"; Rec."Created From Nonstock Item")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies that the item was created from a nonstock item.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the category that the item belongs to.';

                    trigger OnValidate()
                    var
                        ItemAttributeManagement: Codeunit "Item Attribute Management";
                    begin
                        ItemAttributeManagement.InheritAttributesFromItemCategory(Rec, Rec."Item Category Code", xRec."Item Category Code");
                        CurrPage.ItemAttributesFactbox.Page.LoadItemAttributesData(Rec."No.");
                        EnableCostingControls;
                    end;
                }
                // field("Product Group Code"; "Product Group Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Contains a product group code associated with the item category.';
                //     Visible = false;
                // }
                field("Service Item Group"; Rec."Service Item Group")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Contains the code of the service item group that the item belongs to.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies a search description.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    Enabled = InventoryItemEditable;
                    Importance = Promoted;
                    ToolTip = 'Specifies how many units, such as pieces, boxes, or cans, of the item are in inventory.';

                    trigger OnAssistEdit()
                    begin
                        Rec.Modify(true);
                        Commit;
                        if Page.RunModal(Page::"Adjust Inventory", Rec) = Action::LookupOK then
                            Rec.Find;
                        CurrPage.Update
                    end;
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Shows how many units of the item are inbound on purchase orders, meaning listed on outstanding purchase order lines.';
                }
                field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Shows how many units of the item are allocated to production orders, meaning listed on outstanding production order lines.';
                }
                field("Qty. on Component Lines"; Rec."Qty. on Component Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Shows how many units of the item are allocated as production order components, meaning listed under outstanding production order lines.';
                }
                field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Shows how many units of the item are allocated to sales orders, meaning listed on outstanding sales orders lines.';
                }
                field("Qty. on Service Order"; Rec."Qty. on Service Order")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Shows how many units of the item are allocated to service orders, meaning listed on outstanding service order lines.';
                }
                field("Qty. on Job Order"; Rec."Qty. on Job Order")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Shows how many units of the item are allocated to jobs, meaning listed on outstanding job planning lines.';
                }
                field("Qty. on Assembly Order"; Rec."Qty. on Assembly Order")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Shows how many units of the item are allocated to assembly orders, which is how many are listed on outstanding assembly order headers.';
                }
                field("Qty. on Asm. Component"; Rec."Qty. on Asm. Component")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Shows how many units of the item are allocated as assembly components, which means how many are listed on outstanding assembly order lines.';
                }
                field(StockoutWarningDefaultYes; Rec."Stockout Warning")
                {
                    ApplicationArea = All;
                    Caption = 'Stockout Warning';
                    OptionCaption = 'Default (Yes),No,Yes';
                    ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero.';
                    Visible = ShowStockoutWarningDefaultYes;
                }
                field(StockoutWarningDefaultNo; Rec."Stockout Warning")
                {
                    ApplicationArea = All;
                    Caption = 'Stockout Warning';
                    OptionCaption = 'Default (No),No,Yes';
                    ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero.';
                    Visible = ShowStockoutWarningDefaultNo;
                }
                field(PreventNegInventoryDefaultYes; Rec."Prevent Negative Inventory")
                {
                    ApplicationArea = All;
                    Caption = 'Prevent Negative Inventory';
                    Importance = Additional;
                    OptionCaption = 'Default (Yes),No,Yes';
                    ToolTip = 'Specifies if you can post a transaction that will bring the item''s inventory below zero.';
                    Visible = ShowPreventNegInventoryDefaultYes;
                }
                field(PreventNegInventoryDefaultNo; Rec."Prevent Negative Inventory")
                {
                    ApplicationArea = All;
                    Caption = 'Prevent Negative Inventory';
                    Importance = Additional;
                    OptionCaption = 'Default (No),No,Yes';
                    ToolTip = 'Specifies if you can post a transaction that will bring the item''s inventory below zero.';
                    Visible = ShowPreventNegInventoryDefaultNo;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the net weight of the item.';
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the gross weight of the item.';
                }
                field("Automatic Ext. Texts"; Rec."Automatic Ext. Texts")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that an extended text that you have set up will be added automatically on sales or purchase documents for this item.';
                }
            }
            group("Price & Posting")
            {
                Caption = 'Price & Posting';
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = PriceEditable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the price for one unit of the item, in LCY.';
                }
                field(CalcUnitPriceExclVAT; Rec.CalcUnitPriceExclVAT)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionClass = '2,0,' + Rec.FIELDCAPTION("Unit Price");
                    Importance = Additional;
                    ToolTip = 'Specifies the unit price excluding VAT.';
                }
                field("Price Includes VAT"; Rec."Price Includes VAT")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales document lines for this item should be shown with or without VAT.';

                    trigger OnValidate()
                    begin
                        if Rec."Price Includes VAT" = xRec."Price Includes VAT" then
                            exit;
                    end;
                }
                field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies if the Profit Percentage field, the Unit Price field, or neither field is calculated and filled.';

                    trigger OnValidate()
                    begin
                        EnableControls;
                    end;
                }
                field(SpecialPricesAndDiscountsTxt; SpecialPricesAndDiscountsTxt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Special Prices & Discounts';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies special prices and line discounts for the item.';

                    trigger OnDrillDown()
                    var
                        SalesPrice: Record "Sales Price";
                        SalesLineDiscount: Record "Sales Line Discount";
                        SalesPriceAndLineDiscounts: Page "Sales Price and Line Discounts";
                    begin
                        if SpecialPricesAndDiscountsTxt = ViewOrChangeExistingTxt then begin
                            SalesPriceAndLineDiscounts.InitPage(true);
                            SalesPriceAndLineDiscounts.LoadItem(Rec);
                            SalesPriceAndLineDiscounts.RunModal;
                            exit;
                        end;

                        case StrMenu(StrSubstNo('%1,%2', CreateNewSpecialPriceTxt, CreateNewSpecialDiscountTxt), 1, '') of
                            1:
                                begin
                                    SalesPrice.SetRange("Item No.", Rec."No.");
                                    Page.RunModal(Page::"Sales Prices", SalesPrice);
                                end;
                            2:
                                begin
                                    SalesLineDiscount.SetRange(Type, SalesLineDiscount.Type::Item);
                                    SalesLineDiscount.SetRange(Code, Rec."No.");
                                    Page.RunModal(Page::"Sales Line Discounts", SalesLineDiscount);
                                end;
                        end;
                    end;
                }
                field("Profit %"; Rec."Profit %")
                {
                    ApplicationArea = Basic, Suite;
                    DecimalPlaces = 2 : 2;
                    Editable = ProfitEditable;
                    ToolTip = 'Specifies the profit margin you want to sell the item at.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = UnitCostEditable;
                    Enabled = UnitCostEnable;
                    ToolTip = 'Specifies the cost per unit of the item.';

                    trigger OnDrillDown()
                    var
                        ShowAvgCalcItem: Codeunit "Show Avg. Calc. - Item";
                    begin
                        ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
                    end;
                }
                field("Overhead Rate"; Rec."Overhead Rate")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the item''s indirect cost as an absolute amount.';
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies if the item should be included in the calculation of an invoice discount on documents where the item is traded.';
                }
                field("Item Disc. Group"; Rec."Item Disc. Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies an item group code that can be used as a criterion to grant a discount when the item is sold to a certain customer.';
                }
                group("Cost Details")
                {
                    Caption = 'Cost Details';
                    field("Costing Method"; Rec."Costing Method")
                    {
                        ApplicationArea = Basic;
                        Importance = Additional;
                        ToolTip = 'Specifies how the item''s cost flow is recorded and whether an actual or budgeted value is capitalized and used in the cost calculation.';

                        trigger OnValidate()
                        begin
                            EnableCostingControls;
                        end;
                    }
                    field("Indirect Cost %"; Rec."Indirect Cost %")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the percentage of the item''s direct unit cost that makes up indirect costs, such as freight and warehouse handling.';
                    }
                    field("Last Direct Cost"; Rec."Last Direct Cost")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Last Purchase Cost';
                        Importance = Additional;
                        ToolTip = 'Specifies the most recent direct unit cost of the item.';
                    }
                }
                group("Financial Details")
                {
                    Caption = 'Financial Details';
                    field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the item''s general product posting group. It links business transactions made for this item with the general ledger to account for the value of trade with the item.';
                    }
                    field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the VAT product posting group. Links business transactions made for this item with the general ledger, to account for VAT amounts resulting from trade with the item.';
                    }
                    field("Inventory Posting Group"; Rec."Inventory Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = InventoryItemEditable;
                        Importance = Additional;
                        ShowMandatory = InventoryItemEditable;
                        ToolTip = 'Specifies the inventory posting group. Links business transactions made for the item with an inventory account in the general ledger, to group amounts for that item type.';
                    }
                }
                group(ForeignTrade)
                {
                    Caption = 'Foreign Trade';
                    field("Tariff No."; Rec."Tariff No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies a code for the item''s tariff number.';
                    }
                    field("Country/Region of Origin Code"; Rec."Country/Region of Origin Code")
                    {
                        ApplicationArea = Basic;
                        Importance = Additional;
                        ToolTip = 'Specifies a code for the country/region where the item was produced or processed.';
                    }
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Cost is Adjusted"; Rec."Cost is Adjusted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the item''s unit cost has been adjusted, either automatically or manually.';
                }
                field("Cost is Posted to G/L"; Rec."Cost is Posted to G/L")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that all the inventory costs for this item have been posted to the general ledger.';
                }
                // field("Vote Item"; Rec."Vote Item")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Vote Item field.';
                // }
                field("Standard Cost"; Rec."Standard Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = StandardCostEnable;
                    ToolTip = 'Specifies the unit cost that is used as a standard measure.';

                    trigger OnDrillDown()
                    var
                        ShowAvgCalcItem: Codeunit "Show Avg. Calc. - Item";
                    begin
                        ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
                    end;
                }
                field("Default Deferral Template Code"; Rec."Default Deferral Template Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Default Deferral Template';
                    ToolTip = 'Specifies how revenue or expenses for the item are deferred to other accounting periods by default.';
                }
                field("Net Invoiced Qty."; Rec."Net Invoiced Qty.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Shows how many units of the item in inventory have been invoiced.';
                }
                field("Sales Unit of Measure"; Rec."Sales Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit of measure code used when you sell the item.';
                }
                field("Application Wksh. User ID"; Rec."Application Wksh. User ID")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the ID of a user who is working in the Application Worksheet window.';
                    Visible = false;
                }
            }
            group(Replenishment)
            {
                Caption = 'Replenishment';
                field("Replenishment System"; Rec."Replenishment System")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the type of supply order created by the planning system when the item needs to be replenished.';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                }
                group(Purchase)
                {
                    Caption = 'Purchase';
                    field("Vendor No."; Rec."Vendor No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the vendor code of who supplies this item by default.';
                    }
                    field("Vendor Item No."; Rec."Vendor Item No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the number that the vendor uses for this item.';
                    }
                    field("Purch. Unit of Measure"; Rec."Purch. Unit of Measure")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Contains the unit of measure code used when you purchase the item.';
                    }
                }
                group(Control230)
                {
                    Caption = 'Production';
                    field("Manufacturing Policy"; Rec."Manufacturing Policy")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Defines whether additional orders for any related components are calculated.';
                    }
                    field("Routing No."; Rec."Routing No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the number of the routing.';
                    }
                    field("Production BOM No."; Rec."Production BOM No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the number of the production BOM.';
                    }
                    field("Rounding Precision"; Rec."Rounding Precision")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Defines how calculated consumption quantities are rounded when entered on consumption journal lines.';
                    }
                    field("Flushing Method"; Rec."Flushing Method")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the method used to calculate and handle the consumption of the item as a component in production processes.';
                    }
                    field("Scrap %"; Rec."Scrap %")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                    }
                    field("Lot Size"; Rec."Lot Size")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies how many units of the item are processed in one production operation by default.';
                    }
                }
                group(Assembly)
                {
                    Caption = 'Assembly';
                    field("Assembly Policy"; Rec."Assembly Policy")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies which default order flow is used to supply this assembly item.';
                    }
                }
            }
            group(Planning)
            {
                Caption = 'Planning';
                field("Reordering Policy"; Rec."Reordering Policy")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the reordering policy.';

                    trigger OnValidate()
                    begin
                        EnablePlanningControls
                    end;
                }
                field(Reserve; Rec.Reserve)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Indicates whether the program will allow reservations to be made for this item.';
                }
                field("Order Tracking Policy"; Rec."Order Tracking Policy")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies if and how order tracking entries are created and maintained between supply and its corresponding demand.';
                }
                field("Stockkeeping Unit Exists"; Rec."Stockkeeping Unit Exists")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that a SKU exists for this item.';
                }
                field("Dampener Period"; Rec."Dampener Period")
                {
                    ApplicationArea = Basic;
                    Enabled = DampenerPeriodEnable;
                    Importance = Additional;
                    ToolTip = 'Specifies a period of time during which you do not want the planning system to propose to reschedule existing supply orders.';
                }
                field("Dampener Quantity"; Rec."Dampener Quantity")
                {
                    ApplicationArea = Basic;
                    Enabled = DampenerQtyEnable;
                    Importance = Additional;
                    ToolTip = 'Specifies a dampener quantity to block insignificant change suggestions for an existing supply, if the change quantity is lower than the dampener quantity.';
                }
                field(Critical; Rec.Critical)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the item is included in availability calculations to promise a shipment date for its parent item.';
                }
                field("Safety Lead Time"; Rec."Safety Lead Time")
                {
                    ApplicationArea = Basic;
                    Enabled = SafetyLeadTimeEnable;
                    ToolTip = 'Defines a date formula to indicate a safety lead time that can be used as a buffer period for production and other delays.';
                }
                field("Safety Stock Quantity"; Rec."Safety Stock Quantity")
                {
                    ApplicationArea = Basic;
                    Enabled = SafetyStockQtyEnable;
                    ToolTip = 'Defines a quantity of stock to have in inventory to protect against supply-and-demand fluctuations during replenishment lead time.';
                }
                group("Lot-for-Lot Parameters")
                {
                    Caption = 'Lot-for-Lot Parameters';
                    field("Include Inventory"; Rec."Include Inventory")
                    {
                        ApplicationArea = Basic;
                        Enabled = IncludeInventoryEnable;
                        ToolTip = 'Includes inventory in the projected available balance when replenishment orders are calculated.';

                        trigger OnValidate()
                        begin
                            EnablePlanningControls
                        end;
                    }
                    field("Lot Accumulation Period"; Rec."Lot Accumulation Period")
                    {
                        ApplicationArea = Basic;
                        Enabled = LotAccumulationPeriodEnable;
                        ToolTip = 'Defines a period in which multiple demands are accumulated into one supply order when you use the Lot-for-Lot reordering policy.';
                    }
                    field("Rescheduling Period"; Rec."Rescheduling Period")
                    {
                        ApplicationArea = Basic;
                        Enabled = ReschedulingPeriodEnable;
                        ToolTip = 'Defines a period within which any suggestion to change a supply date always consists of a Reschedule action and never a Cancel + New action.';
                    }
                }
                group("Reorder-Point Parameters")
                {
                    Caption = 'Reorder-Point Parameters';
                    grid(Control65)
                    {
                        GridLayout = Rows;
                        group(Control64)
                        {
                            field("Reorder Point"; Rec."Reorder Point")
                            {
                                ApplicationArea = Basic;
                                Enabled = ReorderPointEnable;
                                ToolTip = 'Specifies a stock quantity that sets the inventory below the level that you must replenish the item.';
                            }
                            field("Reorder Quantity"; Rec."Reorder Quantity")
                            {
                                ApplicationArea = Basic;
                                Enabled = ReorderQtyEnable;
                                ToolTip = 'Specifies a standard lot size quantity to be used for all order proposals.';
                            }
                            field("Maximum Inventory"; Rec."Maximum Inventory")
                            {
                                ApplicationArea = Basic;
                                Enabled = MaximumInventoryEnable;
                                ToolTip = 'Specifies a quantity that you want to use as a maximum inventory level.';
                            }
                        }
                    }
                    field("Overflow Level"; Rec."Overflow Level")
                    {
                        ApplicationArea = Basic;
                        Enabled = OverflowLevelEnable;
                        Importance = Additional;
                        ToolTip = 'Specifies a quantity you allow projected inventory to exceed the reorder point, before the system suggests to decrease supply orders.';
                    }
                    field("Time Bucket"; Rec."Time Bucket")
                    {
                        ApplicationArea = Basic;
                        Enabled = TimeBucketEnable;
                        Importance = Additional;
                        ToolTip = 'Specifies a time period that defines the recurring planning horizon used with Fixed Reorder Qty. or Maximum Qty. reordering policies.';
                    }
                }
                group("Order Modifiers")
                {
                    Caption = 'Order Modifiers';
                    grid(Control60)
                    {
                        GridLayout = Rows;
                        group(Control61)
                        {
                            field("Minimum Order Quantity"; Rec."Minimum Order Quantity")
                            {
                                ApplicationArea = Basic;
                                Enabled = MinimumOrderQtyEnable;
                                ToolTip = 'Defines a minimum allowable quantity for an item order proposal.';
                            }
                            field("Maximum Order Quantity"; Rec."Maximum Order Quantity")
                            {
                                ApplicationArea = Basic;
                                Enabled = MaximumOrderQtyEnable;
                                ToolTip = 'Specifies a maximum allowable quantity for an item order proposal.';
                            }
                            field("Order Multiple"; Rec."Order Multiple")
                            {
                                ApplicationArea = Basic;
                                Enabled = OrderMultipleEnable;
                                ToolTip = 'Defines a parameter used by the planning system to modify the quantity of planned supply orders.';
                            }
                        }
                    }
                }
            }
            group("Item Tracking")
            {
                Caption = 'Item Tracking';
                field("Item Tracking Code"; Rec."Item Tracking Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the code that indicates how the program will track the item in inventory.';
                }
                field("Serial Nos."; Rec."Serial Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a number series code to assign consecutive serial numbers to items produced.';
                }
                field("Lot Nos."; Rec."Lot Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number series code that will be used when assigning lot numbers.';
                }
                field("Expiration Calculation"; Rec."Expiration Calculation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the formula for calculating the expiration date on the item tracking line.';
                }
            }
            group(Control1907509201)
            {
                Caption = 'Warehouse';
                field("Warehouse Class Code"; Rec."Warehouse Class Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the warehouse class code for the item.';
                }
                field("Special Equipment Code"; Rec."Special Equipment Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Contains the code of the equipment that warehouse employees must use when handling the item.';
                }
                field("Put-away Template Code"; Rec."Put-away Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the code of the put-away template by which the program determines the most appropriate zone and bin for storage of the item after receipt.';
                }
                field("Put-away Unit of Measure Code"; Rec."Put-away Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the code of the item unit of measure in which the program will put the item away.';
                }
                field("Phys Invt Counting Period Code"; Rec."Phys Invt Counting Period Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the code of the counting period that indicates how often you want to count the item in a physical inventory.';
                }
                field("Last Phys. Invt. Date"; Rec."Last Phys. Invt. Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date on which you last posted the results of a physical inventory for the item to the item ledger.';
                }
                field("Last Counting Period Update"; Rec."Last Counting Period Update")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the last date on which you calculated the counting period. It is updated when you use the function Calculate Counting Period.';
                }
                field("Next Counting Start Date"; Rec."Next Counting Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the starting date of the next counting period.';
                }
                field("Next Counting End Date"; Rec."Next Counting End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ending date of the next counting period.';
                }
                field("Identifier Code"; Rec."Identifier Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Contains a unique code for the item in terms that are useful for automatic data capture.';
                }
                field("Use Cross-Docking"; Rec."Use Cross-Docking")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies if this item can be cross-docked.';
                }
            }
        }
        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                              "Location Filter" = field("Location Filter"),
                              "Drop Shipment Filter" = field("Drop Shipment Filter"),
                              "Variant Filter" = field("Variant Filter");
            }
            part(ItemAttributesFactbox; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
            }
            // part(Control132; "Social Listening FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Item),
            //                   "Source No." = field("No.");
            //     Visible = SocialListeningVisible;
            // }
            // part(Control134; "Social Listening Setup FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Item),
            //                   "Source No." = field("No.");
            //     UpdatePropagation = Both;
            //     Visible = SocialListeningSetupVisible;
            // }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup123)
            {
                Caption = 'Item';
                Image = DataEntry;
                action(Attributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attributes';
                    Image = Category;
                    ToolTip = 'View or edit the item''s attributes, such as color, size, or other characteristics that help to describe the item.';

                    trigger OnAction()
                    begin
                        Page.RunModal(Page::"Item Attribute Value Editor", Rec);
                        CurrPage.SaveRecord;
                        CurrPage.ItemAttributesFactbox.Page.LoadItemAttributesData(Rec."No.");
                    end;
                }
                action(AdjustInventory)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Adjust Inventory';
                    Enabled = InventoryItemEditable;
                    Image = InventoryCalculation;
                    ToolTip = 'Increase or decrease the item''s inventory quantity manually by entering a new quantity. Adjusting the inventory quantity manually may be relevant after a physical count or if you do not record purchased quantities.';
                    Visible = IsFoundationEnabled;

                    trigger OnAction()
                    begin
                        Commit;
                        Page.RunModal(Page::"Adjust Inventory", Rec)
                    end;
                }
                action("Va&riants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Va&riants';
                    Image = ItemVariant;
                    RunObject = Page "Item Variants";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Va&riants action.';
                }
                action(Identifiers)
                {
                    ApplicationArea = Basic;
                    Caption = 'Identifiers';
                    Image = BarCode;
                    RunObject = Page "Item Identifiers";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.", "Variant Code", "Unit of Measure Code");
                    ToolTip = 'Executes the Identifiers action.';
                }
            }
            group(PricesandDiscounts)
            {
                Caption = 'Special Prices & Discounts';
                action("Set Special Prices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Set Special Prices';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Set up different prices for the item. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
                action("Set Special Discounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Set Special Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = Type = const(Item),
                                  Code = field("No.");
                    RunPageView = sorting(Type, Code);
                    ToolTip = 'Set up different discounts for the item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
                action(PricesDiscountsOverview)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Special Prices & Discounts Overview';
                    Image = PriceWorksheet;
                    ToolTip = 'View the special prices and line discounts that you grant for this item when certain criteria are met, such as customer, quantity, or ending date.';

                    trigger OnAction()
                    var
                        SalesPriceAndLineDiscounts: Page "Sales Price and Line Discounts";
                    begin
                        SalesPriceAndLineDiscounts.InitPage(true);
                        SalesPriceAndLineDiscounts.LoadItem(Rec);
                        SalesPriceAndLineDiscounts.RunModal;
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = (not OpenApprovalEntriesExist) and EnabledApprovalWorkflowsExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Send an approval request.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //if //ApprovalsMgmt.CheckItemApprovalsWorkflowEnabled(Rec) then
                        //ApprovalsMgmt.OnSendItemForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.OnCancelItemApprovalRequest(Rec);
                    end;
                }
            }
            group(Workflow)
            {
                Caption = 'Workflow';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Approval Workflow';
                    Enabled = not EnabledApprovalWorkflowsExist;
                    Image = CreateWorkflow;
                    ToolTip = 'Set up an approval workflow for creating or changing items, by going through a few pages that will guide you.';

                    trigger OnAction()
                    begin
                        Page.RunModal(Page::"Item Approval WF Setup Wizard");
                    end;
                }
                action(ManageApprovalWorkflow)
                {
                    ApplicationArea = Basic;
                    Caption = 'Manage Approval Workflow';
                    Enabled = EnabledApprovalWorkflowsExist;
                    Image = WorkflowSetup;
                    ToolTip = 'View or edit existing approval workflows for creating or changing items.';

                    trigger OnAction()
                    var
                        WorkflowManagement: Codeunit "Workflow Management";
                    begin
                        WorkflowManagement.NavigateToWorkflows(Database::Item, EventFilter);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("&Create Stockkeeping Unit")
                {
                    AccessByPermission = TableData "Stockkeeping Unit" = R;
                    ApplicationArea = Basic;
                    Caption = '&Create Stockkeeping Unit';
                    Image = CreateSKU;
                    ToolTip = 'Executes the &Create Stockkeeping Unit action.';
                    trigger OnAction()
                    var
                        Item: Record Item;
                    begin
                        Item.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Create Stockkeeping Unit", true, false, Item);
                    end;
                }
                action(CalculateCountingPeriod)
                {
                    AccessByPermission = TableData "Phys. Invt. Item Selection" = R;
                    ApplicationArea = Basic;
                    Caption = 'C&alculate Counting Period';
                    Image = CalculateCalendar;
                    ToolTip = 'Executes the C&alculate Counting Period action.';
                    trigger OnAction()
                    var
                        Item: Record Item;
                        PhysInvtCountMgt: Codeunit "Phys. Invt. Count.-Management";
                    begin
                        Item.SetRange("No.", Rec."No.");
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Item);
                    end;
                }
                separator(Action241)
                {
                }
                action(Templates)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Templates';
                    Image = Template;
                    RunObject = Page "Config Templates";
                    RunPageLink = "Table ID" = const(27);
                    ToolTip = 'View or edit item templates.';
                }
                action(ApplyTemplate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    ToolTip = 'Use a template to quickly create a new item card.';

                    trigger OnAction()
                    var
                    //ItemTemplate: Record "Item Template";
                    begin
                        // ItemTemplate.UpdateItemFromTemplate(Rec);
                    end;
                }
                action(SaveAsTemplate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Save as Template';
                    Ellipsis = true;
                    Image = Save;
                    ToolTip = 'Save the item card as a template that can be reused to create new item cards. Item templates contain preset information to help you fill in fields on item cards.';

                    trigger OnAction()
                    var
                    //TempItemTemplate: Record "Item Template" temporary;
                    begin
                        // TempItemTemplate.SaveAsTemplate(Rec);
                    end;
                }
            }
            action("Requisition Worksheet")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Worksheet";
                ToolTip = 'Executes the Requisition Worksheet action.';
            }
            action("Item Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Item Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
                ToolTip = 'Executes the Item Journal action.';
            }
            action("Item Reclassification Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Item Reclassification Journal';
                Image = Journals;
                RunObject = Page "Item Reclass. Journal";
                ToolTip = 'Executes the Item Reclassification Journal action.';
            }
            action("Item Tracing")
            {
                ApplicationArea = Basic;
                Caption = 'Item Tracing';
                Image = ItemTracing;
                RunObject = Page "Item Tracing";
                ToolTip = 'Executes the Item Tracing action.';
            }
        }
        area(navigation)
        {
            group(History)
            {
                Caption = 'History';
                Image = History;
                group("E&ntries")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action("Ledger E&ntries")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Ledger E&ntries';
                        Image = ItemLedger;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Category5;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Item No." = field("No.");
                        RunPageView = sorting("Item No.")
                                      order(descending);
                        ShortCutKey = 'Ctrl+F7';
                        ToolTip = 'View the history of transactions that have been posted for the selected record.';
                    }
                    action("&Phys. Inventory Ledger Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Phys. Inventory Ledger Entries';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Phys. Inventory Ledger Entries";
                        RunPageLink = "Item No." = field("No.");
                        RunPageView = sorting("Item No.");
                        ToolTip = 'View how many units of the item you had in stock at the last physical count.';
                    }
                    action("&Reservation Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Reservation Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Reservation Entries";
                        RunPageLink = "Reservation Status" = const(Reservation),
                                      "Item No." = field("No.");
                        RunPageView = sorting("Item No.", "Variant Code", "Location Code", "Reservation Status");
                        ToolTip = 'Executes the &Reservation Entries action.';
                    }
                    action("&Value Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                        RunPageLink = "Item No." = field("No.");
                        RunPageView = sorting("Item No.");
                        ToolTip = 'Executes the &Value Entries action.';
                    }
                    action("Item &Tracking Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item &Tracking Entries';
                        Image = ItemTrackingLedger;
                        ToolTip = 'Executes the Item &Tracking Entries action.';
                        trigger OnAction()
                        var
                            ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
                        begin
                            //ItemTrackingDocMgt.ShowItemTrackingForMasterData(3, '', "No.", '', '', '', '');
                        end;
                    }
                    action("&Warehouse Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Warehouse Entries';
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                        RunPageLink = "Item No." = field("No.");
                        RunPageView = sorting("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code", "Lot No.", "Serial No.", "Entry Type", Dedicated);
                        ToolTip = 'Executes the &Warehouse Entries action.';
                    }
                    action("Application Worksheet")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Application Worksheet';
                        Image = ApplicationWorksheet;
                        RunObject = Page "Application Worksheet";
                        RunPageLink = "Item No." = field("No.");
                        ToolTip = 'Executes the Application Worksheet action.';
                    }
                }
            }
            group(ActionGroup190)
            {
                Caption = 'Item';
                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(27),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edits dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                // action("Cross Re&ferences")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Cross Re&ferences';
                //     Image = Change;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Category4;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = true;
                //     RunObject = Page "Item Cross Reference Entries";
                //     RunPageLink = "Item No." = field("No.");
                //     ToolTip = 'Set up a customer''s or vendor''s own identification of the item. Cross-references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.';
                // }
                action("&Units of Measure")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Units of Measure';
                    Image = UnitOfMeasure;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Item Units of Measure";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Set up the different units that the item can be traded in, such as piece, box, or hour.';
                }
                action("E&xtended Texts")
                {
                    ApplicationArea = Suite;
                    Caption = 'E&xtended Texts';
                    Image = Text;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Extended Text List";
                    RunPageLink = "Table Name" = const(Item),
                                  "No." = field("No.");
                    RunPageView = sorting("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                    ToolTip = 'Set up additional text for the description of the item. Extended text can be inserted under the Description field on document lines for the item.';
                }
                action(Translations)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Translations';
                    Image = Translations;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Item Translations";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'View or edit translated item descriptions. Translated item descriptions are automatically inserted on documents according to the language code.';
                }
                action("Substituti&ons")
                {
                    ApplicationArea = Suite;
                    Caption = 'Substituti&ons';
                    Image = ItemSubstitution;
                    RunObject = Page "Item Substitution Entry";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Substituti&ons action.';
                }
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGoToProduct)
                {
                    ApplicationArea = All;
                    Caption = 'Product';
                    Image = CoupledItem;
                    ToolTip = 'Open the coupled Microsoft Dynamics CRM product.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = All;
                    Caption = 'Synchronize Now';
                    Image = Refresh;
                    ToolTip = 'Send updated data to Microsoft Dynamics CRM.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(Rec.RecordId);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Microsoft Dynamics CRM record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = All;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Microsoft Dynamics CRM product.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = All;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Microsoft Dynamics CRM product.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
            }
            group(Availability)
            {
                Caption = 'Availability';
                Image = ItemAvailability;
                action(ItemsByLocation)
                {
                    AccessByPermission = TableData Location = R;
                    ApplicationArea = Basic;
                    Caption = 'Items b&y Location';
                    Image = ItemAvailbyLoc;
                    ToolTip = 'Show a list of items grouped by location.';

                    trigger OnAction()
                    begin
                        Page.Run(Page::"Items by Location", Rec);
                    end;
                }
                group("&Item Availability by")
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;
                    action("<Action110>")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Event';
                        Image = "Event";
                        ToolTip = 'View how the actual and projected inventory level of an item will develop over time according to supply and demand events.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Period';
                        Image = Period;
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Show the actual and projected quantity of an item over time according to a specified time interval, such as by day, week or month.';
                    }
                    action(Variant)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        RunObject = Page "Item Availability by Variant";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        ToolTip = 'View how the inventory level of an item will develop over time according to the variant that you select.';
                    }
                    action(Location)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Location';
                        Image = Warehouse;
                        RunObject = Page "Item Availability by Location";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Executes the Location action.';
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Basic;
                        Caption = 'BOM Level';
                        Image = BOMLevel;
                        ToolTip = 'View availability figures for BOM items that indicate how many units of a parent you can make based on the availability of child items on underlying lines.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByBOM);
                        end;
                    }
                    action(Timeline)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Timeline';
                        Image = Timeline;
                        ToolTip = 'View a graphical view of an item’s projected inventory based on future supply and demand events, with or without planning suggestions.';

                        trigger OnAction()
                        begin
                            // //Rec.ShowTimelineFromItem(Rec);
                        end;
                    }
                }
                group(ActionGroup102)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Statistics)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statistics';
                        Image = Statistics;
                        ShortCutKey = 'F7';
                        ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                        trigger OnAction()
                        var
                            ItemStatistics: Page "Item Statistics";
                        begin
                            ItemStatistics.SetItem(Rec);
                            ItemStatistics.RunModal;
                        end;
                    }
                    action("Entry Statistics")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Entry Statistics';
                        Image = EntryStatistics;
                        RunObject = Page "Item Entry Statistics";
                        RunPageLink = "No." = field("No."),
                                      "Date Filter" = field("Date Filter"),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        ToolTip = 'View statistics for item ledger entries.';
                    }
                    action("T&urnover")
                    {
                        ApplicationArea = Suite;
                        Caption = 'T&urnover';
                        Image = Turnover;
                        RunObject = Page "Item Turnover";
                        RunPageLink = "No." = field("No."),
                                      "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                      "Location Filter" = field("Location Filter"),
                                      "Drop Shipment Filter" = field("Drop Shipment Filter"),
                                      "Variant Filter" = field("Variant Filter");
                        ToolTip = 'View a detailed account of item turnover by periods after you have set the relevant filters for location and variant.';
                    }
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Item),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments.';
                }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action("Ven&dors")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ven&dors';
                    Image = Vendor;
                    RunObject = Page "Item Vendor Catalog";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Ven&dors action.';
                }
                action(Action85)
                {
                    ApplicationArea = Basic;
                    Caption = 'Set Special Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Set Special Prices action.';
                }
                action(Action86)
                {
                    ApplicationArea = Basic;
                    Caption = 'Set Special Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Set Special Discounts action.';
                }
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Prepa&yment Percentages action.';
                }
                separator(Action47)
                {
                }
                action(Orders)
                {
                    ApplicationArea = Suite;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Orders action.';
                }
                action("Return Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Orders";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Return Orders action.';
                }
                action("Nonstoc&k Items")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Nonstoc&k Items';
                    Image = NonStockItem;
                    RunObject = Page "Catalog Item List";
                    ToolTip = 'Executes the Nonstoc&k Items action.';
                }
            }
            group("S&ales")
            {
                Caption = 'S&ales';
                Image = Sales;
                action(Action300)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Prepa&yment Percentages action.';
                }
                separator(Action46)
                {
                }
                action(Action83)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Orders";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Orders action.';
                }
                action(Action163)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Orders";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Return Orders action.';
                }
            }
            group("Assembly/Production")
            {
                Caption = 'Assembly/Production';
                Image = Production;
                action(Structure)
                {
                    ApplicationArea = Basic;
                    Caption = 'Structure';
                    Image = Hierarchy;
                    ToolTip = 'Executes the Structure action.';
                    trigger OnAction()
                    var
                        BOMStructure: Page "BOM Structure";
                    begin
                        BOMStructure.InitItem(Rec);
                        BOMStructure.Run;
                    end;
                }
                action("Cost Shares")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Shares';
                    Image = CostBudget;
                    ToolTip = 'Executes the Cost Shares action.';
                    trigger OnAction()
                    var
                        BOMCostShares: Page "BOM Cost Shares";
                    begin
                        BOMCostShares.InitItem(Rec);
                        BOMCostShares.Run;
                    end;
                }
                group("Assemb&ly")
                {
                    Caption = 'Assemb&ly';
                    Image = AssemblyBOM;
                    action("Assembly BOM")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Assembly BOM';
                        Image = BOM;
                        RunObject = Page "Assembly BOM";
                        RunPageLink = "Parent Item No." = field("No.");
                        ToolTip = 'Executes the Assembly BOM action.';
                    }
                    action("Where-Used")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Where-Used';
                        Image = Track;
                        RunObject = Page "Where-Used List";
                        RunPageLink = Type = const(Item),
                                      "No." = field("No.");
                        RunPageView = sorting(Type, "No.");
                        ToolTip = 'Executes the Where-Used action.';
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        ApplicationArea = Basic;
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;
                        ToolTip = 'Executes the Calc. Stan&dard Cost action.';
                        trigger OnAction()
                        begin
                            Clear(CalculateStdCost);
                            CalculateStdCost.CalcItem(Rec."No.", true);
                        end;
                    }
                    action("Calc. Unit Price")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        ApplicationArea = Basic;
                        Caption = 'Calc. Unit Price';
                        Image = SuggestItemPrice;
                        ToolTip = 'Executes the Calc. Unit Price action.';
                        trigger OnAction()
                        begin
                            Clear(CalculateStdCost);
                            CalculateStdCost.CalcAssemblyItemPrice(Rec."No.")
                        end;
                    }
                }
                group(Production)
                {
                    Caption = 'Production';
                    Image = Production;
                    action("Production BOM")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Production BOM';
                        Image = BOM;
                        RunObject = Page "Production BOM";
                        RunPageLink = "No." = field("Production BOM No.");
                        ToolTip = 'Executes the Production BOM action.';
                    }
                    action(Action78)
                    {
                        AccessByPermission = TableData "Production BOM Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Where-Used';
                        Image = "Where-Used";
                        ToolTip = 'Executes the Where-Used action.';
                        trigger OnAction()
                        var
                            ProdBOMWhereUsed: Page "Prod. BOM Where-Used";
                        begin
                            ProdBOMWhereUsed.SetItem(Rec, WorkDate);
                            ProdBOMWhereUsed.RunModal;
                        end;
                    }
                    action(Action5)
                    {
                        AccessByPermission = TableData "Production BOM Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;
                        ToolTip = 'Executes the Calc. Stan&dard Cost action.';
                        trigger OnAction()
                        begin
                            Clear(CalculateStdCost);
                            CalculateStdCost.CalcItem(Rec."No.", false);
                        end;
                    }
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("&Bin Contents")
                {
                    ApplicationArea = Basic;
                    Caption = '&Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Item Analysis View Entries";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the &Bin Contents action.';
                }
                action("Stockkeepin&g Units")
                {
                    ApplicationArea = Basic;
                    Caption = 'Stockkeepin&g Units';
                    Image = SKU;
                    RunObject = Page "Stockkeeping Unit List";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Stockkeepin&g Units action.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Ser&vice Items")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ser&vice Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Ser&vice Items action.';
                }
                action(Troubleshooting)
                {
                    AccessByPermission = TableData "Service Header" = R;
                    ApplicationArea = Basic;
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;
                    ToolTip = 'Executes the Troubleshooting action.';
                    trigger OnAction()
                    var
                        TroubleshootingHeader: Record "Troubleshooting Header";
                    begin
                        TroubleshootingHeader.ShowForItem(Rec);
                    end;
                }
                action("Troubleshooting Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Troubleshooting Setup';
                    Image = Troubleshoot;
                    RunObject = Page "Troubleshooting Setup";
                    RunPageLink = Type = const(Item),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Troubleshooting Setup action.';
                }
            }
            group(Resources)
            {
                Caption = 'Resources';
                Image = Resource;
                group("R&esource")
                {
                    Caption = 'R&esource';
                    Image = Resource;
                    action("Resource Skills")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Resource Skills';
                        Image = ResourceSkills;
                        RunObject = Page "Resource Skills";
                        RunPageLink = Type = const(Item),
                                      "No." = field("No.");
                        ToolTip = 'View the assignment of skills to resources, items, service item groups, and service items. You can use skill codes to allocate skilled resources to service items or items that need special skills for servicing.';
                    }
                    action("Skilled Resources")
                    {
                        AccessByPermission = TableData "Service Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Skilled Resources';
                        Image = ResourceSkills;
                        ToolTip = 'View a list of all registered resources with information about whether they have the skills required to service the particular service item group, item, or service item.';

                        trigger OnAction()
                        var
                            ResourceSkill: Record "Resource Skill";
                        begin
                            Clear(SkilledResourceList);
                            SkilledResourceList.Initialize(ResourceSkill.Type::Item, Rec."No.", Rec.Description);
                            SkilledResourceList.RunModal;
                        end;
                    }
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Item Journal_Promoted"; "Item Journal")
                {
                }
                actionref("Item Reclassification Journal_Promoted"; "Item Reclassification Journal")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Item', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Attributes_Promoted; Attributes)
                {
                }
                actionref(AdjustInventory_Promoted; AdjustInventory)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'History', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("&Phys. Inventory Ledger Entries_Promoted"; "&Phys. Inventory Ledger Entries")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Special Prices & Discounts', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Set Special Prices_Promoted"; "Set Special Prices")
                {
                }
                actionref("Set Special Discounts_Promoted"; "Set Special Discounts")
                {
                }
                actionref(PricesDiscountsOverview_Promoted; PricesDiscountsOverview)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(ApprovalEntries_Promoted; ApprovalEntries)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        CreateItemFromTemplate;
        CRMIsCoupledToRecord := CRMIntegrationEnabled and CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
        //  OpenApprovalEntriesExistCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);

        EventFilter := WorkflowEventHandling.RunWorkflowOnSendItemForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnItemChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(Database::Item, EventFilter);

        CurrPage.ItemAttributesFactbox.Page.LoadItemAttributesData(Rec."No.");
    end;

    trigger OnAfterGetRecord()
    begin
        EnableControls
    end;

    trigger OnInit()
    begin
        InitControls
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        InsertItemUnitOfMeasure;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnNewRec
    end;

    trigger OnOpenPage()
    begin
        // IsFoundationEnabled := ApplicationAreaSetup.IsFoundationEnabled;
        EnableControls;
    end;

    var
        ApplicationAreaSetup: Record "Application Area Setup";
        CalculateStdCost: Codeunit "Calculate Standard Cost";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SkilledResourceList: Page "Skilled Resource List";
        IsFoundationEnabled: Boolean;
        ShowStockoutWarningDefaultYes: Boolean;
        ShowStockoutWarningDefaultNo: Boolean;
        ShowPreventNegInventoryDefaultYes: Boolean;
        ShowPreventNegInventoryDefaultNo: Boolean;

        TimeBucketEnable: Boolean;

        SafetyLeadTimeEnable: Boolean;

        SafetyStockQtyEnable: Boolean;

        ReorderPointEnable: Boolean;

        ReorderQtyEnable: Boolean;

        MaximumInventoryEnable: Boolean;

        MinimumOrderQtyEnable: Boolean;

        MaximumOrderQtyEnable: Boolean;

        OrderMultipleEnable: Boolean;

        IncludeInventoryEnable: Boolean;

        ReschedulingPeriodEnable: Boolean;

        LotAccumulationPeriodEnable: Boolean;

        DampenerPeriodEnable: Boolean;

        DampenerQtyEnable: Boolean;

        OverflowLevelEnable: Boolean;

        StandardCostEnable: Boolean;

        UnitCostEnable: Boolean;

        SocialListeningSetupVisible: Boolean;

        SocialListeningVisible: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;

        InventoryItemEditable: Boolean;

        UnitCostEditable: Boolean;
        ProfitEditable: Boolean;
        PriceEditable: Boolean;
        SpecialPricesAndDiscountsTxt: Text;
        CreateNewTxt: label 'Create New...';
        ViewOrChangeExistingTxt: label 'View or Change Existing...';
        CreateNewSpecialPriceTxt: label 'Create New Special Price...';
        CreateNewSpecialDiscountTxt: label 'Create New Special Discount...';
        EnabledApprovalWorkflowsExist: Boolean;
        EventFilter: Text;
        NoFieldVisible: Boolean;
        NewMode: Boolean;

    local procedure EnableControls()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        InventoryItemEditable := Rec.Type = Rec.Type::Inventory;

        if Rec.Type = Rec.Type::Inventory then begin
            ItemLedgerEntry.SetRange("Item No.", Rec."No.");
            UnitCostEditable := ItemLedgerEntry.IsEmpty;
        end else
            UnitCostEditable := true;

        ProfitEditable := Rec."Price/Profit Calculation" <> Rec."price/profit calculation"::"Profit=Price-Cost";
        PriceEditable := Rec."Price/Profit Calculation" <> Rec."price/profit calculation"::"Price=Cost+Profit";

        EnablePlanningControls;
        EnableCostingControls;

        EnableShowStockOutWarning;

        SetSocialListeningFactboxVisibility;
        NoFieldVisible := DocumentNoVisibility.ItemNoIsVisible;
        EnableShowShowEnforcePositivInventory;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;

        UpdateSpecialPricesAndDiscountsTxt;
    end;

    local procedure OnNewRec()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        if GuiAllowed then begin
            EnableControls;
            if Rec."No." = '' then
                if DocumentNoVisibility.ItemNoSeriesIsDefault then
                    NewMode := true;
        end;
    end;

    local procedure EnableShowStockOutWarning()
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get;
        ShowStockoutWarningDefaultYes := SalesSetup."Stockout Warning";
        ShowStockoutWarningDefaultNo := not ShowStockoutWarningDefaultYes;

        EnableShowShowEnforcePositivInventory
    end;

    local procedure InsertItemUnitOfMeasure()
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
    begin
        if Rec."Base Unit of Measure" <> '' then begin
            ItemUnitOfMeasure.Init;
            ItemUnitOfMeasure."Item No." := Rec."No.";
            ItemUnitOfMeasure.Validate(Code, Rec."Base Unit of Measure");
            ItemUnitOfMeasure."Qty. per Unit of Measure" := 1;
            ItemUnitOfMeasure.Insert;
        end;
    end;

    local procedure EnableShowShowEnforcePositivInventory()
    var
        InventorySetup: Record "Inventory Setup";
    begin
        InventorySetup.Get;
        ShowPreventNegInventoryDefaultYes := InventorySetup."Prevent Negative Inventory";
        ShowPreventNegInventoryDefaultNo := not ShowPreventNegInventoryDefaultYes;
    end;

    local procedure EnablePlanningControls()
    var
        PlanningGetParam: Codeunit "Planning-Get Parameters";
        TimeBucketEnabled: Boolean;
        SafetyLeadTimeEnabled: Boolean;
        SafetyStockQtyEnabled: Boolean;
        ReorderPointEnabled: Boolean;
        ReorderQtyEnabled: Boolean;
        MaximumInventoryEnabled: Boolean;
        MinimumOrderQtyEnabled: Boolean;
        MaximumOrderQtyEnabled: Boolean;
        OrderMultipleEnabled: Boolean;
        IncludeInventoryEnabled: Boolean;
        ReschedulingPeriodEnabled: Boolean;
        LotAccumulationPeriodEnabled: Boolean;
        DampenerPeriodEnabled: Boolean;
        DampenerQtyEnabled: Boolean;
        OverflowLevelEnabled: Boolean;
    begin
        // PlanningGetParam.SetUpPlanningControls(Rec."Reordering Policy", Rec."Include Inventory",
        //   TimeBucketEnabled, SafetyLeadTimeEnabled, SafetyStockQtyEnabled,
        //   ReorderPointEnabled, ReorderQtyEnabled, MaximumInventoryEnabled,
        //   MinimumOrderQtyEnabled, MaximumOrderQtyEnabled, OrderMultipleEnabled, IncludeInventoryEnabled,
        //   ReschedulingPeriodEnabled, LotAccumulationPeriodEnabled,
        //   DampenerPeriodEnabled, DampenerQtyEnabled, OverflowLevelEnabled);

        TimeBucketEnable := TimeBucketEnabled;
        SafetyLeadTimeEnable := SafetyLeadTimeEnabled;
        SafetyStockQtyEnable := SafetyStockQtyEnabled;
        ReorderPointEnable := ReorderPointEnabled;
        ReorderQtyEnable := ReorderQtyEnabled;
        MaximumInventoryEnable := MaximumInventoryEnabled;
        MinimumOrderQtyEnable := MinimumOrderQtyEnabled;
        MaximumOrderQtyEnable := MaximumOrderQtyEnabled;
        OrderMultipleEnable := OrderMultipleEnabled;
        IncludeInventoryEnable := IncludeInventoryEnabled;
        ReschedulingPeriodEnable := ReschedulingPeriodEnabled;
        LotAccumulationPeriodEnable := LotAccumulationPeriodEnabled;
        DampenerPeriodEnable := DampenerPeriodEnabled;
        DampenerQtyEnable := DampenerQtyEnabled;
        OverflowLevelEnable := OverflowLevelEnabled;
    end;

    local procedure EnableCostingControls()
    begin
        StandardCostEnable := Rec."Costing Method" = Rec."costing method"::Standard;
        UnitCostEnable := Rec."Costing Method" <> Rec."costing method"::Standard;
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        //SocialListeningMgt.GetItemFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;

    local procedure InitControls()
    begin
        UnitCostEnable := true;
        StandardCostEnable := true;
        OverflowLevelEnable := true;
        DampenerQtyEnable := true;
        DampenerPeriodEnable := true;
        LotAccumulationPeriodEnable := true;
        ReschedulingPeriodEnable := true;
        IncludeInventoryEnable := true;
        OrderMultipleEnable := true;
        MaximumOrderQtyEnable := true;
        MinimumOrderQtyEnable := true;
        MaximumInventoryEnable := true;
        ReorderQtyEnable := true;
        ReorderPointEnable := true;
        SafetyStockQtyEnable := true;
        SafetyLeadTimeEnable := true;
        TimeBucketEnable := true;

        InventoryItemEditable := Rec.Type = Rec.Type::Inventory;
        Rec."Costing Method" := Rec."costing method"::FIFO;
        UnitCostEditable := true;
    end;

    local procedure UpdateSpecialPricesAndDiscountsTxt()
    var
        TempSalesPriceAndLineDiscBuff: Record "Sales Price and Line Disc Buff" temporary;
    begin
        SpecialPricesAndDiscountsTxt := CreateNewTxt;
        TempSalesPriceAndLineDiscBuff.LoadDataForItem(Rec);
        if not TempSalesPriceAndLineDiscBuff.IsEmpty then
            SpecialPricesAndDiscountsTxt := ViewOrChangeExistingTxt;
    end;

    local procedure CreateItemFromTemplate()
    var
        // ItemTemplate: Record "Item Template";
        Item: Record Item;
    begin
        if NewMode then begin
            // if ItemTemplate.NewItemFromTemplate(Item) then begin
            //     Rec.Copy(Item);
            //     CurrPage.Update;
            // end;

            // // Enforce FIFO costing method for Foundation
            // if ApplicationAreaSetup.IsFoundationEnabled then
            //     Item.Validate("Costing Method", Rec."costing method"::FIFO);

            // NewMode := false;
        end;
    end;
}

#pragma implicitwith restore

