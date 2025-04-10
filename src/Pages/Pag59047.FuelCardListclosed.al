

page 59047 "Fuel Card List-closed"
{
    CardPageID = "Fuel Card-Closed";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Fuel Card";
    SourceTableView = where(closed = const(true));
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Receipt No"; Rec."Receipt No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Card No. field.';
                }
                field("Fuel Card Pin"; Rec."Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Card Pin field.';
                }
                field("Vehicle Limit"; Rec."Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Limit field.';
                }
                field("Total Allocated Limit"; Rec."Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Allocated Limit field.';
                }
                field("Total Balance"; Rec."Total Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Balance field.';
                }
                field("Allocated Vehicle Limit"; Rec."Allocated Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated Vehicle Limit field.';
                }
                field("Vehicle Balance"; Rec."Vehicle Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Balance field.';
                }
                field("Total Amount Spend"; Rec."Total Amount Spend")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount Spend field.';
                }
                field("Total Amt Spend per Vehicle"; Rec."Total Amt Spend per Vehicle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amt Spend per Vehicle field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

