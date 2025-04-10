

page 69291 "Duty Stations1"
{
    Caption = 'Research Center List';
    CardPageID = "Duty Station1";
    Editable = false;
    PageType = List;
    SourceTable = "Responsibility Center";
    SourceTableView = where("Operating Unit Type" = filter(CEO));


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
                action("Fixed Assets")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    RunObject = Page "Fixed Asset List";
                    // RunPageLink = "Research Center" = field(Code);
                    ToolTip = 'Executes the Fixed Assets action.';
                }
                // action(Statistics)
                // {
                //     ApplicationArea = Basic;
                //     Image = Statistics;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "Research Center Statistics";
                //     // RunPageLink = Code = field(Code);
                //     ToolTip = 'Executes the Statistics action.';
                // }
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
                separator(Action11)
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
                separator(Action5)
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
                actionref("Copy Company Address_Promoted"; "Copy Company Address")
                {
                }
            }
            group(Category_Category5)
            {
                actionref("Fixed Assets_Promoted"; "Fixed Assets")
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

