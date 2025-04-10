

page 56049 "Copyright Works List"
{
    Caption = 'Copyright Works List';
    CardPageID = "Copyright Works Card";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Service Item";
    // SourceTableView = where("Customer Type" = const("Copyright Applicant"));


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number of the item.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains a description of this item.';
                }
                // field(Type; Rec.Type)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Type field.';
                // }
                // field("Customer Category"; Rec."Customer Category")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Applicant Category field.';
                // }
                // field("ID. No."; Rec."ID. No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the ID. No. field.';
                // }
                // field("P.I.N"; Rec."P.I.N")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the P.I.N field.';
                // }
                // field("Copyright Title"; Rec."Copyright Title")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Copyright Title field.';
                // }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the serial number of this item.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number of the customer who owns this item.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the status of the service item.';
                    Visible = false;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the service priority for this item.';
                    Visible = false;
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
            group("&Service Item")
            {
                Caption = '&Service Item';
                Image = ServiceItem;
                action("Com&ponent List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Com&ponent List';
                    Image = Components;
                    RunObject = Page "Service Item Component List";
                    RunPageLink = Active = const(true), "Parent Service Item No." = field("No.");
                    RunPageView = sorting(Active, "Parent Service Item No.", "Line No.");
                    ToolTip = 'Executes the Com&ponent List action.';
                }
                separator(Action27)
                {
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("&Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(5940), "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the &Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            ServiceItem: Record "Service Item";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(ServiceItem);
                            // DefaultDimMultiple.SetMultiServiceItem(ServiceItem);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                separator(Action58)
                {
                    Caption = '';
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action59)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Statistics';
                        Image = Statistics;
                        RunObject = Page "Service Item Statistics";
                        RunPageLink = "No." = field("No.");
                        ShortCutKey = 'F7';
                        ToolTip = 'Executes the Statistics action.';
                    }
                    action("Tr&endscape")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Tr&endscape';
                        Image = Trendscape;
                        RunObject = Page "Service Item Trendscape";
                        RunPageLink = "No." = field("No.");
                        ToolTip = 'Executes the Tr&endscape action.';
                    }
                }
                separator(Action61)
                {
                    Caption = '';
                }
                group(Troubleshooting)
                {
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;
                    action("Troubleshooting Setup")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Troubleshooting Setup';
                        Image = Troubleshoot;
                        RunObject = Page "Troubleshooting Setup";
                        RunPageLink = Type = const("Service Item"), "No." = field("No.");
                        ToolTip = 'Executes the Troubleshooting Setup action.';
                    }
                    action(Action3)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Troubleshooting';
                        Image = Troubleshoot;
                        ToolTip = 'Executes the Troubleshooting action.';
                        trigger OnAction()
                        var
                            TroubleshootingHeader: Record "Troubleshooting Header";
                        begin
                            TroubleshootingHeader.ShowForServItem(Rec);
                        end;
                    }
                }
                action("Resource Skills")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Skills';
                    Image = ResourceSkills;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const("Service Item"), "No." = field("No.");
                    ToolTip = 'Executes the Resource Skills action.';
                }
                action("S&killed Resources")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&killed Resources';
                    Image = ResourceSkills;
                    ToolTip = 'Executes the S&killed Resources action.';
                    trigger OnAction()
                    begin
                        Clear(SkilledResourceList);
                        SkilledResourceList.Initialize(ResourceSkill.Type::"Service Item", Rec."No.", Rec.Description);
                        SkilledResourceList.RunModal;
                    end;
                }
                separator(Action56)
                {
                    Caption = '';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = const("Service Item"), "Table Subtype" = const(0), "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                group("S&ervice Orders")
                {
                    Caption = 'S&ervice Orders';
                    Image = "Order";
                    action("&Item Lines")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Service Item Lines";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'Executes the &Item Lines action.';
                    }
                    action("&Service Lines")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Service Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'Executes the &Service Lines action.';
                    }
                }
                group("Service Shi&pments")
                {
                    Caption = 'Service Shi&pments';
                    Image = Shipment;
                    action(Action67)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Posted Shpt. Item Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'Executes the &Item Lines action.';
                    }
                    action(Action68)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Posted Serv. Shpt. Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'Executes the &Service Lines action.';
                    }
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    RunObject = Page "Serv. Contr. List (Serv. Item)";
                    RunPageLink = "Service Item No." = field("No.");
                    RunPageView = sorting("Service Item No.", "Contract Status");
                    ToolTip = 'Executes the Ser&vice Contracts action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Service Item Lo&g")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Item Lo&g';
                    Image = Log;
                    RunObject = Page "Service Item Log";
                    RunPageLink = "Service Item No." = field("No.");
                    ToolTip = 'Executes the Service Item Lo&g action.';
                }
                action("Service Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Ledger E&ntries';
                    Image = ServiceLedger;
                    RunObject = Page "Service Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No."), "Service Order No." = field("Service Order Filter"), "Service Contract No." = field("Contract Filter"), "Posting Date" = field("Date Filter");
                    RunPageView = sorting("Service Item No. (Serviced)", "Entry Type", "Moved from Prepaid Acc.", Type, "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Service Ledger E&ntries action.';
                }
                action("&Warranty Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = '&Warranty Ledger Entries';
                    Image = WarrantyLedger;
                    RunObject = Page "Warranty Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No.");
                    RunPageView = sorting("Service Item No. (Serviced)", "Posting Date", "Document No.");
                    ToolTip = 'Executes the &Warranty Ledger Entries action.';
                }
                separator(Action30)
                {
                    Caption = '';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                action("New Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Item';
                    Image = NewItem;
                    RunObject = Page "Item Card";
                    RunPageMode = Create;
                    ToolTip = 'Executes the New Item action.';
                }
            }
        }
        area(reporting)
        {
            action("Service Item")
            {
                ApplicationArea = Basic;
                Caption = 'Service Item';
                Image = "Report";
                RunObject = Report "Service Items";
                ToolTip = 'Executes the Service Item action.';
            }
            action("Service Item Label")
            {
                ApplicationArea = Basic;
                Caption = 'Service Item Label';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Service Item Line Labels";
                ToolTip = 'Executes the Service Item Label action.';
            }
            action("Service Item Resource usage")
            {
                ApplicationArea = Basic;
                Caption = 'Service Item Resource usage';
                Image = "Report";
                RunObject = Report "Service Item - Resource Usage";
                ToolTip = 'Executes the Service Item Resource usage action.';
            }
            action("Service Item Out of Warranty")
            {
                ApplicationArea = Basic;
                Caption = 'Service Item Out of Warranty';
                Image = "Report";
                RunObject = Report "Service Items Out of Warranty";
                ToolTip = 'Executes the Service Item Out of Warranty action.';
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("New Item_Promoted"; "New Item")
                {
                }
            }
            group(Category_Process)
            {
                actionref(Action59_Promoted; Action59)
                {
                }
                actionref("Troubleshooting Setup_Promoted"; "Troubleshooting Setup")
                {
                }
                actionref("Ser&vice Contracts_Promoted"; "Ser&vice Contracts")
                {
                }
            }
            group(Category_Report)
            {
                actionref("Service Item_Promoted"; "Service Item")
                {
                }
                actionref("Service Item Resource usage_Promoted"; "Service Item Resource usage")
                {
                }
                actionref("Service Item Out of Warranty_Promoted"; "Service Item Out of Warranty")
                {
                }
            }
        }
    }

    var
        ResourceSkill: Record "Resource Skill";
        SkilledResourceList: Page "Skilled Resource List";
}

#pragma implicitwith restore

