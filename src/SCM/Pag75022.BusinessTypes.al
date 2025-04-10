

page 75022 "Business Types"
{
    PageType = List;
    SourceTable = "Business Types";
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Type field.';
                }
                field("No. of Active Vendors"; Rec."No. of Active Vendors")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Active Vendors field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup14)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Business Type" = field(Code);
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

