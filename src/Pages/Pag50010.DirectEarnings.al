 
page 50010 "Directors Earnings"
{
    PageType = List;
    SourceTable = "Directors Earnings";


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
                field("Pay Type"; Rec."Pay Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Type field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Per Diem"; Rec."Per Diem")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Per Diem field.';
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
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
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
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Cash Benefit field.';
                }
                field("Minimum Limit"; Rec."Minimum Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Limit field.';
                }
                field("Maximum Limit"; Rec."Maximum Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Limit field.';
                }
                field("Reduces Tax"; Rec."Reduces Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reduces Tax field.';
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
                field(Months; Rec.Months)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Months field.';
                }
                field("Show on Report"; Rec."Show on Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Report field.';
                }
                field("Earning Type"; Rec."Earning Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earning Type field.';
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
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Block field.';
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
            systempart(Control1000000037; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000038; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000039; Outlook)
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

