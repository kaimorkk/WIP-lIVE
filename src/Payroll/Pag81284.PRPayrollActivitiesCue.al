
page 52193726 "PR Payroll Activities Cue"
{
    PageType = CardPart;
    SourceTable = "HR Activities Cue";

    layout
    {
        area(content)
        {

            cuegroup(PayrollActivites)
            {
                ShowCaption = false;


                field(Allowances; Rec.Allowances)
                {
                    ApplicationArea = all;
                    Caption = 'Allowances';
                }

                field(PAYE; Rec.PAYE)
                {
                    ApplicationArea = all;
                }

                field(NHIF; Rec.NHIF)
                {
                    ApplicationArea = all;
                    Caption = 'NHIF';
                }

                field(NSSF; Rec.NSSF)
                {
                    ApplicationArea = all;
                    Caption = 'NSSF';
                }

                field("Voluntary NSSF"; Rec."Voluntary NSSF")
                {
                    ApplicationArea = all;
                }

                field("Pension-Employee"; Rec."Pension-Employee")
                {
                    ApplicationArea = all;
                    Caption = 'Pension - Employee';
                }

                field("Pension-Employer"; Rec."Pension-Employer")
                {
                    ApplicationArea = all;
                    DrillDownPageId = "PR Employer Contributions";
                    Caption = 'Pension - Employer';
                }

                field("Voluntary Pension"; Rec."Voluntary Pension")
                {
                    ApplicationArea = all;
                }
                field("Payroll Actuals"; Rec."Payroll Actuals")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Payroll Actuals field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budgeted Amount field.';
                }
                field("Housing Fund"; Rec."Housing Fund")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Housing Fund field.';
                }

            }
        }

    }
    trigger OnOpenPage();
    var
        PayPeriods: Record "PR Payroll Periods";
    begin


        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;

        END;
        PayPeriods.Reset();
        PayPeriods.SetRange(Closed, true);
        if PayPeriods.FindLast() then begin
            Rec.SetFilter("PayPeriod Filter", format(PayPeriods."Date Opened"));
        end;
    end;

}

#pragma implicitwith restore




