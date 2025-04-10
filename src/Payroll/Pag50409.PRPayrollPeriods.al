page 52193890 "PR Payroll Periods"
{
    PageType = List;
    SourceTable = "PR Payroll Periods";
    // Editable = false;
    // InsertAllowed = false;
    // DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(PeriodMonth; "Period Month")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field(PeriodYear; "Period Year")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field(PeriodName; "Period Name")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field(Closed; Closed)
                {
                    ApplicationArea = Basic;

                }
                field(Processing; Rec.Processing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Processing field.';
                }
                field(DateOpened; "Date Opened")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field(OpenedBy; "Opened By")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field("Lock PCA"; Rec."Lock PCA")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lock PCA/Data form Creation field.';
                }
                field(DateClosed; "Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ClosedBy; "Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AllowViewPayslip; "Allow View Payslip?")
                {
                    ApplicationArea = Basic;
                }
                field(ProrationDone; "Proration Done")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Approved"; "Date Approved")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ClosePeriod)
            {
                ApplicationArea = Basic;
                Caption = 'Close Period';
                Image = ClosePeriod;

                trigger OnAction()
                begin

                    /*
                    Warn user about the consequence of closure - operation is not reversible.
                    Ask if he is sure about the closure.
                    */

                    fnGetOpenPeriod;

                    Question := 'Once a period has been closed it can NOT be opened.\It is assumed that you have PAID out salaries.\'
                    + 'Do still want to close [' + strPeriodName + ']';

                    Answer := Dialog.Confirm(Question, false);
                    if Answer = true then begin
                        Clear(objOcx);
                        objOcx.fnClosePayrollPeriod(dtOpenPeriod);
                        Message('Process Complete');
                    end else begin
                        Message('You have selected NOT to Close the period');
                    end

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(ClosePeriod_Promoted; ClosePeriod)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        //HRCodeunit.fn_HRPRAccessList(USERID);
    end;

    var
        PayPeriod: Record "PR Payroll Periods";
        strPeriodName: Text[30];
        Text000: label '''Leave without saving changes?''';
        Text001: label '''You selected %1.''';
        Question: Text[250];
        Answer: Boolean;
        objOcx: Codeunit "PR Payroll Processing";
        dtOpenPeriod: Date;
    // HRCodeunit: Codeunit "HR Codeunit";

    procedure fnGetOpenPeriod()
    begin

        //Get the open/current period
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.FindFirst() then begin
            strPeriodName := PayPeriod."Period Name";
            dtOpenPeriod := PayPeriod."Date Opened";
        end;
    end;
}

