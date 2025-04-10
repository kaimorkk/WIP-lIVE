report 52193605 "PR Pension Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Pension Report.rdl';

    dataset
    {

        dataitem("HR Employees"; "Employee")
        {
            DataItemTableView = sorting("No.") order(ascending);
            RequestFilterFields = "Global Dimension 1 Code", "Posting Group", "Contract Type";
            RequestFilterHeading = 'Required Filters';
            column(ReportForNavId_1102755000; 1102755000)
            {
            }
            column(GlobalDimension1Code_HREmployees; "HR Employees"."Global Dimension 1 Code")
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Name2; CompInfo."Name 2")
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_Phone; CompInfo."Phone No.")
            {
            }
            column(CompInfo_Phone2; CompInfo."Phone No. 2")
            {
            }
            column(CompInfo_Email; CompInfo."E-Mail")
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(ReportTitle; ReportTitle)
            {
            }
            column(Staff_PFund; Staff_PFund)
            {
            }
            column(Employer_PFund; Employer_PFund)
            {
            }
            column(PFundTotal; PFundTotal)
            {
            }
            column(EmployeeContractType_HREmployees; "HR Employees"."Contract Type")
            {
            }
            column(No_HREmployees; "HR Employees"."No.")
            {
            }
            column(FullName_HREmployees; "HR Employees".FullName())
            {
            }
            column(GlobalDim1Code_HREmployees; "HR Employees"."Global Dimension 1 Code")
            {
            }
            column(IDNumber_HREmployees; "HR Employees"."ID Number")
            {
            }
            column(BasicPay; BasicPay)
            {
            }

            column(VolAmount; VolAmount)
            {

            }
            // column(ApproverID_ApprovalEntry; "ApprovalEntry".UserID)
            // {
            // }
            column(LastDateTimeModified_ApprovalEntry; '')
            {
            }

            column(Signature_PreparedBy; UserRec."User Signature")
            {
            }
            column(PreparedByDesignation_UserSetup; UserRec."Approval Title")
            {
            }
            column(Signature_UserSetup; UserRec1."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup; UserRec1."Approval Title")
            {
            }
            column(Signature_UserSetup2; UserRec2."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup2; UserRec2."Approval Title")
            {
            }
            column(Signature_UserSetup3; UserRec3."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup3; UserRec3."Approval Title")
            {
            }
            column(Signature_UserSetup4; UserRec4."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup4; UserRec4."Approval Title")
            {
            }
            column(Signature_UserSetup5; UserRec5."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup5; UserRec5."Approval Title")
            {
            }
            column(UserDesign1; UserDesign1)
            {
            }
            column(UserDesign2; UserDesign2)
            {
            }
            column(UserDesign3; UserDesign3)
            {
            }
            column(UserDesign4; UserDesign4)
            {
            }
            column(UserDesign5; UserDesign5)
            {
            }
            column(ApprovalDate1; ApprovalDate1)
            {
            }
            column(ApprovalDate2; ApprovalDate2)
            {
            }
            column(ApprovalDate3; ApprovalDate3)
            {
            }
            column(ApprovalDate4; ApprovalDate4)
            {
            }
            column(ApprovalDate5; ApprovalDate5)
            {
            }
            column(UserName1; UserName1)
            {
            }
            column(UserName2; UserName2)
            {
            }
            column(UserName3; UserName3)
            {
            }
            column(UserName4; UserName4)
            {
            }
            column(UserName5; UserName5)
            {
            }

            column(SendDate; SendDate)
            {
            }
            column(SenderDesign; SenderDesign)
            {
            }
            column(SenderName; SenderName)
            {
            }
            column(SenderSignature; UserRec6."User Signature")
            {
            }
            column(Grade; "Salary Scale")
            {
            }
            column(Arrears; Arrears)
            {

            }
            column(EmployerArrears; EmployerArrears)
            {

            }
            column(TransCodeName; TransCodeName)
            {
            }
            column(EmployeeArrears; EmployeeArrears)
            {
            }
            column(PostRetirement; PostRetirement)
            {
            }
            column(PostRetirementEmployer; PostRetirementEmployer)
            {
            }
            trigger OnAfterGetRecord()
            var
                Found: Boolean;
            begin
                Staff_PFund := 0;
                PFundTotal := 0;
                Employer_PFund := 0;
                EmployerArrears := 0;
                Arrears := 0;
                BasicPay := 0;
                VolAmount := 0;
                Found := false;
                EmployeeArrears := 0;
                PostRetirement := 0;
                PostRetirementEmployer := 0;
                if "Contract Type" = 'SECONDED' then CurrReport.Skip();


                ///Check if employee has any pension transactions
                TransCode.Reset();
                TransCode.SetRange("Transaction Category", TransCode."Transaction Category"::Pension);
                TransCode.SetRange("Transaction Code", PensionCode);
                if TransCode.FindSet() then
                    TransCodeName := TransCode."Transaction Name";
                repeat
                    fnSetrangePRPeriodTransactions();
                    PRPeriodTrans.SetRange("Transaction Code", TransCode."Transaction Code");
                    if PRPeriodTrans.FindFirst() then
                        Found := true;
                until TransCode.Next() = 0;
                // if not Found then
                //     CurrReport.skip;
                ///Check if employee has any pension transactions


                TransCode.Reset();
                TransCode.SetRange("Transaction Category", TransCode."Transaction Category"::Pension);
                TransCode.SetRange("Transaction Code", PensionCode);
                if TransCode.FindSet() then
                    repeat
                        //P-FUND EMPLOYER
                        fnSetrangePREmployerDeductions;
                        PREmployerDed.SetRange(PREmployerDed."Transaction Code", TransCode."Transaction Code");
                        if PREmployerDed.FindSet() then begin
                            PREmployerDed.CalcSums(Amount);
                            Employer_PFund += PREmployerDed.Amount;

                            if TransCode."Arrears Code" <> '' then begin

                                fnSetrangePREmployerDeductions;
                                PREmployerDed.SetFilter(PREmployerDed."Transaction Code", TransCode."Arrears Code");
                                if PREmployerDed.FindFirst() then begin
                                    PREmployerDed.CalcSums(Amount);
                                    EmployerArrears += PREmployerDed.Amount;
                                end;
                            end;

                        end;

                        //P-FUND EMPLOYEES
                        fnSetrangePRPeriodTransactions;
                        PRPeriodTrans.SetRange("Transaction Code", TransCode."Transaction Code");
                        if PRPeriodTrans.FindFirst() then begin
                            Staff_PFund += PRPeriodTrans.Amount;

                            if TransCode."Arrears Code" <> '' then begin

                                fnSetrangePRPeriodTransactions;
                                PRPeriodTrans.SetFilter("Transaction Code", TransCode."Arrears Code");
                                if PRPeriodTrans.FindFirst() then begin
                                    EmployeeArrears := PRPeriodTrans.Amount;
                                    PRPeriodTrans.CalcSums(Amount);
                                    Arrears += PRPeriodTrans.Amount;
                                end;
                            end;

                        end;

                        //BASIC PAY
                        fnSetrangePRPeriodTransactions;
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'BPAY');
                        if PRPeriodTrans.FindFirst() then begin
                            BasicPay := PRPeriodTrans.Amount;
                        end;
                        fnSetrangePRPeriodTransactions;
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'DED-0311');
                        if PRPeriodTrans.FindFirst() then begin
                            PostRetirement := PRPeriodTrans.Amount;
                        end;
                        fnSetrangePREmployerDeductions;
                        PREmployerDed.SetRange(PREmployerDed."Transaction Code", 'DED-0311');
                        if PREmployerDed.FindSet() then begin
                            PostRetirementEmployer := PREmployerDed.Amount;
                        end;


                        //Voluntary Amount
                        fnSetrangePRPeriodTransactions;
                        PRPeriodTrans.Setfilter(PRPeriodTrans."Coop Parameter Lk", '=%1', PRPeriodTrans."Coop Parameter Lk"::"Voluntary Pension");
                        if PRPeriodTrans.FindFirst() then begin
                            VolAmount := PRPeriodTrans.Amount;
                        end;

                        PFundTotal := Staff_PFund + Employer_PFund;
                        if (PFundTotal = 0) and (EmployeeArrears = 0) then
                            CurrReport.skip;
                    until TransCode.Next() = 0;

                //if PFundTotal = 0 then CurrReport.Skip;
                PrPayPeriod.reset;
                PrPayPeriod.SetRange("Date Opened", SelectedPeriod);
                PrPayPeriod.setrange("Approval Status", PrPayPeriod."Approval Status"::Approved);
                if PrPayPeriod.find('-') then begin
                    // ApprovalEntry.reset;

                    // if ApprovalEntry.find('-') then begin
                    //     repeat
                    //         if ApprovalEntry."Sequence No" = 1 then begin
                    //             UserRec1.reset;
                    //             UserRec1.setrange("User ID", ApprovalEntry.UserID);
                    //             if UserRec1.find('-') then begin
                    //                 UserRec1.calcfields("User Signature");
                    //                 UserName1 := UserRec1.UserName;
                    //                 UserDesign1 := UserRec1."Approval Title";
                    //                 ApprovalDate1 := PrPayPeriod."Date Approved";
                    //             end;
                    //         end;
                    //         if ApprovalEntry."Sequence No" = 2 then begin
                    //             UserRec2.reset;
                    //             UserRec2.setrange("User ID", ApprovalEntry.UserID);
                    //             if UserRec2.find('-') then begin
                    //                 UserRec2.calcfields("User Signature");
                    //                 UserName2 := UserRec2.UserName;
                    //                 UserDesign2 := UserRec2."Approval Title";
                    //                 ApprovalDate2 := PrPayPeriod."Date Approved";
                    //             end;
                    //         end;
                    //         if ApprovalEntry."Sequence No" = 3 then begin
                    //             UserRec3.reset;
                    //             UserRec3.setrange("User ID", ApprovalEntry.UserID);
                    //             if UserRec3.find('-') then begin
                    //                 UserRec3.calcfields("User Signature");
                    //                 UserName3 := UserRec3.UserName;
                    //                 UserDesign3 := UserRec3."Approval Title";
                    //                 ApprovalDate3 := PrPayPeriod."Date Approved";
                    //             end;
                    //         end;
                    //         if ApprovalEntry."Sequence No" = 4 then begin
                    //             UserRec4.reset;
                    //             UserRec4.setrange("User ID", ApprovalEntry.UserID);
                    //             if UserRec4.find('-') then begin
                    //                 UserRec4.calcfields("User Signature");
                    //                 UserName4 := UserRec4.UserName;
                    //                 UserDesign4 := UserRec4."Approval Title";
                    //                 ApprovalDate4 := PrPayPeriod."Date Approved";
                    //             end;
                    //         end;
                    //         if ApprovalEntry."Sequence No" = 5 then begin
                    //             UserRec5.reset;
                    //             UserRec5.setrange("User ID", ApprovalEntry.UserID);
                    //             if UserRec5.find('-') then begin
                    //                 UserRec5.calcfields("User Signature");
                    //                 UserName5 := UserRec5.UserName;
                    //                 UserDesign5 := UserRec5."Approval Title";
                    //                 ApprovalDate5 := PrPayPeriod."Date Approved";
                    //             end;
                    //         end;
                    //         if ApprovalEntry."Sequence No" = 0 then begin
                    //             UserRec6.reset;
                    //             UserRec6.setrange("User ID", ApprovalEntry.UserID);
                    //             if UserRec6.find('-') then begin
                    //                 UserRec6.calcfields("User Signature");
                    //                 SenderName := UserRec6.UserName;
                    //                 SenderDesign := UserRec6."Approval Title";
                    //                 SendDate := PrPayPeriod."Date Approved";
                    //             end;
                    //         end;

                    //     until ApprovalEntry.next = 0;
                    // end;
                end;



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
                group(Control3)
                {
                    Caption = 'Options';
                    field(SelectedPeriod; SelectedPeriod)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Payroll Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
                    }

                    field("Pension Code"; PensionCode)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pension Transaction Code';
                        TableRelation = "PR Transaction Codes" where("Transaction Category" = filter(Pension));
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            /*  PayrollPeriod.Reset();
             PayrollPeriod.SetRange(Closed, false);
             if PayrollPeriod.FindFirst() then SelectedPeriod := PayrollPeriod."Date Opened"; */
        end;
    }

    labels
    {
        LblCertifiedBy = 'Certified By:';
        LblApprovedBy = 'Approved By:';
        LblTypingSpace = '...............................................................................';
        LblPrintedby = 'Printed By:';
        LblPage = 'Page No.';
    }

    trigger OnPreReport()
    begin
        if SelectedPeriod = 0D then Error('Please select Payroll Period');

        if PensionCode = '' then Error('Please select pension code');

        if ReportTitle = '' then ReportTitle := Text000 + ' ' + Format(SelectedPeriod);

        PayrollPeriod.Reset;
        if PayrollPeriod.Get(SelectedPeriod) then PeriodName := PayrollPeriod."Period Name";

        fnCompanyInfo();
    end;

    var
        PREmployerDed: Record "PR Employer Deductions";
        PRPeriodTrans: Record "PR Period Transactions";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PayrollPeriod: Record "PR Payroll Periods";
        ContractTypeFilter: Code[100];
        CompInfo: Record "Company Information";
        Staff_PFund: Decimal;
        Employer_PFund: Decimal;

        PensionCode: Code[20];

        PRPeriodTrans2: Record "PR Period Transactions";
        Arrears, EmployerArrears, PFundTotal : Decimal;
        Text000: label 'CONTRIBUTIONS TO THE STAFF RETIREMENT BENEFITS SCHEME - ';
        BasicPay: Decimal;
        ReportTitle: Text;
        //Approvals Start
        PrPayPeriod: record "PR Payroll Periods";
        TransCode, TransCode2 : Record "PR Transaction Codes";
        Approver1: Text;
        Approver2: Text;
        Approver3: Text;
        Date1: Date;
        Date2: Date;
        Date3: Date;
        ApprovalEntry: Record "Workflow User Group Member";
        Approver4: Text;
        Approver5: Text;
        UserRec: Record "User Setup";
        UserRec6: Record "User Setup";
        UserRec1: Record "User Setup";
        UserRec2: Record "User Setup";
        UserRec3: Record "User Setup";
        UserRec4: Record "User Setup";
        UserRec5: Record "User Setup";
        UserName1: text[100];
        UserDesign1UserDesign1: text[100];
        ApprovalDate1: DateTime;
        UserName2: text[100];

        UserDesign1: text[100];
        UserDesign2: text[100];
        ApprovalDate2: DateTime;
        UserName3: text[100];
        UserDesign3: text[100];
        ApprovalDate3: DateTime;
        UserName4: text[100];
        UserDesign4: text[100];
        ApprovalDate4: DateTime;
        UserName5: text[100];
        UserDesign5: text[100];
        ApprovalDate5: DateTime;
        SenderName: text[100];
        SenderDesign: text[100];
        SendDate: DateTime;
        TransCodeName: Text;
        PRSetup: Record "PR Vital Setup Info";
        EmployeeArrears: Decimal;
        PostRetirement: Decimal;
        PostRetirementEmployer: Decimal;




    //Approvals Ends

    procedure fnSetrangePRPeriodTransactions()
    begin
        PRPeriodTrans.Reset;
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
        PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
    end;

    procedure fnSetrangePREmployerDeductions()
    begin
        PREmployerDed.Reset;
        PREmployerDed.SetRange(PREmployerDed."Payroll Period", SelectedPeriod);
        PREmployerDed.SetRange(PREmployerDed."Employee Code", "HR Employees"."No.");
    end;

    procedure fnCompanyInfo()
    begin
        CompInfo.Reset;
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        VolAmount: Decimal;
}

