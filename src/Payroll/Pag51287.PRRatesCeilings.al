
page 52193655 "PR Rates & Ceilings"
{
    PageType = Card;
    SourceTable = "PR Vital Setup Info";

    layout
    {
        area(content)
        {
            group(TaxRelief)
            {
                Caption = 'Taxation & Relief';

                field(SetupCode; Rec."Setup Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Control20; Rec."Tax Relief")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceRelief; Rec."Insurance Relief")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumReliefAmount; Rec."Minimum Relief Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaxRelief; Rec."Max Relief")
                {
                    Caption = 'Max Insurance Relief';
                    ApplicationArea = Basic;
                }
                field(DisbledTaxLimit; Rec."Disbled Tax Limit")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumTaxablePay; Rec."Minimum Taxable Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Hardship Allowance Code"; Rec."Hardship Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Seconded Emp PAYE"; Rec."Seconded Emp PAYE")
                {
                    ApplicationArea = Basic;
                }
                field("Casual Rates Resource"; Rec."Casual Rates Resource")
                {
                    ApplicationArea = Basic;
                }

            }
            group(Mobility)
            {
                field("Baggage Allowance Code"; Rec."Baggage Allowance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Baggage Allowance Code field.';
                }
                field("Baggage Allowance Distance"; Rec."Baggage Allowance Distance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Baggage Allowance Distance(KMs) field.';
                }
                field("Transfer Allowance Code"; Rec."Transfer Allowance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Allowance Code field.';
                }
            }
            group(NSSFContribution)
            {
                Caption = 'NSSF Contribution';
                field(NSSFEmployee; Rec."NSSF Employee")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFEmployerFactor; Rec."NSSF Employer Factor")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFBasedon; Rec."NSSF Based on")
                {
                    ApplicationArea = Basic;
                }
                field(ImplementNewNSSF; Rec."Implement New NSSF")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFRate; Rec."NSSF Rate")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFLowerEarningLimit; Rec."NSSF Lower Earning Limit(LEL)")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFUpperEarningLimit; Rec."NSSF Upper Earning Limit(UEL)")
                {
                    ApplicationArea = Basic;
                }

            }
            group(NHIF)
            {
                Caption = 'SHIF';
                field(Selectone; Rec."NHIF Based on")
                {

                    ApplicationArea = Basic;
                    Caption = 'SHIF Based on:';
                }
                field("SHIF Percentage %"; Rec."SHIF Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SHIF Percentage field.', Comment = '%';
                }

                field("Implement NHIF Relief"; Rec."Implement NHIF Relief")
                {
                    Caption = 'Implement SHIF Relief';
                    ApplicationArea = Basic;
                }

                field("NHIF Relief Percentage"; Rec."NHIF Relief Percentage")
                {
                    Caption = 'SHIF Relief Percentage';

                    ApplicationArea = basic;

                }
                field("Enable Relief On PAYE Only"; Rec."Enable Relief On PAYE Only")
                {
                    ApplicationArea = basic;

                }
            }
            group(Housing)
            {
                Caption = 'Housing';
                field("Implement Housing Levy"; Rec."Implement Housing Levy")
                {
                    ApplicationArea = basic;
                }
                field("Housing Levy"; Rec."Housing Levy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Housing Levy field.';
                }
                field("Housing Employee Code"; Rec."Housing Employee Code")
                {
                    ApplicationArea = All;
                    Caption = 'House Allowance';
                    ToolTip = 'Specifies the value of the Housing Employee Code field.';
                }



            }
            group(Pension)
            {
                Caption = 'Pension';
                field(MaxPensionContribution; Rec."Max Pension Contribution")
                {
                    ApplicationArea = Basic;
                }
                field(TaxOnExcessPension; Rec."Tax On Excess Pension")
                {
                    ApplicationArea = Basic;
                }
                field("PrPension Employer Code"; Rec."PrPension Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field("PrPension Employee Code"; Rec."PrPension Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Post-Retirement Medical"; Rec."Post-Retirement Medical")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post-Retirement Medical field.', Comment = '%';
                }
            }
            group(Arrears)
            {
                field("Salary Arrears Code"; Rec."Salary Arrears Code")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Arrears Employee Code"; Rec."Pension Arrears Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Arrears Employee Code field.';
                }
                field("Pension Arrears Employer Code"; Rec."Pension Arrears Employer Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Arrears Employer Code field.';
                }

                field("Pension Arrears Employee"; Rec."Pension Arrears Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Arrears Employee field.';
                }
                field("Pension Arrear Employer"; Rec."Pension Arrear Employer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pension Arrear Employer field.';
                }
            }
            group(Mortgage)
            {
                Caption = 'Mortgage';
                field(MortgageReliefLessfromTaxablePay; Rec."Mortgage Relief")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mortgage Relief (Less from Taxable Pay)';
                }
                field(MortgageReliefPercentage; Rec."Mortgage Relief Percentage")
                {
                    ApplicationArea = Basic;
                }
            }
            group(OwnerOccupierInterest)
            {
                Caption = 'Owner Occupier Interest';
                field(MaxMonthlyContribution; Rec."OOI Deduction")
                {
                    ApplicationArea = Basic;
                    Caption = 'Max Monthly Contribution';
                }
                field(Decemberdeduction; Rec."OOI December")
                {
                    ApplicationArea = Basic;
                    Caption = 'December deduction';
                }
            }
            group(StaffLoans)
            {
                Caption = 'Staff Loans';
                field(LoanMarketRate; Rec."Loan Market Rate")
                {
                    ApplicationArea = Basic;
                }
                field(LoanCorporateRate; Rec."Loan Corporate Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance Code"; Rec."Salary Advance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Advance Code field.';
                }
                field("Salary Advance Recovery"; Rec."Salary Advance Recovery")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Advance Recovery field.';
                }
            }
            group(Training)
            {

                field("Local Training Levy"; Rec."Local Training Levy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Local Training Levy field.';
                }
                field("Int. Training Levy"; Rec."Int. Training Levy")
                {
                    ApplicationArea = All;
                    Caption = 'International Training Levy';
                    ToolTip = 'Specifies the value of the Int. Training Levy field.';
                }
            }
            group("Other Transactions")
            {

                field(NITA; Rec.NITA)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NITA field.';
                }
                field("TopUp Allowance"; Rec."TopUp Allowance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TopUp Allowance field.';
                }
            }
            group(PayslipMessage)
            {
                Caption = 'Payslip Message';
                field(Control27; Rec."Payslip Message")
                {
                    ApplicationArea = Basic;
                }
                field(PWDStaffRetirementAge; Rec."PWD Staff Retirement Age")
                {
                    ApplicationArea = Basic;
                }
                field(OtherStaffRetirementAge; Rec."Other Staff Retirement Age")
                {
                    ApplicationArea = Basic;
                }

                field("Encrypt Payroll Document"; Rec."Encrypt Payroll Document")
                {
                    ApplicationArea = all;
                }
            }

            group(PayrollProration)
            {
                Caption = 'Payroll Proration';
                field("Enable Payroll Proration"; Rec."Enable Payroll Proration")
                {
                    ApplicationArea = Basic;
                }
                field("Exclude A Third"; Rec."Exclude A Third")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exclude A Third field.';
                }
            }
            group("Payroll PVS Default Dimensions")
            {
                field("Payroll PVS Default Dim 1"; Rec."Payroll PVS Default Dim 1")
                {
                    ApplicationArea = All;
                }

                field("Payroll PVS Default Dim 2"; Rec."Payroll PVS Default Dim 2")
                {
                    ApplicationArea = All;
                }
                field("Payroll PVS Default Dim 3"; Rec."Payroll PVS Default Dim 3")
                {
                    ApplicationArea = All;
                }
                field("Payroll PVS Default Dim 4"; Rec."Payroll PVS Default Dim 4")
                {
                    ApplicationArea = All;
                }
                field("Payroll PVS Default Dim 5"; Rec."Payroll PVS Default Dim 5")
                {
                    ApplicationArea = All;
                }
                field("Payroll PVS Default Dim 6"; Rec."Payroll PVS Default Dim 6")
                {
                    ApplicationArea = All;
                }
                field("Payroll PVS Default Dim 7"; Rec."Payroll PVS Default Dim 7")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}

#pragma implicitwith restore
