

page 59002 "Fixed Asset List-flt"
{
    Caption = 'Fixed Asset List';
    CardPageID = "Fixed Asset Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Fixed Asset";
    // SourceTableView = where(test = const('1'));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the fixed asset.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the vendor from which you purchased this fixed asset.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the fixed asset''s serial number.';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the number of the vendor who performs repairs and maintenance on the fixed asset.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies which employee is responsible for the fixed asset.';
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the class that the fixed asset belongs to.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the subclass of the class that the fixed asset belongs to.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the location, such as a building, where the fixed asset is located.';
                }
                field("Budgeted Asset"; Rec."Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies if the asset is for budgeting purposes.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a search description for the fixed asset.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fixed &Asset")
            {
                Caption = 'Fixed &Asset';
                Image = FixedAssets;
                action("Depreciation &Books")
                {
                    ApplicationArea = Basic;
                    Caption = 'Depreciation &Books';
                    Image = DepreciationBooks;
                    RunObject = Page "FA Depreciation Books";
                    RunPageLink = "FA No." = field("No.");
                    ToolTip = 'Executes the Depreciation &Books action.';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Fixed Asset Statistics";
                    RunPageLink = "FA No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
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
                        RunPageLink = "Table ID" = const(5600),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            FA: Record "Fixed Asset";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(FA);
                            //DefaultDimMultiple.SetMultiFA(FA);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action("Main&tenance Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Main&tenance Ledger Entries';
                    Image = MaintenanceLedgerEntries;
                    RunObject = Page "Maintenance Ledger Entries";
                    RunPageLink = "FA No." = field("No.");
                    RunPageView = sorting("FA No.");
                    ToolTip = 'Executes the Main&tenance Ledger Entries action.';
                }
                action(Picture)
                {
                    ApplicationArea = Basic;
                    Caption = 'Picture';
                    Image = Picture;
                    RunObject = Page "Fixed Asset Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Picture action.';
                }
                action("C&opy Fixed Asset")
                {
                    ApplicationArea = Basic;
                    Caption = 'C&opy Fixed Asset';
                    Ellipsis = true;
                    Image = CopyFixedAssets;
                    ToolTip = 'Executes the C&opy Fixed Asset action.';
                    trigger OnAction()
                    var
                        CopyFA: Report "Copy Fixed Asset";
                    begin
                        CopyFA.SetFANo(Rec."No.");
                        CopyFA.RunModal;
                    end;
                }
                action("FA Posting Types Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Posting Types Overview';
                    Image = ShowMatrix;
                    RunObject = Page "FA Posting Types Overview";
                    ToolTip = 'Executes the FA Posting Types Overview action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const("Fixed Asset"),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group("Main Asset")
            {
                Caption = 'Main Asset';
                Image = Components;
                action("M&ain Asset Components")
                {
                    ApplicationArea = Basic;
                    Caption = 'M&ain Asset Components';
                    Image = Components;
                    RunObject = Page "Main Asset Components";
                    RunPageLink = "Main Asset No." = field("No.");
                    ToolTip = 'Executes the M&ain Asset Components action.';
                }
                action("Ma&in Asset Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ma&in Asset Statistics';
                    Image = StatisticsDocument;
                    RunObject = Page "Main Asset Statistics";
                    RunPageLink = "FA No." = field("No.");
                    ToolTip = 'Executes the Ma&in Asset Statistics action.';
                }
                separator(Action45)
                {
                    Caption = '';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = FixedAssetLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "FA Ledger Entries";
                    RunPageLink = "FA No." = field("No.");
                    RunPageView = sorting("FA No.");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
                action("Error Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Error Ledger Entries';
                    Image = ErrorFALedgerEntries;
                    RunObject = Page "FA Error Ledger Entries";
                    RunPageLink = "Canceled from FA No." = field("No.");
                    RunPageView = sorting("Canceled from FA No.");
                    ToolTip = 'Executes the Error Ledger Entries action.';
                }
                action("Maintenance &Registration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance &Registration';
                    Image = MaintenanceRegistrations;
                    RunObject = Page "Maintenance Registration";
                    RunPageLink = "FA No." = field("No.");
                    ToolTip = 'Executes the Maintenance &Registration action.';
                }
            }
        }
        area(reporting)
        {
            action("Fixed Assets List")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets List';
                Image = "Report";
                RunObject = Report "Fixed Asset - List";
                ToolTip = 'Executes the Fixed Assets List action.';
            }
            action("Acquisition List")
            {
                ApplicationArea = Basic;
                Caption = 'Acquisition List';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Acquisition List";
                ToolTip = 'Executes the Acquisition List action.';
            }
            action(Details)
            {
                ApplicationArea = Basic;
                Caption = 'Details';
                Image = View;
                RunObject = Report "Fixed Asset - Details";
                ToolTip = 'Executes the Details action.';
            }
            action("Book Value 01")
            {
                ApplicationArea = Basic;
                Caption = 'Book Value 01';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 01";
                ToolTip = 'Executes the Book Value 01 action.';
            }
            action("Book Value 02")
            {
                ApplicationArea = Basic;
                Caption = 'Book Value 02';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 02";
                ToolTip = 'Executes the Book Value 02 action.';
            }
            action(Analysis)
            {
                ApplicationArea = Basic;
                Caption = 'Analysis';
                Image = "Report";
                RunObject = Report "Fixed Asset - Analysis";
                ToolTip = 'Executes the Analysis action.';
            }
            action("Projected Value")
            {
                ApplicationArea = Basic;
                Caption = 'Projected Value';
                Image = "Report";
                RunObject = Report "Fixed Asset - Projected Value";
                ToolTip = 'Executes the Projected Value action.';
            }
            action("G/L Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'G/L Analysis';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - G/L Analysis";
                ToolTip = 'Executes the G/L Analysis action.';
            }
            action(Register)
            {
                ApplicationArea = Basic;
                Caption = 'Register';
                Image = Confirm;
                RunObject = Report "Fixed Asset Register";
                ToolTip = 'Executes the Register action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Depreciation &Books_Promoted"; "Depreciation &Books")
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref("Main&tenance Ledger Entries_Promoted"; "Main&tenance Ledger Entries")
                {
                }
                actionref("C&opy Fixed Asset_Promoted"; "C&opy Fixed Asset")
                {
                }
                actionref("Maintenance &Registration_Promoted"; "Maintenance &Registration")
                {
                }
            }
            group(Category_Report)
            {
                actionref("Fixed Assets List_Promoted"; "Fixed Assets List")
                {
                }
                actionref(Details_Promoted; Details)
                {
                }
                actionref(Analysis_Promoted; Analysis)
                {
                }
                actionref("Projected Value_Promoted"; "Projected Value")
                {
                }
                actionref(Register_Promoted; Register)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

