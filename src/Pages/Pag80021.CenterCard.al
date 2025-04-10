

page 80021 "Center Card"
{
    Caption = 'Offices Card';
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
                //     ToolTip = 'Specifies the value of the Vision field.';
                // }
                // field(Mission; Rec.Mission)
                // {
                //     ApplicationArea = Basic;
                //     MultiLine = true;
                //     ToolTip = 'Specifies the value of the Mission field.';
                // }
                // field(Motto; Rec.Motto)
                // {
                //     ApplicationArea = Basic;
                //     MultiLine = true;
                //     ToolTip = 'Specifies the value of the Motto field.';
                // }
                field("Headed By (Title)"; Rec."Headed By (Title)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Headed By (Title) field.';
                }
                // field("Region?"; Rec."Region?")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Region? field.';
                // }
                field("Current Head"; Rec."Current Head")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Number';
                    ToolTip = 'Specifies the value of the Personal Number field.';
                }
                field("Current Head Name"; Rec."Current Head Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Head Name field.';
                }
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
            // part(Control35; "Research Center Factbox")
            // {
            //     SubPageLink = Code = field(Code);
            //     ApplicationArea = Basic;
            // }
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
            action("Core Values")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                RunObject = Page "Core Values";
                ToolTip = 'Executes the Core Values action.';
            }
            separator(Action31)
            {
            }
            action("Core Mandate")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                RunObject = Page "Core Mandates";
                ToolTip = 'Executes the Core Mandate action.';
            }
            separator(Action27)
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
            separator(Action23)
            {
            }
            action("Annual Reporting Codes")
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                RunObject = Page "Annual Reporting Codes";
                ToolTip = 'Executes the Annual Reporting Codes action.';
            }
            group(ActionGroup55)
            {
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;
                    ToolTip = 'Executes the Copy Company Address action.';
                    trigger OnAction()
                    begin
                        if Rec.Code = '' then
                            Error(Text0001, Rec.Code);
                        CompInfo.Get();
                        Rec.Address := CompInfo.Address;
                        Rec."Address 2" := CompInfo."Address 2";
                        Rec."Post Code" := CompInfo."Post Code";
                        Rec.City := CompInfo.City;
                        Rec."Phone No." := CompInfo."Phone No.";
                        Rec."E-Mail" := CompInfo."E-Mail";
                        Rec."Fax No." := CompInfo."Fax No.";
                        Rec."Home Page" := CompInfo."Home Page";
                        // Rec.Mission := CompInfo.Mission;
                        // Rec.Vision := CompInfo.Vision;
                        // Rec.Motto := CompInfo.Motto;
                        Rec."Country/Region Code" := CompInfo."Country/Region Code";
                        Rec.Modify;

                        Message(Text0002);
                    end;
                }
                // action("Staff Profile")
                // {
                //     ApplicationArea = Basic;
                //     Image = Employee;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Employee List-P";
                //     RunPageLink = "Research Center" = field(Code);
                //     ToolTip = 'Executes the Staff Profile action.';
                // }
                // action("Grants Profile")
                // {
                //     ApplicationArea = Basic;
                //     Image = Grid;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Grant Funding Application List";
                //     RunPageLink = "Research Center" = field(Code);
                //     ToolTip = 'Executes the Grants Profile action.';
                // }
                // action("Project profile")
                // {
                //     ApplicationArea = Basic;
                //     Image = Job;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "Job List";
                //     RunPageLink = "Research Center" = field(Code);
                //     ToolTip = 'Executes the Project profile action.';
                // }
                // action("Sub Centers")
                // {
                //     ApplicationArea = Basic;
                //     Image = Skills;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "Research Sub-Center List";
                //     RunPageLink = "Research Centre" = field(Code);
                //     ToolTip = 'Executes the Sub Centers action.';
                // }
                // action("Research Programs")
                // {
                //     ApplicationArea = Basic;
                //     Image = Planning;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "Research Center Programs List";
                //     RunPageLink = "Center Code" = field(Code);
                //     ToolTip = 'Executes the Research Programs action.';
                // }
                // action("Research Infrastructure")
                // {
                //     ApplicationArea = Basic;
                //     Image = FixedAssets;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Research Infrastructure List";
                //     RunPageLink = "Center Code" = field(Code);
                //     ToolTip = 'Executes the Research Infrastructure action.';
                // }
                // action("Fixed Assets")
                // {
                //     ApplicationArea = Basic;
                //     Image = FixedAssets;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Fixed Asset List";
                //     RunPageLink = "Research Center" = field(Code);
                //     ToolTip = 'Executes the Fixed Assets action.';
                // }
                // action(Statistics)
                // {
                //     ApplicationArea = Basic;
                //     Image = Statistics;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Research Center Statistics";
                //     RunPageLink = Code = field(Code);
                //     ToolTip = 'Executes the Statistics action.';
                // }
            }
        }
        area(reporting)
        {
            group(ActionGroup44)
            {
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    // RunObject = Report "Research Center List";
                    ToolTip = 'Executes the Research Centers action.';
                }
                action("Research Centers Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    ToolTip = 'Executes the Research Centers Profile action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action41)
                {
                }
                action("Center Grant Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    ToolTip = 'Executes the Center Grant Profile action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65011, true, true, ResearchCenter);
                        end;
                    end;
                }
                action("Center Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    ToolTip = 'Executes the Center Projects Profile action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65012, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action38)
                {
                }
                action("Fixed Assets List")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    ToolTip = 'Executes the Fixed Assets List action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65013, true, true, ResearchCenter);
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Core Values_Promoted"; "Core Values")
                {
                }
                actionref("Core Mandate_Promoted"; "Core Mandate")
                {
                }
                actionref("Copy Company Address_Promoted"; "Copy Company Address")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Responsibility Centers_Promoted"; "Responsibility Centers")
                {
                }
                actionref("Annual Reporting Codes_Promoted"; "Annual Reporting Codes")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Operating Unit Type" := Rec."operating unit type"::Office;
    end;

    var
        CompInfo: Record "Company Information";
        WorkDescription: Text;
        ResearchCenter: Record "Responsibility Center";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        ShowMapLbl: label 'Show on Map';
}

#pragma implicitwith restore

