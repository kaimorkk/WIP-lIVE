 
page 50024 "Director Deduction"
{
    PageType = List;
    SourceTable = "Director Deductions";


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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Tax deductible"; Rec."Tax deductible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax deductible field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculation Method field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
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
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group Filter field.';
                }
                field(Loan; Rec.Loan)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan field.';
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Amount field.';
                }
                field("Pay Period Filter"; Rec."Pay Period Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Period Filter field.';
                }
                field("Pension Scheme"; Rec."Pension Scheme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Scheme field.';
                }
                field("Deduction Table"; Rec."Deduction Table")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduction Table field.';
                }
                field("G/L Account Employer"; Rec."G/L Account Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account Employer field.';
                }
                field("Percentage Employer"; Rec."Percentage Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage Employer field.';
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Amount field.';
                }
                field("Flat Amount Employer"; Rec."Flat Amount Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Amount Employer field.';
                }
                field("Show Balance"; Rec."Show Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show Balance field.';
                }
                field(CoinageRounding; Rec.CoinageRounding)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CoinageRounding field.';
                }
                field("Director Filter"; Rec."Director Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director Filter field.';
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Balance field.';
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Filter field.';
                }
                field("Show on report"; Rec."Show on report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on report field.';
                }
                field("PAYE Code"; Rec."PAYE Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Code field.';
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
                field(Statutory; Rec.Statutory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statutory field.';
                }
                field("No of Entries"; Rec."No of Entries")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Entries field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000042; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000043; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000044; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000045; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

