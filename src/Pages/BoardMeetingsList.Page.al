Page 52194419 "Board Meetings List"
{
    Caption = 'Campaign List';
   // CardPageID = "Commission Meetings A/cs";
    Editable = false;
    PageType = List;
    SourceTable = Campaign;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                          CurrPage.Update;
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeCode;"Committee Code")
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeName;"Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field(StartingDate;"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndingDate;"Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime;"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(EndTime;"End Time")
                {
                    ApplicationArea = Basic;
                }
                field(NotificationDate;"Notification Date")
                {
                    ApplicationArea = Basic;
                }
                field(AgendasDate;"Agendas Date")
                {
                    ApplicationArea = Basic;
                }
                field(BoardMemberNotice;"Commisioner Notice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Member Notice';
                }
                field(LastDateModified;"Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Activated;Activated)
                {
                    ApplicationArea = Basic;
                }
                field(Month;Month)
                {
                    ApplicationArea = Basic;
                }
                field(Attachment;Attachment)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
            group(Campaign)
            {
                Caption = 'C&ampaign';
                Image = Campaign;
                action(Entries)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&ntries';
                    Image = Entries;
                    RunObject = Page "Campaign Entries";
                    RunPageLink = "Campaign No."=field("No.");
                    RunPageView = sorting("Campaign No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = "Table Name"=const(Campaign),
                                  "No."=field("No."),
                                  "Sub No."=const(0);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Campaign Statistics";
                    RunPageLink = "No."=field("No.");
                    ShortCutKey = 'F7';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=const(5071),
                                      "No."=field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            Campaign: Record Campaign;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Campaign);
                            // DefaultDimMultiple.SetMultiCampaign(Campaign);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(Todos)
                {
                    ApplicationArea = Basic;
                    Caption = 'T&o-dos';
                    Image = TaskList;
                    RunObject = Page "Task List";
                    RunPageLink = "Campaign No."=field("No."),
                                  "System To-do Type"=filter(Organizer);
                    RunPageView = sorting("Campaign No.");
                }
                action(Segments)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&egments';
                    Image = Segment;
                    RunObject = Page "Segment List";
                    RunPageLink = "Campaign No."=field("No.");
                    RunPageView = sorting("Campaign No.");
                }
                group(Opportunities)
                {
                    Caption = 'Oppo&rtunities';
                    Image = OpportunityList;
                    action(List)
                    {
                        ApplicationArea = Basic;
                        Caption = 'List';
                        Image = OpportunitiesList;
                        RunObject = Page "Opportunity List";
                        RunPageLink = "Campaign No."=field("No.");
                        RunPageView = sorting("Campaign No.");
                    }
                }
                action(SalesPrices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Prices';
                    Image = SalesPrices;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type"=const(Campaign),
                                  "Sales Code"=field("No.");
                    RunPageView = sorting("Sales Type","Sales Code");
                }
                action(SalesLineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Line Discounts';
                    Image = SalesLineDisc;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type"=const(Campaign),
                                  "Sales Code"=field("No.");
                    RunPageView = sorting("Sales Type","Sales Code");
                }
            }
        }
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(ActivateSalesPricesLineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = '&Activate Sales Prices/Line Discounts';
                    Image = ActivateDiscounts;

                    trigger OnAction()
                    begin
                        CampaignMgmt.ActivateCampaign(Rec);
                    end;
                }
                action(DeactivateSalesPricesLineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = '&Deactivate Sales Prices/Line Discounts';
                    Image = DeactivateDiscounts;

                    trigger OnAction()
                    begin
                        CampaignMgmt.DeactivateCampaign(Rec,true);
                    end;
                }
            }
        }
        area(reporting)
        {
            action(CampaignDetails)
            {
                ApplicationArea = Basic;
                Caption = 'Campaign Details';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Campaign - Details";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Segments_Promoted; Segments)
                {
                }
                actionref(ActivateSalesPricesLineDiscounts_Promoted; ActivateSalesPricesLineDiscounts)
                {
                }
                actionref(DeactivateSalesPricesLineDiscounts_Promoted; DeactivateSalesPricesLineDiscounts)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }

    var
        CampaignMgmt: Codeunit "Campaign Target Group Mgt";


    procedure GetSelectionFilter(): Text
    var
        Campaign: Record Campaign;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Campaign);
        exit(SelectionFilterManagement.GetSelectionFilterForCampaign(Campaign));
    end;
}

