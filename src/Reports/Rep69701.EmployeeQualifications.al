report 69701 "Employee Qualifications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmployeeQualification.rdlc';
    ApplicationArea = BasicHR;
    Caption = 'Employee Qualifications';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Employee Qualification"; "Employee Qualification")
        {
            DataItemTableView = sorting("Employee No.", "Line No.");
            RequestFilterFields = "Employee No.", "Qualification Code";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column(Employee_Qualification__TABLECAPTION__________EmployeeQualificationFilter; TableCaption + ': ' + EmployeeQualificationFilter)
            {
            }
            column(EmployeeQualificationFilter; EmployeeQualificationFilter)
            {
            }
            column(Employee_Qualification__Employee_No__; "Employee No.")
            {
            }
            column(Employee_FullName; Employee.FullName())
            {
            }
            column(Employee_Qualification__Qualification_Code_; "Qualification Code")
            {
            }
            column(Employee_Qualification__From_Date_; Format("From Date"))
            {
            }
            column(Employee_Qualification__To_Date_; Format("To Date"))
            {
            }
            column(Employee_Qualification_Type; Type)
            {
            }
            column(Employee_Qualification_Description; Description)
            {
            }
            column(Employee_Qualification__Institution_Company_; "Institution/Company")
            {
            }
            column(Employee___QualificationsCaption; Employee___QualificationsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_Qualification__Institution_Company_Caption; FieldCaption("Institution/Company"))
            {
            }
            column(Employee_Qualification_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Employee_Qualification_TypeCaption; FieldCaption(Type))
            {
            }
            column(Employee_Qualification__To_Date_Caption; Employee_Qualification__To_Date_CaptionLbl)
            {
            }
            column(Employee_Qualification__From_Date_Caption; Employee_Qualification__From_Date_CaptionLbl)
            {
            }
            column(Employee_Qualification__Qualification_Code_Caption; FieldCaption("Qualification Code"))
            {
            }
            column(Comment_EmployeeQualification; Comment)
            {
            }
            column(Cost_EmployeeQualification; Cost)
            {
            }
            column(CourseGrade_EmployeeQualification; "Course Grade")
            {
            }
            column(EmployeeStatus_EmployeeQualification; "Employee Status")
            {
            }
            column(ExpirationDate_EmployeeQualification; "Expiration Date")
            {
            }
            column(FromDate_EmployeeQualification; "From Date")
            {
            }
            column(LineNo_EmployeeQualification; "Line No.")
            {
            }
            column(QualificationCategory_EmployeeQualification; "Qualification Category")
            {
            }
            column(Specialization_EmployeeQualification; Specialization)
            {
            }
            column(SpecializedDomainArea_EmployeeQualification; "Specialized Domain Area")
            {
            }
            column(SystemCreatedAt_EmployeeQualification; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy_EmployeeQualification; SystemCreatedBy)
            {
            }
            column(SystemId_EmployeeQualification; SystemId)
            {
            }
            column(SystemModifiedAt_EmployeeQualification; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy_EmployeeQualification; SystemModifiedBy)
            {
            }
            column(ToDate_EmployeeQualification; "To Date")
            {
            }
            column(Year_EmployeeQualification; Year)
            {
            }
            dataitem(Employees; Employee)
            {
                DataItemLink = "No." = field("Employee No.");

                column(CompanyEMail_Employees; "Company E-Mail")
                {
                }
                column(EMail_Employees; "E-Mail")
                {
                }
                column(Absence_Employees; Absence)
                {
                }
                column(AbsentDays_Employees; "Absent Days")
                {
                }
                column(AcruedLeaveDays_Employees; "Acrued Leave Days")
                {
                }
                column(ActualContribution_Employees; "Actual Contribution")
                {
                }
                column(AdditionalLanguage_Employees; "Additional Language")
                {
                }
                column(Address_Employees; Address)
                {
                }
                column(Address2_Employees; "Address 2")
                {
                }
                column(Advance_Employees; Advance)
                {
                }
                column(Age_Employees; Age)
                {
                }
                column(AgeinYears_Employees; "Age in Years")
                {
                }
                column(AgencyCar_Employees; "Agency Car")
                {
                }
                column(AllocatedLeaveDays_Employees; "Allocated Leave Days")
                {
                }
                column(AllowNegativeLeave_Employees; "Allow Negative Leave")
                {
                }
                column(AllowReEmploymentInFuture_Employees; "Allow Re-Employment In Future")
                {
                }
                column(AltAddressCode_Employees; "Alt. Address Code")
                {
                }
                column(AltAddressEndDate_Employees; "Alt. Address End Date")
                {
                }
                column(AltAddressStartDate_Employees; "Alt. Address Start Date")
                {
                }
                column(AnnualLeaveAccount_Employees; "Annual Leave Account")
                {
                }
                column(AnnualLeaveDays_Employees; "Annual Leave Days")
                {
                }
                column(ApplicationMethod_Employees; "Application Method")
                {
                }
                column(Balance_Employees; Balance)
                {
                }
                column(Bank2_Employees; "Bank 2 %")
                {
                }
                column(BankAccountNo_Employees; "Bank Account No.")
                {
                }
                column(BankAccountNo2_Employees; "Bank Account No. 2")
                {
                }
                column(BankAccountNumber_Employees; "Bank Account Number")
                {
                }
                column(BankBranch_Employees; "Bank Branch")
                {
                }
                column(BankBranch2_Employees; "Bank Branch 2")
                {
                }
                column(BankBranchName_Employees; "Bank Branch Name")
                {
                }
                column(BankBranchName2_Employees; "Bank Branch Name 2")
                {
                }
                column(BankBranchNo_Employees; "Bank Branch No.")
                {
                }
                column(BankName_Employees; "Bank Name")
                {
                }
                column(BankName2_Employees; "Bank Name 2")
                {
                }
                column(Basic_Employees; Basic)
                {
                }
                column(BasicArrears_Employees; "Basic Arrears")
                {
                }
                column(BasicPay_Employees; "Basic Pay")
                {
                }
                column(BasicSalary_Employees; "Basic Salary")
                {
                }
                column(BenefitsNonCash_Employees; "Benefits-Non Cash")
                {
                }
                column(BfMpr_Employees; BfMpr)
                {
                }
                column(BirthDate_Employees; "Birth Date")
                {
                }
                column(Branch_Employees; Branch)
                {
                }
                column(CashLeaveEarned_Employees; "Cash - Leave Earned")
                {
                }
                column(CashperLeaveDay_Employees; "Cash per Leave Day")
                {
                }
                column(CauseofInactivityCode_Employees; "Cause of Inactivity Code")
                {
                }
                column(CellularPhoneNumber_Employees; "Cellular Phone Number")
                {
                }
                column(CEO_Employees; CEO)
                {
                }
                column(Citizenship_Employees; Citizenship)
                {
                }
                column(City_Employees; City)
                {
                }
                column(ClaimLimit_Employees; "Claim Limit")
                {
                }
                column(Classification_Employees; Classification)
                {
                }
                column(Comment_Employees; Comment)
                {
                }
                column(CompassionateLeaveAcc_Employees; "Compassionate Leave Acc.")
                {
                }
                column(CompassionateLeaveDays_Employees; "Compassionate Leave Days")
                {
                }
                column(ContractEndDate_Employees; "Contract End Date")
                {
                }
                column(ContractType_Employees; "Contract Type")
                {
                }
                column(COOP_Employees; COOP)
                {
                }
                column(CoOperativeNo_Employees; "Co-Operative No")
                {
                }
                column(CostCenterCode_Employees; "Cost Center Code")
                {
                }
                column(CostObjectCode_Employees; "Cost Object Code")
                {
                }
                column(Country_Employees; Country)
                {
                }
                column(CountryRegionCode_Employees; "Country/Region Code")
                {
                }
                column(County_Employees; County)
                {
                }
                column(CountyofOrigin_Employees; "County of Origin")
                {
                }
                column(CountyofOriginName_Employees; "County of Origin Name")
                {
                }
                column(CountyofResidence_Employees; "County of Residence")
                {
                }
                column(CountyofResidenceName_Employees; "County of Residence Name")
                {
                }
                column(CourtLevels_Employees; "Court Levels")
                {
                }
                column(CummBasicPay_Employees; "Cumm. Basic Pay")
                {
                }
                column(CummNetPay_Employees; "Cumm. Net Pay")
                {
                }
                column(CummPAYE_Employees; "Cumm. PAYE")
                {
                }
                column(cumul_Employees; cumul)
                {
                }
                column(CumulativeQuarters_Employees; "Cumulative Quarters")
                {
                }
                column(CurrencyCode_Employees; "Currency Code")
                {
                }
                column(CurrentDate_Employees; "Current Date")
                {
                }
                column(CurrentDutyStation_Employees; "Current Duty Station")
                {
                }
                column(CurrentJobGrade_Employees; "Current Job Grade")
                {
                }
                column(CurrentPositionID_Employees; "Current Position ID")
                {
                }
                column(CurrentTermsofService_Employees; "Current Terms of Service")
                {
                }
                column(DailyRate_Employees; "Daily Rate")
                {
                }
                column(DateJoinedDB_Employees; "Date Joined DB")
                {
                }
                column(DateJoinedDC_Employees; "Date Joined DC")
                {
                }
                column(DateOfBirth_Employees; "Date Of Birth")
                {
                }
                column(DateOfJoin_Employees; "Employment Date")
                {
                }
                column(DateOfLeaving_Employees; "Date Of Leaving")
                {
                }
                column(DateOfJoiningPayroll_Employees; "Date OfJoining Payroll")
                {
                }
                column(daysworked_Employees; "days worked")
                {
                }
                // column(DaysWorkedperweek_Employees; "Days Worked per week")
                // {
                // }
                // column(DaysDeployed_Employees; DaysDeployed)
                // {
                // }
                // column(DebtorCode_Employees; "Debtor Code")
                // {
                // }
                column(Deduction_Employees; Deduction)
                {
                }

                column(DepartmentCode_Employees; "Department Code")
                {
                }
                column(DepartmentName_Employees; "Department Name")
                {
                }

                column(DirectorateCode_Employees; "Directorate Code")
                {
                }
                // column(DirectorsFees_Employees; "Directors Fees")
                // {
                // }
                column(DisabilityCode_Employees; "Disability Code")
                {
                }
                column(DisabilityDescription_Employees; "Disability Description")
                {
                }
                column(DisabilityNo_Employees; "Disability No.")
                {
                }
                column(Disabled_Employees; Disabled)
                {
                }
                // column(Disciplinarystatus_Employees; "Disciplinary status")
                // {
                // }
                column(Division_Employees; Division)
                {
                }
                column(DrivingLicence_Employees; "Driving Licence")
                {
                }
                column(ECode_Employees; ECode)
                {
                }
                column(EmergencyContactPerson_Employees; "Emergency Contact Person")
                {
                }
                // column(EmpFL_Employees; "Emp F L")
                // {
                // }
                column(EmployeeActQty_Employees; "Employee Act. Qty")
                {
                }
                column(EmployeeArcQty_Employees; "Employee Arc. Qty")
                {
                }
                column(EmployeeContractType_Employees; "Employee Contract Type")
                {
                }
                column(EmployeeContribution_Employees; "Employee Contribution")
                {
                }
                column(EmployeeJobType_Employees; "Employee Job Type")
                {
                }
                column(EmployeePostingGroup_Employees; "Employee Posting Group")
                {
                }
                column(EmployeeQty_Employees; "Employee Qty")
                {
                }
                column(EmployeeType_Employees; "Employee Type")
                {
                }
                column(EmployeesBank_Employees; "Employee's Bank")
                {
                }
                column(EmployeesBank2_Employees; "Employee's Bank 2")
                {
                }
                column(EmployeesType_Employees; "Employees Type")
                {
                }
                column(EmployementTerms_Employees; "Employement Terms")
                {
                }
                column(Employer_Employees; Employer)
                {
                }
                column(EmployerContribution_Employees; "Employer Contribution")
                {
                }
                column(EmployerRent_Employees; "Employer Rent")
                {
                }
                column(EmploymentDate_Employees; "Employment Date")
                {
                }
                column(EmplymtContractCode_Employees; "Emplymt. Contract Code")
                {
                }
                column(EndofContractDate_Employees; "End of Contract Date")
                {
                }
                column(EndOfProbationDate_Employees; "End Of Probation Date")
                {
                }
                column(EndingDate_Employees; "Ending Date")
                {
                }
                column(eRecruitmentProfileID_Employees; "e-Recruitment Profile ID")
                {
                }
                column(EthnicOrigin_Employees; "Ethnic Origin")
                {
                }
                // column(ExemptJobBookOTLD_Employees; "Exempt Job Book OT/LD")
                // {
                // }
                column(ExitInterviewConducted_Employees; "Exit Interview Conducted")
                {
                }
                column(ExitInterviewDate_Employees; "Exit Interview Date")
                {
                }
                column(ExitInterviewDoneby_Employees; "Exit Interview Done by")
                {
                }
                column(Ext_Employees; "Ext.")
                {
                }
                column(Extension_Employees; Extension)
                {
                }
                column(FaxNo_Employees; "Fax No.")
                {
                }
                column(FaxNumber_Employees; "Fax Number")
                {
                }
                column(FirstLanguageRWS_Employees; "First Language (R/W/S)")
                {
                }
                column(FirstName_Employees; "First Name")
                {
                }
                column(FullPartTime_Employees; "Full / Part Time")
                {
                }
                column(FullName_Employees; "Full Name")
                {
                }
                column(Gender_Employees; Gender)
                {
                }
                column(Gender1_Employees; Gender1)
                {
                }
                column(GlobalDimension1Code_Employees; "Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_Employees; "Global Dimension 2 Code")
                {
                }
                column(GrossCash_Employees; "Gross Cash")
                {
                }
                column(Grosspay_Employees; "Gross pay")
                {
                }
                column(GroundsforTermCode_Employees; "Grounds for Term. Code")
                {
                }
                column(HalfPay_Employees; "Half Pay")
                {
                }
                column(Halt_Employees; Halt)
                {
                }
                column(HELBNo_Employees; "HELB No")
                {
                }
                column(HOD_Employees; HOD)
                {
                }
                column(HODIR_Employees; HODIR)
                {
                }
                column(HomeOwnershipStatus_Employees; "Home Ownership Status")
                {
                }
                column(HomePhoneNumber_Employees; "Home Phone Number")
                {
                }
                column(HomeSavings_Employees; "Home Savings")
                {
                }
                column(HourlyRate_Employees; "Hourly Rate")
                {
                }
                column(HouseAllowance1_Employees; "House Allowance1")
                {
                }
                column(HouseRent_Employees; "House Rent")
                {
                }
                column(HousedbyEmployer_Employees; "Housed by Employer")
                {
                }
                column(Housing_Employees; Housing)
                {
                }
                // column(HR_Employees; HR)
                // {
                // }
                column(IBAN_Employees; IBAN)
                {
                }
                column(ICTHelpDeskAdmin_Employees; "ICT Help Desk Admin")
                {
                }
                // column(Id_Employees; Id)
                // {
                // }
                column(IDNumber_Employees; "ID Number")
                {
                }
                column(Image_Employees; Image)
                {
                }
                column(InactiveDate_Employees; "Inactive Date")
                {
                }
                column(IncrementalMonth_Employees; "Incremental Month")
                {
                }
                column(Initials_Employees; Initials)
                {
                }
                column(Insurance_Employees; Insurance)
                {
                }
                column(InsuranceRelief_Employees; "Insurance Relief")
                {
                }
                column(interest_Employees; interest)
                {
                }
                column(JobID_Employees; "Job ID")
                {
                }
                // column(JobNo_Employees; "Job No")
                // {
                // }
                // column(JobTaskNo_Employees; "Job Task No")
                // {
                // }
                column(JobTitle_Employees; "Job Title")
                {
                }
                column(JobTitle2_Employees; "Job Title2")
                {
                }
                column(KnownAs_Employees; "Known As")
                {
                }
                column(LastDateModified_Employees; "Last Date Modified")
                {
                }
                column(LastModifiedBy_Employees; "Last Modified By")
                {
                }
                column(LastModifiedDateTime_Employees; "Last Modified Date Time")
                {
                }
                column(LastName_Employees; "Last Name")
                {
                }
                column(Leave_Employees; Leave)
                {
                }
                column(LeaveAllowance_Employees; "Leave Allowance")
                {
                }
                column(LeaveBalance_Employees; "Leave Balance")
                {
                }
                column(LeaveOutstandingBal_Employees; "Leave Outstanding Bal")
                {
                }
                column(LeaveStatus_Employees; "Leave Status")
                {
                }
                column(LengthOfService_Employees; "Length Of Service")
                {
                }
                column(Level_Employees; Level)
                {
                }
                column(Loans_Employees; Loans)
                {
                }
                // column(LostDays_Employees; LostDays)
                // {
                // }
                // column(LumpSum_Employees; "Lump Sum")
                // {
                // }
                column(ManagerNo_Employees; "Manager No.")
                {
                }
                column(MaritalStatus_Employees; "Marital Status")
                {
                }
                column(MaternityLeaveAcc_Employees; "Maternity Leave Acc.")
                {
                }
                column(MaternityLeaveDays_Employees; "Maternity Leave Days")
                {
                }
                column(MedicalSchemeJoin_Employees; "Medical Scheme Join")
                {
                }
                // column(MedicalSchemeJoinDate_Employees; "Medical Scheme Join Date")
                // {
                // }
                column(MiddleName_Employees; "Middle Name")
                {
                }
                column(MobilePhoneNo_Employees; "Mobile Phone No.")
                {
                }
                // column(MobileBills_Employees; MobileBills)
                // {
                // }
                column(MorgageRelief_Employees; "Morgage Relief")
                {
                }
                // column(MPR_Employees; MPR)
                // {
                // }

                column(NationalID_Employees; "National ID")
                {
                }
                column(NationalityCode_Employees; "Nationality Code")
                {
                }
                column(Netpay_Employees; "Net pay")
                {
                }
                column(NHIF_Employees; NHIF)
                {
                }

                column(NightAllowanceDays_Employees; "Night Allowance Days")
                {
                }
                column(No_Employees; "No.")
                {
                }
                column(NoofAppraisals_Employees; "No. of Appraisals")
                {
                }
                column(NoofChildren_Employees; "No. of Children")
                {
                }
                column(NoofCommitteeAppointments_Employees; "No. of Committee Appointments")
                {
                }
                column(NoOfDaysWorked_Employees; "No. Of Days Worked")
                {
                }
                column(NoofDisciplinaryCases_Employees; "No. of Disciplinary Cases")
                {
                }
                column(NoofEmploymentContracts_Employees; "No. of Employment Contracts")
                {
                }
                column(NoofHours_Employees; "No. of Hours")
                {
                }
                column(NoOfHoursWeekend_Employees; "No. Of Hours Weekend")
                {
                }
                column(NoofJobApplications_Employees; "No. of Job Applications")
                {
                }
                column(NoofPromotions_Employees; "No. of Promotions")
                {
                }
                column(NoofTrainings_Employees; "No. of Trainings")
                {
                }
                column(NoofTransfers_Employees; "No. of Transfers")
                {
                }
                column(NoSeries_Employees; "No. Series")
                {
                }
                // column(NonCashBenefit_Employees; "Non Cash Benefit")
                // {
                // }
                column(NonFluctuatingAllowance_Employees; "Non-Fluctuating Allowance")
                {
                }
                // column(NormalWorkingDays_Employees; "Normal Working Days")
                // {
                // }
                column(NoticePeriod_Employees; "Notice Period")
                {
                }
                column(NSSF_Employees; "N.H.I.F No")
                {
                }
                column(NSSFNo_Employees; "Social Security No.")
                {
                }
                // column(OffDays_Employees; "Off Days")
                // {
                // }
                column(OffDaysAcc_Employees; "Off Days Acc.")
                {
                }
                column(OnInterdiction_Employees; "On Interdiction")
                {
                }
                column(OnLeave_Employees; "On Leave")
                {
                }
                column(OnProbation_Employees; "On Probation")
                {
                }
                column(OnSuspension_Employees; "On Suspension")
                {
                }
                column(OpeningEmployerSSF_Employees; "Opening Employer SSF")
                {
                }
                column(OpeningPAYE_Employees; "Opening PAYE")
                {
                }
                column(OtherAllowance_Employees; "Other Allowance")
                {
                }
                column(Otherallowances_Employees; "Other allowances")
                {
                }
                column(Otherdeductions_Employees; "Other deductions")
                {
                }
                column(OtherLanguageRead_Employees; "Other Language Read")
                {
                }
                column(OtherLanguageSpeak_Employees; "Other Language Speak")
                {
                }
                column(OtherLanguageWrite_Employees; "Other Language Write")
                {
                }
                column(Overtime_Employees; Overtime)
                {
                }
                column(OvertimeAllowance_Employees; "Overtime Allowance")
                {
                }
                column(Overtimetaxed_Employees; "Overtime taxed")
                {
                }
                // column(Overtime15_Employees; "Overtime1.5")
                // {
                // }
                // column(Overtime20_Employees; "Overtime2.0")
                // {
                // }
                column(OwnerOccupier_Employees; "Owner Occupier")
                {
                }
                column(PIN_Employees; "P.I.N")
                {
                }
                column(Pager_Employees; Pager)
                {
                }
                // column(PaidOvertime_Employees; "Paid Overtime?")
                // {
                // }
                column(PassportNo_Employees; "Passport No.")
                {
                }
                column(PassportNumber_Employees; "Passport Number")
                {
                }
                column(PaternityLeaveAcc_Employees; "Paternity Leave Acc.")
                {
                }
                column(PaternityLeaveDays_Employees; "Paternity Leave Days")
                {
                }
                column(PayMode_Employees; "Pay Mode")
                {
                }
                // column(PayWages_Employees; "Pay Wages")
                // {
                // }
                column(PAYE_Employees; PAYE)
                {
                }
                column(PAYEDiff_Employees; "PAYE Diff")
                {
                }
                column(PayingBankCode_Employees; "Paying Bank Code")
                {
                }
                column(Payment_Employees; Payment)
                {
                }
                // column(PaymentMode_Employees; "Payment Mode")
                // {
                // }
                // column(Paypoint_Employees; Paypoint)
                // {
                // }
                // column(PayrollGroup_Employees; "Payroll Group")
                // {
                // }
                // column(PayrollNumber_Employees; "Payroll Number")
                // {
                // }
                column(PayrollPayMode_Employees; "Payroll Pay Mode")
                {
                }
                // column(PayrollPeriod_Employees; "Payroll Period")
                // {
                // }
                column(PaysNHIF_Employees; "Pays N.H.I.F")
                {
                }
                // column(PaysSSF_Employees; "Pays SSF?")
                // {
                // }
                column(Paystax_Employees; "Pays tax?")
                {
                }
                column(PensionSchemeJoin_Employees; "Pension Scheme Join")
                {
                }
                column(PensionNo_Employees; PensionNo)
                {
                }
                column(PhoneNo_Employees; "Phone No.")
                {
                }
                column(PINNumber_Employees; "PIN Number")
                {
                }
                column(Position_Employees; Position)
                {
                }
                column(PositionToSucceed_Employees; "Position To Succeed")
                {
                }
                // column(Position1_Employees; Position1)
                // {
                // }
                column(PostCode_Employees; "Post Code")
                {
                }
                column(PostCode2_Employees; "Post Code2")
                {
                }
                column(PostalAddress_Employees; "Postal Address")
                {
                }
                column(PostalAddress2_Employees; "Postal Address2")
                {
                }
                column(PostalAddress3_Employees; "Postal Address3")
                {
                }
                column(PostingGroup_Employees; "Posting Group")
                {
                }
                column(Present_Employees; Present)
                {
                }
                column(Previous_Employees; Previous)
                {
                }
                // column(PreviousTermsofService_Employees; "Previous  Terms of Service")
                // {
                // }
                column(PreviousPaymentSystem_Employees; "Previous Payment System")
                {
                }
                column(PrimaryBank_Employees; "Primary Bank %")
                {
                }
                column(PrimaryFirstName_Employees; "Primary First Name")
                {
                }
                column(PrimaryLastName_Employees; "Primary Last Name")
                {
                }
                column(PrimaryRelationship_Employees; "Primary Relationship")
                {
                }
                column(PrimaryTelephoneNo_Employees; "Primary Telephone No.")
                {
                }
                column(PrivacyBlocked_Employees; "Privacy Blocked")
                {
                }
                // column(Projects_Employees; Projects)
                // {
                // }
                column(ProRataCalculated_Employees; "Pro-Rata Calculated")
                {
                }
                column(ProRataonJoining_Employees; "Pro-Rata on Joining")
                {
                }
                column(ProrataonLeaving_Employees; "Pro-rata on Leaving")
                {
                }
                // column(PublicHolidayDays_Employees; "Public Holiday Days")
                // {
                // }
                // column(Rank_Employees; Rank)
                // {
                // }
                column(Reasonfortermination_Employees; "Reason for termination")
                {
                }
                column(RecordType_Employees; "Record Type")
                {
                }
                column(Region_Employees; Region)
                {
                }
                column(RegionalManager_Employees; "Regional Manager")
                {
                }
                // column(RegistrationCode_Employees; "Registration Code")
                // {
                // }
                column(ReimbursedLeaveDays_Employees; "Reimbursed Leave Days")
                {
                }
                column(ReliefAmount_Employees; "Relief Amount")
                {
                }
                column(Religion_Employees; Religion)
                {
                }
                column(ReliverCode_Employees; "Reliver Code")
                {
                }
                column(ResearchCenter_Employees; "Research Center")
                {
                }
                column(ResidentialAddress_Employees; "Residential Address")
                {
                }
                column(ResidentialAddress2_Employees; "Residential Address2")
                {
                }
                column(ResidentialAddress3_Employees; "Residential Address3")
                {
                }
                column(ResidentialStatus_Employees; "Residential Status")
                {
                }
                column(ResourceNo_Employees; "Resource No.")
                {
                }
                column(ResponsibilityCenter_Employees; "Responsibility Center")
                {
                }
                column(RetirementContribution_Employees; "Retirement Contribution")
                {
                }
                column(RetirementDate_Employees; "Retirement Date")
                {
                }
                column(SalaryScale_Employees; "Salary Scale")
                {
                }
                column(SalarySchemeCategory_Employees; "Salary Scheme Category")
                {
                }
                column(SalarySteps_Employees; "Salary Steps")
                {
                }
                column(SalaryType_Employees; "Salary Type")
                {
                }
                column(SalespersPurchCode_Employees; "Salespers./Purch. Code")
                {
                }
                column(SearchName_Employees; "Search Name")
                {
                }
                column(SecEmergencyContactPerson_Employees; "Sec Emergency Contact Person")
                {
                }
                column(SecondLanguageRWS_Employees; "Second Language (R/W/S)")
                {
                }
                column(SecondaryFirstName_Employees; "Secondary First Name")
                {
                }
                column(SecondaryLastName_Employees; "Secondary Last Name")
                {
                }
                column(SecondaryRelationship_Employees; "Secondary Relationship")
                {
                }
                column(SecondaryTelephoneNo_Employees; "Secondary Telephone No.")
                {
                }
                column(SectionLocation_Employees; "Section/Location")
                {
                }
                column(SendAlertto_Employees; "Send Alert to")
                {
                }
                column(SendPayslipByEmail_Employees; "Send Payslip By E-mail?")
                {
                }
                column(ServedNoticePeriod_Employees; "Served Notice Period")
                {
                }
                column(ShareAmount_Employees; "Share Amount")
                {
                }
                column(Shift_Employees; Shift)
                {
                }
                column(SickLeave_Employees; "Sick Leave")
                {
                }
                column(SickLeaveAcc_Employees; "Sick Leave Acc.")
                {
                }
                column(SKey_Employees; SKey)
                {
                }
                column(SocialSecurityNo_Employees; "Social Security No.")
                {
                }
                column(SpecialPension_Employees; "Special Pension")
                {
                }
                column(SpecializationArea_Employees; "Specialization Area")
                {
                }
                column(SportsLeaveAcc_Employees; "Sports Leave Acc")
                {
                }
                column(SSFEmployertoDate_Employees; "SSF Employer to Date")
                {
                }
                column(StaffingGroup_Employees; "Staffing Group")
                {
                }
                column(StartingDate_Employees; "Starting Date")
                {
                }
                column(StatisticsGroupCode_Employees; "Statistics Group Code")
                {
                }
                column(Status_Employees; Status)
                {
                }
                column(StudyLeaveAcc_Employees; "Study Leave Acc")
                {
                }
                column(StudyLeaveDays_Employees; "Study Leave Days")
                {
                }
                column(SuccesionDate_Employees; "Succesion Date")
                {
                }
                column(Supervisor_Employees; Supervisor)
                {
                }
                column(SWIFTCode_Employees; "SWIFT Code")
                {
                }
                column(SystemCreatedAt_Employees; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_Employees; SystemCreatedBy)
                {
                }
                column(SystemId_Employees; SystemId)
                {
                }
                column(SystemModifiedAt_Employees; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_Employees; SystemModifiedBy)
                {
                }
                column(TaxDeductibleAmount_Employees; "Tax Deductible Amount")
                {
                }
                column(TaxDeductibletoDate_Employees; "Tax Deductible to Date")
                {
                }
                column(TaxRelief_Employees; "Tax Relief")
                {
                }
                column(TaxReliefAmount_Employees; "Tax Relief Amount")
                {
                }
                column(TaxableAllowance_Employees; "Taxable Allowance")
                {
                }
                column(TaxableIncome_Employees; "Taxable Income")
                {
                }
                column(TerminalDues_Employees; "Terminal Dues")
                {
                }
                column(TerminalLeave_Employees; "Terminal Leave")
                {
                }
                column(TerminationCategory_Employees; "Termination Category")
                {
                }
                column(TerminationDate_Employees; "Termination Date")
                {
                }
                column(TimeMedicalScheme_Employees; "Time Medical Scheme")
                {
                }
                column(TimePensionScheme_Employees; "Time Pension Scheme")
                {
                }
                column(Title_Employees; Title)
                {
                }
                column(TotalLeaveDays_Employees; "Total (Leave Days)")
                {
                }
                column(TotalAbsenceBase_Employees; "Total Absence (Base)")
                {
                }
                column(TotalAllowances_Employees; "Total Allowances")
                {
                }
                column(TotalAllowances1_Employees; "Total Allowances1")
                {
                }
                column(TotalDeductions_Employees; "Total Deductions")
                {
                }
                column(Totalearnings_Employees; "Total earnings")
                {
                }
                column(TotalGratuityAmount_Employees; "Total Gratuity Amount")
                {
                }
                column(TotalLeaveTaken_Employees; "Total Leave Taken")
                {
                }
                column(TotalQuarters_Employees; "Total Quarters")
                {
                }
                column(TotalSavings_Employees; "Total Savings")
                {
                }
                column(TotalStatutory_Employees; "Total Statutory")
                {
                }
                column(TransportAllowance_Employees; "Transport Allowance")
                {
                }
                column(TRelief_Employees; TRelief)
                {
                }
                column(UnionCode_Employees; "Union Code")
                {
                }
                column(UnionMembershipNo_Employees; "Union Membership No.")
                {
                }
                column(UnpaidLeave_Employees; "Unpaid Leave")
                {
                }
                column(UnpaidLeaveAcc_Employees; "Unpaid Leave Acc")
                {
                }
                column(UnpaidLeaveDays_Employees; "Unpaid Leave Days")
                {
                }
                column(UserID_Employees; "User ID")
                {
                }
                column(UserSignature_Employees; "User Signature")
                {
                }
                column(WelfareMember_Employees; "Welfare Member")
                {
                }
                column(WorkPhoneNumber_Employees; "Work Phone Number")
                {
                }
                column(WorkingHours_Employees; "Working Hours")
                {
                }

            }

            trigger OnAfterGetRecord()
            begin
                Employee.Get("Employee No.");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        EmployeeQualificationFilter := "Employee Qualification".GetFilters();
    end;

    var
        Employee: Record Employee;
        EmployeeQualificationFilter: Text;
        Employee___QualificationsCaptionLbl: Label 'Employee - Qualifications';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_Qualification__To_Date_CaptionLbl: Label 'To Date';
        Employee_Qualification__From_Date_CaptionLbl: Label 'From Date';
}

