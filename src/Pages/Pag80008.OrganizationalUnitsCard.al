

page 80008 "Organizational Units  Card"
{
    Caption = 'Organizational Units  Card';
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
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
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
                action("Core Mandate")
                {
                    ApplicationArea = Basic;
                    Image = Hierarchy;
                    RunObject = Page "Core Mandate";
                    ToolTip = 'Executes the Core Mandate action.';
                }
                action("Core Strategic Plans")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    RunObject = Page "Corporate Strategic Plans";
                    ToolTip = 'Executes the Core Strategic Plans action.';
                }
                action("Performance Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Performance Contracts action.';
                }
                action("Direct Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Direct Reports action.';
                }
                action("Indirect Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Indirect Reports action.';
                }
                action("Staff Profile")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Staff Profile action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Core Mandate_Promoted"; "Core Mandate")
                {
                }
                actionref("Core Strategic Plans_Promoted"; "Core Strategic Plans")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

