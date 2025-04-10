report 50168 "PR Transfer To Journal Batch"
{
    Caption = 'PR Transfer To Journal';
    ProcessingOnly = true;

    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            RequestFilterFields = "Transaction Code";
            column(ReportForNavId_9285; 9285)
            {
            }

            trigger OnAfterGetRecord()
            var
                Text000: label '@1@@@@@@@@@@';
            begin


                //For use when posting Pension and NSSF


                LineNumber := LineNumber + 10;

                PeriodTrans.Reset;
                PeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", "Transaction Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Journal Account Code", '<>%1', '');
                //PeriodTrans.SetRange(PeriodTrans."Posting Group", SelectedPostingGroup);
                //Added
                if EmployeeNo <> '' then begin
                    PeriodTrans.SetFilter("Employee Code", EmployeeNo);
                end;

                //Added
                if PeriodTrans.FindFirst() then begin
                    //REPEAT
                    PostingGroup.Get(PeriodTrans."Posting Group");
                    PostingGroup.TestField("SSF Employer Account");
                    PostingGroup.TestField("SSF Employee Account");
                    PostingGroup.TestField("Pension Employer Acc");
                    PostingGroup.TestField("Pension Employee Acc");
                    PostingGroup.TestField("Housing Levy Employee Account");
                    PostingGroup.TestField("Housing Levy Employer Account");
                    //Sum all trans
                    PeriodTrans.CalcSums(PeriodTrans.Amount);

                    MyDialog.Update(1, PeriodTrans."Transaction Code" + ' - ' + PeriodTrans."Transaction Name");

                    if PeriodTrans."Journal Account Code" <> '' then begin
                        AmountToDebit := 0;
                        AmountToCredit := 0;
                        if PeriodTrans."Post As" = PeriodTrans."post as"::Debit then
                            AmountToDebit := PeriodTrans.Amount;

                        if PeriodTrans."Post As" = PeriodTrans."post as"::Credit then
                            AmountToCredit := PeriodTrans.Amount;

                        IntegerPostAs := 0;
                        if PeriodTrans."Journal Account Type" = Jac::"G/L Account" then  //GL
                            IntegerPostAs := 0;   //0 debit
                        if PeriodTrans."Journal Account Type" = Jac::Customer then
                            IntegerPostAs := 1;  // 1 =
                        if PeriodTrans."Journal Account Type" = Jac::Vendor then
                            IntegerPostAs := 2;  // 1 =
                        if Vendor <> '' then IntegerPostAs := 2;
                        if Vendor <> '' then GLAcVendor := Vendor else GLAcVendor := "GL Account";
                        SaccoTransactionType := Saccotransactiontype::" ";

                        if PeriodTrans."Coop Parameters" = PeriodTrans."coop parameters"::Loan then
                            SaccoTransactionType := Saccotransactiontype::Repayment;

                        if PeriodTrans."Coop Parameters" = PeriodTrans."coop parameters"::"Loan Interest" then
                            SaccoTransactionType := Saccotransactiontype::"Interest Paid";

                        if PeriodTrans."Coop Parameters" = PeriodTrans."coop parameters"::Welfare then
                            SaccoTransactionType := Saccotransactiontype::"Welfare Contribution";

                        if PeriodTrans."Coop Parameters" = PeriodTrans."coop parameters"::Shares then
                            SaccoTransactionType := Saccotransactiontype::"Deposit Contribution";



                        CreateJnlEntry(IntegerPostAs, GLAcVendor,
                        GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToDebit, AmountToCredit,
                        PeriodTrans."Post As", '', SaccoTransactionType);

                        //Pension
                        //    IF PeriodTrans."coop parameters"=PeriodTrans."coop parameters"::Pension THEN BEGIN
                        TransCode.Reset;
                        TransCode.SetRange(TransCode."Transaction Code", PeriodTrans."Transaction Code");
                        TransCode.SetRange("Employer Deduction", true);
                        TransCode.SetRange(TransCode."Special Trans Deductions", TransCode."Special Trans Deductions"::"Defined Contribution");
                        if TransCode.Find('-') then begin

                            //Moe
                            //Get from Employer Deduction
                            EmployerDed.Reset;
                            EmployerDed.SetRange(EmployerDed."Employee Code", PeriodTrans."Employee Code");
                            EmployerDed.SetRange(EmployerDed."Transaction Code", PeriodTrans."Transaction Code");
                            EmployerDed.SetRange(EmployerDed."Payroll Period", PeriodTrans."Payroll Period");
                            if EmployerDed.Find('-') then begin
                                CreateJnlEntry(0, PostingGroup."Pension Employee Acc",
                                GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", 0,
                               EmployerDed.Amount, PeriodTrans."Post As", '', SaccoTransactionType);

                                //Debit Staff Expense
                                CreateJnlEntry(0, PostingGroup."Pension Employer Acc",
                                GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", EmployerDed.Amount, 0, 1, '',
                                SaccoTransactionType);

                            end;
                            //Moe
                        end;

                        //NSSF
                        if PeriodTrans."Coop Parameters" = PeriodTrans."coop parameters"::NSSF then begin
                            //Credit Payables
                            //Credit Payables

                            CreateJnlEntry(0, PostingGroup."SSF Employee Account",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", 0, PeriodTrans.Amount,
                            PeriodTrans."Post As", '', SaccoTransactionType);

                            //Debit Staff Expense

                            CreateJnlEntry(0, PostingGroup."SSF Employer Account",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", PeriodTrans.Amount, 0, 1, '',
                            SaccoTransactionType);
                        end;
                        if PeriodTrans."Transaction Code" = 'HLEVY' then begin
                            //Credit Payables
                            //Credit Payables

                            /*  CreateJnlEntry(0, PostingGroup."Housing Levy Employee Account",
                             GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", 0, PeriodTrans.Amount,
                             PeriodTrans."Post As", '', SaccoTransactionType); */
                            CreateJnlEntry(IntegerPostAs, PeriodTrans."Journal Account Code",
                        GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToDebit, AmountToCredit,
                        PeriodTrans."Post As", '', SaccoTransactionType);

                            //Debit Staff Expense

                            CreateJnlEntry(0, PostingGroup."Housing Levy Employer Account",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToCredit, 0, 1, '',
                            SaccoTransactionType);


                        end;
                        if PeriodTrans."Transaction Code" = 'NHIF' then begin
                            //Credit Payables
                            //Credit Payables

                            /*  CreateJnlEntry(0, PostingGroup."Housing Levy Employee Account",
                             GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", 0, PeriodTrans.Amount,
                             PeriodTrans."Post As", '', SaccoTransactionType); */
                            CreateJnlEntry(IntegerPostAs, PeriodTrans."Journal Account Code",
                        GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToDebit, AmountToCredit,
                        PeriodTrans."Post As", '', SaccoTransactionType);

                            //Debit Staff Expense

                            CreateJnlEntry(0, PostingGroup."Housing Levy Employer Account",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToCredit, 0, 1, '',
                            SaccoTransactionType);


                        end;
                        if PeriodTrans."Transaction Code" = 'PAYE' then begin
                            //Credit Payables
                            //Credit Payables

                            /*  CreateJnlEntry(0, PostingGroup."Housing Levy Employee Account",
                             GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", 0, PeriodTrans.Amount,
                             PeriodTrans."Post As", '', SaccoTransactionType); */
                            CreateJnlEntry(IntegerPostAs, PeriodTrans."Journal Account Code",
                        GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToDebit, AmountToCredit,
                        PeriodTrans."Post As", '', SaccoTransactionType);

                            //Debit Staff Expense

                            CreateJnlEntry(0, PostingGroup."Housing Levy Employer Account",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToCredit, 0, 1, '',
                            SaccoTransactionType);


                        end;
                        if PeriodTrans."Transaction Code" = 'NPAY' then begin
                            //Credit Payables
                            //Credit Payables

                            /*  CreateJnlEntry(0, PostingGroup."Housing Levy Employee Account",
                             GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", 0, PeriodTrans.Amount,
                             PeriodTrans."Post As", '', SaccoTransactionType); */
                            CreateJnlEntry(IntegerPostAs, PeriodTrans."Journal Account Code",
                        GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToDebit, AmountToCredit,
                        PeriodTrans."Post As", '', SaccoTransactionType);

                            //Debit Staff Expense

                            CreateJnlEntry(0, PostingGroup."Housing Levy Employer Account",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Transaction Code", AmountToCredit, 0, 1, '',
                            SaccoTransactionType);


                        end;

                    end;
                    //Test

                    //UNTIL PeriodTrans.NEXT=0;
                end;
            end;


            trigger OnPostDataItem()
            begin
                EndTime := CreateDatetime(Today, Time);
                TotalTimeTaken := EndTime - StartTime;



                MyDialog.Close();
                Message('Payroll Journal Generated Succesfully [%1]', TotalTimeTaken);
            end;

            trigger OnPreDataItem()
            begin
                BNAME := 'PAYROLL';

                GenJnlBatch.Reset;
                GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", 'GENERAL');
                GenJnlBatch.SetRange(GenJnlBatch.Name, BNAME);
                if GenJnlBatch.FINDSET() then begin
                    GenJournalLine.DeleteAll;
                end;


                LineNo := 10000;

                //Create batch
                GenJnlBatch.Reset;
                GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", 'GENERAL');
                GenJnlBatch.SetRange(GenJnlBatch.Name, BNAME);
                if GenJnlBatch.FindFirst() = false then begin
                    GenJnlBatch.Init;
                    GenJnlBatch."Journal Template Name" := 'GENERAL';
                    GenJnlBatch.Name := BNAME;
                    GenJnlBatch.Insert;

                end;
                // End Create Batch

                "Slip/Receipt No" := UpperCase(objPeriod."Period Name");
                DialogInfo := Text0006 + Text0009 + Text0010;
                MyDialog.Open(DialogInfo);
            end;

        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(General)
                {
                    Caption = 'Options';
                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Payroll Period';
                        TableRelation = "PR Payroll Periods";
                    }
                    // field(SelectedPostingGroup; SelectedPostingGroup)
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Posting Group';
                    //     TableRelation = "PR Employee Posting Groups".Code;
                    // }
                    field(EmployeeNo; EmployeeNo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employee No.';
                        TableRelation = "Employee"."No.";
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            PRPayrollPeriods.Reset();
            PRPayrollPeriods.SetRange(Closed, false);
            if PRPayrollPeriods.FindFirst() then PeriodFilter := PRPayrollPeriods."Date Opened";
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        StartTime := CreateDatetime(Today, Time);
        EndTime := CreateDatetime(0D, 0T);
        Clear(TotalTimeTaken);

        if PeriodFilter = 0D then Error('You must specify the period filter');
        //if SelectedPostingGroup = '' then Error('Please select Posting Group to transfer to Journal');
        SelectedPeriod := PeriodFilter;
        objPeriod.Reset;
        if objPeriod.Get(SelectedPeriod) then PeriodName := objPeriod."Period Name";

        PostingDate := CalcDate('1M-1D', SelectedPeriod);
        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);

        //Dan - Ensure All TransCode have respective GL
        TransCode.Reset;
        TransCode.SetFilter(TransCode."Transaction Code", '<>%1', '');
        if TransCode.FindFirst then begin
            repeat
            //TransCode.TestField(TransCode."GL Account");
            until TransCode.Next = 0;
        end;
        //Dan - Ensure All TransCode have respective GL
    end;

    var
        PRPayrollPeriods: Record "PR Payroll Periods";
        GenJournalLine: Record "Gen. Journal Line";
        PeriodTrans: Record "PR Period Transactions";
        NssfAmount: Decimal;

        TotNssfAmount: Decimal;
        objEmp: Record "Employee";
        EmployeeName: Text[30];
        NssfNo: Text[30];
        IDNumber: Text[30];
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Date;
        "Volume Amount": Decimal;
        "TotVolume Amount": Decimal;
        TotalAmount: Decimal;
        totTotalAmount: Decimal;
        CompanyInfo: Record "Company Information";
        ExcelBuf: Record "Excel Buffer" temporary;
        PrinttoExcel: Boolean;
        EmployerNSSFNo: Integer;
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentNo: Code[100];
        NHIfAmount: Decimal;
        totNHIFTotalAmount: Decimal;
        PAYEAmount: Decimal;
        totPAYETotalAmount: Decimal;
        PENSIONAmount: Decimal;
        totPENSIONTotalAmount: Decimal;
        totHELBTotalAmount: Decimal;
        HELBAMOUNT: Decimal;
        totGRATTotalAmount: Decimal;
        GRATAMOUNT: Decimal;
        ICEAAMOUNT: Decimal;
        totSACCOTotalAmount: Decimal;
        SACCOAMOUNT: Decimal;
        totICEATotalAmount: Decimal;
        Pension: Decimal;
        NssfAmountemployer: Decimal;
        TotalNssfAmountemployer: Decimal;
        totTotalNssfAmountemployer: Decimal;
        NssfAmountemployee: Decimal;
        TotalNssfAmountemployee: Decimal;
        totTotalNssfAmountemployee: Decimal;
        ICEATotalAmount: Decimal;
        GeneraljnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        gRATAMOUNT1: Decimal;
        prsalrycard: Record "PR Salary Card";
        amount: Decimal;
        TOTALamountGRAT: Decimal;
        nETPAY: Decimal;
        Finlemsacco: Decimal;
        csrcontribution: Decimal;
        sALARYaDVANCE: Decimal;
        CarLoanInt: Decimal;
        Staffloanint: Decimal;
        "prEmployee Transactions": Record "PR Employer Deductions";
        TotalAmountarrears: Decimal;
        GRATAMOUNTarrears: Decimal;
        totGRATTotalAmount1: Decimal;
        totGRATTotalAmounttot: Decimal;
        toGrossAmount: Decimal;
        "Slip/Receipt No": Code[50];
        PostingGroup: Record "PR Employee Posting Groups";
        strEmpName: Text[150];
        AmountToDebit: Decimal;
        AmountToCredit: Decimal;
        IntegerPostAs: Integer;
        SaccoTransactionType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Welfare Contribution","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee","Welfare Contribution 2";
        PostingDate: Date;
        GlobalDim1: Code[20];
        GlobalDim2: Code[20];
        EmployerDed: Record "PR Employer Deductions";
        TransCode: Record "PR Transaction Codes";
        LineNumber: Integer;
        MyDialog: Dialog;
        MyNext: Integer;
        JAC: Option " ","G/L Account",Customer,Vendor;
        Text10001: label 'There are [%1] entries that exist in the Journal for Payroll Period [%2] Please post the before generating a new Journal';
        StartTime: DateTime;
        EndTime: DateTime;
        TotalTimeTaken: Duration;
        Text0006: label '#1############################3######';
        Text0007: label 'Transaction Code #2#######';
        Text0008: label 'Amount #3########';
        DialogInfo: Text;
        Text0009: label '#2######';
        Text0010: label '#3######';
        EmployeeNo: Code[100];
        BNAME: Code[20];
        EmployeePost: Code[30];
        GLAcVendor: Code[30];

    procedure CreateJnlEntry(AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; AccountNo: Code[20]; GlobalDime1: Code[20]; GlobalDime2: Code[20]; Description: Text[150]; DebitAmount: Decimal; CreditAmount: Decimal; PostAs: Option " ",Debit,Credit; LoanNo: Code[20]; TransType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Benevolent Fund","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee Due","Loan Guard",Prepayment,"Administration Fee Paid","Car Savings","SchFees Savings","Holiday Savings","CIC Fixed Deposit","Withdrawable Savings","Children Savings","KMA Investment","KMA Fixed Deposit","UAP Premiums","UAP Admin Fee","Direct Debit")
    begin

        LineNumber := LineNumber + 100;
        GeneraljnlLine.Init;
        GeneraljnlLine."Journal Template Name" := 'GENERAL';
        GeneraljnlLine."Journal Batch Name" := BNAME;
        GeneraljnlLine."Line No." := LineNumber;
        GeneraljnlLine."Document No." := "Slip/Receipt No";
        //GeneraljnlLine."Loan No":=LoanNo;
        //GeneraljnlLine."Transaction Type":=TransType;
        GeneraljnlLine."Posting Date" := PostingDate;
        GeneraljnlLine."Account Type" := AccountType;
        GeneraljnlLine."Account No." := AccountNo;
        GeneraljnlLine.Validate(GeneraljnlLine."Account No.");
        GeneraljnlLine.Description := Description;
        if PostAs = Postas::Debit then begin
            GeneraljnlLine."Debit Amount" := DebitAmount;
            GeneraljnlLine.Validate("Debit Amount");
        end else begin
            GeneraljnlLine."Credit Amount" := CreditAmount;
            GeneraljnlLine.Validate("Credit Amount");
        end;
        GeneraljnlLine."Shortcut Dimension 1 Code" := GlobalDime1;
        GeneraljnlLine.Validate(GeneraljnlLine."Shortcut Dimension 1 Code");
        GeneraljnlLine."Shortcut Dimension 2 Code" := GlobalDime2;
        GeneraljnlLine.Validate(GeneraljnlLine."Shortcut Dimension 2 Code");
        if GeneraljnlLine.Amount <> 0 then
            GeneraljnlLine.Insert;
    end;
}

