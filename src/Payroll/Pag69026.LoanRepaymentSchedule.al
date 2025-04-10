

page 52193690 "Loan Repayment Schedule"
{
    PageType = List;
    SourceTable = "Loan Repayment Schedule1";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Instalment No"; Rec."Instalment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Instalment No field.';
                }
                field("Repayment Date"; Rec."Repayment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Repayment Date field.';
                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Amount field.';
                }
                field("Balance B/F"; Rec."Balance B/F")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance B/F field.';
                }
                field("Principal Repayment"; Rec."Principal Repayment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Repayment field.';
                }
                field("Monthly Interest"; Rec."Monthly Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Interest field.';
                }
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Repayment field.';
                }
                field("Balance C/F"; Rec."Balance C/F")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance C/F field.';
                }
                field("Principal Ded Code"; Rec."Principal Ded Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Ded Code field.';
                }
                field("Interest Ded Code"; Rec."Interest Ded Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Ded Code field.';
                }
                field("Principal Recovered"; Rec."Principal Recovered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Recovered field.';
                }
                field("Interest Recovered"; Rec."Interest Recovered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Recovered field.';
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Product Type field.';
                }
                field("Cash Payment"; Rec."Cash Payment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Payment field.';
                }
                field(Refinanced; Rec.Refinanced)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Refinanced field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000020; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000021; Links)
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

