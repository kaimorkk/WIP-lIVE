Table 52193550 "Transaction Schedule Income"
{
    DrillDownPageID = "Transaction Schedule111";
    LookupPageID = "Transaction Schedule111";

    fields
    {
        field(1; No; Code[50])
        {
            TableRelation = Transactions.No;
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Account No"; Code[30])
        {
            NotBlank = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                // AccountHolders.Reset;
                // if AccountHolders.Get("Account No") then begin
                //     "Account Name" := AccountHolders.Name;
                //     "Account Type Name" := AccountHolders."Account Type";
                //     "CIF No" := AccountHolders."BOSA Account No";
                // end;
                // //RecoverFOSA;
                // RecoverSTO;

                // Transactions.Reset;
                // if Transactions.Get(No) then begin



                //     SDeductions.Reset;
                //     SDeductions.SetRange(SDeductions."Transaction No", No);
                //     SDeductions.SetRange(SDeductions."Vendor No", "Account No");
                //     SDeductions.DeleteAll;


                //     LApplications.Reset;
                //     LApplications.SetRange(LApplications.Source, LApplications.Source::FOSA);
                //     LApplications.SetRange(LApplications."Account No", "Account No");
                //     LApplications.SetRange(LApplications.Posted, true);
                //     LApplications.SetRange(LApplications."Income Type", Transactions."Income Type");

                //     if LApplications.Find('-') then begin
                //         repeat

                //             LApplications.CalcFields("Outstanding Balance", "Interest Due");
                //             if LApplications."Outstanding Balance" > 0 then begin

                //                 SDeductions.Init;
                //                 SDeductions."Transaction No" := No;
                //                 SDeductions."Vendor No" := "Account No";
                //                 SDeductions.Source := SDeductions.Source::FOSA;
                //                 SDeductions."Loan No" := LApplications."Loan No.";
                //                 SDeductions."Loan Type" := LApplications."Loan Product Type Name";
                //                 if LApplications.Installments = 0 then begin
                //                     SDeductions."Total Repayment" := LApplications."Outstanding Balance" + LApplications."Interest Due";
                //                     SDeductions.Principal := LApplications."Outstanding Balance"
                //                 end
                //                 else begin
                //                     if LApplications."Outstanding Balance" < LApplications.Repayment then begin
                //                         SDeductions."Total Repayment" := LApplications."Outstanding Balance" + LApplications."Interest Due";
                //                         SDeductions.Principal := LApplications."Outstanding Balance"
                //                     end
                //                     else begin
                //                         SDeductions."Total Repayment" := LApplications.Repayment + LApplications."Interest Due";
                //                         SDeductions.Principal := LApplications.Repayment;
                //                     end;
                //                 end;
                //                 SDeductions.Interest := LApplications."Interest Due";
                //                 SDeductions.Insert;

                //             end;


                //         until LApplications.Next = 0;


                //     end;
                // end;
                // // END;
            end;
        }
        field(4; "Account Name"; Text[60])
        {
        }
        field(5; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                /*
                TotalDN:=0;
                AddVarDN:=0;
                
                //MODIFY;
                
                TransactionSchedule.RESET;
                
                TransactionSchedule.SETRANGE(TransactionSchedule.No,No);
                
                IF TransactionSchedule.FIND('-') THEN BEGIN
                REPEAT
                
                AddVarDN:=0;
                AddVarDN:=TransactionSchedule."Account Name";
                TotalDN:=TotalDN+AddVarDN;
                
                UNTIL TransactionSchedule.NEXT=0;
                END;
                
                Transactions.RESET;
                IF Transactions.GET(No) THEN BEGIN;
                Transactions."Schedule Amount":=TotalDN;
                //IF "Bonus?"=FALSE THEN BEGIN
                //IF Transactions."Income Type"=Transactions."Income Type"::Salary THEN BEGIN
                //RecoverBOSA;
                //RecoverSTO;
                //END;
                //END;
                Transactions.MODIFY;
                END;
                */

            end;
        }
        field(6; "Account Type Name"; Text[50])
        {
        }
        field(7; "Transfer By EFT"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(8; "External Account No"; Code[30])
        {
        }
        field(9; "Loan Deductions-BOSA"; Decimal)
        {
            Editable = false;
        }
        field(10; "External Account Name"; Text[150])
        {
        }
        field(11; "Do Not Effect Deductions"; Boolean)
        {
        }
        field(12; Imported; Boolean)
        {
        }
        field(13; "Import Date"; Date)
        {
        }
        field(14; "EFT Amount"; Decimal)
        {
        }
        field(15; "Staff No/Employee No"; Code[20])
        {
        }
        field(16; "Transferred To EFT"; Boolean)
        {
        }
        field(17; "Date transferred"; Date)
        {
        }
        field(18; "Time Transferred"; Time)
        {
        }
        field(19; "Transferred By"; Code[20])
        {
        }
        field(20; "Bank Code"; Code[20])
        {
        }
        field(21; "New Import"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(22; "Customer ID. No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*AccountHolders.RESET;
                AccountHolders.SETRANGE(AccountHolders."No.","Line No.");
                IF AccountHolders.FIND('-') THEN BEGIN
                "Account No":=AccountHolders.Name;
                END;
                 */

            end;
        }
        field(23; "Comms Charged"; Decimal)
        {
        }
        field(24; "Standing Order"; Decimal)
        {
            CalcFormula = sum("STO Schedule"."Amount Deducted" where("Transaction No." = field(No),
                                                                      "Source No." = field("Account No")));
            FieldClass = FlowField;
        }
        field(25; Name; Text[80])
        {
        }
        field(26; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(27; "Loan No."; Code[20])
        {
            //TableRelation = Loans."Loan No." where (Posted=filter(true),
            // "Account No" =field("Account No"));

            trigger OnValidate()
            var
            // LoanRec: Record Loans;
            // LRSchedule: Record "Loan Repayment Schedule";
            begin
                // if LoanRec.Get("Loan No.") then begin
                //     //Get the Current Loan to be paid as per the Schedule
                //     LoanRec.CalcFields(LoanRec."Interest Due");

                //     //Get the Schedule
                //     LRSchedule.Reset;
                //     LRSchedule.SetCurrentkey(LRSchedule."Instalment No", LRSchedule."Repayment Code");
                //     LRSchedule.SetRange(LRSchedule."Loan No.", LoanRec."Loan No.");
                //     LRSchedule.SetRange(LRSchedule."Fully Paid", false);

                //     if LRSchedule.Find('-') then begin
                //         PrincipleRepayAmnt := LRSchedule."Principal Repayment";
                //         InterestRepayAmnt := LRSchedule."Monthly Interest";

                //         if Rec.Amount <> 0 then begin
                //             //"Repayment Code":=LRSchedule."Repayment Code";
                //             LoanRec."Interest Due" := LoanRec."Loan Interest Repayment";
                //             "Loan Type" := LoanRec."Loan Product Type";
                //             //"Installment Nos":=LOAN.Installments;
                //             Interest := InterestRepayAmnt;//LOAN."Interest Due";
                //             Principal := (Amount - InterestRepayAmnt);

                //         end else if Rec.Amount = 0 then begin
                //             Principal := 0;
                //             Interest := 0;
                //         end;
                //     end;

                // end;


                //     //Update if Loan repayment
                //     if "Loan No." <> '' then begin
                //         "Loan Repayment" := true;
                //         FosaSetup.Get;
                //         if FosaCharge.Get(FosaSetup."Loan Commission") then begin
                //             if FosaCharge."Use Percentage" then
                //                 "Comms Charged" := Amount * FosaCharge."Percentage of Amount" / 100;
                //         end;
                //     end else begin
                //         "Loan Repayment" := false;
                //         Principal := 0;
                //         Interest := 0;
                //         "Loan Type" := '';
                //     end;
            end;
        }
        field(28; "CIF No"; Code[20])
        {
        }
        field(29; "Loan Repayment"; Boolean)
        {
        }
        field(30; "Loan Type"; Code[20])
        {
        }
        field(31; Principal; Decimal)
        {
        }
        field(32; Interest; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No, "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Loan Repayment")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        AccountHolders: Record Vendor;
        TotalDN: Decimal;
        AddVarDN: Decimal;
        Transactions: Record Transactions;
        TransactionSchedule: Record "Transaction Schedule Income";
        // LApplications: Record Loans;
        // LTypes: Record "Loan Product Types";
        SDeductions: Record "Income Processing Deductions";
        // LBOSA: Record Loans;
        RunBal: Decimal;
        GenSetup: Record "General Set-Up";
        Cust: Record Customer;
        // LoanApp: Record Loans;
        // LoanType: Record "Loan Product Types";
        LineN: Integer;
        Gnljnline: Record "Gen. Journal Line";
        STO: Record "Standing Orders";
        STOSched: Record "STO Schedule";
        PrincipleRepayAmnt: Decimal;
        InterestRepayAmnt: Decimal;
        FosaSetup: Record "Fosa Setup";
        FosaCharge: Record "Charges - FOSA";


    procedure RecoverBOSA()
    begin
        /*SDeductions.RESET;
        SDeductions.SETRANGE(SDeductions."Transaction No",No);
        SDeductions.SETRANGE(SDeductions."CID NO","Customer ID. No.");
        SDeductions.SETRANGE(SDeductions."KTDA No.","KTDA No.");
        SDeductions.DELETEALL;
        
        
        GenSetup.GET;
        GenSetup.TESTFIELD(GenSetup."Loan Repayment %");
        GenSetup.TESTFIELD(GenSetup."Deposit Contribution %");
        RunBal:=Amount*0.01*GenSetup."Loan Repayment %";
        Cust.RESET;
        Cust.SETCURRENTKEY(Cust."Customer CID  No.");
        Cust.SETRANGE(Cust."Customer Type",Cust."Customer Type"::"1");
        Cust.SETRANGE(Cust."Customer CID  No.","Customer ID. No.");
        IF Cust.FIND('-') THEN BEGIN
        IF Cust.Status=Cust.Status::"0" THEN BEGIN
        //Recover penalties
        LoanType.RESET;
        LoanType.SETCURRENTKEY(LoanType.Priority);
        LoanType.SETRANGE(LoanType."FOSA/BOSA/MICRO FINANCE",LoanType."FOSA/BOSA/MICRO FINANCE"::"0");
        LoanType.SETRANGE(LoanType."Staff Loans",FALSE);
        IF LoanType.FIND('-') THEN BEGIN
        REPEAT
        LoanApp.RESET;
        LoanApp.SETCURRENTKEY(Source,"Loan Product Type","Member Code",LoanApp."Issued Date");
        LoanApp.SETRANGE(LoanApp.Source,LoanApp.Source::"0");
        LoanApp.SETRANGE(LoanApp."Loan Product Type",LoanType.Code);
        LoanApp.SETRANGE(LoanApp."Member Code",Cust."No.");
        IF LoanApp.FIND('-') THEN BEGIN
        REPEAT
        IF RunBal>0 THEN BEGIN
        LoanApp.CALCFIELDS(LoanApp."Oustanding Penalty");
        
        IF LoanApp."Oustanding Penalty">0 THEN BEGIN
        SDeductions.RESET;
        SDeductions.SETRANGE(SDeductions."Loan No",LoanApp."Loan  No.");
        SDeductions.SETRANGE(SDeductions."KTDA No.","KTDA No.");
        IF NOT SDeductions.FIND('-') THEN BEGIN
        SDeductions.INIT;
        SDeductions."Transaction No":=No;
        SDeductions."Vendor No":=Cust."No.";
        SDeductions."KTDA No.":="KTDA No.";
        SDeductions."Loan No":=LoanApp."Loan  No.";
        SDeductions.Source:=SDeductions.Source::"0";
        SDeductions."Loan Type":=LoanApp."Loan Product Type";
        SDeductions."CID NO":=LoanApp."Customer CID. No.";
        IF RunBal > LoanApp."Oustanding Penalty" THEN BEGIN
        SDeductions.Penalties:=LoanApp."Oustanding Penalty";
        SDeductions."Total Repayment":=LoanApp."Oustanding Penalty";
        END ELSE BEGIN
        SDeductions.Penalties:=RunBal;
        SDeductions."Total Repayment":=RunBal;
        END;
        SDeductions.INSERT;
        END;
        END;
        RunBal:=RunBal-LoanApp."Oustanding Penalty";
        END;
        UNTIL LoanApp.NEXT = 0;
        END;
        UNTIL LoanType.NEXT = 0;
        END;
        
        //Recover Appraisal
        LoanType.RESET;
        LoanType.SETCURRENTKEY(LoanType.Priority);
        LoanType.SETRANGE(LoanType."FOSA/BOSA/MICRO FINANCE",LoanType."FOSA/BOSA/MICRO FINANCE"::"0");
        LoanType.SETRANGE(LoanType."Staff Loans",FALSE);
        IF LoanType.FIND('-') THEN BEGIN
        REPEAT
        LoanApp.RESET;
        LoanApp.SETCURRENTKEY(Source,"Loan Product Type","Member Code",LoanApp."Issued Date");
        LoanApp.SETRANGE(LoanApp.Source,LoanApp.Source::"0");
        LoanApp.SETRANGE(LoanApp."Loan Product Type",LoanType.Code);
        LoanApp.SETRANGE(LoanApp."Member Code",Cust."No.");
        IF LoanApp.FIND('-') THEN BEGIN
        REPEAT
        IF RunBal>0 THEN BEGIN
        LoanApp.CALCFIELDS(LoanApp."Oustanding Appraisal");
        IF LoanApp."Oustanding Appraisal">0 THEN BEGIN
        SDeductions.RESET;
        SDeductions.SETRANGE(SDeductions."Loan No",LoanApp."Loan  No.");
        SDeductions.SETRANGE(SDeductions."KTDA No.","KTDA No.");
        SDeductions.SETRANGE(SDeductions."Transaction No",No);
        IF SDeductions.FIND('-') THEN BEGIN
        IF RunBal>LoanApp."Oustanding Appraisal" THEN BEGIN
        SDeductions.Appraisal:=LoanApp."Oustanding Appraisal";
        SDeductions."Total Repayment":=SDeductions."Total Repayment"+LoanApp."Oustanding Appraisal";
        SDeductions.MODIFY;
        END ELSE BEGIN
        SDeductions.Appraisal:=RunBal;
        SDeductions."Total Repayment":=SDeductions."Total Repayment"+RunBal;
        SDeductions.MODIFY;
        END
        END ELSE BEGIN
        SDeductions.INIT;
        SDeductions."Transaction No":=No;
        SDeductions."Vendor No":=Cust."No.";
        SDeductions.Source:=SDeductions.Source::"0";
        SDeductions."CID NO":=LoanApp."Customer CID. No.";
        SDeductions."KTDA No.":="KTDA No.";
        SDeductions."Loan No":=LoanApp."Loan  No.";
        SDeductions."Loan Type":=LoanApp."Loan Product Type";
        IF RunBal >LoanApp."Oustanding Appraisal" THEN BEGIN
        SDeductions.Appraisal:=LoanApp."Oustanding Appraisal";
        SDeductions."Total Repayment":=LoanApp."Oustanding Appraisal";
        END ELSE BEGIN
        SDeductions.Appraisal:=RunBal;
        SDeductions."Total Repayment":=RunBal;
        END;
        SDeductions.INSERT;
        END;
        RunBal:=RunBal-LoanApp."Oustanding Appraisal";
        END;
        //RunBal:=RunBal-LoanApp."Oustanding Appraisal";
        END;
        UNTIL LoanApp.NEXT = 0;
        END;
        UNTIL LoanType.NEXT = 0;
        END;
        
        //Recover Interest
        LoanType.RESET;
        LoanType.SETCURRENTKEY(LoanType.Priority);
        LoanType.SETRANGE(LoanType."FOSA/BOSA/MICRO FINANCE",LoanType."FOSA/BOSA/MICRO FINANCE"::"0");
        LoanType.SETRANGE(LoanType."Staff Loans",FALSE);
        IF LoanType.FIND('-') THEN BEGIN
        REPEAT
        LoanApp.RESET;
        LoanApp.SETCURRENTKEY(Source,"Loan Product Type","Member Code",LoanApp."Issued Date");
        LoanApp.SETRANGE(LoanApp.Source,LoanApp.Source::"0");
        LoanApp.SETRANGE(LoanApp."Loan Product Type",LoanType.Code);
        LoanApp.SETRANGE(LoanApp."Member Code",Cust."No.");
        
        IF LoanApp.FIND('-') THEN BEGIN
        REPEAT
        IF RunBal>0 THEN BEGIN
        LoanApp.CALCFIELDS(LoanApp."Oustanding Interest to Date");
        //MESSAGE('%1',LoanApp."Oustanding Interest to Date");
        IF LoanApp."Oustanding Interest to Date">0 THEN BEGIN
        //MESSAGE('%1',LoanApp."Oustanding Interest to Date");
        SDeductions.RESET;
        SDeductions.SETRANGE(SDeductions."Loan No",LoanApp."Loan  No.");
        SDeductions.SETRANGE(SDeductions."KTDA No.","KTDA No.");
        SDeductions.SETRANGE(SDeductions."Transaction No",No);
        IF SDeductions.FIND('-') THEN BEGIN
        IF RunBal>LoanApp."Oustanding Interest to Date" THEN BEGIN
        SDeductions.Interest:=LoanApp."Oustanding Interest to Date";
        SDeductions."Total Repayment":=SDeductions."Total Repayment"+LoanApp."Oustanding Interest to Date";
        SDeductions.MODIFY;
        END ELSE BEGIN
        SDeductions.Interest:=RunBal;
        SDeductions."Total Repayment":=SDeductions."Total Repayment"+RunBal;
        SDeductions.MODIFY;
        END;
        END ELSE BEGIN
        SDeductions.INIT;
        SDeductions."Transaction No":=No;
        SDeductions."Vendor No":=Cust."No.";
        SDeductions.Source:=SDeductions.Source::"0";
        SDeductions."CID NO":=LoanApp."Customer CID. No.";
        SDeductions."Loan No":=LoanApp."Loan  No.";
        SDeductions."KTDA No.":="KTDA No.";
        SDeductions."Loan Type":=LoanApp."Loan Product Type";
        IF RunBal >LoanApp."Oustanding Interest to Date" THEN BEGIN
        SDeductions.Interest:=LoanApp."Oustanding Interest to Date";
        SDeductions."Total Repayment":=LoanApp."Oustanding Interest to Date";
        END ELSE BEGIN
        SDeductions.Interest:=RunBal;
        SDeductions."Total Repayment":=RunBal;
        END;
        SDeductions.INSERT;
        
        END;
        RunBal:=RunBal-LoanApp."Oustanding Interest to Date";
        END;
        //RunBal:=RunBal-LoanApp."Oustanding Interest to Date";
        END;
        UNTIL LoanApp.NEXT = 0;
        END;
        UNTIL LoanType.NEXT = 0;
        END;
        
        //Recover Principal
        LoanType.RESET;
        LoanType.SETCURRENTKEY(LoanType.Priority);
        LoanType.SETRANGE(LoanType."FOSA/BOSA/MICRO FINANCE",LoanType."FOSA/BOSA/MICRO FINANCE"::"0");
        LoanType.SETRANGE(LoanType."Staff Loans",FALSE);
        IF LoanType.FIND('-') THEN BEGIN
        REPEAT
        LoanApp.RESET;
        LoanApp.SETCURRENTKEY(Source,"Loan Product Type","Member Code",LoanApp."Issued Date");
        LoanApp.SETRANGE(LoanApp.Source,LoanApp.Source::"0");
        LoanApp.SETRANGE(LoanApp."Loan Product Type",LoanType.Code);
        LoanApp.SETRANGE(LoanApp."Member Code",Cust."No.");
        IF LoanApp.FIND('-') THEN BEGIN
        REPEAT
        
        IF RunBal>0 THEN BEGIN
            LoanApp.CALCFIELDS(LoanApp."Oustanding Balance");
              IF LoanApp."Oustanding Balance">0 THEN BEGIN
                 SDeductions.RESET;
                 SDeductions.SETRANGE(SDeductions."Loan No",LoanApp."Loan  No.");
                 SDeductions.SETRANGE(SDeductions."KTDA No.","KTDA No.");
                 SDeductions.SETRANGE(SDeductions."Transaction No",No);
                        IF SDeductions.FIND('-') THEN BEGIN
                           IF RunBal>LoanApp.Repayment THEN BEGIN
                              IF LoanApp.Repayment>LoanApp."Oustanding Balance" THEN BEGIN
                               SDeductions.Principal:=LoanApp."Oustanding Balance";
                               SDeductions."Total Repayment":=SDeductions."Total Repayment"+LoanApp."Oustanding Balance";
                              END ELSE BEGIN
                              SDeductions.Principal:=LoanApp.Repayment;
                              SDeductions."Total Repayment":=SDeductions."Total Repayment"+LoanApp.Repayment;
                              END;
                           END;
                           IF  RunBal<=LoanApp.Repayment THEN BEGIN
                              SDeductions.Principal:=RunBal;
                              SDeductions."Total Repayment":=SDeductions."Total Repayment"+RunBal;
                           END;
                            SDeductions.MODIFY;
                        END ELSE BEGIN
                           SDeductions.INIT;
                           SDeductions."Transaction No":=No;
                           SDeductions.Source:=SDeductions.Source::"0";
                           SDeductions."KTDA No.":="KTDA No.";
                           SDeductions."Vendor No":=Cust."No.";
                           SDeductions."CID NO":=LoanApp."Customer CID. No.";
                           SDeductions."Loan No":=LoanApp."Loan  No.";
                           SDeductions."Loan Type":=LoanApp."Loan Product Type";
                                IF RunBal >LoanApp.Repayment THEN BEGIN
                                   SDeductions.Principal:=LoanApp.Repayment;
                                   SDeductions."Total Repayment":=LoanApp.Repayment;
                                END ELSE BEGIN
                                   SDeductions.Principal:=RunBal;
                                   SDeductions."Total Repayment":=RunBal;
                                END;
                            SDeductions.INSERT;
             END;
         RunBal:=RunBal-LoanApp.Repayment;
        END;
        
        //RunBal:=RunBal-LoanApp.Repayment;
        END;
        UNTIL LoanApp.NEXT = 0;
        END;
        UNTIL LoanType.NEXT = 0;
        END;
        "Deposit Contribution":=Amount*0.01*GenSetup."Deposit Contribution %";
        MODIFY;
        END;
        END;
        RunBal:=0;
        */

    end;


    procedure RecoverFOSA()
    begin
        /*//SDeductions.RESET;
        //SDeductions.SETRANGE(SDeductions."Transaction No",No);
        //SDeductions.SETRANGE(SDeductions."CID NO","Customer ID. No.");
        //SDeductions.DELETEALL;
        
           LApplications.RESET;
           LApplications.SETRANGE(LApplications.Source,LApplications.Source::FOSA);
           LApplications.SETRANGE(LApplications."Member No.","Line No.");
           LApplications.SETRANGE(LApplications.Posted,TRUE);
           //LApplications.SETRANGE(LApplications."Loan Product Type",'SAL LOAN');
           IF LApplications.FIND('-') THEN BEGIN
           REPEAT
        
           IF LTypes.GET(LApplications."Loan Product Type") THEN BEGIN
           //IF LTypes."Deductable From Salary Proc." = TRUE THEN BEGIN
           LApplications.CALCFIELDS("Outstanding Balance");
           IF LApplications."Outstanding Balance" > 0 THEN BEGIN
        
           SDeductions.INIT;
           SDeductions."Transaction No":=No;
           SDeductions."Vendor No":="Line No.";
           SDeductions."Loan No":=LApplications."Loan  No.";
           SDeductions.Source:=SDeductions.Source::FOSA;
           SDeductions."Loan Type":=LApplications."Loan Product Type Name";
           IF LApplications.Installments=0 THEN BEGIN
           SDeductions."Total Repayment":=ROUND(LApplications."Outstanding Balance"
                                          +((LApplications."Outstanding Balance"/100)*LApplications.Interest),0.01);
           SDeductions.Principal:=ROUND(LApplications."Outstanding Balance",0.01);
           END
           ELSE BEGIN
           IF LApplications."Outstanding Balance"<LApplications.Repayment THEN BEGIN
           SDeductions."Total Repayment":=ROUND((LApplications."Outstanding Balance")
                                          + ((LApplications."Outstanding Balance"/100)*LApplications.Interest),0.01);
           SDeductions.Principal:=LApplications."Outstanding Balance"
           END
           ELSE BEGIN
           SDeductions."Total Repayment":=ROUND((LApplications.Repayment)
                                          + ((LApplications."Outstanding Balance"/100)*LApplications.Interest),0.01);
           SDeductions.Principal:=ROUND((LApplications.Repayment),0.01);
           END;
           END;
           SDeductions.Interest:=ROUND((LApplications."Outstanding Balance"/100)*LApplications.Interest,0.01);
           //IF LApplications."Outstanding Appraisal">0 THEN
           //SDeductions.Appraisal:=LApplications."Oustanding Appraisal";
           //IF LApplications."Oustanding Penalty">0 THEN
           //SDeductions.Penalties:=LApplications."Oustanding Penalty";
           SDeductions.INSERT;
        
           //END;
           END;
           END;
        
           UNTIL LApplications.NEXT = 0;
        
        
           END;
        */

    end;


    procedure RecoverSTO()
    begin
        /*Transactions.RESET;
        Transactions.GET(No);
        
        
        
        STO.RESET;
        STO.SETRANGE(STO."Source Account No.","Line No.");
        STO.SETRANGE(STO.Status,STO.Status::"Pending Approval");
        STO.SETRANGE(STO."Allocated Amount",Transactions."Income Type");
        IF STO.FIND('-') THEN BEGIN
        REPEAT
        STOSched."Transaction No.":=Transactions.No;
        EVALUATE(STOSched."Transaction Type",FORMAT(Transactions."Transaction Type"));
        STOSched."Destinantion Account Type":=STO."Destination Account Type";
        //STOSched."Loan No.":=;
        STOSched."STO No.":=STO."No.";
        IF STO."Destination Account Type"=STO."Destination Account Type"::External THEN
        STOSched."Destination Account No.":=STO."BOSA Account No."
        ELSE
        IF STO."Destination Account Type"=STO."Destination Account Type"::" " THEN
        STOSched."Destination Account No.":=STO."Destination Account No."
        ELSE
        IF STO."Destination Account Type"=STO."Destination Account Type"::Internal THEN
        STOSched."Destination Account No.":=STO."Bank Code";
        STOSched."Amount Deducted":=STO.Amount;
        STOSched."Source No.":=STO."Source Account No.";
        STOSched.INSERT;
        UNTIL STO.NEXT=0;
        END;
         */

    end;
}

