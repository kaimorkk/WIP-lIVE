

page 59001 "Fleet Vehicle Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Vehicles.";

    layout
    {
        area(content)
        {
            group(General)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    LookupPageID = "Fixed Asset List";
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Alternative Number"; Rec."Alternative Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Alternative Registration Number';
                    ToolTip = 'Specifies the value of the Alternative Number field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Type of Vehicle"; Rec."Type of Vehicle")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Vehicle field.';
                }
                field("Sp Equipment on Vehicle"; Rec."Sp Equipment on Vehicle")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Specialized Equipment on Vehicle field.';
                }

                field("Specialized Vehicle Use"; Rec."Specialized Vehicle Use")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Specialized use of  Vehicle code field.';
                }

                field("Specialized use of  Vehicle"; Rec."Specialized use of  Vehicle")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Specialized use of  Vehicle field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Driver';
                    ToolTip = 'Specifies the value of the Driver field.';
                }

                field(Grounded; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounded';
                    ToolTip = 'Specifies the value of the Grounded field.';
                }
                field("Allocated Employee"; Rec."Allocated Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                /* field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Location';
                     ToolTip = 'Specifies the value of the Vehicle Location field.';
                }*/
                field("Vehicle Status"; Rec."Vehicle Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Status field.';
                }
                field("Starting Odometer Reading"; Rec."Starting Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Odometer Reading field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Odometer Reading");
                        Rec."Current Odometer Reading" := Rec."Starting Odometer Reading" + Rec."Odometer Reading";
                    end;
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Running Odometer Reading';
                    Editable = false;
                    TableRelation = "Daily Work Ticket Lines"."Closing Odometer Reading" where("Vehicle Allocated" = field("Registration No."));
                    ToolTip = 'Specifies the value of the Total Running Odometer Reading field.';
                }
                field("Current Odometer Reading"; Rec."Current Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Odometer Reading field.';
                }

                field("Vehicle Purchase From"; Rec."Vehicle Purchase From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Acquisition field.';
                }

                field("Project Number"; Rec."Project Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Number field.';
                    Visible = false;
                }
                field("Date of Purchase"; Rec."Date of Purchase")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Purchase field.';
                }

            }
            group(Posting)
            {
                Visible = false;
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Class Code field.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Subclass Code field.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Location Code field.';
                }
                field("Budgeted Asset"; Rec."Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budgeted Asset field.';
                }
            }
            group(Maintenance)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Next Service Milleage"; Rec."Next Service Milleage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Service Milleage field.';
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Next Service Date field.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warranty Date field.';
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insured field.';
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Under Maintenance field.';
                }
            }
            group("Vehicle Details")
            {
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Vehicle Make List";
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Year Of Manufacture"; Rec."Year Of Manufacture")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Of Manufacture field.';
                }
                field("Country Of Origin"; Rec."Country Of Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country Of Origin field.';
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passenger Capacity field.';
                }
                field("Vehicle CC"; Rec."Vehicle CC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle CC field.';
                }
                field(Ownership; Rec.Ownership)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership field.';
                }
                field("Body Color"; Rec."Body Color")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body Color field.';
                }
                field("Chassis Serial No."; Rec."Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chassis Serial No. field.';
                }
                field("Engine Serial No."; Rec."Engine Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engine Serial No. field.';
                }
                field("Ignition Key Code"; Rec."Ignition Key Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ignition Key Code field.';
                }
                field("Tare Weight"; Rec."Tare Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tare Weight field.';
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Card No field.';
                }
                field("Fuel Card Pin"; Rec."Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Card Pin field.';
                }
                field("Maximum Tonnage(Kgs)"; Rec."Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Vehicle Limit field.';
                }
                field("Tire Size Rear"; Rec."Tire Size Rear")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tyre Size Rear';
                    ToolTip = 'Specifies the value of the Tyre Size Rear field.';
                }
                field("Tire Size Front"; Rec."Tire Size Front")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tyre Size Front';
                    ToolTip = 'Specifies the value of the Tyre Size Front field.';
                }
                field("Vehicle Owner"; Rec."Vehicle Owner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Owner field.';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                }
            }
            group("Millage/Hrs Worked Details")
            {
                group(Details)
                {
                    Caption = 'Details';
                    field("Readings Based On"; Rec."Readings Based On")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Readings Based On field.';
                    }
                    field("Start Reading"; Rec."Start Reading")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Start Reading field.';
                        trigger OnValidate()
                        begin
                            Rec.Validate("Total Trip Milleage");
                            Rec."Current Reading" := Rec."Start Reading" + Rec."Total Trip Milleage";
                        end;
                    }
                    field("Current Reading"; Rec."Current Reading")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Current Reading field.';
                    }
                    field("Total Trip Milleage"; Rec."Total Trip Milleage")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Total Trip Milleage field.';
                    }
                }
                part(Control11; "Fuel Milleage")
                {
                    SubPageLink = No = field("No.");
                    ApplicationArea = Basic;
                }
            }
            group("Insurance Details")
            {
                Visible = false;
                Enabled = false;
                field("Licensing Company"; Rec."Licensing Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Company field.';
                }
                field("Date of Last Insurance"; Rec."Date of Last Insurance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Last Insurance field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Licensing Details"; Rec."Licensing Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Details field.';
                }
            }
            part(Control1000000069; "Vehicle Incidents Part")
            {
                Caption = 'Vehicle Incidents';
                SubPageLink = "Licence Plate Number" = field("Registration No.");
                ApplicationArea = Basic;
            }
            part(Control5; "Closed Fleet Requests List")
            {
                Caption = 'Approved Transport Requests';
                SubPageLink = "Vehicle Allocated" = field("Registration No.");
                ApplicationArea = Basic;
            }
            part(Control1000000050; "Fuel and Maintenance List")
            {
                Caption = 'Maintenance List';
                SubPageLink = "Vehicle Reg No" = field("Registration No."),
                              Type = const(Maintenance);
                ApplicationArea = Basic;
            }
            /*   part(Control10; "Fuel and Maintenance List")
              {
                  Caption = 'Fuel Requisition List';
                  SubPageLink = "Vehicle Reg No" = field("Registration No."),
                                Type = const(Fuel);
                  ApplicationArea = Basic;
              } */
        }
    }

    actions
    {
        area(creation)
        {
            action("Maintenance Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                RunObject = Page "Maintenance Ledger Entries";
                ToolTip = 'Executes the Maintenance Ledger Entries action.';
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                RunObject = Page "Comment Sheet";
                ToolTip = 'Executes the Comments action.';
            }
            action(Picture)
            {
                ApplicationArea = Basic;
                Image = Picture;
                ToolTip = 'Executes the Picture action.';
            }
            action("Maintenance Registration")
            {
                ApplicationArea = Basic;
                Image = Register;
                RunObject = Page "Maintenance Registration";
                ToolTip = 'Executes the Maintenance Registration action.';
            }
            action(Statistics)
            {
                ApplicationArea = Basic;
                Image = Statistics;
                ToolTip = 'Executes the Statistics action.';
            }
            action("Main Asset Components")
            {
                ApplicationArea = Basic;
                Image = Components;
                ToolTip = 'Executes the Main Asset Components action.';
            }
            action("Total Value Insured")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                RunObject = Page "Total Value Insured";
                ToolTip = 'Executes the Total Value Insured action.';
            }
            action("Allocate to Departments")
            {
                ApplicationArea = Basic;
                Image = Dimension;
                //RunObject = Page UnknownPage52018565;
                ToolTip = 'Executes the Allocate to Departments action.';
            }
            action("Create Plan")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Create Plan action.';
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Vehicle Work Tickest")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                ToolTip = 'Executes the Vehicle Work Tickest action.';
                trigger OnAction()
                begin
                    DialyWorkTicket.Reset;
                    DialyWorkTicket.SetRange(DialyWorkTicket."Vehicle Registration No", Rec."Registration No.");
                    Page.Run(59014, DialyWorkTicket);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Vehicle Work Tickest_Promoted"; "Vehicle Work Tickest")
                {
                }
                actionref("Maintenance Ledger Entries_Promoted"; "Maintenance Ledger Entries")
                {
                }
                actionref(Comments_Promoted; Comments)
                {
                }
                actionref(Picture_Promoted; Picture)
                {
                }
                actionref("Maintenance Registration_Promoted"; "Maintenance Registration")
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref("Main Asset Components_Promoted"; "Main Asset Components")
                {
                }
                actionref("Total Value Insured_Promoted"; "Total Value Insured")
                {
                }
                actionref("Allocate to Departments_Promoted"; "Allocate to Departments")
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.Validate("Start Reading");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Validate("Start Reading");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Validate("Start Reading");
    end;

    trigger OnOpenPage()
    begin
        Rec.Validate("Start Reading");
        Rec.CalcFields("Odometer Reading");
        Rec."Current Odometer Reading" := Rec."Starting Odometer Reading" + Rec."Odometer Reading";
    end;

    var
        DialyWorkTicket: Record "Monthly Work Ticket Header";
}

#pragma implicitwith restore

