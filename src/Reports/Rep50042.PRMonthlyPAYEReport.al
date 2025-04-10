report 50042 "PR Monthly PAYE Report"
{
    // version FIN-24-AUG-18

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Monthly PAYE Report.rdl';

    dataset
    {
        dataitem("Employee"; "Employee")
        {
            RequestFilterFields = "No.", Status;
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_PhoneNo; CompInfo."Phone No.")
            {
            }
            // column(CompInfo_PIN; CompInfo."Pin No")
            // {
            // }
            column(CompInfo_PIN; CompInfo."Registration No.")
            {
            }
            column(No_HREmployees; "Employee"."No.")
            {
            }
            column(FirstName_HREmployees; "Employee"."First Name")
            {
            }
            column(MiddleName_HREmployees; "Employee"."Middle Name")
            {
            }
            column(LastName_HREmployees; "Employee"."Last Name")
            {
            }
            column(IDNumber_Employee; "ID Number")
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(PAYENumber_HREmployees; "Employee"."P.I.N")
            {
            }
            column(TaxableAmount; TaxableAmount)
            {
            }
            column(TaxCharged; TaxCharged)
            {
            }
            column(TaxReliefKSH; TaxReliefKSH)
            {
            }
            column(InsuranceReleif; InsuranceReleif)
            {

            }
            column(PAYEKSH; PAYEKSH)
            {
            }
            column(TotalRelief; TotalRelief)
            {
            }
            column(OOI; OOI)
            {
            }
            column(ApproverID_ApprovalEntry; /* "ApprovalEntry".UserID */'')
            {
            }
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


            trigger OnAfterGetRecord();
            begin
                CLEAR(TaxableAmount);
                CLEAR(TaxCharged);
                CLEAR(TaxReliefKSH);
                CLEAR(PAYEKSH);
                CLEAR(InsuranceReleif);
                CLEAR(TotalRelief);
                clear(OOI);

                //Taxable Pay
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", 'TXBP');
                if PRPeriodTrans.FINDFIRST() then TaxableAmount := PRPeriodTrans.Amount;

                //Tax Charged
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", 'PAYE');
                if PRPeriodTrans.FINDFIRST() then begin
                    PAYEKSH := PRPeriodTrans.Amount;
                end;


                //Group Order for Personal and Mortgage Releif is 6,9
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SETRANGE("Group Order", 6);
                PRPeriodTrans.SETRANGE("Sub Group Order", 9);
                if PRPeriodTrans.FINDSET(false, false) then begin
                    PRPeriodTrans.CALCSUMS(Amount);
                    TaxReliefKSH := PRPeriodTrans.Amount;
                end;

                //Group Order for Insurance releif is 6,8
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SETRANGE("Group Order", 6);
                PRPeriodTrans.SETRANGE("Sub Group Order", 8);
                if PRPeriodTrans.FINDSET(false, false) then begin
                    PRPeriodTrans.CALCSUMS(Amount);
                    InsuranceReleif := PRPeriodTrans.Amount;
                end;

                //Group Order for Insurance releif is 6,8
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SetRange("Transaction Code", 'OOI');
                if PRPeriodTrans.FINDSET(false, false) then begin
                    PRPeriodTrans.CALCSUMS(Amount);
                    OOI := PRPeriodTrans.Amount;
                end;

                TotalRelief := InsuranceReleif + TaxReliefKSH;

                TaxCharged := TaxableAmount + TotalRelief + OOI;

                if TaxableAmount = 0 then CurrReport.SKIP();

                if PAYEKSH = 0 then CurrReport.SKIP();

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
                group("Filter Options")
                {
                    field(SelectedPeriod; SelectedPeriod)
                    {
                        Caption = 'Selected Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin


        CompInfo.RESET;
        CompInfo.GET;

        CompInfo.CALCFIELDS(Picture);

        if SelectedPeriod = 0D then ERROR('Please select payroll period');

        PRPayrollPeriods.RESET;
        PRPayrollPeriods.SETRANGE("Date Opened", SelectedPeriod);
        if PRPayrollPeriods.FINDFIRST() then PeriodName := UPPERCASE(PRPayrollPeriods."Period Name");
    end;

    var
        CompInfo: Record "Company Information";
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodName: Text;
        TaxableAmount: Decimal;
        TaxCharged: Decimal;
        TaxReliefKSH: Decimal;
        PAYEKSH: Decimal;
        InsuranceReleif: Decimal;
        TotalRelief: Decimal;

        OOI: Decimal;
        //Approvals Start
        PrPayPeriod: record "PR Payroll Periods";
        Approver1: Text;
        Approver2: Text;
        Approver3: Text;
        Date1: Date;
        Date2: Date;
        Date3: Date;
        // ApprovalEntry: Record "Payroll Approvers";
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

    //Approvals Ends
}

