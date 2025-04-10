

page 72001 "Regions Card"
{
    Caption = 'Regions Card';
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
                field(ShowMap; ShowMapLbl)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the customer''s address on your preferred map website.';
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        //CurrPage.UPDATE(TRUE);
                        //DisplayMap;
                    end;
                }
                // field(Vision; Rec.Vision)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Mission; Rec.Mission)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Motto; Rec.Motto)
                // {
                //     ApplicationArea = Basic;
                // }
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
            // group(" Research")
            // {
            //     Visible = false;
            //     field("Research Center?"; Rec."Research Center?")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     group("Overview Details")
            //     {
            //         field(Overview; WorkDescription)
            //         {
            //             ApplicationArea = Basic;
            //             Caption = 'Overview';
            //             MultiLine = true;

            //             trigger OnValidate()
            //             begin
            //                 //SetWorkDescription(WorkDescription);
            //             end;
            //         }
            //     }
            //     field("Blocked?"; Rec."Blocked?")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
        }
        area(factboxes)
        {
            // part(Control35; "Research Center Factbox")
            // {
            //     SubPageLink = Code = field(Code);
            //     Visible = false;
            //     ApplicationArea = Basic;
            // }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
                ApplicationArea = Basic;
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
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;

                    trigger OnAction()
                    begin
                        if Rec.Code = '' then
                            Error(Text0001, Rec.Code);
                        CompInfo.Get();
                        Rec.Address := CompInfo.Address;
                        Rec."Address 2" := CompInfo."Address 2";
                        Rec."Post Code" := CompInfo."Post Code";
                        // Rec.Vision := CompInfo.Vision;
                        // Rec.Mission := CompInfo.Mission;
                        // Rec.Motto := CompInfo.Motto;
                        Rec.City := CompInfo.City;
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
                // }
                // action("Grants Profile")
                // {
                //     ApplicationArea = Basic;
                //     Image = Grid;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Grant Funding Application List";
                //     RunPageLink = "Research Center" = field(Code);
                // }
                // action("Road Work Projects")
                // {
                //     ApplicationArea = Basic;
                //     Image = Job;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "Job List";
                //     RunPageLink = "Research Center" = field(Code);
                // }
                // action("Sub Centers")
                // {
                //     ApplicationArea = Basic;
                //     Image = Skills;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "Research Sub-Center List";
                //     RunPageLink = "Research Centre" = field(Code);
                //     Visible = false;
                // }
                // action("Research Programs")
                // {
                //     ApplicationArea = Basic;
                //     Image = Planning;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "Research Center Programs List";
                //     RunPageLink = "Center Code" = field(Code);
                //     Visible = false;
                // }
                // action("Research Infrastructure")
                // {
                //     ApplicationArea = Basic;
                //     Image = FixedAssets;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Research Infrastructure List";
                //     RunPageLink = "Center Code" = field(Code);
                //     Visible = false;
                // }
                // action("Fixed Assets")
                // {
                //     ApplicationArea = Basic;
                //     Image = FixedAssets;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Fixed Asset List";
                //     RunPageLink = "Research Center" = field(Code);
                // }
                // action(Statistics)
                // {
                //     ApplicationArea = Basic;
                //     Image = Statistics;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Research Center Statistics";
                //     RunPageLink = Code = field(Code);
                // }
            }
        }
        area(reporting)
        {
            group(ActionGroup38)
            {
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //  RunObject = Report "Research Center List";
                    Visible = false;
                }
                action("Research Centers Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    Visible = false;

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action43)
                {
                }
                action("Region Grant Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
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
                action("Region Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
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
                separator(Action44)
                {
                }
                action("Fixed Assets List")
                {
                    ApplicationArea = Basic;
                    Image = "report";
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
                actionref("Copy Company Address_Promoted"; "Copy Company Address")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // /
    end;

    var
        CompInfo: Record "Company Information";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        WorkDescription: Text;
        ShowMapLbl: label 'Show on Map';
        ResearchCenter: Record "Research Center";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        /*OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
      //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        CanCancelApprovalForRecord := //ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);*/

    end;
}

#pragma implicitwith restore

