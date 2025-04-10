report 52193501 PCA
{
    Caption = 'PCA';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PCA.rdl';
    dataset
    {
        dataitem(prBasicpayPCA; "prBasic pay PCA")
        {
            RequestFilterFields = "Employee Code", "Change Advice Serial No.", "Payroll Period";

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
            column(IDNumber; HrEmp."ID Number")
            {
            }
            // column(PoliceForceNumber; HrEmp."Police Force Number")
            // {
            // }
            column(BasicPay; "Basic Pay")
            {
            }
            column(CampusCode; "Campus Code")
            {
            }
            column(CampusName; "Campus Name")
            {
            }
            column(ChangeAdviceSerialNo; "Change Advice Serial No.")
            {
            }
            column(ChangeBankDetails; "Change Bank Details")
            {
            }
            column(Comments; Comments)
            {
            }
            column(CostCenterName; "Cost Center Name")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(Description; Description)
            {
            }
            column(DocumentNo; "Document No")
            {
            }
            column(DutyStation; "Duty Station")
            {
            }
            column(Effected; Effected)
            {
            }
            column(EffectiveDate; "Effective Date")
            {
            }
            column(EmployeeCode; "Employee Code")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeesBank; "Employee's Bank")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(ImplementingUnit; "Implementing Unit")
            {
            }
            column(Multipay; Multipay)
            {
            }
            column(PAyrollCode; PAyrollCode)
            {
            }
            column(PayrollPeriod; "Payroll Period")
            {
            }
            column(PaysNHIF; "Pays NHIF")
            {
            }
            column(PaysNSSF; "Pays NSSF")
            {
            }
            column(PaysPAYE; "Pays PAYE")
            {
            }
            column(PeriodMonth; "Period Month")
            {
            }
            column(PeriodYear; "Period Year")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(SourceDocument; "Source Document")
            {
            }
            column(Status; Status)
            {
            }
            column(UserID; "User ID")
            {
            }
            column(Designation_prBasicpayPCA; Designation)
            {
            }
            column(IncrementalMonth_prBasicpayPCA; "Incremental Month")
            {
            }
            column(SalaryScale_prBasicpayPCA; "Salary Scale")
            {
            }
            column(ApproverID_ApprovalEntry; "ApprovalEntry"."Approver ID")
            {
            }
            column(LastDateTimeModified_ApprovalEntry; '')
            {
            }

            column(Signature_PreparedBy; UserRec6."User Signature")
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
            column(BankAccountNumber_prBasicpayPCA; "Bank Account Number")
            {
            }
            column(BankName_prBasicpayPCA; "Bank Name")
            {
            }
            column(BankBranch_prBasicpayPCA; "Bank Branch")
            {
            }
            column(BankBranchName_prBasicpayPCA; "Bank Branch Name")
            {
            }
            column(CauseofInactivity_prBasicpayPCA; "Cause of Inactivity")
            {
            }
            column(CurrentJobGrade_prBasicpayPCA; "Current Job Grade")
            {
            }
            column(DocumentType_prBasicpayPCA; "Document Type")
            {
            }
            column(EmployeeStatus_prBasicpayPCA; "Employee Status")
            {
            }
            column(ExitStatus_prBasicpayPCA; "Exit Status")
            {
            }
            column(IncrementDate_prBasicpayPCA; "Increment Date")
            {
            }
            column(PaysNITA_prBasicpayPCA; "Pays NITA")
            {
            }
            column(PostedBy_prBasicpayPCA; "Posted By")
            {
            }
            column(PostedByName_prBasicpayPCA; "Posted By Name")
            {
            }
            column(PostedDate_prBasicpayPCA; "Posted Date")
            {
            }
            column(Present_prBasicpayPCA; Present)
            {
            }
            dataitem("prEmployee Trans PCA"; "prEmployee Trans PCA")
            {
                DataItemLink = "Employee Code" = field("Employee Code"),
                              "Change Advice Serial No." = field("Change Advice Serial No."),
                              "Payroll Period" = field("Payroll Period");
                CalcFields = "Transaction Type";

                column(Amount_prEmployeeTransPCA; Amount)
                {
                }
                column(Balance_prEmployeeTransPCA; Balance)
                {
                }
                column(Comments_prEmployeeTransPCA; Comments)
                {
                }
                column(ChangeType_prEmployeeTransPCA; "Change Type")
                {
                }
                column(Difference_prEmployeeTransPCA; Difference)
                {
                }
                column(Duration_prEmployeeTransPCA; "Duration")
                {
                }
                column(EmployerAmount_prEmployeeTransPCA; "Employer Amount")
                {
                }
                column(EndDate_prEmployeeTransPCA; "End Date")
                {
                }
                column(FromDate_prEmployeeTransPCA; "From Date")
                {
                }
                column(Paid_prEmployeeTransPCA; Paid)
                {
                }
                column(Payable_prEmployeeTransPCA; Payable)
                {
                }
                column(PeriodMonth_prEmployeeTransPCA; "Period Month")
                {
                }
                column(PeriodYear_prEmployeeTransPCA; "Period Year")
                {
                }
                column(StartDate_prEmployeeTransPCA; "Start Date")
                {
                }
                column(SubTotal_prEmployeeTransPCA; SubTotal)
                {
                }
                column(ToDate_prEmployeeTransPCA; "To Date")
                {
                }
                column(TransactionCode_prEmployeeTransPCA; "Transaction Code")
                {
                }
                column(TransactionName_prEmployeeTransPCA; "Transaction Name")
                {
                }
                column(TransactionType_prEmployeeTransPCA; "Transaction Type")
                {
                }
            }


            trigger OnAfterGetRecord()
            begin
                CompInfo.get();
                CompInfo.CalcFields(Picture);
                HrEmp.get(prBasicpayPCA."Employee Code");
                ApprovalEntry.reset;
                ApprovalEntry.SetRange("Document No.", prBasicpayPCA."Change Advice Serial No.");
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
                if ApprovalEntry.FindSet() then begin
                    repeat
                        if ApprovalEntry."Sequence No." = 1 then begin
                            UserRec1.reset;
                            UserRec1.setrange("User ID", ApprovalEntry."Approver ID");
                            if UserRec1.find('-') then begin
                                UserRec1.calcfields("User Signature");
                                UserName1 := UserRec1."Employee Name";
                                UserDesign1 := UserRec1."Approval Title";
                                ApprovalDate1 := ApprovalEntry."Last Date-Time Modified";
                            end;
                        end;
                        if ApprovalEntry."Sequence No." = 2 then begin
                            UserRec2.reset;
                            UserRec2.setrange("User ID", ApprovalEntry."Approver ID");
                            if UserRec2.find('-') then begin
                                UserRec2.calcfields("User Signature");
                                UserName2 := UserRec2."Employee Name";
                                UserDesign2 := UserRec2."Approval Title";
                                ApprovalDate2 := ApprovalEntry."Last Date-Time Modified";
                            end;
                        end;
                        if ApprovalEntry."Sequence No." = 3 then begin
                            UserRec3.reset;
                            UserRec3.setrange("User ID", ApprovalEntry."Approver ID");
                            if UserRec3.find('-') then begin
                                UserRec3.calcfields("User Signature");
                                UserName3 := UserRec3."Employee Name";
                                UserDesign3 := UserRec3."Approval Title";
                                ApprovalDate3 := ApprovalEntry."Last Date-Time Modified";
                            end;
                        end;
                        if ApprovalEntry."Sequence No." = 4 then begin
                            UserRec4.reset;
                            UserRec4.setrange("User ID", ApprovalEntry."Approver ID");
                            if UserRec4.find('-') then begin
                                UserRec4.calcfields("User Signature");
                                UserName4 := UserRec4."Employee Name";
                                UserDesign4 := UserRec4."Approval Title";
                                ApprovalDate4 := ApprovalEntry."Last Date-Time Modified";
                            end;
                        end;
                        if ApprovalEntry."Sequence No." = 5 then begin
                            UserRec5.reset;
                            UserRec5.setrange("User ID", ApprovalEntry."Approver ID");
                            if UserRec5.find('-') then begin
                                UserRec5.calcfields("User Signature");
                                UserName5 := UserRec5."Employee Name";
                                UserDesign5 := UserRec5."Approval Title";
                                ApprovalDate5 := ApprovalEntry."Last Date-Time Modified";
                            end;
                        end;

                        UserRec6.reset;
                        UserRec6.setrange("User ID", ApprovalEntry."Sender ID");
                        if UserRec6.find('-') then begin
                            UserRec6.calcfields("User Signature");
                            SenderName := UserRec6."Employee Name";
                            SenderDesign := UserRec6."Approval Title";
                            SendDate := ApprovalEntry."Date-Time Sent for Approval";
                        end;


                    until ApprovalEntry.next = 0;
                end;
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        PREmployerDed: Record "PR Employer Deductions";
        PRPeriodTrans: Record "PR Period Transactions";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PayrollPeriod: Record "PR Payroll Periods";
        ContractTypeFilter: Code[100];
        PRPeriodTrans2: Record "PR Period Transactions";
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
        ApprovalEntry: Record "Approval Entry";
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
        CompInfo: Record "Company Information";
        HrEmp: Record Employee;
}
