PageExtension 52193533 pageextension52193533 extends "Cash Flow Availability Lines" 
{
    layout
    {
        modify(ManualRevenues)
        {
            Caption = 'Cash Flow Manual Expenses';
        }

        //Unsupported feature: Property Deletion (AutoFormatType) on "Receivables(Control 1005)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Receivables(Control 1005)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "SalesOrders(Control 1007)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "SalesOrders(Control 1007)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ServiceOrders(Control 1)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ServiceOrders(Control 1)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "SalesofFixedAssets(Control 1009)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "SalesofFixedAssets(Control 1009)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ManualRevenues(Control 1011)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ManualRevenues(Control 1011)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ManualRevenues(Control 1011)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Payables(Control 1013)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Payables(Control 1013)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "PurchaseOrders(Control 1015)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "PurchaseOrders(Control 1015)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "BudgetedFixedAssets(Control 1017)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "BudgetedFixedAssets(Control 1017)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ManualExpenses(Control 1019)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ManualExpenses(Control 1019)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Budget(Control 3)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Budget(Control 3)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Total(Control 1021)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Total(Control 1021)".

    }

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE AmountType OF
          AmountType::"Net Change":
            CashFlowForecast.CalculateAllAmounts("Period Start","Period End",Amounts,CashFlowSum);
          AmountType::"Balance at Date":
            CashFlowForecast.CalculateAllAmounts(0D,"Period End",Amounts,CashFlowSum)
        END;

        FOR SourceType := 1 TO ARRAYLEN(Amounts) DO
          Amounts[SourceType] := MatrixMgt.RoundValue(Amounts[SourceType],RoundingFactor);

        CashFlowSum := MatrixMgt.RoundValue(CashFlowSum,RoundingFactor);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
          Amounts[SourceType] := RoundAmount(Amounts[SourceType]);

        CashFlowSum := RoundAmount(CashFlowSum);
        */
    //end;


    //Unsupported feature: Code Modification on "Set(PROCEDURE 1000)".

    //procedure Set();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CashFlowForecast.COPY(NewCashFlowForecast);
        CashFlowForecast2.COPY(NewCashFlowForecast);
        CFPeriodLength := NewCashFlowPeriodLength;
        AmountType := NewAmountType;
        CurrPage.UPDATE(FALSE);
        RoundingFactor := RoundingFactor2;
        RoundingFactorFormatString := MatrixMgt.GetFormatString(RoundingFactor,FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        */
    //end;

    procedure RoundAmount(AmountToRound: Decimal): Decimal
    begin
        case RoundingFactor of
          Roundingfactor::"1":
            AmountToRound := ROUND(AmountToRound,1);
          Roundingfactor::"1000":
            AmountToRound := ROUND(AmountToRound / 1000,0.1);
          Roundingfactor::"1000000":
            AmountToRound := ROUND(AmountToRound / 1000000,0.1);
        end;
        exit(AmountToRound);
    end;
}

