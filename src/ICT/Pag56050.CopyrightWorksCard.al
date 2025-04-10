

page 56050 "Copyright Works Card"
{
    Caption = 'Copyright Works Card';
    PageType = Card;
    SourceTable = "Service Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the number of the item.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains a description of this item.';
                }
                // field(Type; Rec.Type)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Type field.';
                // }
                // field("Company Reg No"; Rec."Company Reg No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Company Reg No field.';
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
                // field(Title; Rec.Title)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Title field.';
                // }
                // field("Captured by"; Rec."Captured by")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Captured by field.';
                // }
            }
            group(Customer)
            {
                Caption = 'Customer';
                Editable = false;
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the number of the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Name, "Name 2", Address, "Address 2", "Post Code",
                          City, Contact, "Phone No.", County, "Country/Region Code");
                        CustomerNoOnAfterValidate;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of the customer who owns this item.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the address of the customer who owns this item.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address 2(County)';
                    DrillDown = false;
                    ToolTip = 'Specifies an additional line of the address.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the postal code of the address.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the city of the customer address.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of the person you regularly contact when you do business with the customer who owns this item.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the customer phone number.';
                }
                field("Location of Service Item"; Rec."Location of Service Item")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the code of the location of this item.';
                }
            }
            // group("Agent Details")
            // {
            //     Caption = 'Agent Details';
            //     Editable = false;
            //     field("Agent First Name"; Rec."Agent First Name")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent First Name field.';
            //     }
            //     field("Agent Surname"; Rec."Agent Surname")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent Surname field.';
            //     }
            //     field("Agent Middle Name"; Rec."Agent Middle Name")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent Middle Name field.';
            //     }
            //     field("Agent Address"; Rec."Agent Address")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent Address field.';
            //     }
            //     field("Agent Address 2"; Rec."Agent Address 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent Address 2 field.';
            //     }
            //     field("Agent City"; Rec."Agent City")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent City field.';
            //     }
            //     field("Agent Contact"; Rec."Agent Contact")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent Contact field.';
            //     }
            //     field("Agent Phone No."; Rec."Agent Phone No.")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent Phone No. field.';
            //     }
            //     field("Agent ID. No."; Rec."Agent ID. No.")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent ID. No. field.';
            //     }
            //     field("Agent P.I.N"; Rec."Agent P.I.N")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Agent P.I.N field.';
            //     }
            // }
            // group("Authorship Details")
            // {
            //     Caption = 'Authorship Details';
            //     Editable = false;
            //     field("Author First Name"; Rec."Author First Name")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author First Name field.';
            //     }
            //     field("Author Agent Surname"; Rec."Author Agent Surname")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author Agent Surname field.';
            //     }
            //     field("Author Middle Name"; Rec."Author Middle Name")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author Middle Name field.';
            //     }
            //     field("Author Address"; Rec."Author Address")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author Address field.';
            //     }
            //     field("Author Address 2"; Rec."Author Address 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author Address field.';
            //     }
            //     field("Author City"; Rec."Author City")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author City field.';
            //     }
            //     field("Author Contact"; Rec."Author Contact")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author Contact field.';
            //     }
            //     field("Author Phone No."; Rec."Author Phone No.")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author Phone No. field.';
            //     }
            //     field("Author ID. No."; Rec."Author ID. No.")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author ID. No. field.';
            //     }
            //     field("Author P.I.N"; Rec."Author P.I.N")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Author P.I.N field.';
            //     }
            // }
            // group("Copyright Work Details")
            // {
            //     Caption = 'Copyright Work Details';
            //     Editable = false;
            //     field("Copyright Title"; Rec."Copyright Title")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Copyright Title field.';
            //     }
            //     field("Copyright Work Category"; Rec."Copyright Work Category")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Copyright Work Category field.';
            //     }
            //     field("Copyright Work SubCategory"; Rec."Copyright Work SubCategory")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Copyright Work SubCategory field.';
            //     }
            //     field("Copyright Category Description"; Rec."Copyright Category Description")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Copyright Category Description field.';
            //     }
            //     field("Copyright SubCategory Desc"; Rec."Copyright SubCategory Desc")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Copyright SubCategory Desc field.';
            //     }
            //     field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Date of Fixation/Reduction field.';
            //     }
            //     field(Language; Rec.Language)
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Language field.';
            //     }
            //     field("Copyright Work Abstract"; Rec."Copyright Work Abstract")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Copyright Work Abstract field.';
            //     }
            // }
            // group("Production Details")
            // {
            //     Caption = 'Production Details';
            //     Editable = false;
            //     field("Prod/Pub Name"; Rec."Prod/Pub Name")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Prod/Pub Name field.';
            //     }
            //     field("Prod/Pub ID No/Company Reg No"; Rec."Prod/Pub ID No/Company Reg No")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Prod/Pub ID No/Company Reg No field.';
            //     }
            //     field("Prod/Pub P.I.N"; Rec."Prod/Pub P.I.N")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Prod/Pub P.I.N field.';
            //     }
            //     field("Assignment/License Date"; Rec."Assignment/License Date")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Assignment/License Date field.';
            //     }
            //     field("1st Country of Production"; Rec."1st Country of Production")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the 1st Country of Production field.';
            //     }
            //     field(ISBN; Rec.ISBN)
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ISBN field.';
            //     }
            //     field("Production Category"; Rec."Production Category")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Production Category field.';
            //     }
            //     field("Prod/Pub Phone No."; Rec."Prod/Pub Phone No.")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Prod/Pub Phone No. field.';
            //     }
            //     field("Prod/Pub Email"; Rec."Prod/Pub Email")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Prod/Pub Email field.';
            //     }
            // }
            // group(Payments)
            // {
            //     Caption = 'Payments';
            //     Editable = false;
            //     field("Payement Reference No"; Rec."Payemnt Reference No")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Payemnt Reference No field.';
            //     }
            //     field("Receipt No"; Rec."Receipt No")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Receipt No field.';
            //     }
            //     field("Receipt Amount"; Rec."Receipt Amount")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Receipt Amount field.';
            //     }
            // }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the ship-to code for the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        UpdateShipToCode;
                    end;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the name at the address.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the address where this service item is located.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains an additional line of the address.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the postal code of the address.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the city of the address.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of a contact person for the address.';
                }
                field("Ship-to Phone No."; Rec."Ship-to Phone No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the telephone number for the address.';
                }
            }
            group(Contract)
            {
                Caption = 'Contract';
                field("Default Contract Cost"; Rec."Default Contract Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the default contract cost of a service item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Value"; Rec."Default Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the default contract value of an item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Discount %"; Rec."Default Contract Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a default contract discount percentage for an item, if this item will be part of a service contract.';
                }
                field("Service Contracts"; Rec."Service Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that this service item is associated with one or more service contracts/quotes.';
                }
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number of the vendor for this item.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Vendor Name");
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the vendor name for this item.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number assigned to this service item by its vendor.';
                }
                field("Vendor Item Name"; Rec."Vendor Item Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the name assigned to this item by the vendor.';
                }
            }
            group(Detail)
            {
                Caption = 'Detail';
                field("Sales Unit Cost"; Rec."Sales Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit cost of this item when it was sold.';
                }
                field("Sales Unit Price"; Rec."Sales Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit price of this item when it was sold.';
                }
                field("Sales Date"; Rec."Sales Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date when this item was sold.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the code of the unit of measure used when this item was sold.';
                }
                field("Installation Date"; Rec."Installation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date when this item was installed at the customer''s site.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("Customer No."),
                              "Date Filter" = field("Date Filter");
                Visible = true;
                ApplicationArea = Basic;
            }
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
                separator(Action123)
                {
                }
                action("&Components")
                {
                    ApplicationArea = Basic;
                    Caption = '&Components';
                    Image = Components;
                    RunObject = Page "Service Item Component List";
                    RunPageLink = Active = const(true),
                                  "Parent Service Item No." = field("No.");
                    RunPageView = sorting(Active, "Parent Service Item No.", "Line No.");
                    ToolTip = 'Executes the &Components action.';
                }
                action("&Dimensions")
                {
                    ApplicationArea = Basic;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5940),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the &Dimensions action.';
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action39)
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
                        RunPageLink = Type = const("Service Item"),
                                      "No." = field("No.");
                        ToolTip = 'Executes the Troubleshooting Setup action.';
                    }
                    action("<Page Troubleshooting>")
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
                    separator(Action128)
                    {
                        Caption = '';
                    }
                }
                action("Resource Skills")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Skills';
                    Image = ResourceSkills;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const("Service Item"),
                                  "No." = field("No.");
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
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = const("Service Item"),
                                  "Table Subtype" = const(0),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                separator(Action131)
                {
                    Caption = '';
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
                    action(Action117)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Posted Shpt. Item Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'Executes the &Item Lines action.';
                    }
                    action(Action113)
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
                separator(Action126)
                {
                    Caption = '';
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
                    RunPageLink = "Service Item No. (Serviced)" = field("No."),
                                  "Service Order No." = field("Service Order Filter"),
                                  "Service Contract No." = field("Contract Filter"),
                                  "Posting Date" = field("Date Filter");
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
                separator(Action127)
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
                Image = NewItem;
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
            action("Service Line Item Label")
            {
                ApplicationArea = Basic;
                Caption = 'Service Line Item Label';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Service Item Line Labels";
                ToolTip = 'Executes the Service Line Item Label action.';
            }
            action("Copyright Certificate")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                ToolTip = 'Executes the Copyright Certificate action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."No.", Rec."No.");
                    if Rec.FindSet then
                        Report.Run(56231, true, true, Rec);
                end;
            }
            action("Email Certificate")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                ToolTip = 'Executes the Email Certificate action.';
                trigger OnAction()
                begin

                    // //code to send email
                    // SMTPMailSet.Get;
                    // objCustomer.Reset;
                    // objCustomer.Get("Customer No.");
                    // Notification1.CreateMessage('Kenya Copyright Board ', SMTPMailSet."Email Sender Address", objCustomer."E-Mail", 'Copyright Works',
                    //                 'Dear ' + objCustomer.Name + ',<BR><BR>' +
                    //                 ' Your copyright work ' + UpperCase("Copyright Title") + ' has been successfully processed.<BR>' +
                    // Text0023 + '<BR>' + '<BR>', true);

                    // Notification1.AppendToBody(
                    // '<BR><BR>Kind Regards,' +
                    // '<BR><BR>For any Information, Please Contact' + '<BR>Copyright Registration and Enforcement Department<BR>' +
                    // CompInfo.Name + '<BR>' +
                    // CompInfo.Address + '<BR>' +
                    // CompInfo."Address 2" + '<BR>' +
                    // CompInfo."Phone No." + '<BR>' +
                    // CompInfo.City);
                    // FileDirectory := 'K:/DOCS/';
                    // FileName := 'Certificate_' + "Copyright Title" + '.pdf';
                    // ////Report.SaveAsPdf(56231, FileDirectory + FileName, Rec);
                    // Notification1.AddAttachment(FileDirectory + FileName, FileName);
                    // Notification1.Send;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Copyright Certificate_Promoted"; "Copyright Certificate")
                {
                }
                actionref("Email Certificate_Promoted"; "Email Certificate")
                {
                }
                actionref("New Item_Promoted"; "New Item")
                {
                }
            }
            group(Category_Process)
            {
                actionref("&Components_Promoted"; "&Components")
                {
                }
                actionref(Action39_Promoted; Action39)
                {
                }
                actionref("Ser&vice Contracts_Promoted"; "Ser&vice Contracts")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateShipToCode;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Item No." = '' then
            if Rec.GetFilter("Item No.") <> '' then
                if Rec.GetRangeMin("Item No.") = Rec.GetRangemax("Item No.") then
                    Rec."Item No." := Rec.GetRangeMin("Item No.");

        if Rec."Customer No." = '' then
            if Rec.GetFilter("Customer No.") <> '' then
                if Rec.GetRangeMin("Customer No.") = Rec.GetRangemax("Customer No.") then
                    Rec."Customer No." := Rec.GetRangeMin("Customer No.");
    end;

    var
        ResourceSkill: Record "Resource Skill";
        SkilledResourceList: Page "Skilled Resource List";
        FileDirectory: Text;
        FileName: Text;
        SMTPMailSet: Record "Email Account";
        ServiceItem: Record "Service Item";
        Service: Text;
        Notification1: Codeunit "Email Message";
        objCustomer: Record Customer;
        CompInfo: Record "Company Information";
        Text0023: label 'Please find attached, your copyright work certificate.';

    local procedure UpdateShipToCode()
    begin
        if Rec."Ship-to Code" = '' then begin
            Rec."Ship-to Name" := Rec.Name;
            Rec."Ship-to Address" := Rec.Address;
            Rec."Ship-to Address 2" := Rec."Address 2";
            Rec."Ship-to Post Code" := Rec."Post Code";
            Rec."Ship-to City" := Rec.City;
            Rec."Ship-to Phone No." := Rec."Phone No.";
            Rec."Ship-to Contact" := Rec.Contact;
        end else
            Rec.CalcFields(
              "Ship-to Name", "Ship-to Name 2", "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City",
              "Ship-to County", "Ship-to Country/Region Code", "Ship-to Contact", "Ship-to Phone No.");
    end;

    local procedure CustomerNoOnAfterValidate()
    begin
        if Rec."Customer No." <> xRec."Customer No." then
            UpdateShipToCode;
    end;
}

#pragma implicitwith restore

