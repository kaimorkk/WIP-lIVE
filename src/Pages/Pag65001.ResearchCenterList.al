

page 65001 "Research Center List"
{
    Caption = 'Research Center List';
    // CardPageID = "Research Center Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Center";


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center list code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
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
                        Rec.City := CompInfo.City;
                        Rec."Country/Region Code" := CompInfo."Country/Region Code";
                        Rec.Modify;

                        Message(Text0002);
                    end;
                }
                action("Staff Profile")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    RunObject = Page "Employee List-P";
                    // RunPageLink = "Research Center" = field(Code);
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    // RunObject = Page "Grant Funding Application List";
                    // RunPageLink = "Research Center" = field(Code);
                }
                action("Project profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    RunObject = Page "Job List";
                    // RunPageLink = "Research Center" = field(Code);
                }
                action("Sub Centers")
                {
                    ApplicationArea = Basic;
                    Image = Skills;
                    // RunObject = Page "Research Sub-Center List";
                    // RunPageLink = "Research Centre" = field(Code);
                }
                action("Research Programs")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    // RunObject = Page "Research Center Programs List";
                    // RunPageLink = "Center Code" = field(Code);
                }
                action("Research Infrastructure")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    // RunObject = Page "Research Infrastructure List";
                    // RunPageLink = "Center Code" = field(Code);
                }
                action("Fixed Assets")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    RunObject = Page "Fixed Asset List";
                    // RunPageLink = "Research Center" = field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    // RunObject = Page "Research Center Statistics";
                    // RunPageLink = Code = field(Code);
                }
            }
        }
        area(reporting)
        {
            group(ActionGroup14)
            {
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //   RunObject = Report "Research Center List";
                }
                action("Research Centers Profile")
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
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action11)
                {
                }
                action("Center Grant Profile")
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
                action("Center Projects Profile")
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
                separator(Action5)
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
                actionref("Staff Profile_Promoted"; "Staff Profile")
                {
                }
                actionref("Grants Profile_Promoted"; "Grants Profile")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Project profile_Promoted"; "Project profile")
                {
                }
                actionref("Sub Centers_Promoted"; "Sub Centers")
                {
                }
                actionref("Research Programs_Promoted"; "Research Programs")
                {
                }
            }
            group(Category_Category5)
            {
                actionref("Research Infrastructure_Promoted"; "Research Infrastructure")
                {
                }
                actionref("Fixed Assets_Promoted"; "Fixed Assets")
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }

    var
        CompInfo: Record "Company Information";
        WorkDescription: Text;
        ResearchCenter: Record "Research Center";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        ShowMapLbl: label 'Show on Map';
}

#pragma implicitwith restore

