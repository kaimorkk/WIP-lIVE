Page 52194243 "Fleet List"
{
    ApplicationArea = Basic;
    Caption = 'Fleet List';
    CardPageID = "Fleet Card";
    Editable = false;
    PageType = List;
    SourceTable = "Fixed Asset";
    SourceTableView = where(Disposed=const(false),
                            "FA Class Code"=const('MV'));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(VendorNo;"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field(MaintenanceVendorNo;"Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(ResponsibleEmployee;"Responsible Employee")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(FAClassCode;"FA Class Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(FASubclassCode;"FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field(FALocation;"FA Location")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                field(BudgetedAsset;"Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(SearchDescription;"Search Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(FixedAsset)
            {
                Caption = 'Fixed &Asset';
                action(DepreciationBooks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Depreciation &Books';
                    Image = DepreciationBooks;
                    RunObject = Page "FA Depreciation Books";
                    RunPageLink = "FA No."=field("No.");
                }
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = FixedAssetLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "FA Ledger Entries";
                    RunPageLink = "FA No."=field("No.");
                    RunPageView = sorting("FA No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(ErrorLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Error Ledger Entries';
                    RunObject = Page "FA Error Ledger Entries";
                    RunPageLink = "Canceled from FA No."=field("No.");
                    RunPageView = sorting("Canceled from FA No.");
                }
                action(MaintenanceLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Main&tenance Ledger Entries';
                    Image = MaintenanceLedgerEntries;
                    RunObject = Page "Maintenance Ledger Entries";
                    RunPageLink = "FA No."=field("No.");
                    RunPageView = sorting("FA No.");
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=const("Fixed Asset"),
                                  "No."=field("No.");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=const(5600),
                                      "No."=field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            FA: Record "Fixed Asset";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(FA);
                            // DefaultDimMultiple.SetMultiFA(FA);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(Picture)
                {
                    ApplicationArea = Basic;
                    Caption = 'Picture';
                    RunObject = Page "Fixed Asset Picture";
                    RunPageLink = "No."=field("No.");
                }
                action(MaintenanceRegistration)
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance &Registration';
                    Image = MaintenanceRegistrations;
                    RunObject = Page "Maintenance Registration";
                    RunPageLink = "FA No."=field("No.");
                }
                action(MainAssetComponents)
                {
                    ApplicationArea = Basic;
                    Caption = 'M&ain Asset Components';
                    RunObject = Page "Main Asset Components";
                    RunPageLink = "Main Asset No."=field("No.");
                }
                action(CopyFixedAsset)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&opy Fixed Asset';
                    Ellipsis = true;
                    Image = CopyFixedAssets;

                    trigger OnAction()
                    var
                        CopyFA: Report "Copy Fixed Asset";
                    begin
                        CopyFA.SetFANo("No.");
                        CopyFA.RunModal;
                    end;
                }
                separator(Action45)
                {
                    Caption = '';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Fixed Asset Statistics";
                    RunPageLink = "FA No."=field("No.");
                    ShortCutKey = 'F7';
                }
                action(MainAssetStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ma&in Asset Statistics';
                    RunObject = Page "Main Asset Statistics";
                    RunPageLink = "FA No."=field("No.");
                }
                action(FAPostingTypesOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Posting Types Overview';
                    RunObject = Page "FA Posting Types Overview";
                }
            }
        }
        area(reporting)
        {
            action(FixedAssetsList)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets List';
                RunObject = Report "Fixed Asset - List";
            }
            action(AcquisitionList)
            {
                ApplicationArea = Basic;
                Caption = 'Acquisition List';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Acquisition List";
            }
            action(Details)
            {
                ApplicationArea = Basic;
                Caption = 'Details';
                RunObject = Report "Fixed Asset - Details";
            }
            action(BookValue01)
            {
                ApplicationArea = Basic;
                Caption = 'Book Value 01';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 01";
            }
            action(BookValue02)
            {
                ApplicationArea = Basic;
                Caption = 'Book Value 02';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset Journal - Test";
            }
            action(Analysis)
            {
                ApplicationArea = Basic;
                Caption = 'Analysis';
                RunObject = Report "Fixed Asset - Analysis";
            }
            action(ProjectedValue)
            {
                ApplicationArea = Basic;
                Caption = 'Projected Value';
                RunObject = Report "Fixed Asset - Projected Value";
            }
            action(GLAnalysis)
            {
                ApplicationArea = Basic;
                Caption = 'G/L Analysis';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - G/L Analysis";
            }
            action(Register)
            {
                ApplicationArea = Basic;
                Caption = 'Register';
                Image = Confirm;
                RunObject = Report "Fixed Asset Register";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(DepreciationBooks_Promoted; DepreciationBooks)
                {
                }
                actionref(MaintenanceLedgerEntries_Promoted; MaintenanceLedgerEntries)
                {
                }
                actionref(MaintenanceRegistration_Promoted; MaintenanceRegistration)
                {
                }
                actionref(CopyFixedAsset_Promoted; CopyFixedAsset)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
            group(Category_Report)
            {
                actionref(FixedAssetsList_Promoted; FixedAssetsList)
                {
                }
                actionref(Details_Promoted; Details)
                {
                }
                actionref(Analysis_Promoted; Analysis)
                {
                }
                actionref(ProjectedValue_Promoted; ProjectedValue)
                {
                }
                actionref(Register_Promoted; Register)
                {
                }
            }
        }
    }
}

