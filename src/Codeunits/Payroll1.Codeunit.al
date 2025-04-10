Codeunit 52193460 Payroll1
{

    trigger OnRun()
    begin
    end;

    var
        AmountRemaining: Decimal;
        TaxableAmount: Decimal;
        TaxCode: Code[20];
        IncomeTax: Decimal;
        GrossTaxCharged: Decimal;
        relief: Decimal;
        PayPeriod: Record "Payroll PeriodX1";
        BeginDate: Date;
        BasicSalary: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        Emp: Record Employee;
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        PAYE: Decimal;
        TaxablePay: Decimal;
        EmpRec: Record Employee;
        BfMpr: Decimal;
        CfMpr: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        LowInterestBenefits: Decimal;
        Netpay: Decimal;
        Earnings: Record EarningsX1;
        TerminalDues: Decimal;
        Earn: Record EarningsX1;
        TaxTable: Record BracketsX1;
        Ded: Record DeductionsX1;
        i: Integer;
        Text000: label 'Preview is not allowed.';
        Text001: label 'Last Check No. must be filled in.';
        Text002: label 'Filters on %1 and %2 are not allowed.';
        Text003: label 'XXXXXXXXXXXXXXXX';
        Text004: label 'must be entered.';
        Text005: label 'The Bank Account and the General Journal Line must have the same currency.';
        Text006: label 'Salesperson';
        Text007: label 'Purchaser';
        Text008: label 'Both Bank Accounts must have the same currency.';
        Text009: label 'Our Contact';
        Text010: label 'XXXXXXXXXX';
        Text011: label 'XXXX';
        Text012: label 'XX.XXXXXXXXXX.XXXX';
        Text013: label '%1 already exists.';
        Text014: label 'Check for %1 %2';
        Text015: label 'Payment';
        Text016: label 'In the Check report, One Check per Vendor and Document No.\';
        Text017: label 'must not be activated when Applies-to ID is specified in the journal lines.';
        Text018: label 'XXX';
        Text019: label 'Total';
        Text020: label 'The total amount of check %1 is %2. The amount must be positive.';
        Text021: label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        Text022: label 'NON-NEGOTIABLE';
        Text023: label 'Test print';
        Text024: label 'XXXX.XX';
        Text025: label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: label 'ZERO';
        Text027: label 'HUNDRED';
        Text028: label 'AND';
        Text029: label '%1 results in a written number that is too long.';
        Text030: label ' is already applied to %1 %2 for customer %3.';
        Text031: label ' is already applied to %1 %2 for vendor %3.';
        Text032: label 'ONE';
        Text033: label 'TWO';
        Text034: label 'THREE';
        Text035: label 'FOUR';
        Text036: label 'FIVE';
        Text037: label 'SIX';
        Text038: label 'SEVEN';
        Text039: label 'EIGHT';
        Text040: label 'NINE';
        Text041: label 'TEN';
        Text042: label 'ELEVEN';
        Text043: label 'TWELVE';
        Text044: label 'THIRTEEN';
        Text045: label 'FOURTEEN';
        Text046: label 'FIFTEEN';
        Text047: label 'SIXTEEN';
        Text048: label 'SEVENTEEN';
        Text049: label 'EIGHTEEN';
        Text050: label 'NINETEEN';
        Text051: label 'TWENTY';
        Text052: label 'THIRTY';
        Text053: label 'FORTY';
        Text054: label 'FIFTY';
        Text055: label 'SIXTY';
        Text056: label 'SEVENTY';
        Text057: label 'EIGHTY';
        Text058: label 'NINETY';
        Text059: label 'THOUSAND';
        Text060: label 'MILLION';
        Text061: label 'BILLION';
        Text062: label 'G/L Account,Customer,Vendor,Bank Account';
        Text063: label 'Net Amount %1';
        Text064: label '%1 must not be %2 for %3 %4.';
        Text065: label 'AND // text0028 removed the AND';
        OnesText: array [20] of Text[30];
        TensText: array [10] of Text[30];
        ExponentText: array [5] of Text[30];
        mine: Text[30];


    procedure GetTaxBracket(var TaxableAmount: Decimal) GetTaxBracket: Decimal
    var
        TaxTable: Record BracketsX1;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
          CompRec.Get;
          TaxCode:=CompRec."Tax Table";
          AmountRemaining:=TaxableAmount;
          AmountRemaining:=ROUND(AmountRemaining,0.01);
          EndTax:=false;
          TaxTable.SetRange("Table Code",TaxCode);


          if TaxTable.Find('-') then
          begin
            repeat

             if AmountRemaining<=0 then
                EndTax:=true


             else
              begin

               if ROUND((TaxableAmount),1)>=TaxTable."Upper Limit" then
               begin

               Tax:=TaxTable."Taxable Amount"*TaxTable.Percentage/100;
               TotalTax:=TotalTax+Tax;
               //
               end
              else
               begin
               //Deducted 1 here and got the xact figures just chek incase this may have issues
               //Only the amount in the last Tax band had issues.
                AmountRemaining:=AmountRemaining-TaxTable."Lower Limit";
                Tax:=AmountRemaining*(TaxTable.Percentage/100);

                //Tax:=AmountRemaining*TaxTable.Percentage/100;

                EndTax:=true;
                TotalTax:=TotalTax+Tax;
               end;
              end;
            until (TaxTable.Next=0) or EndTax=true;
          end;
          TotalTax:=TotalTax;
          TotalTax:=PayrollRounding(TotalTax);
          IncomeTax:=-TotalTax;

          GetTaxBracket:=ROUND(TotalTax,1,'<');
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay",false);
         if PayPeriod.Find('-') then
         begin
          //PayPeriodtext:=PayPeriod.Name;
          BeginDate:=PayPeriod."Starting Date";
         end;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin


            HRsetup.Get;
            if HRsetup."Payroll Rounding Precision"=0 then
               Error('You must specify the rounding precision under HR setup');

          if HRsetup."Payroll Rounding Type"=HRsetup."payroll rounding type"::Nearest then
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'=');

          if HRsetup."Payroll Rounding Type"=HRsetup."payroll rounding type"::Up then
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'>');

          if HRsetup."Payroll Rounding Type"=HRsetup."payroll rounding type"::Down then
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'<');
    end;


    procedure CalculateTaxableAmount(var EmployeeNo: Code[20];var DateSpecified: Date;var FinalTax: Decimal;var TaxableAmountNew: Decimal;var RetirementCont: Decimal)
    var
        Assignmatrix: Record "Assignment Matrix-X1";
        EmpRec: Record Employee;
        EarnRec: Record EarningsX1;
        InsuranceRelief: Decimal;
        PersonalRelief: Decimal;
    begin
          CfMpr:=0;
          FinalTax:=0;
          i:=0;
          TaxableAmount:=0;
          RetirementCont:=0;
          InsuranceRelief:=0;
          PersonalRelief:=0;
         //Get payroll period
         GetPayPeriod;
         if DateSpecified=0D then
         Error('Pay period must be specified for this report');

         // Taxable Amount
         EmpRec.Reset;
         EmpRec.SetRange(EmpRec."No.",EmployeeNo);
         EmpRec.SetRange("Pay Period Filter", DateSpecified);
         if EmpRec.Find('-') then begin
          if EmpRec."Pays tax"=true then begin

           EmpRec.CalcFields(EmpRec."Taxable Allowance","Tax Deductible Amount");
           TaxableAmount:=EmpRec."Taxable Allowance";
          // mine:=EmpRec."Taxable Allowance";
          // MESSAGE('%1',TaxableAmount);
          Ded.Reset;
          Ded.SetRange(Ded."Tax deductible",true);
          if Ded.Find('-') then begin
           repeat
               Assignmatrix.Reset;
               Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
               Assignmatrix.SetRange(Type,Assignmatrix.Type::Deduction);
               Assignmatrix.SetRange(Assignmatrix.Code,Ded.Code);
               Assignmatrix.SetRange(Assignmatrix."Employee No",EmployeeNo);
               if Assignmatrix.Find('-') then
               if Ded."Pension Limit Amount">0 then begin
                if Abs(Assignmatrix.Amount)>Ded."Pension Limit Amount" then
                 RetirementCont:=Abs(RetirementCont)+Ded."Pension Limit Amount";
               end else
                RetirementCont:=Abs(RetirementCont)+Abs(Assignmatrix.Amount);

          until Ded.Next=0;
          end;
             TaxableAmount:=TaxableAmount-RetirementCont;
           // end Taxable Amount

           // added to cater for Owner occupier Specific

           if EmpRec."Home Ownership Status"=EmpRec."home ownership status"::"Owner Occupier"
            then begin
             // Get owner Occuper From Earning Table
             EarnRec.Reset;
             EarnRec.SetCurrentkey(EarnRec."Earning Type");
             EarnRec.SetRange(EarnRec."Earning Type",EarnRec."earning type"::"Owner Occupier");
             if EarnRec.Find('-') then begin
              repeat
               Assignmatrix.Reset;
               Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
               Assignmatrix.SetRange(Type,Assignmatrix.Type::Payment);
               Assignmatrix.SetRange(Assignmatrix.Code,EarnRec.Code);
               Assignmatrix.SetRange(Assignmatrix."Employee No",EmployeeNo);
               if Assignmatrix.Find('-') then
                TaxableAmount:=TaxableAmount-Assignmatrix.Amount;
              until EarnRec.Next=0;
             end;
           end;
           // End ofOwner occupier Specific

        // Low Interest Benefits
             EarnRec.Reset;
             EarnRec.SetCurrentkey(EarnRec."Earning Type");
             EarnRec.SetRange(EarnRec."Earning Type",EarnRec."earning type"::"Low Interest");
             if EarnRec.Find('-') then begin
              repeat
               Assignmatrix.Reset;
               Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
               Assignmatrix.SetRange(Type,Assignmatrix.Type::Payment);
               Assignmatrix.SetRange(Assignmatrix.Code,EarnRec.Code);
               Assignmatrix.SetRange(Assignmatrix."Employee No",EmployeeNo);
               if Assignmatrix.Find('-') then
                TaxableAmount:=TaxableAmount+Assignmatrix.Amount;
              until EarnRec.Next=0;
             end;

         //End of Low Interest benefits

         TaxableAmount:=ROUND(TaxableAmount,0.01,'<');
         TaxableAmountNew:= TaxableAmount;

         // Get PAYE
        //MESSAGE('Taxable income=%1',TaxableAmount);
         FinalTax:=GetTaxBracket(TaxableAmount);
        //MESSAGE('tax=%1',FinalTax);

        // Get Reliefs
        InsuranceRelief:=0;
        // Calculate insurance relief;
             EarnRec.Reset;
             EarnRec.SetCurrentkey(EarnRec."Earning Type");
             EarnRec.SetRange(EarnRec."Earning Type",EarnRec."earning type"::"Insurance Relief");
             if EarnRec.Find('-') then begin
              repeat
               Assignmatrix.Reset;
               Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
               Assignmatrix.SetRange(Type,Assignmatrix.Type::Payment);
               Assignmatrix.SetRange(Assignmatrix.Code,EarnRec.Code);
               Assignmatrix.SetRange(Assignmatrix."Employee No",EmployeeNo);
               if Assignmatrix.Find('-') then
                InsuranceRelief:=InsuranceRelief+Assignmatrix.Amount;
              until EarnRec.Next=0;
             end;


        // Personal Relief
             PersonalRelief:=0;
             EarnRec.Reset;
             EarnRec.SetCurrentkey(EarnRec."Earning Type");
             EarnRec.SetRange(EarnRec."Earning Type",EarnRec."earning type"::"Tax Relief");
             if EarnRec.Find('-') then begin
              repeat
               Assignmatrix.Reset;
               Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
               Assignmatrix.SetRange(Type,Assignmatrix.Type::Payment);
               Assignmatrix.SetRange(Assignmatrix.Code,EarnRec.Code);
               Assignmatrix.SetRange(Assignmatrix."Employee No",EmployeeNo);
               if Assignmatrix.Find('-') then
                PersonalRelief:=PersonalRelief+Assignmatrix.Amount;
              until EarnRec.Next=0;
             end;


         FinalTax:=FinalTax-(PersonalRelief+InsuranceRelief);

        if FinalTax<0 then
        FinalTax:=0;
        end else
         FinalTax:=0;

        end;
        Message('Runs this routine');
    end;


    procedure GetUserGroup(var UserIDs: Code[10];var PGroup: Code[20])
    var
        UserSetup: Record "User Setup";
    begin
          if UserSetup.Get(UserIDs) then begin
          // PGroup:=UserSetup."Payroll Group";
           if PGroup='' then
            Error('Dont have payroll permission');
          end;
    end;


    procedure FormatNoText(var NoText: array [2] of Text[80];No: Decimal;CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        if No < 1 then
          AddToNoText(NoText,NoTextIndex,PrintExponent,Text026)
        else begin
          for Exponent := 4 downto 1 do begin
            PrintExponent := false;
            Ones := No DIV Power(1000,Exponent - 1);
            Hundreds := Ones DIV 100;
            Tens := (Ones MOD 100) DIV 10;
            Ones := Ones MOD 10;
            if Hundreds > 0 then begin
              AddToNoText(NoText,NoTextIndex,PrintExponent,OnesText[Hundreds]);
              AddToNoText(NoText,NoTextIndex,PrintExponent,Text027);
            end;
            if Tens >= 2 then begin
              AddToNoText(NoText,NoTextIndex,PrintExponent,TensText[Tens]);
              if Ones > 0 then
                AddToNoText(NoText,NoTextIndex,PrintExponent,OnesText[Ones]);
            end else
              if (Tens * 10 + Ones) > 0 then
                AddToNoText(NoText,NoTextIndex,PrintExponent,OnesText[Tens * 10 + Ones]);
            if PrintExponent and (Exponent > 1) then
              AddToNoText(NoText,NoTextIndex,PrintExponent,ExponentText[Exponent]);
            No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000,Exponent - 1);
          end;
        end;

        AddToNoText(NoText,NoTextIndex,PrintExponent,Text028);
        AddToNoText(NoText,NoTextIndex,PrintExponent,'');
        //FORMAT(No * 100) + '/100');

        if CurrencyCode <> '' then
          AddToNoText(NoText,NoTextIndex,PrintExponent,CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array [2] of Text[80];var NoTextIndex: Integer;var PrintExponent: Boolean;AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
          NoTextIndex := NoTextIndex + 1;
          if NoTextIndex > ArrayLen(NoText) then
            Error(Text029,AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText,'<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;
}

