Page 52193455 "Member Statistics"
{
    Caption = 'Customer Statistics';
    Editable = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(BalanceLCY;"Balance (LCY)")
                {
                    ApplicationArea = Basic;

                    trigger OnDrillDown()
                    var
                        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
                        CustLedgEntry: Record "Cust. Ledger Entry";
                    begin
                        DtldCustLedgEntry.SetRange("Customer No.","No.");
                        Copyfilter("Global Dimension 1 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 1");
                        Copyfilter("Global Dimension 2 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 2");
                        Copyfilter("Currency Filter",DtldCustLedgEntry."Currency Code");
                        CustLedgEntry.DrillDownOnEntries(DtldCustLedgEntry);
                    end;
                }
                group(Sales)
                {
                    Caption = 'Sales';
                    field(OutstandingOrdersLCY;"Outstanding Orders (LCY)")
                    {
                        ApplicationArea = Basic;
                    }
                    field(ShippedNotInvoicedLCY;"Shipped Not Invoiced (LCY)")
                    {
                        ApplicationArea = Basic;
                    }
                    field(OutstandingInvoicesLCY;"Outstanding Invoices (LCY)")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group(Service)
                {
                    Caption = 'Service';
                    field(OutstandingServOrdersLCY;"Outstanding Serv. Orders (LCY)")
                    {
                        ApplicationArea = Basic;
                    }
                    field(ServShippedNotInvoicedLCY;"Serv Shipped Not Invoiced(LCY)")
                    {
                        ApplicationArea = Basic;
                    }
                    field(OutstandingServInvoicesLCY;"Outstanding Serv.Invoices(LCY)")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field(GetTotalAmountLCY;GetTotalAmountLCY)
                {
                    ApplicationArea = Basic;
                    AutoFormatType = 1;
                    Caption = 'Total (LCY)';
                    Importance = Promoted;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(CreditLimitLCY;"Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Balance Due (LCY)";CalcOverdueBalance)
                {
                    ApplicationArea = Basic;
                    CaptionClass = FORMAT(STRSUBSTNO(Text000,FORMAT(CurrentDate)));

                    trigger OnDrillDown()
                    var
                        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
                        CustLedgEntry: Record "Cust. Ledger Entry";
                    begin
                        DtldCustLedgEntry.SetFilter("Customer No.","No.");
                        Copyfilter("Global Dimension 1 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 1");
                        Copyfilter("Global Dimension 2 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 2");
                        Copyfilter("Currency Filter",DtldCustLedgEntry."Currency Code");
                        CustLedgEntry.DrillDownOnOverdueEntries(DtldCustLedgEntry);
                    end;
                }
                field(GetInvoicedPrepmtAmountLCY;GetInvoicedPrepmtAmountLCY)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Prepayment Amount (LCY)';
                }
            }
            group(Control1904305601)
            {
                Caption = 'Sales';
                fixed(Control1904230801)
                {
                    group(ThisPeriod)
                    {
                        Caption = 'This Period';
                        field(CustDateName1;CustDateName[1])
                        {
                            ApplicationArea = Basic;
                        }
                        field(SalesLCY;CustSalesLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Sales (LCY)';
                        }
                        field(OriginalCostsLCY;CustSalesLCY[1] - CustProfit[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Costs (LCY)';
                        }
                        field(OriginalProfitLCY;CustProfit[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Profit (LCY)';
                        }
                        field(OriginalProfit;ProfitPct[1])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Original Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(AdjustedCostsLCY;CustSalesLCY[1] - CustProfit[1] - AdjmtCostLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Costs (LCY)';
                        }
                        field(AdjustedProfitLCY;AdjCustProfit[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Profit (LCY)';
                        }
                        field(AdjustedProfit;AdjProfitPct[1])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Adjusted Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(CostAdjmtAmountsLCY;-AdjmtCostLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Cost Adjmt. Amounts (LCY)';

                            trigger OnDrillDown()
                            begin
                                // GetLegalEntityType(CustDateFilter[1]);
                            end;
                        }
                        field(InvDiscountsLCY;CustInvDiscAmountLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Discounts (LCY)';
                        }
                        field(InvAmountsLCY;InvAmountsLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Amounts (LCY)';
                        }
                        field(ReminderAmountsLCY;CustReminderChargeAmtLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Reminder Amounts (LCY)';
                        }
                        field(FinChargesLCY;CustFinChargeAmtLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Fin. Charges (LCY)';
                        }
                        field(CrMemoAmountsLCY;CustCrMemoAmountsLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Cr. Memo Amounts (LCY)';
                        }
                        field(PaymentsLCY;CustPaymentsLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payments (LCY)';
                        }
                        field(RefundsLCY;CustRefundsLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Refunds (LCY)';
                        }
                        field(OtherAmountsLCY;CustOtherAmountsLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Other Amounts (LCY)';
                        }
                        field(PmtDiscountsLCY;CustPaymentDiscLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Discounts (LCY)';
                        }
                        field(PmtDiscTolLCY;CustPaymentDiscTolLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Disc. Tol. (LCY)';
                        }
                        field(PmtTolerancesLCY;CustPaymentTolLCY[1])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Tolerances (LCY)';
                        }
                    }
                    group(ThisYear)
                    {
                        Caption = 'This Year';
                        field(Text001;Text001)
                        {
                            ApplicationArea = Basic;
                            Visible = false;
                        }
                        field(CustSalesLCY2;CustSalesLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Sales (LCY)';
                        }
                        field(CustSalesLCY2CustProfit2;CustSalesLCY[2] - CustProfit[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Costs (LCY)';
                        }
                        field(CustProfit2;CustProfit[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Profit (LCY)';
                        }
                        field(ProfitPct2;ProfitPct[2])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Original Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(CustSalesLCY2CustProfit2AdjmtCostLCY2;CustSalesLCY[2] - CustProfit[2] - AdjmtCostLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Costs (LCY)';
                        }
                        field(AdjCustProfit2;AdjCustProfit[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Profit (LCY)';
                        }
                        field(AdjProfitPct2;AdjProfitPct[2])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Adjusted Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(AdjustmentCostsLCY;-AdjmtCostLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjustment Costs (LCY)';

                            trigger OnDrillDown()
                            begin
                                GetLegalEntityType();
                            end;
                        }
                        field(CustInvDiscAmountLCY2;CustInvDiscAmountLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Discounts (LCY)';
                        }
                        field(InvAmountsLCY2;InvAmountsLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Amounts (LCY)';
                        }
                        field(CustReminderChargeAmtLCY2;CustReminderChargeAmtLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Reminder Amounts (LCY)';
                        }
                        field(CustFinChargeAmtLCY2;CustFinChargeAmtLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Fin. Charges (LCY)';
                        }
                        field(CustCrMemoAmountsLCY2;CustCrMemoAmountsLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Cr. Memo Amounts (LCY)';
                        }
                        field(CustPaymentsLCY2;CustPaymentsLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payments (LCY)';
                        }
                        field(CustRefundsLCY2;CustRefundsLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Refunds (LCY)';
                        }
                        field(CustOtherAmountsLCY2;CustOtherAmountsLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Other Amounts (LCY)';
                        }
                        field(CustPaymentDiscLCY2;CustPaymentDiscLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Discounts (LCY)';
                        }
                        field(PmtDiscToleranceLCY;CustPaymentDiscTolLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Disc. Tolerance (LCY)';
                        }
                        field(PaymentTolerancesLCY;CustPaymentTolLCY[2])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payment Tolerances (LCY)';
                        }
                    }
                    group(LastYear)
                    {
                        Caption = 'Last Year';
                        field(Control122;Text001)
                        {
                            ApplicationArea = Basic;
                            Visible = false;
                        }
                        field(CustSalesLCY3;CustSalesLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Sales (LCY)';
                        }
                        field(CustSalesLCY3CustProfit3;CustSalesLCY[3] - CustProfit[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Costs (LCY)';
                        }
                        field(CustProfit3;CustProfit[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Profit (LCY)';
                        }
                        field(ProfitPct3;ProfitPct[3])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Original Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(CustSalesLCY3CustProfit3AdjmtCostLCY3;CustSalesLCY[3] - CustProfit[3] - AdjmtCostLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Costs (LCY)';
                        }
                        field(AdjCustProfit3;AdjCustProfit[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Profit (LCY)';
                        }
                        field(AdjProfitPct3;AdjProfitPct[3])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Adjusted Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(AdjmtCostLCY3;-AdjmtCostLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjustment Costs (LCY)';

                            trigger OnDrillDown()
                            begin
                                GetLegalEntityType();
                            end;
                        }
                        field(CustInvDiscAmountLCY3;CustInvDiscAmountLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Discounts (LCY)';
                        }
                        field(InvAmountsLCY3;InvAmountsLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Amounts (LCY)';
                        }
                        field(CustReminderChargeAmtLCY3;CustReminderChargeAmtLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Reminder Amounts (LCY)';
                        }
                        field(CustFinChargeAmtLCY3;CustFinChargeAmtLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Fin. Charges (LCY)';
                        }
                        field(CustCrMemoAmountsLCY3;CustCrMemoAmountsLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Cr. Memo Amounts (LCY)';
                        }
                        field(CustPaymentsLCY3;CustPaymentsLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payments (LCY)';
                        }
                        field(CustRefundsLCY3;CustRefundsLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Refunds (LCY)';
                        }
                        field(CustOtherAmountsLCY3;CustOtherAmountsLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Other Amounts (LCY)';
                        }
                        field(CustPaymentDiscLCY3;CustPaymentDiscLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Discounts (LCY)';
                        }
                        field(CustPaymentDiscTolLCY3;CustPaymentDiscTolLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Disc. Tolerance (LCY)';
                        }
                        field(CustPaymentTolLCY3;CustPaymentTolLCY[3])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payment Tolerances (LCY)';
                        }
                    }
                    group(ToDate)
                    {
                        Caption = 'To Date';
                        field(Control123;Text001)
                        {
                            ApplicationArea = Basic;
                            Visible = false;
                        }
                        field(CustSalesLCY4;CustSalesLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Sales (LCY)';
                        }
                        field(CustSalesLCY4CustProfit4;CustSalesLCY[4] - CustProfit[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Costs (LCY)';
                        }
                        field(CustProfit4;CustProfit[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Original Profit (LCY)';
                        }
                        field(ProfitPct4;ProfitPct[4])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Original Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(CustSalesLCY4CustProfit4AdjmtCostLCY4;CustSalesLCY[4] - CustProfit[4] - AdjmtCostLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Costs (LCY)';
                        }
                        field(AdjCustProfit4;AdjCustProfit[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjusted Profit (LCY)';
                        }
                        field(AdjProfitPct4;AdjProfitPct[4])
                        {
                            ApplicationArea = Basic;
                            Caption = 'Adjusted Profit %';
                            DecimalPlaces = 1:1;
                        }
                        field(AdjmtCostLCY4;-AdjmtCostLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Adjustment Costs (LCY)';

                            trigger OnDrillDown()
                            begin
                                GetLegalEntityType();
                            end;
                        }
                        field(CustInvDiscAmountLCY4;CustInvDiscAmountLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Discounts (LCY)';
                        }
                        field(InvAmountsLCY4;InvAmountsLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Inv. Amounts (LCY)';
                        }
                        field(CustReminderChargeAmtLCY4;CustReminderChargeAmtLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Reminder Amounts (LCY)';
                        }
                        field(CustFinChargeAmtLCY4;CustFinChargeAmtLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Fin. Charges (LCY)';
                        }
                        field(CustCrMemoAmountsLCY4;CustCrMemoAmountsLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Cr. Memo Amounts (LCY)';
                        }
                        field(CustPaymentsLCY4;CustPaymentsLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payments (LCY)';
                        }
                        field(CustRefundsLCY4;CustRefundsLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Refunds (LCY)';
                        }
                        field(CustOtherAmountsLCY4;CustOtherAmountsLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Other Amounts (LCY)';
                        }
                        field(CustPaymentDiscLCY4;CustPaymentDiscLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Discounts (LCY)';
                        }
                        field(CustPaymentDiscTolLCY4;CustPaymentDiscTolLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Disc. Tolerance (LCY)';
                        }
                        field(CustPaymentTolLCY4;CustPaymentTolLCY[4])
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Payment Tolerances (LCY)';
                        }
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        CostCalcMgt: Codeunit "Cost Calculation Management";
    begin
        if CurrentDate <> WorkDate then begin
          CurrentDate := WorkDate;
          DateFilterCalc.CreateAccountingPeriodFilter(CustDateFilter[1],CustDateName[1],CurrentDate,0);
          DateFilterCalc.CreateFiscalYearFilter(CustDateFilter[2],CustDateName[2],CurrentDate,0);
          DateFilterCalc.CreateFiscalYearFilter(CustDateFilter[3],CustDateName[3],CurrentDate,-1);
        end;

        SetRange("Date Filter",0D,CurrentDate);

        for i := 1 to 4 do begin
          SetFilter("Date Filter",CustDateFilter[i]);
          CalcFields(
            "Sales (LCY)","Profit (LCY)","Inv. Discounts (LCY)","Inv. Amounts (LCY)","Pmt. Discounts (LCY)",
            "Pmt. Disc. Tolerance (LCY)","Pmt. Tolerance (LCY)",
            "Fin. Charge Memo Amounts (LCY)","Cr. Memo Amounts (LCY)","Payments (LCY)",
            "Reminder Amounts (LCY)","Refunds (LCY)","Other Amounts (LCY)");
          CustSalesLCY[i] := "Sales (LCY)";
          CustProfit[i] := "Profit (LCY)" + CostCalcMgt.NonInvtblCostAmt(Rec);
          AdjmtCostLCY[i] := CustSalesLCY[i] - CustProfit[i] + CostCalcMgt.CalcCustActualCostLCY(Rec);
          AdjCustProfit[i] := CustProfit[i] + AdjmtCostLCY[i];

          if "Sales (LCY)" <> 0 then begin
            ProfitPct[i] := ROUND(100 * CustProfit[i] / "Sales (LCY)",0.1);
            AdjProfitPct[i] := ROUND(100 * AdjCustProfit[i] / "Sales (LCY)",0.1);
          end else begin
            ProfitPct[i] := 0;
            AdjProfitPct[i] := 0;
          end;

          InvAmountsLCY[i] := "Inv. Amounts (LCY)";
          CustInvDiscAmountLCY[i] := "Inv. Discounts (LCY)";
          CustPaymentDiscLCY[i] := "Pmt. Discounts (LCY)";
          CustPaymentDiscTolLCY[i] := "Pmt. Disc. Tolerance (LCY)";
          CustPaymentTolLCY[i] := "Pmt. Tolerance (LCY)";
          CustReminderChargeAmtLCY[i] := "Reminder Amounts (LCY)";
          CustFinChargeAmtLCY[i] := "Fin. Charge Memo Amounts (LCY)";
          CustCrMemoAmountsLCY[i] := "Cr. Memo Amounts (LCY)";
          CustPaymentsLCY[i] := "Payments (LCY)";
          CustRefundsLCY[i] := "Refunds (LCY)";
          CustOtherAmountsLCY[i] := "Other Amounts (LCY)";
        end;
        SetRange("Date Filter",0D,CurrentDate);
    end;

    var
        Text000: label 'Overdue Amounts (LCY) as of %1';
        DateFilterCalc: Codeunit "DateFilter-Calc";
        CustDateFilter: array [4] of Text[30];
        CustDateName: array [4] of Text[30];
        CurrentDate: Date;
        CustSalesLCY: array [4] of Decimal;
        AdjmtCostLCY: array [4] of Decimal;
        CustProfit: array [4] of Decimal;
        ProfitPct: array [4] of Decimal;
        AdjCustProfit: array [4] of Decimal;
        AdjProfitPct: array [4] of Decimal;
        CustInvDiscAmountLCY: array [4] of Decimal;
        CustPaymentDiscLCY: array [4] of Decimal;
        CustPaymentDiscTolLCY: array [4] of Decimal;
        CustPaymentTolLCY: array [4] of Decimal;
        CustReminderChargeAmtLCY: array [4] of Decimal;
        CustFinChargeAmtLCY: array [4] of Decimal;
        CustCrMemoAmountsLCY: array [4] of Decimal;
        CustPaymentsLCY: array [4] of Decimal;
        CustRefundsLCY: array [4] of Decimal;
        CustOtherAmountsLCY: array [4] of Decimal;
        i: Integer;
        InvAmountsLCY: array [4] of Decimal;
        Text001: label 'Placeholder';
}

