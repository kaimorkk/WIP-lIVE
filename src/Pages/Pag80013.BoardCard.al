

page 80013 "Board Card"
{
    Caption = 'Board Card';
    PageType = Card;
    SourceTable = "Responsibility Center";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the address associated with the responsibility center.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the city where the responsibility center is located.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name of the person you regularly contact. ';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Division/Unit';
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Branch Codes';
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
                }
                field("Operating Unit Type"; Rec."Operating Unit Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Operating Unit Type field.';
                }
                field("Direct Reports To"; Rec."Direct Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Reports To field.';
                }
                field("Indirect Reports To"; Rec."Indirect Reports To")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Indirect Reports To field.';
                }
                field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hierarchical  Level ID field.';
                }
                // field(Vision; Rec.Vision)
                // {
                //     ApplicationArea = Basic;
                //     MultiLine = true;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Vision field.';
                // }
                // field(Mission; Rec.Mission)
                // {
                //     ApplicationArea = Basic;
                //     MultiLine = true;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Mission field.';
                // }
                // field(Motto; Rec.Motto)
                // {
                //     ApplicationArea = Basic;
                //     Enabled = false;
                //     MultiLine = true;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Motto field.';
                // }
                field("Headed By (Title)"; Rec."Headed By (Title)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Headed By (Title) field.';
                }
                // field("Region?"; Rec."Region?")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Region? field.';
                // }
                field("Current Head"; Rec."Current Head")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Number';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Personal Number field.';
                }
                field("Current Head Name"; Rec."Current Head Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Current Head Name field.';
                }
                // field("Start Date"; Rec."Start Date")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Start Date';
                //     ToolTip = 'Specifies the value of the Start Date field.';
                // }
                // field("<Ende Date>"; Rec."Ende Date")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'End Date';
                //     ToolTip = 'Specifies the value of the End Date field.';
                // }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked? field.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s phone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the fax number of the responsibility center.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Location;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the email address of the responsibility center.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s web site.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5714),
                                  "No." = field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
            }
            // action("Core Values")
            // {
            //     ApplicationArea = Basic;
            //     Image = ValueLedger;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Core Values";
            //     ToolTip = 'Executes the Core Values action.';
            // }
            separator(Action25)
            {
            }
            // action("Core Mandate")
            // {
            //     ApplicationArea = Basic;
            //     Image = Hierarchy;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Core Mandates";
            //     ToolTip = 'Executes the Core Mandate action.';
            // }
            separator(Action22)
            {
            }
            action("Responsibility Centers")
            {
                ApplicationArea = Advanced;
                Caption = 'Responsibility Centers';
                Image = Position;
                RunObject = Page "Responsibility Center List";
                ToolTip = 'Set up responsibility centers to administer business operations that cover multiple locations, such as a sales offices or a purchasing departments.';
            }
            separator(Action19)
            {
            }
            // action("Annual Reporting Codes")
            // {
            //     ApplicationArea = Basic;
            //     Image = AccountingPeriods;
            //     Promoted = true;
            //     PromotedCategory = Category4;
            //     RunObject = Page "Annual Reporting Codes";
            //     ToolTip = 'Executes the Annual Reporting Codes action.';
            // }
            separator(Action40)
            {
            }
            // action("Archive Retired Board")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Action";
            //     Promoted = true;
            //     PromotedCategory = Category4;
            //     ToolTip = 'Executes the Archive Retired Board action.';
            //     trigger OnAction()
            //     begin
            //         Rec.Archive := true;
            //         Rec.Modify;
            //         Message('Retired Board Archived Successfully');
            //     end;
            // }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Responsibility Centers_Promoted"; "Responsibility Centers")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Operating Unit Type" := Rec."operating unit type"::Branch;
    end;
}

#pragma implicitwith restore

