

page 69765 "Offer Compensation"
{
    PageType = ListPart;
    SourceTable = "Employment Offer Compensation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Offer ID"; Rec."Offer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer ID field.';
                }
                field("Earnings Code"; Rec."Earnings Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earnings Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Pay Frequency"; Rec."Pay Frequency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Frequency field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Line Amount(LCY)"; Rec."Line Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount(LCY) field.';
                }
                field("Payroll Start Period"; Rec."Payroll Start Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Start Period field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

