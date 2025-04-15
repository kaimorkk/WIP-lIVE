 
page 50029 "Deductins Listing"
{
    Editable = false;
    PageType = List;
    SourceTable = DeductionsX;

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
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Code field.';
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Block field.';
                }
                field("Pension Limit Percentage"; Rec."Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Limit Percentage field.';
                }
                field("Pension Limit Amount"; Rec."Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Limit Amount field.';
                }
                field("Applies to All"; Rec."Applies to All")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies to All field.';
                }
                field("Show on Master Roll"; Rec."Show on Master Roll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Master Roll field.';
                }
                field("Pension Scheme Code"; Rec."Pension Scheme Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Scheme Code field.';
                }
                field("Main Deduction Code"; Rec."Main Deduction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Deduction Code field.';
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Code field.';
                }
                field("Show on Payslip Information"; Rec."Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Payslip Information field.';
                }
                field("Voluntary Percentage"; Rec."Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Voluntary Percentage field.';
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance Type field.';
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculation Method field.';
                }
                field("Flat Amount"; Rec."Flat Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Deduct From Pension"; Rec."Deduct From Pension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduct From Pension field.';
                }
                field("Calculate Excess Pension"; Rec."Calculate Excess Pension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculate Excess Pension field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

