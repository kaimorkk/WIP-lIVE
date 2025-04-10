

page 95106 "Incident Impact Summary"
{
    PageType = ListPart;
    SourceTable = "Risk Incident Log Impact R";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Impact Type"; Rec."Impact Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Impact Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Category of Party Affected"; Rec."Category of Party Affected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category of Party Affected field.';
                }
                field("Internal Employee No."; Rec."Internal Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Employee No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Contact Details"; Rec."Contact Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Details field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
                field("Police Report Reference No."; Rec."Police Report Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Report Reference No. field.';
                }
                field("Police Report Date"; Rec."Police Report Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Report Date field.';
                }
                field("Police Station"; Rec."Police Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Station field.';
                }
                field("Reporting Officer"; Rec."Reporting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting Officer field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

