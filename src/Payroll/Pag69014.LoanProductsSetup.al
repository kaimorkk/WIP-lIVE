

Page 52193682 "Loan Products Setup"
{
    Editable = true;
    RefreshOnActivate = true;
    SourceTable = "Loan Product Type";
    PageType = Card;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Loan Category"; Rec."Loan Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Category field.';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Rate field.';
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Calculation Method field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
                field("No of Instalment"; Rec."No of Instalment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Instalment field.';
                }
                field("Loan No Series"; Rec."Loan No Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan No Series field.';
                }
                field(Rounding; Rec.Rounding)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding field.';
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding Precision field.';
                }

                field("Calculate Interest"; Rec."Calculate Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculate Interest field.';
                }
                field("Earning Code"; Rec."Earning Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is for loans that are paid out through the payroll, eg. Salary advance';
                }
                field("Interest Deduction Code"; Rec."Interest Deduction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Deduction Code field.';
                }
                field("Deduction Code"; Rec."Deduction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduction Code field.';
                }
                field(Internal; Rec.Internal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal field.';
                }
            }
            // part("Loan Entitlement  List"; "Loan Entitlement  List")
            // {
            //     SubPageLink = "Loan Code" = Field("Code"), "Loan Category" = field("Loan Category");
            //     ApplicationArea = All;
            // }
        }
    }

    actions
    {
    }

    var
    //WshShell: Automation WshShell;
}

#pragma implicitwith restore

