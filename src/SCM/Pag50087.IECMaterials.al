

page 50513 "IEC Materials"
{
    Caption = 'Item List';
    CardPageID = "IEC Material";
    Editable = false;
    PageType = List;
    SourceTable = Item;
    //SourceTableView = where("IEC Materials" = const(true));


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Caption = 'Item';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the item.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the item card represents a physical item (Inventory) or a service (Service).';
                }
                field(Control113; Rec.Inventory)
                {
                    ApplicationArea = Basic, Suite;
                    HideValue = IsService;
                    ToolTip = 'Specifies how many units, such as pieces, boxes, or cans, of the item are in inventory.';
                }
                field("Costing Method"; Rec."Costing Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies how the item''s cost flow is recorded and whether an actual or budgeted value is capitalized and used in the cost calculation.';
                }
                field("Standard Cost"; Rec."Standard Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the unit cost that is used as an estimation to be adjusted with variances later. It is typically used in assembly and production where costs can vary.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cost per unit of the item.';
                }
                field("Inventory Value Zero"; Rec."Inventory Value Zero")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory Value Zero field.';
                }
            }
        }
        area(factboxes)
        {
            // part(Control3; "Social Listening FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Item),
            //                   "Source No." = field("No.");
            //     Visible = SocialListeningVisible;
            // }
            // part(Control26; "Social Listening Setup FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Item),
            //                   "Source No." = field("No.");
            //     UpdatePropagation = Both;
            //     Visible = SocialListeningSetupVisible;
            // }
            part(Control1901314507; "Item Invoicing FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                              "Location Filter" = field("Location Filter"),
                              "Drop Shipment Filter" = field("Drop Shipment Filter"),
                              "Bin Filter" = field("Bin Filter"),
                              "Variant Filter" = field("Variant Filter"),
                              "Lot No. Filter" = field("Lot No. Filter"),
                              "Serial No. Filter" = field("Serial No. Filter");
                ApplicationArea = Basic;
            }
            part(Control1903326807; "Item Replenishment FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                              "Location Filter" = field("Location Filter"),
                              "Drop Shipment Filter" = field("Drop Shipment Filter"),
                              "Bin Filter" = field("Bin Filter"),
                              "Variant Filter" = field("Variant Filter"),
                              "Lot No. Filter" = field("Lot No. Filter"),
                              "Serial No. Filter" = field("Serial No. Filter");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control1906840407; "Item Planning FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                              "Location Filter" = field("Location Filter"),
                              "Drop Shipment Filter" = field("Drop Shipment Filter"),
                              "Bin Filter" = field("Bin Filter"),
                              "Variant Filter" = field("Variant Filter"),
                              "Lot No. Filter" = field("Lot No. Filter"),
                              "Serial No. Filter" = field("Serial No. Filter");
                ApplicationArea = Basic;
            }
            part(Control1901796907; "Item Warehouse FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                              "Location Filter" = field("Location Filter"),
                              "Drop Shipment Filter" = field("Drop Shipment Filter"),
                              "Bin Filter" = field("Bin Filter"),
                              "Variant Filter" = field("Variant Filter"),
                              "Lot No. Filter" = field("Lot No. Filter"),
                              "Serial No. Filter" = field("Serial No. Filter");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(ItemAttributesFactBox; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
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
            group(Item)
            {
                Caption = 'Item';
                Image = DataEntry;
                action("&Units of Measure")
                {
                    ApplicationArea = Basic;
                    Caption = '&Units of Measure';
                    Image = UnitOfMeasure;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Item Units of Measure";
                    RunPageLink = "Item No." = field("No.");
                    Scope = Repeater;
                    ToolTip = 'Set up the different units that the selected item can be traded in, such as piece, box, or hour.';
                }
                action(Attributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic;
                    Caption = 'Attributes';
                    Image = Category;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Scope = Repeater;
                    ToolTip = 'View or edit the item''s attributes, such as color, size, or other characteristics that help to describe the item.';

                    trigger OnAction()
                    begin
                        Page.RunModal(Page::"Item Attribute Value Editor", Rec);
                        CurrPage.SaveRecord;
                        CurrPage.ItemAttributesFactBox.Page.LoadItemAttributesData(Rec."No.");
                    end;
                }
                action(FilterByAttributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Filter by Attributes';
                    Image = EditFilter;
                    ToolTip = 'Find items that match specific attributes.';

                    trigger OnAction()
                    var
                        ItemAttributeManagement: Codeunit "Item Attribute Management";
                        CloseAction: action;
                        FilterText: Text;
                        FilterPageID: Integer;
                    begin
                        FilterPageID := Page::"Filter Items by Attribute";
                        if CurrentClientType = Clienttype::Phone then
                            FilterPageID := Page::"Filter Items by Att. Phone";

                        CloseAction := Page.RunModal(FilterPageID, TempFilterItemAttributesBuffer);
                        if (CurrentClientType <> Clienttype::Phone) and (CloseAction <> Action::LookupOK) then
                            exit;

                        Rec.FilterGroup(0);
                        FilterText := ItemAttributeManagement.FindItemsByAttribute(TempFilterItemAttributesBuffer);
                        Rec.SetFilter("No.", FilterText);
                    end;
                }
                action(ClearAttributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Clear Attributes Filter';
                    Image = RemoveFilterLines;
                    ToolTip = 'Remove the filter for specific item attributes.';

                    trigger OnAction()
                    begin
                        TempFilterItemAttributesBuffer.Reset;
                        TempFilterItemAttributesBuffer.DeleteAll;
                        Rec.FilterGroup(0);
                        Rec.SetRange("No.");
                    end;
                }
                action("Cross Re&ferences")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    // RunObject = Page "Item Cross Reference Entries";
                    // RunPageLink = "Item No." = field("No.");
                    Scope = Repeater;
                    ToolTip = 'Set up a customer''s or vendor''s own identification of the selected item. Cross-references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.';
                }
                action("E&xtended Texts")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xtended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text List";
                    RunPageLink = "Table Name" = const(Item), "No." = field("No.");
                    RunPageView = sorting("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                    Scope = Repeater;
                    ToolTip = 'Set up additional text for the description of the selected item. Extended text can be inserted under the Description field on document lines for the item.';
                }
                action(Translations)
                {
                    ApplicationArea = Basic;
                    Caption = 'Translations';
                    Image = Translations;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Item Translations";
                    RunPageLink = "Item No." = field("No."), "Variant Code" = const('');
                    Scope = Repeater;
                    ToolTip = 'Set up translated item descriptions for the selected item. Translated item descriptions are automatically inserted on documents according to the language code.';
                }
                group(ActionGroup145)
                {
                    Visible = false;
                    action(AdjustInventory)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Adjust Inventory';
                        Enabled = InventoryItemEditable;
                        Image = InventoryCalculation;
                        Scope = Repeater;
                        ToolTip = 'Increase or decrease the item''s inventory quantity manually by entering a new quantity. Adjusting the inventory quantity manually may be relevant after a physical count or if you do not record purchased quantities.';
                        Visible = IsFoundationEnabled;

                        trigger OnAction()
                        begin
                            Commit;
                            Page.RunModal(Page::"Adjust Inventory", Rec)
                        end;
                    }
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(27), "No." = field("No.");
                        Scope = Repeater;
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            Item: Record Item;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Item);
                            //    DefaultDimMultiple.SetMultiItem(Item);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
            }
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
                        ApplicationArea = Basic;
                        Caption = 'Ledger E&ntries';
                        Image = ItemLedger;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Category5;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Item No." = field("No.");
                        RunPageView = sorting("Item No.")
                                      order(descending);
                        Scope = Repeater;
                        ShortCutKey = 'Ctrl+F7';
                        ToolTip = 'View the history of positive and negative inventory changes that reflect transactions with the selected item.';
                    }
                    action("&Phys. Inventory Ledger Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Phys. Inventory Ledger Entries';
                        Image = PhysicalInventoryLedger;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Category5;
                        RunObject = Page "Phys. Inventory Ledger Entries";
                        RunPageLink = "Item No." = field("No.");
                        RunPageView = sorting("Item No.");
                        Scope = Repeater;
                        ToolTip = 'Executes the &Phys. Inventory Ledger Entries action.';
                    }
                }
            }
            group(PricesandDiscounts)
            {
                Caption = 'Prices and Discounts';
                action(Prices_Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Special Prices';
                    Image = Price;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    Scope = Repeater;
                    ToolTip = 'Set up different prices for the selected item. An item price is automatically used on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
                action(Prices_LineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Special Discounts';
                    Image = LineDiscount;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = Type = const(Item), Code = field("No.");
                    RunPageView = sorting(Type, Code);
                    Scope = Repeater;
                    ToolTip = 'Set up different discounts for the selected item. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
                action(PricesDiscountsOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Special Prices & Discounts Overview';
                    Image = PriceWorksheet;
                    ToolTip = 'Executes the Special Prices & Discounts Overview action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        SalesPriceAndLineDiscounts: Page "Sales Price and Line Discounts";
                    begin
                        SalesPriceAndLineDiscounts.InitPage(true);
                        SalesPriceAndLineDiscounts.LoadItem(Rec);
                        SalesPriceAndLineDiscounts.RunModal;
                    end;
                }
                action("Sales Price Worksheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales Price Worksheet';
                    Image = PriceWorksheet;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Sales Price Worksheet";
                    ToolTip = 'Executes the Sales Price Worksheet action.';
                }
            }
            group("Periodic Activities")
            {
                Caption = 'Periodic Activities';
                action("Adjust Cost - Item Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Adjust Cost - Item Entries';
                    Image = AdjustEntries;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    RunObject = Report "Adjust Cost - Item Entries";
                    ToolTip = 'Adjust inventory values in value entries so that you use the correct adjusted cost for updating the general ledger and so that sales and profit statistics are up to date.';
                }
                action("Post Inventory Cost to G/L")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post Inventory Cost to G/L';
                    Image = PostInventoryToGL;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    RunObject = Report "Post Inventory Cost to G/L";
                    ToolTip = 'Post the quantity and value changes to the inventory in the item ledger entries and the value entries when you post inventory transactions, such as sales shipments or purchase receipts.';
                }
                action("Physical Inventory Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Physical Inventory Journal';
                    Image = PhysicalInventory;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    RunObject = Page "Phys. Inventory Journal";
                    ToolTip = 'Select how you want to maintain an up-to-date record of your inventory at different locations.';
                }
                action("Revaluation Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revaluation Journal';
                    Image = Journal;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    RunObject = Page "Revaluation Journal";
                    ToolTip = 'View or edit the inventory value of items, which you can change, such as after doing a physical inventory.';
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = (not OpenApprovalEntriesExist) and EnabledApprovalWorkflowsExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Send an approval request.';

                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // //if //ApprovalsMgmt.CheckItemApprovalsWorkflowEnabled(Rec) then
                        // //ApprovalsMgmt.OnSendItemForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  //ApprovalsMgmt.OnCancelItemApprovalRequest(Rec);
                    end;
                }
            }
            group(Workflow)
            {
                Caption = 'Workflow';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Approval Workflow';
                    Enabled = not EnabledApprovalWorkflowsExist;
                    Image = CreateWorkflow;
                    ToolTip = 'Set up an approval workflow for creating or changing items, by going through a few pages that will guide you.';

                    trigger OnAction()
                    begin
                        Page.RunModal(Page::"Item Approval WF Setup Wizard");
                        SetWorkflowManagementEnabledState;
                    end;
                }
                action(ManageApprovalWorkflow)
                {
                    ApplicationArea = Suite;
                    Caption = 'Manage Approval Workflow';
                    Enabled = EnabledApprovalWorkflowsExist;
                    Image = WorkflowSetup;
                    ToolTip = 'View or edit existing approval workflows for creating or changing items.';

                    trigger OnAction()
                    var
                        WorkflowManagement: Codeunit "Workflow Management";
                    begin
                        WorkflowManagement.NavigateToWorkflows(Database::Item, EventFilter);
                        SetWorkflowManagementEnabledState;
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
                action("C&alculate Counting Period")
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
                        CurrPage.SetSelectionFilter(Item);
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Item);
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
            action("Adjust Item Cost/Price")
            {
                ApplicationArea = Basic;
                Caption = 'Adjust Item Cost/Price';
                Image = AdjustItemCost;
                RunObject = Report "Adjust Item Costs/Prices";
                ToolTip = 'Executes the Adjust Item Cost/Price action.';
            }
        }
        area(reporting)
        {
            group("Assembly/Production1")
            {
                Caption = 'Assembly/Production';
                action("Assemble to Order - Sales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assemble to Order - Sales';
                    Image = "Report";
                    RunObject = Report "Assemble to Order - Sales";
                    ToolTip = 'Executes the Assemble to Order - Sales action.';
                }
                action("Where-Used (Top Level)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Where-Used (Top Level)';
                    Image = "Report";
                    RunObject = Report "Where-Used (Top Level)";
                    ToolTip = 'Executes the Where-Used (Top Level) action.';
                }
                action("Quantity Explosion of BOM")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity Explosion of BOM';
                    Image = "Report";
                    RunObject = Report "Quantity Explosion of BOM";
                    ToolTip = 'Executes the Quantity Explosion of BOM action.';
                }
                group(Costing)
                {
                    Caption = 'Costing';
                    Image = ItemCosts;
                    action("Inventory Valuation - WIP")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Inventory Valuation - WIP';
                        Image = "Report";
                        RunObject = Report "Inventory Valuation - WIP";
                        ToolTip = 'Executes the Inventory Valuation - WIP action.';
                    }
                    action("Cost Shares Breakdown")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Cost Shares Breakdown';
                        Image = "Report";
                        RunObject = Report "Cost Shares Breakdown";
                        ToolTip = 'Executes the Cost Shares Breakdown action.';
                    }
                    action("Detailed Calculation")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Detailed Calculation';
                        Image = "Report";
                        RunObject = Report "Detailed Calculation";
                        ToolTip = 'Executes the Detailed Calculation action.';
                    }
                    action("Rolled-up Cost Shares")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rolled-up Cost Shares';
                        Image = "Report";
                        RunObject = Report "Rolled-up Cost Shares";
                        ToolTip = 'Executes the Rolled-up Cost Shares action.';
                    }
                    action("Single-Level Cost Shares")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Single-Level Cost Shares';
                        Image = "Report";
                        RunObject = Report "Single-level Cost Shares";
                        ToolTip = 'Executes the Single-Level Cost Shares action.';
                    }
                }
            }
            group(Inventory)
            {
                Caption = 'Inventory';
                action("Inventory - List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory - List';
                    Image = "Report";
                    RunObject = Report "Inventory - List";
                    ToolTip = 'Executes the Inventory - List action.';
                }
                action("Inventory - Availability Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory - Availability Plan';
                    Image = ItemAvailability;
                    RunObject = Report "Inventory - Availability Plan";
                    ToolTip = 'Executes the Inventory - Availability Plan action.';
                }
                action("Item/Vendor Catalog")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item/Vendor Catalog';
                    Image = "Report";
                    RunObject = Report "Item/Vendor Catalog";
                    ToolTip = 'Executes the Item/Vendor Catalog action.';
                }
                action("Phys. Inventory List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Phys. Inventory List';
                    Image = "Report";
                    RunObject = Report "Phys. Inventory List";
                    ToolTip = 'Executes the Phys. Inventory List action.';
                }
                action("Nonstock Item Sales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Nonstock Item Sales';
                    Image = "Report";
                    RunObject = Report "Catalog Item Sales";
                    ToolTip = 'Executes the Nonstock Item Sales action.';
                }
                action("Item Substitutions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Substitutions';
                    Image = "Report";
                    RunObject = Report "Item Substitutions";
                    ToolTip = 'View or edit any substitute items that are set up to be traded instead of the item in case it is not available.';
                }
                action("Price List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Price List';
                    Image = "Report";
                    RunObject = Report "Price List";
                    ToolTip = 'View, print, or save a list of your items and their prices, for example, to send to customers. You can create the list for specific customers, campaigns, currencies, or other criteria.';
                }
                action("Inventory Cost and Price List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory Cost and Price List';
                    Image = "Report";
                    RunObject = Report "Inventory Cost and Price List";
                    ToolTip = 'View, print, or save a list of your items and their price and cost information. The report specifies direct unit cost, last direct cost, unit price, profit percentage, and profit.';
                }
                action("Inventory Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory Availability';
                    Image = "Report";
                    RunObject = Report "Inventory Availability";
                    ToolTip = 'View, print, or save a summary of historical inventory transactions with selected items, for example, to decide when to purchase the items. The report specifies quantity on sales order, quantity on purchase order, back orders from vendors, minimum inventory, and whether there are reorders.';
                }
                group("Item Register")
                {
                    Caption = 'Item Register';
                    Image = ItemRegisters;
                    action("Item Register - Quantity")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item Register - Quantity';
                        Image = "Report";
                        RunObject = Report "Item Register - Quantity";
                        ToolTip = 'Executes the Item Register - Quantity action.';
                    }
                    action("Item Register - Value")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item Register - Value';
                        Image = "Report";
                        RunObject = Report "Item Register - Value";
                        ToolTip = 'Executes the Item Register - Value action.';
                    }
                }
                group(ActionGroup130)
                {
                    Caption = 'Costing';
                    Image = ItemCosts;
                    action("Inventory - Cost Variance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Inventory - Cost Variance';
                        Image = ItemCosts;
                        RunObject = Report "Inventory - Cost Variance";
                        ToolTip = 'Executes the Inventory - Cost Variance action.';
                    }
                    action("Invt. Valuation - Cost Spec.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Invt. Valuation - Cost Spec.';
                        Image = "Report";
                        RunObject = Report "Invt. Valuation - Cost Spec.";
                        ToolTip = 'Executes the Invt. Valuation - Cost Spec. action.';
                    }
                    action("Compare List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Compare List';
                        Image = "Report";
                        RunObject = Report "Compare List";
                        ToolTip = 'Executes the Compare List action.';
                    }
                }
                group("Inventory Details")
                {
                    Caption = 'Inventory Details';
                    Image = "Report";
                    action("Inventory - Transaction Detail")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Inventory - Transaction Detail';
                        Image = "Report";
                        RunObject = Report "Inventory - Transaction Detail";
                        ToolTip = 'Executes the Inventory - Transaction Detail action.';
                    }
                    action("Item Charges - Specification")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item Charges - Specification';
                        Image = "Report";
                        RunObject = Report "Item Charges - Specification";
                        ToolTip = 'Executes the Item Charges - Specification action.';
                    }
                    action("Item Age Composition - Qty.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Item Age Composition - Qty.';
                        Image = "Report";
                        RunObject = Report "Item Age Composition - Qty.";
                        ToolTip = 'View, print, or save an overview of the current age composition of selected items in your inventory.';
                    }
                    action("Item Expiration - Quantity")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item Expiration - Quantity';
                        Image = "Report";
                        RunObject = Report "Item Expiration - Quantity";
                        ToolTip = 'Executes the Item Expiration - Quantity action.';
                    }
                }
                group(Reports)
                {
                    Caption = 'Inventory Statistics';
                    Image = "Report";
                    action("Inventory - Sales Statistics")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Inventory - Sales Statistics';
                        Image = "Report";
                        RunObject = Report "Inventory - Sales Statistics";
                        ToolTip = 'View, print, or save a summary of selected items'' sales per customer, for example, to analyze the profit on individual items or trends in revenues and profit. The report specifies direct unit cost, unit price, sales quantity, sales in LCY, profit percentage, and profit.';
                    }
                    action("Inventory - Customer Sales")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Inventory - Customer Sales';
                        Image = "Report";
                        RunObject = Report "Inventory - Customer Sales";
                        ToolTip = 'View, print, or save a list of customers that have purchased selected items within a selected period, for example, to analyze customers'' purchasing patterns. The report specifies quantity, amount, discount, profit percentage, and profit.';
                    }
                    action("Inventory - Top 10 List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Inventory - Top 10 List';
                        Image = "Report";
                        RunObject = Report "Inventory - Top 10 List";
                        ToolTip = 'View, print, or save a list of the top items by sales, quantity on hand, or inventory value. The report includes a bar graph to show you how the items rank.';
                    }
                }
                group("Finance Reports")
                {
                    Caption = 'Finance Reports';
                    Image = "Report";
                    action("Inventory Valuation")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Inventory Valuation';
                        Image = "Report";
                        RunObject = Report "Inventory Valuation";
                        ToolTip = 'View, print, or save a list of the values of the on-hand quantity of each inventory item.';
                    }
                    action(Status)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Status';
                        Image = "Report";
                        RunObject = Report Status;
                        ToolTip = 'View, print, or save the status of partially filled or unfilled orders so you can determine what effect filling these orders may have on your inventory.';
                    }
                    action("Item Age Composition - Value")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item Age Composition - Value';
                        Image = "Report";
                        RunObject = Report "Item Age Composition - Value";
                        ToolTip = 'View, print, or save an overview of the current age composition of selected items in your inventory.';
                    }
                }
            }
            group(Orders)
            {
                Caption = 'Orders';
                action("Inventory Order Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory Order Details';
                    Image = "Report";
                    RunObject = Report "Inventory Order Details";
                    ToolTip = 'Executes the Inventory Order Details action.';
                }
                action("Inventory Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory Purchase Orders';
                    Image = "Report";
                    RunObject = Report "Inventory Purchase Orders";
                    ToolTip = 'Executes the Inventory Purchase Orders action.';
                }
                action("Inventory - Vendor Purchases")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory - Vendor Purchases';
                    Image = "Report";
                    RunObject = Report "Inventory - Vendor Purchases";
                    ToolTip = 'Executes the Inventory - Vendor Purchases action.';
                }
                action("Inventory - Reorders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory - Reorders';
                    Image = "Report";
                    RunObject = Report "Inventory - Reorders";
                    ToolTip = 'Executes the Inventory - Reorders action.';
                }
                action("Inventory - Sales Back Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inventory - Sales Back Orders';
                    Image = "Report";
                    RunObject = Report "Inventory - Sales Back Orders";
                    ToolTip = 'Executes the Inventory - Sales Back Orders action.';
                }
            }
        }
        area(navigation)
        {
            group(ActionGroup126)
            {
                Caption = 'Item';
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    begin
                        //  //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
            }
            group(Availability)
            {
                Caption = 'Availability';
                Image = Item;
                action("Items b&y Location")
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
                    action("<Action5>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Event';
                        Image = "Event";
                        ToolTip = 'Executes the Event action.';
                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Period';
                        Image = Period;
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = "No." = field("No."), "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"), "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"), "Location Filter" = field("Location Filter"), "Drop Shipment Filter" = field("Drop Shipment Filter"), "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Executes the Period action.';
                    }
                    action(Variant)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        RunObject = Page "Item Availability by Variant";
                        RunPageLink = "No." = field("No."), "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"), "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"), "Location Filter" = field("Location Filter"), "Drop Shipment Filter" = field("Drop Shipment Filter"), "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Executes the Variant action.';
                    }
                    action(Location)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Location';
                        Image = Warehouse;
                        RunObject = Page "Item Availability by Location";
                        RunPageLink = "No." = field("No."), "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"), "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"), "Location Filter" = field("Location Filter"), "Drop Shipment Filter" = field("Drop Shipment Filter"), "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Executes the Location action.';
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Basic;
                        Caption = 'BOM Level';
                        Image = BOMLevel;
                        ToolTip = 'Executes the BOM Level action.';
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
                        ToolTip = 'Executes the Timeline action.';
                        trigger OnAction()
                        begin
                            // //Rec.ShowTimelineFromItem(Rec);
                        end;
                    }
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
                        Item: Record Item;
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        ItemRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(Item);
                        Item.Next;

                        if Item.Count = 1 then
                            CRMIntegrationManagement.UpdateOneNow(Item.RecordId)
                        else begin
                            ItemRecordRef.GetTable(Item);
                            CRMIntegrationManagement.UpdateMultipleNow(ItemRecordRef);
                        end
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
                action("Va&riants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Va&riants';
                    Image = ItemVariant;
                    RunObject = Page "Item Variants";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Va&riants action.';
                }
                action("Substituti&ons")
                {
                    ApplicationArea = Suite;
                    Caption = 'Substituti&ons';
                    Image = ItemSubstitution;
                    RunObject = Page "Item Substitution Entry";
                    RunPageLink = Type = const(Item), "No." = field("No.");
                    ToolTip = 'Executes the Substituti&ons action.';
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
                    action("<Action32>")
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
                        RunPageLink = Type = const(Item), "No." = field("No.");
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
                            CalculateStdCost.CalcAssemblyItemPrice(Rec."No.");
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
                    action(Action29)
                    {
                        AccessByPermission = TableData "BOM Component" = R;
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
                    action(Action24)
                    {
                        AccessByPermission = TableData "Production BOM Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;
                        ToolTip = 'Executes the Calc. Stan&dard Cost action.';
                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcItem(Rec."No.", false);
                        end;
                    }
                    action("&Reservation Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Reservation Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Reservation Entries";
                        RunPageLink = "Reservation Status" = const(Reservation), "Item No." = field("No.");
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
                            //   //ItemTrackingDocMgt.ShowItemTrackingForMasterData(3, '', "No.", '', '', '', '');
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
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action16)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Statistics';
                        Image = Statistics;
                        ShortCutKey = 'F7';
                        ToolTip = 'Executes the Statistics action.';
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
                        ApplicationArea = Basic;
                        Caption = 'Entry Statistics';
                        Image = EntryStatistics;
                        RunObject = Page "Item Entry Statistics";
                        RunPageLink = "No." = field("No."), "Date Filter" = field("Date Filter"), "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"), "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"), "Location Filter" = field("Location Filter"), "Drop Shipment Filter" = field("Drop Shipment Filter"), "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Executes the Entry Statistics action.';
                    }
                    action("T&urnover")
                    {
                        ApplicationArea = Basic;
                        Caption = 'T&urnover';
                        Image = Turnover;
                        RunObject = Page "Item Turnover";
                        RunPageLink = "No." = field("No."), "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"), "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"), "Location Filter" = field("Location Filter"), "Drop Shipment Filter" = field("Drop Shipment Filter"), "Variant Filter" = field("Variant Filter");
                        ToolTip = 'Executes the T&urnover action.';
                    }
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Item), "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group("S&ales")
            {
                Caption = 'S&ales';
                Image = Sales;
                action(Sales_Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Prices action.';
                }
                action(Sales_LineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = Type = const(Item), Code = field("No.");
                    RunPageView = sorting(Type, Code);
                    ToolTip = 'Executes the Line Discounts action.';
                }
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Prepa&yment Percentages action.';
                }
                action(Action37)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Orders";
                    RunPageLink = Type = const(Item), "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Orders action.';
                }
                action("Returns Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Returns Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Orders";
                    RunPageLink = Type = const(Item), "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Returns Orders action.';
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
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Prices action.';
                }
                action("Line Discounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'Executes the Line Discounts action.';
                }
                action(Action125)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Item No." = field("No.");
                    ToolTip = 'Executes the Prepa&yment Percentages action.';
                }
                action(Action40)
                {
                    ApplicationArea = Suite;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                    RunPageLink = Type = const(Item), "No." = field("No.");
                    RunPageView = sorting("Document Type", Type, "No.");
                    ToolTip = 'Executes the Orders action.';
                }
                action("Return Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Orders";
                    RunPageLink = Type = const(Item), "No." = field("No.");
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
                    RunPageLink = Type = const(Item), "No." = field("No.");
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
                    action("Resource &Skills")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Resource &Skills';
                        Image = ResourceSkills;
                        RunObject = Page "Resource Skills";
                        RunPageLink = Type = const(Item), "No." = field("No.");
                        ToolTip = 'View the assignment of skills to resources, items, service item groups, and service items. You can use skill codes to allocate skilled resources to service items or items that need special skills for servicing.';
                    }
                    action("Skilled R&esources")
                    {
                        AccessByPermission = TableData "Service Header" = R;
                        ApplicationArea = Jobs;
                        Caption = 'Skilled R&esources';
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

                actionref("Inventory - Reorders_Promoted"; "Inventory - Reorders")
                {
                }
                actionref("Inventory - Sales Back Orders_Promoted"; "Inventory - Sales Back Orders")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Item', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Cross Re&ferences_Promoted"; "Cross Re&ferences")
                {
                }
                actionref(AdjustInventory_Promoted; AdjustInventory)
                {
                }
                actionref(ApprovalEntries_Promoted; ApprovalEntries)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'History', Comment = 'Generated from the PromotedActionCategories property index 4.';
            }
            group(Category_Category6)
            {
                Caption = 'Special Prices & Discounts', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category7)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Periodic Activities', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Category9)
            {
                Caption = 'Inventory', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref("Price List_Promoted"; "Price List")
                {
                }
            }
            group(Category_Category10)
            {
                Caption = 'Attributes', Comment = 'Generated from the PromotedActionCategories property index 9.';

                actionref(FilterByAttributes_Promoted; FilterByAttributes)
                {
                }
                actionref(ClearAttributes_Promoted; ClearAttributes)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        SetSocialListeningFactboxVisibility;

        CRMIsCoupledToRecord :=
          CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId) and CRMIntegrationEnabled;

        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);

        //   CanCancelApprovalForRecord := //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
        CurrPage.ItemAttributesFactBox.Page.LoadItemAttributesData(Rec."No.");
    end;

    trigger OnAfterGetRecord()
    begin
        SetSocialListeningFactboxVisibility;
        EnableControls;
    end;

    trigger OnOpenPage()
    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        //IsFoundationEnabled := ApplicationAreaSetup.IsFoundationEnabled;
        SetWorkflowManagementEnabledState;
    end;

    var
        TempFilterItemAttributesBuffer: Record "Filter Item Attributes Buffer" temporary;
        ApplicationAreaSetup: Record "Application Area Setup";
        CalculateStdCost: Codeunit "Calculate Standard Cost";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        ////ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SkilledResourceList: Page "Skilled Resource List";
        IsFoundationEnabled: Boolean;

        SocialListeningSetupVisible: Boolean;

        SocialListeningVisible: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        OpenApprovalEntriesExist: Boolean;

        IsService: Boolean;

        InventoryItemEditable: Boolean;
        EnabledApprovalWorkflowsExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        EventFilter: Text;


    procedure GetSelectionFilter(): Text
    var
        Item: Record Item;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Item);
        exit(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;


    procedure SetSelection(var Item: Record Item)
    begin
        CurrPage.SetSelectionFilter(Item);
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    // //SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        //   //SocialListeningMgt.GetItemFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;

    local procedure EnableControls()
    begin
        IsService := (Rec.Type = Rec.Type::Service);
        InventoryItemEditable := Rec.Type = Rec.Type::Inventory;
    end;

    local procedure SetWorkflowManagementEnabledState()
    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        EventFilter := WorkflowEventHandling.RunWorkflowOnSendItemForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnItemChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(Database::Item, EventFilter);
    end;
}

#pragma implicitwith restore

