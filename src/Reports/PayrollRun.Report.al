Report 52193536 "Payroll Run"
{
//     ProcessingOnly = true;
//     UsageCategory = ReportsandAnalysis;

//     dataset
//     {
//         dataitem(Employee; Employee)
//         {
//             DataItemTableView = sorting("No.") where(Status = const(Active));
//             RequestFilterFields = "No.", "Pay Period Filter";
//             column(ReportForNavId_7528; 7528)
//             {
//             }

//             trigger OnAfterGetRecord()
//             var
//                 // LoanApp: Record "Loan Application1";
//                 // Loans: Record "Loan Product Type1";
//                 // LoanTopup: Record "Loan Top-up";
//                 OpenBal: Decimal;
//             begin

//                 //Check the Balances and stop if the Amounts are zero.
//                 //ClosingBal:=0;
//                 //RepaymentAmt:=0;
//                 /*
//        Deductions.RESET;
//        Deductions.SETRANGE(Deductions."Salary Recovery",TRUE);
//        //Deductions.SETRANGE(Deductions."Show Balance",TRUE);
//        IF Deductions.FIND('-') THEN BEGIN
//           Assignmatrix.RESET;
//           Assignmatrix.SETRANGE("Employee No","No.");
//           Assignmatrix.SETRANGE(Code,Deductions.Code);
//           IF Assignmatrix.FINDFIRST THEN
//           //BEGIN
//              RepaymentAmt:=Assignmatrix.Amount;
//            //  OpenBal:=Assignmatrix."Opening Balance"
//          // END;
//          // MESSAGE('RepaymentAmt=%1',RepaymentAmt);
//           Assignmatrix.RESET;
//           Assignmatrix.SETRANGE("Employee No","No.");
//           Assignmatrix.SETRANGE(Code,Deductions.Code);
//           Assignmatrix.CALCSUMS("Opening Balance",Amount);
//           ClosingBal:=Assignmatrix."Opening Balance"-Assignmatrix.Amount;

//         // MESSAGE('OpenBal=%2\TotalRepay=%3\ClosingBal=%1',ClosingBal,Assignmatrix."Opening Balance",Assignmatrix.Amount);

//          IF (ABS(ClosingBal)>0) AND (ABS(ClosingBal)<ABS(RepaymentAmt)) THEN  BEGIN
//              Assignmatrix.RESET;
//              Assignmatrix.SETRANGE("Employee No","No.");
//              Assignmatrix.SETRANGE(Code,Deductions.Code);
//              Assignmatrix.SETRANGE("Payroll Period",DateSpecified);
//              IF Assignmatrix.FIND('-') THEN BEGIN
//               Assignmatrix.Amount:=ClosingBal;
//               Assignmatrix.MODIFY;
//          //  MESSAGE('CloseAmount=%1', Assignmatrix.Amount);
//             END;
//          END;// ELSE

//          IF (ABS(ClosingBal)>0) AND (ABS(ClosingBal)>=ABS(RepaymentAmt)) THEN  BEGIN
//              Assignmatrix.RESET;
//              Assignmatrix.SETRANGE("Employee No","No.");
//              Assignmatrix.SETRANGE(Code,Deductions.Code);
//              Assignmatrix.SETRANGE("Payroll Period",DateSpecified);
//              IF Assignmatrix.FIND('-') THEN BEGIN
//               Assignmatrix.Amount:=RepaymentAmt;
//               Assignmatrix.MODIFY;
//           // MESSAGE('RepayAmount=%1', Assignmatrix.Amount);
//             END;
//          END;// ELSE

//           //MESSAGE('%1',RepaymentAmt);
//           IF ABS(ClosingBal)<=0 THEN
//           BEGIN
//              Assignmatrix.RESET;
//              Assignmatrix.SETRANGE("Employee No","No.");
//              Assignmatrix.SETRANGE(Code,Deductions.Code);
//              Assignmatrix.SETRANGE("Payroll Period",DateSpecified);
//              IF Assignmatrix.FIND('-') THEN
//              BEGIN
//               Assignmatrix.Amount:=0;
//               //Assignmatrix."Opening Balance":=OpenBal;
//               Assignmatrix.MODIFY;
//              END;
//            END;

//        END;
//            */
//                 ClosingBal := 0;

//                 Deductions.Reset;
//                 Deductions.SetRange(Deductions.Loan, true);
//                 if Deductions.Find('-') then begin
//                     Assignmatrix.Reset;
//                     Assignmatrix.SetRange("Employee No", "No.");
//                     Assignmatrix.SetRange(Code, Deductions.Code);
//                     if Assignmatrix.Find('+') then begin
//                         RepaymentAmt := Assignmatrix.Amount;

//                         LoanApp.Reset;
//                         LoanApp.SetRange(LoanApp."Employee No", Assignmatrix."Employee No");
//                         LoanApp.SetRange(LoanApp."Loan No", Assignmatrix."Reference No");
//                         if LoanApp.Find('-') then begin
//                             if LoanApp."Stop Loan" then begin
//                                 Assignmatrix.Reset;
//                                 Assignmatrix.SetRange("Employee No", "No.");
//                                 Assignmatrix.SetRange(Code, Deductions.Code);
//                                 Assignmatrix.SetRange("Payroll Period", DateSpecified);
//                                 Assignmatrix.SetRange("Reference No", LoanApp."Loan No");
//                                 Assignmatrix.Delete;
//                             end;
//                             if Loans.Get(LoanApp."Loan Product Type") then begin
//                                 if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Flat Rate" then begin
//                                     LoanApp.CalcFields("Total Repayment", "Total Loan");
//                                     if LoanApp."Total Loan" <> 0 then begin
//                                         /*
//                                           LoanTopup.RESET;
//                                           LoanTopup.SETCURRENTKEY("Loan No","Payroll Period");
//                                           LoanTopup.SETRANGE("Loan No",LoanApplication."Loan No");
//                                           LoanTopup.SETRANGE("Payroll Period",0D,DateSpecified);
//                                           LoanTopup.CALCSUMS(Amount);
//                                          // LoanBalance:=LoanTopup.Amount+LoanApp."Total Repayment"
//                                          */
//                                         ClosingBal := LoanApp."Total Loan" + LoanApp."Total Repayment"
//                                         //  ClosingBal:=LoanTopup.Amount+LoanApp."Total Repayment"
//                                     end else
//                                         ClosingBal := LoanApp."Approved Amount" + LoanApp."Total Repayment";

//                                     // MESSAGE('ClosingBalance=%1\RepaymentAmt=%2',ClosingBal,RepaymentAmt);

//                                     if (ClosingBal = 0) or (ClosingBal < Abs(RepaymentAmt)) then begin
//                                         Assignmatrix.Reset;
//                                         Assignmatrix.SetRange("Employee No", "No.");
//                                         Assignmatrix.SetRange(Code, Deductions.Code);
//                                         Assignmatrix.SetRange("Payroll Period", DateSpecified);
//                                         if Assignmatrix.Find('-') then begin
//                                             Assignmatrix.Amount := ClosingBal;
//                                             Assignmatrix.Modify;
//                                         end;
//                                     end;
//                                 end else if Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Balance" then begin//Amortization

//                                 end;
//                             end;
//                         end;
//                     end;
//                 end;


//                 // MESSAGE('Niko hapa');
//                 /*
//                 Assignmatrix.NEXT;
//                 Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                 Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",LastMonth);
//                 Assignmatrix.SETRANGE(Assignmatrix."Basic Salary Code",TRUE);
//                 IF Assignmatrix.FIND('-') THEN
//                 BEGIN
//                 ScalePointer.RESET;
//                 ScalePointer.SETRANGE(ScalePointer."Basic Pay",Assignmatrix.Amount);
//                 IF ScalePointer.FIND('-') THEN
//                 BEGIN
//                 Employee.Present:=ScalePointer."Salary Pointer";
//                 CurrentMonth:=DATE2DMY(Month,2);
//                 Employee.MODIFY;
//                 END;
                
//                  // assign new pointer
//                  CurrentMonth:=DATE2DMY(Month,2);
                
//                  EVALUATE(CurrentMonthtext,FORMAT(CurrentMonth));
//                  IF CurrentMonthtext=Employee."Incremental Month" THEN BEGIN
//                  IF Employee.Halt<>Employee.Present THEN
//                  BEGIN
//                  NextPointer:=INCSTR(Employee.Present);
//                  IF NextPointer<>Employee.Halt THEN
//                  BEGIN
//                   IF ScalePointer.GET(NextPointer)THEN
//                    // ScalePointer.NEXT;
//                    IF Employee.Halt<>NextPointer THEN BEGIN
//                     Employee.Previous:=Employee.Present;
//                     Employee.Present:=ScalePointer."Salary Pointer";
//                     Employee.MODIFY;
//                     // change employee basic salary to current pointer
//                     END;
//                   END;
//                   END;
//                   END;
//                   */

//                 // IF ScalePointer.GET(Employee.Present) THEN
//                 // BEGIN
//                 Earnings.Reset;
//                 Earnings.SetRange(Earnings."Basic Salary Code", true);
//                 if Earnings.Find('-') then
//                     //  BEGIN
//                     BasicSalaryCode := Earnings.Code;
//                 //  END;

//                 if ScaleBenefits.Get(Employee."Salary Scale", Employee.Present, BasicSalaryCode) then begin
//                     Assignmatrix.Reset;
//                     Assignmatrix.SetRange(Assignmatrix.Code, BasicSalaryCode);
//                     Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
//                     Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                     Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

//                     if Assignmatrix.Find('-') then begin
//                         //  REPEAT
//                         //Assignmatrix.Amount:=ScalePointer."Basic Pay";
//                         Assignmatrix.Amount := ScaleBenefits.Amount;
//                         if Assignmatrix."Manual Entry" = false then
//                             Assignmatrix.Modify;
//                         if Assignmatrix.Modify then;
//                         //  MESSAGE('BASIC PAY OF %1 MODIFIED',Assignmatrix.Amount);
//                         // UNTIL Assignmatrix.NEXT=0;
//                     end
//                     else begin
//                         Assignmatrix.Init;
//                         Assignmatrix."Employee No" := Employee."No.";
//                         Assignmatrix.Type := Assignmatrix.Type::Payment;
//                         Assignmatrix.Code := BasicSalaryCode;
//                         Assignmatrix.Validate(Assignmatrix.Code);
//                         Assignmatrix."Payroll Period" := Month;
//                         //Assignmatrix.Amount:=ScalePointer."Basic Pay";
//                         Assignmatrix.Amount := ScaleBenefits.Amount;
//                         Assignmatrix."Manual Entry" := false;
//                         Assignmatrix.Insert;
//                         if Assignmatrix.Insert then;
//                         // MESSAGE('BASIC PAY OF %1 INSERTED',ScaleBenefits.Amount);
//                     end;
//                 end;



//                 /*
//                  // Assigning House Allowance Automatically
                
//                  Earnings.RESET;
//                  Earnings.SETCURRENTKEY("House Allowance Code");
//                  Earnings.SETRANGE("House Allowance Code",TRUE);
//                  IF Earnings.FIND('-') THEN BEGIN
//                     IF HseAllow.GET(Employee."Salary Scale",Employee."Global Dimension 2 Code") THEN BEGIN
//                       // if house all. already assigned then modify the amount else insert new
//                       //Employee No,Type,Code,Payroll Period,Department Code
//                        Assignmatrix.RESET;
//                        Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
//                        Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
//                        Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                        Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                        Assignmatrix.DELETEALL;
                
//                       IF Assignmatrix.GET(Employee."No.",Assignmatrix.Type::Payment,Earnings.Code,
//                         Month,Employee."Global Dimension 2 Code") THEN BEGIN
//                           Assignmatrix.Amount:=HseAllow."House Allowance";
//                           Assignmatrix.MODIFY;
//                           IF Assignmatrix.Amount=0 THEN
//                              Assignmatrix.DELETE;
//                        END ELSE BEGIN
//                          Assignmatrix.INIT;
//                          Assignmatrix."Employee No":=Employee."No.";
//                          Assignmatrix.Type:=Assignmatrix.Type::Payment;
//                          Assignmatrix.Code:=Earnings.Code;
//                          Assignmatrix.VALIDATE(Code);
//                          Assignmatrix."Payroll Period":=Month;
//                          Assignmatrix."Global Dimension 2 Code":=Employee."Global Dimension 2 Code";
//                          Assignmatrix.Amount:=HseAllow."House Allowance";
//                          Assignmatrix."Posting Group Filter":=Employee."Posting Group";
//                          Assignmatrix.VALIDATE(Amount);
//                          IF Assignmatrix.Amount<>0 THEN
//                           Assignmatrix.INSERT;
                
//                        END;
                
//                     END ELSE BEGIN
//                        Assignmatrix.RESET;
//                        Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
//                        Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
//                        Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                        Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                        Assignmatrix.DELETEALL;
                
//                     END;
//                  END;
//                  // end of house allowance
                
//                 //Assigning Responsibility allowance automatically
                
//                  Earnings.RESET;
//                  Earnings.SETCURRENTKEY("Responsibility Allowance Code");
//                  Earnings.SETRANGE("Responsibility Allowance Code",TRUE);
//                  IF Earnings.FIND('-') THEN BEGIN
//                     //IF SalaryScale.GET(Employee."Salary Scale",Employee."Global Dimension 1 Code") THEN BEGIN
//                     IF SalaryScale.GET(Employee."Salary Scale") THEN BEGIN
                
//                       // if Responibility allowance already assigned then modify the amount else insert new
//                       //Employee No,Type,Code,Payroll Period,Department Code
//                        Assignmatrix.RESET;
//                        Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
//                        Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
//                        Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                        Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                        Assignmatrix.DELETEALL;
//                    //  MESSAGE('Period=%1',Month);
//                      // IF Assignmatrix.GET(Employee."No.",Assignmatrix.Type::Payment,Earnings.Code,
//                        // Month,Employee."Global Dimension 1 Code") THEN BEGIN
//                       IF Assignmatrix.GET(Employee."No.",Assignmatrix.Type::Payment,Earnings.Code,
//                         Month) THEN BEGIN
                
                
//                           Assignmatrix.Amount:=SalaryScale."Responsibility Allowance";
//                           Assignmatrix.MODIFY;
//                           IF Assignmatrix.Amount=0 THEN
//                              Assignmatrix.DELETE;
//                        END ELSE BEGIN
//                          Assignmatrix.INIT;
//                          Assignmatrix."Employee No":=Employee."No.";
//                          Assignmatrix.Type:=Assignmatrix.Type::Payment;
//                          Assignmatrix.Code:=Earnings.Code;
//                          Assignmatrix.VALIDATE(Code);
//                          Assignmatrix."Payroll Period":=Month;
//                          //Assignmatrix."Department Code":=Employee."Global Dimension 1 Code";
//                          Assignmatrix.Amount:=SalaryScale."Responsibility Allowance";
//                          Assignmatrix."Posting Group Filter":=Employee."Posting Group";
//                          Assignmatrix.VALIDATE(Amount);
//                          IF Assignmatrix.Amount<>0 THEN
//                           Assignmatrix.INSERT;
                
//                        END;
                
//                     END ELSE BEGIN
//                        Assignmatrix.RESET;
//                        Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
//                        Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
//                        Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                        Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                        Assignmatrix.DELETEALL;
                
//                     END;
//                  END;
                
                
//                 //End of Responsibility allowance
                
//                 //Assigning Commuter allowance automatically
//                  Earnings.RESET;
//                  Earnings.SETCURRENTKEY("Commuter Allowance Code");
//                  Earnings.SETRANGE("Commuter Allowance Code",TRUE);
//                  IF Earnings.FIND('-') THEN BEGIN
//                     IF SalaryScale.GET(Employee."Salary Scale") THEN BEGIN
                
//                       // if commuter allowance already assigned then modify the amount else insert new
//                       //Employee No,Type,Code,Payroll Period,Department Code
//                        Assignmatrix.RESET;
//                        Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
//                        Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
//                        Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                        Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                        Assignmatrix.DELETEALL;
                
//                       IF Assignmatrix.GET(Employee."No.",Assignmatrix.Type::Payment,Earnings.Code,
//                         Month) THEN BEGIN
                
                
//                           Assignmatrix.Amount:=SalaryScale."Commuter Allowance";
//                           Assignmatrix.MODIFY;
//                           IF Assignmatrix.Amount=0 THEN
//                              Assignmatrix.DELETE;
//                        END ELSE BEGIN
//                          Assignmatrix.INIT;
//                          Assignmatrix."Employee No":=Employee."No.";
//                          Assignmatrix.Type:=Assignmatrix.Type::Payment;
//                          Assignmatrix.Code:=Earnings.Code;
//                          Assignmatrix.VALIDATE(Code);
//                          Assignmatrix."Payroll Period":=Month;
//                          Assignmatrix.Amount:=SalaryScale."Commuter Allowance";
//                          Assignmatrix."Posting Group Filter":=Employee."Posting Group";
//                          Assignmatrix.VALIDATE(Amount);
//                          IF Assignmatrix.Amount<>0 THEN
//                           Assignmatrix.INSERT;
                
//                        END;
                
//                     END ELSE BEGIN
//                        Assignmatrix.RESET;
//                        Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
//                        Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
//                        Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                        Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                        Assignmatrix.DELETEALL;
                
//                     END;
//                  END;
                
                
                
                
//                 //End Of Assigning Commuter allowance
//                 */

//                 /*
//                  Assignmatrix.RESET;
//                  Assignmatrix.SETRANGE(Assignmatrix."Tax Deductible",TRUE);
//                  Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Deduction);
//                  Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
//                  Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
//                  IF Assignmatrix.FIND('-') THEN
//                  BEGIN
//                  Assignmatrix.VALIDATE(Assignmatrix.Code);
//                  Assignmatrix.VALIDATE(Assignmatrix."Employee Voluntary");
//                  Assignmatrix.MODIFY;
//                  END;
//                  */


//                 Deductions.Reset;
//                 Deductions.SetRange(Deductions."PAYE Code", true);
//                 if Deductions.Find('-') then begin
//                     // Delete all Previous PAYE
//                     Assignmatrix.Reset;
//                     Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
//                     Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                     Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                     Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
//                     Assignmatrix.DeleteAll;
//                     // end of deletion
//                 end;

//                 // validate assigment matrix code incase basic salary change and update calculation based on basic salary
//                 Assignmatrix.Reset;
//                 Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                 Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
//                 if Assignmatrix.Find('-') then begin
//                     repeat
//                         if Assignmatrix.Type = Assignmatrix.Type::Payment then begin
//                             if Earnings.Get(Assignmatrix.Code) then begin
//                                 if (Earnings."Calculation Method" = Earnings."calculation method"::"% of Basic pay") or
//                                    (Earnings."Calculation Method" = Earnings."calculation method"::"% of Basic after tax") or
//                                    (Earnings."Calculation Method" = Earnings."calculation method"::"Based on Hourly Rate") or
//                                    (Earnings."Calculation Method" = Earnings."calculation method"::"% of Loan Amount") then begin

//                                     Assignmatrix.Validate(Code);

//                                     //Assignmatrix.VALIDATE(Assignmatrix."Employee Voluntary");
//                                     // Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
//                                     Assignmatrix.Amount := (Assignmatrix.Amount);
//                                     Assignmatrix.Modify;
//                                 end;
//                             end;
//                         end;
//                         if Assignmatrix.Retirement = false then begin
//                             if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
//                                 if Deductions.Get(Assignmatrix.Code) then begin
//                                     if (Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay") or
//                                        (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Hourly Rate") or
//                                        (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Daily Rate ") then begin

//                                         Assignmatrix.Validate(Code);
//                                         //Assignmatrix.VALIDATE(Assignmatrix."Employee Voluntary");
//                                         // Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
//                                         Assignmatrix.Amount := (Assignmatrix.Amount);

//                                         Assignmatrix.Modify;
//                                     end;

//                                 end;
//                             end;
//                         end;
//                         if Assignmatrix.Retirement = true then begin
//                             if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
//                                 if Deductions.Get(Assignmatrix.Code) then begin
//                                     if (Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay") or
//                                        (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Hourly Rate") or
//                                        (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Daily Rate ") then begin

//                                         Assignmatrix.Validate(Code);
//                                         //Assignmatrix.VALIDATE(Assignmatrix."Employee Voluntary");
//                                         //Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
//                                         Assignmatrix.Amount := (Assignmatrix.Amount);

//                                         Assignmatrix.Modify;
//                                     end;
//                                 end;
//                             end;
//                         end;

//                         if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
//                             if Deductions.Get(Assignmatrix.Code) then begin
//                                 if (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table") and
//                                    (Deductions."PAYE Code" = false) then begin
//                                     Assignmatrix.Validate(Code);
//                                     Assignmatrix.Amount := ROUND(Assignmatrix.Amount, 1);
//                                     Assignmatrix.Modify;
//                                 end;
//                             end;
//                         end;

//                     until Assignmatrix.Next = 0;
//                 end;


//                 if Employee."Posting Group" <> 'BOARD' then begin

//                     Deductions.Reset;
//                     Deductions.SetRange(Deductions."PAYE Code", true);
//                     if Deductions.Find('-') then begin
//                         GetPaye.CalculateTaxableAmount(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont);
//                         // Create PAYE
//                         Assignmatrix.Init;
//                         Assignmatrix."Employee No" := Employee."No.";
//                         Assignmatrix.Type := Assignmatrix.Type::Deduction;
//                         Assignmatrix.Code := Deductions.Code;
//                         Assignmatrix.Validate(Code);
//                         Assignmatrix."Payroll Period" := Month;
//                         Assignmatrix."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
//                         if IncomeTax > 0 then
//                             IncomeTax := -IncomeTax;
//                         Assignmatrix.Amount := IncomeTax;
//                         //MESSAGE('Incometax=%1',IncomeTax);
//                         Assignmatrix.Paye := true;
//                         Assignmatrix."Taxable amount" := TaxableAmount;
//                         //MESSAGE('EmpNo%2 TaxableAmt=%1',Assignmatrix."Taxable amount",Employee."No.");
//                         Assignmatrix."Less Pension Contribution" := RetireCont;
//                         //MESSAGE('%1 LessPensionCont=%2',Assignmatrix."Employee No",Assignmatrix."Less Pension Contribution");
//                         Assignmatrix.Paye := true;
//                         Assignmatrix."Posting Group Filter" := Employee."Posting Group";
//                         Assignmatrix.Validate(Amount);
//                         if (Assignmatrix."Taxable amount" <> 0) then
//                             //MESSAGE('Inserted!!!');
//                             Assignmatrix.Insert;
//                     end else
//                         Error('Must specify Paye Code under deductions');

//                 end;
//                 Assignmatrix.Reset;
//                 Assignmatrix.SetRange(Assignmatrix.Code, '869');
//                 Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                 Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                 Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
//                 Assignmatrix.DeleteAll;


//                 RefNo := 'INT-000';
//                 LoanBalance := 0;
//                 TotalTopUp := 0;
//                 InterestAmt := 0;
//                 LoanApplication.Reset;
//                 LoanApplication.SetRange(LoanApplication."Employee No", "No.");
//                 LoanApplication.SetRange("Stop Loan", false);
//                 if LoanApplication.Find('-') then
//                     repeat
//                         RefNo := IncStr(RefNo);
//                         if LoanType.Get(LoanApplication."Loan Product Type") then begin
//                             if LoanType."Calculate Interest" then begin
//                                 if LoanType."Interest Calculation Method" = LoanType."interest calculation method"::"Flat Rate" then begin
//                                     /*
//                                      LoanTopup.RESET;
//                                      LoanTopup.SETCURRENTKEY("Loan No","Payroll Period");
//                                      LoanTopup.SETRANGE("Loan No",LoanApplication."Loan No");
//                                      LoanTopup.SETRANGE("Payroll Period",0D,Month);
//                                      LoanTopup.CALCSUMS(Amount);
//                                      TotalTopUp:=LoanTopup.Amount;

//                                     LoanApplication.SETRANGE(LoanApplication."Date filter",0D,LastMonth);
//                                     LoanApplication.CALCFIELDS(LoanApplication."Total Repayment","Total Loan");
//                                    // LoanApplication.SETRANGE(LoanApplication."Date filter",0D,LastMonth);
//                                    // LoanApplication.CALCFIELDS(LoanApplication."Total Repayment",LoanApplication."Total Loan");
//                                    IF LoanApplication."Total Loan"<>0 THEN BEGIN
//                                      LoanTopup.RESET;
//                                      LoanTopup.SETCURRENTKEY("Loan No","Payroll Period");
//                                      LoanTopup.SETRANGE("Loan No",LoanApplication."Loan No");
//                                      LoanTopup.SETRANGE("Payroll Period",0D,Month);
//                                      LoanTopup.CALCSUMS(Amount);
//                                      TotalTopUp:=LoanTopup.Amount;

//                                    LoanBalance:=TotalTopUp+LoanApplication."Total Repayment"
//                                    */

//                                     //LoanApplication.RESET;
//                                     //LoanApplication.SETRANGE(LoanApplication."Loan Product Type",Loans.Code);
//                                     LoanApplication.SetRange("Date filter", 0D, LastMonth);
//                                     LoanApplication.CalcFields("Total Loan", "Total Repayment");
//                                     //IF  Loans."Interest Calculation Method"=Loans."Interest Calculation Method"::"Flat Rate" THEN BEGIN
//                                     if LoanApplication."Total Loan" <> 0 then begin
//                                         //MESSAGE('%1',LoanApplication."Total Loan");
//                                         LoanTopup.Reset;
//                                         LoanTopup.SetCurrentkey("Loan No", "Payroll Period");
//                                         LoanTopup.SetRange("Loan No", LoanApplication."Loan No");
//                                         LoanTopup.SetRange("Payroll Period", 0D, Month);
//                                         LoanTopup.CalcSums(Amount);
//                                         LoanBalance := LoanTopup.Amount + LoanApplication."Total Repayment"

//                                     end else
//                                         LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";

//                                     InterestAmt := LoanType."Interest Rate" / 100 / 12 * LoanBalance;
//                                     Informational := false;
//                                     //END;
//                                     //MESSAGE('Interest=%1\ Balance=%2',InterestAmt,LoanBalance);
//                                 end else if LoanType."Interest Calculation Method" = LoanType."interest calculation method"::"Reducing Balance" then begin
//                                     //MESSAGE('%1\%2',LoanType.Description,Month);
//                                     InterestAmt := 0;
//                                     RepSchedule.Reset;
//                                     RepSchedule.SetRange(RepSchedule."Loan No", LoanApplication."Loan No");
//                                     RepSchedule.SetRange("Employee No", LoanApplication."Employee No");
//                                     RepSchedule.SetRange("Repayment Date", Month);
//                                     if RepSchedule.Find('-') then begin
//                                         Informational := true;
//                                         InterestAmt := RepSchedule."Monthly Interest";

//                                         //MESSAGE('Emp No %2\%3 Interest=%1',InterestAmt,RepSchedule."Employee No",LoanType.Description);

//                                         Assignmatrix.Init;
//                                         Assignmatrix."Employee No" := Employee."No.";
//                                         Assignmatrix.Type := Assignmatrix.Type::Deduction;
//                                         Assignmatrix.Code := LoanType."Principal Deduction Code";
//                                         Assignmatrix.Validate(Code);
//                                         Assignmatrix."Payroll Period" := Month;
//                                         Assignmatrix."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
//                                         //Assignmatrix.Amount:=-ABS(RepSchedule."Principal Repayment");

//                                         Assignmatrix.Amount := -Abs(RepSchedule."Monthly Repayment" - RepSchedule."Monthly Interest");

//                                         // MESSAGE('%1-%2=%3',RepSchedule."Monthly Repayment",RepSchedule."Monthly Interest",Assignmatrix.Amount);

//                                         Assignmatrix.Validate(Amount);
//                                         Assignmatrix.Information := true;
//                                         Assignmatrix."Loan Balance" := LoanBalance;
//                                         // Assignmatrix."Taxable amount":=0;
//                                         Assignmatrix."Reference No" := LoanApplication."Loan No";
//                                         Assignmatrix."Posting Group Filter" := Employee."Posting Group";

//                                         Assmatrix.Reset;
//                                         Assmatrix.SetRange(Assmatrix."Employee No", Assignmatrix."Employee No");
//                                         Assmatrix.SetRange(Assmatrix.Type, Assignmatrix.Type);
//                                         Assmatrix.SetRange(Assmatrix.Code, Assignmatrix.Code);
//                                         Assmatrix.SetRange(Assmatrix."Payroll Period", Assignmatrix."Payroll Period");
//                                         Assmatrix.SetRange(Assmatrix."Reference No", Assignmatrix."Reference No");
//                                         if Assmatrix.Find('-') then begin
//                                             // IF Assignmatrix.GET(Assignmatrix."Employee No",Assignmatrix.Type,Assignmatrix.Code,Assignmatrix."Payroll Period",Assignmatrix."Reference No") THEN BEGIN

//                                             Assignmatrix.Modify;
//                                             // MESSAGE('Modify Principal=%1',Assignmatrix.Amount);
//                                         end else begin
//                                             Assignmatrix.Insert;
//                                             // MESSAGE('Insert Principal=%1',Assignmatrix.Amount);

//                                         end;
//                                     end;
//                                 end;
//                             end else
//                                 InterestAmt := 0;

//                             InterestAmt := PayrollRounding(InterestAmt);

//                             Assignmatrix.Reset;
//                             Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
//                             Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                             Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                             Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
//                             Assignmatrix.Init;
//                             Assignmatrix."Employee No" := Employee."No.";

//                             Assignmatrix.Type := Assignmatrix.Type::Deduction;
//                             Assignmatrix.Code := LoanType."Interest Deduction Code";
//                             Assignmatrix.Validate(Code);
//                             Assignmatrix."Payroll Period" := Month;
//                             Assignmatrix."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";

//                             Assignmatrix.Amount := -Abs(InterestAmt);
//                             Assignmatrix.Validate(Amount);
//                             //  MESSAGE('Interest=%1',Assignmatrix.Amount);
//                             Assignmatrix."Loan Balance" := LoanBalance;
//                             if Informational then
//                                 Assignmatrix.Information := true;
//                             // Assignmatrix."Taxable amount":=0;
//                             Assignmatrix."Reference No" := LoanApplication."Loan No";
//                             Assignmatrix."Posting Group Filter" := Employee."Posting Group";
//                             if not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type, Assignmatrix.Code, Assignmatrix."Payroll Period",
//                              Assignmatrix."Reference No") then begin
//                                 if Assignmatrix.Amount <> 0 then
//                                     Assignmatrix.Insert;

//                             end else begin
//                                 Assignmatrix.Amount := -Abs(InterestAmt);
//                                 Assignmatrix.Modify;
//                                 if Assignmatrix.Amount = 0 then
//                                     Assignmatrix.Delete;
//                             end;

//                         end;


//                         if LoanApplication."Stop Loan" then begin
//                             Assignmatrix.Reset;
//                             Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
//                             Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                             Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                             Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
//                             Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
//                             Assignmatrix.DeleteAll;


//                             Assignmatrix.Reset;
//                             Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
//                             Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                             Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                             Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
//                             Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
//                             Assignmatrix.DeleteAll;

//                             // MESSAGE('Repayment and Interest Details deleted');

//                         end;

//                     until LoanApplication.Next = 0;

//                 LoanApplication.Reset;
//                 LoanApplication.SetRange(LoanApplication."Employee No", "No.");
//                 LoanApplication.SetRange("Stop Loan", true);
//                 if LoanApplication.Find('-') then
//                     repeat
//                         LoanType.Reset;
//                         if LoanType.Get(LoanApplication."Loan Product Type") then begin

//                             Assignmatrix.Reset;
//                             Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
//                             Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                             Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                             Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
//                             Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
//                             //Assignmatrix.SETRANGE(Assignmatrix."Reference No",LoanApplication."Loan No");
//                             Assignmatrix.DeleteAll;


//                             Assignmatrix.Reset;
//                             Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
//                             Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
//                             Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
//                             Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
//                             Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
//                             //Assignmatrix.SETRANGE(Assignmatrix."Reference No",LoanApplication."Loan No");
//                             Assignmatrix.DeleteAll;
//                         end;
//                     //MESSAGE('Repayment and Interest Details deleted');
//                     until LoanApplication.Next = 0;




//                 Window.Update(1, Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");

//             end;

//             trigger OnPostDataItem()
//             begin
//                 Window.Close;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 Window.Open('Calculating Payroll For ##############################1', EmployeeName);

//                 PayrollPeriod.SetRange(Closed, false);
//                 if PayrollPeriod.Find('-') then
//                     Month := PayrollPeriod."Starting Date";
//                 // MESSAGE('Month=%1',Month);
//                 LastMonth := CalcDate('-1M', Month);
//                 /*
//                 CUser:=USERID;
//                 GetGroup.GetUserGroup(CUser,GroupCode);
//                 SETRANGE(Employee."Posting Group",GroupCode);
//                 */

//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         GetPayPeriod;

//         //PayPeriodtext:="Employee PayrollX".GETFILTER("Pay Period Filter");
//         // IF PayPeriodtext='' THEN
//         // ERROR('Pay period must be specified for this report');

//         //DateSpecified:="Employee PayrollX".GETRANGEMIN("Employee PayrollX"."Pay Period Filter");
//         DateSpecified := BeginDate;
//         if PayPeriod.Get(DateSpecified) then
//             PayPeriodtext := PayPeriod.Name;
//         EndDate := CalcDate('1M', DateSpecified - 1);
//         CompRec.Get;
//         TaxCode := CompRec."Tax Table";
//     end;

//     var
//         Assignmatrix: Record "Assignment Matrix-X1";
//         BeginDate: Date;
//         DateSpecified: Date;
//         BasicSalary: Decimal;
//         TaxableAmount: Decimal;
//         CompRec: Record "Human Resources Setup";
//         HseLimit: Decimal;
//         TaxCode: Code[10];
//         retirecontribution: Decimal;
//         ExcessRetirement: Decimal;
//         GrossPay: Decimal;
//         TotalBenefits: Decimal;
//         TaxablePay: Decimal;
//         RetireCont: Decimal;
//         TotalQuarters: Decimal;
//         IncomeTax: Decimal;
//         relief: Decimal;
//         EmpRec: Record Employee;
//         NetPay: Decimal;
//         NetPay1: Decimal;
//         Index: Integer;
//         Intex: Integer;
//         AmountRemaining: Decimal;
//         PayPeriod: Record "Payroll PeriodX1";
//         DenomArray: array[1, 12] of Text[50];
//         NoOfUnitsArray: array[1, 12] of Integer;
//         AmountArray: array[1, 60] of Decimal;
//         PayMode: Text[30];
//         PayPeriodtext: Text[30];
//         EndDate: Date;
//         DaysinAmonth: Decimal;
//         HoursInamonth: Decimal;
//         Earnings: Record EarningsX1;
//         CfMpr: Decimal;
//         Deductions: Record DeductionsX1;
//         NormalOvertimeHours: Decimal;
//         WeekendOvertime: Decimal;
//         PayrollPeriod: Record "Payroll PeriodX1";
//         Window: Dialog;
//         EmployeeName: Text[230];
//         NoOfDays: Integer;
//         Month: Date;
//         GetPaye: Codeunit Payroll5;
//         GetGroup: Codeunit Payroll5;
//         GroupCode: Code[20];
//         CUser: Code[20];
//         ScalePointer: Record "Salary Pointers1";
//         SalaryScale: Record "Salary Scales21";
//         CurrentMonth: Integer;
//         CurrentMonthtext: Text[30];
//         HseAllow: Record "House Allowance Matrix21";
//         Ded: Record DeductionsX1;
//         Assmatrix: Record "Assignment Matrix-X1";
//         LoanType: Record "Loan Product Type1";
//         LoanApplication: Record "Loan Application1";
//         LoanBalance: Decimal;
//         InterestAmt: Decimal;
//         RefNo: Code[20];
//         LastMonth: Date;
//         NextPointer: Code[10];
//         ScaleBenefits: Record "Scale Benefits1";
//         BasicSalaryCode: Code[10];
//         LoanTopUp: Record "Loan Top-up";
//         TotalTopUp: Decimal;
//         RepSchedule: Record "Repayment Schedule1";
//         Informational: Boolean;
//         ClosingBal: Decimal;
//         RepaymentAmt: Decimal;


//     procedure GetTaxBracket(var TaxableAmount: Decimal)
//     var
//         TaxTable: Record BracketsX1;
//         TotalTax: Decimal;
//         Tax: Decimal;
//         EndTax: Boolean;
//     begin
//         AmountRemaining := TaxableAmount;
//         AmountRemaining := ROUND(AmountRemaining, 0.01);
//         EndTax := false;
//         TaxTable.SetRange("Table Code", TaxCode);


//         if TaxTable.Find('-') then begin
//             repeat

//                 if AmountRemaining <= 0 then
//                     EndTax := true
//                 else begin
//                     if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
//                         Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100

//                     else begin
//                         Tax := AmountRemaining * TaxTable.Percentage / 100;
//                         TotalTax := TotalTax + Tax;
//                         EndTax := true;
//                     end;
//                     if not EndTax then begin
//                         AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
//                         TotalTax := TotalTax + Tax;
//                     end;
//                 end;
//             until (TaxTable.Next = 0) or EndTax = true;
//         end;
//         TotalTax := TotalTax;
//         TotalTax := PayrollRounding(TotalTax);
//         IncomeTax := -TotalTax;
//         if not Employee."Pays tax" then
//             IncomeTax := 0;
//         //MESSAGE('Niko hapa');
//     end;


//     procedure GetPayPeriod()
//     begin
//         PayPeriod.SetRange(PayPeriod."Close Pay", false);
//         if PayPeriod.Find('-') then begin
//             //PayPeriodtext:=PayPeriod.Name;
//             BeginDate := PayPeriod."Starting Date";
//         end;
//         // MESSAGE('BeginDate=%1',BeginDate);
//     end;


//     procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
//     var
//         HRsetup: Record "Human Resources Setup";
//     begin

//         HRsetup.Get;
//         if HRsetup."Payroll Rounding Precision" = 0 then
//             Error('You must specify the rounding precision under HR setup');

//         if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
//             PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

//         if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
//             PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

//         if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
//             PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
//     end;
 }

