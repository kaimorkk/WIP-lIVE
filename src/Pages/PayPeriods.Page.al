Page 52193963 "Pay Periods"
{
    ApplicationArea = Basic;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Payroll PeriodX1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(StartingDate;"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(NewFiscalYear;"New Fiscal Year")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayDate;"Pay Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClosedBy;"Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ClosedonDate;"Closed on Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(CMSStartingDate;"CMS Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(CMSEndDate;"CMS End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ClosePay;"Close Pay")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(MarketInterestRate;"Market Interest Rate %")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ClosePeriod)
            {
                Caption = 'Close Period';
                action(ClosePayPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Pay Period';

                    trigger OnAction()
                    begin
                        if not Confirm('You are about to close the current Pay period are you sure you want to do this?'+ //
                        ' Make sure all reports are correct before closing the current pay period, Go ahead?',false) then
                        exit;



                        ClosingFunction.GetCurrentPeriod(Rec);
                        ClosingFunction.Run;
                    end;
                }
            }
        }
        area(processing)
        {
            action(CreatePeriod)
            {
                ApplicationArea = Basic;
                Caption = '&Create Period';
                Ellipsis = true;
                RunObject = Report "Create Payroll Period";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CreatePeriod_Promoted; CreatePeriod)
                {
                }
            }
        }
    }

    var
        ClosingFunction: Report "Close Pay period";
        PayrollRun: Report "Master reporterx";
}

