

page 75083 "Company Size Code"
{
    PageType = List;
    SourceTable = "Company Size Code";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Min No. Of Employees"; Rec."Min No. Of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min No. Of Employees field.';
                }
                field("Max No. Of Employees"; Rec."Max No. Of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max No. Of Employees field.';
                }
                field("No. of Vendors"; Rec."No. of Vendors")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Vendors field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Company Size")
            {
                Caption = 'Company Size';
                Image = IndustryGroups;
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Company Size" = field(Code);
                    ToolTip = 'Executes the Vendors action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Vendors_Promoted; Vendors)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

