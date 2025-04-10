Report 52193595 "PR Master Roll Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Master Roll Report.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;
            DataItemTableView = where(Status = const(Active));
            column(No_; "No.")
            {

            }
            dataitem("PR Period Transactions"; "PR Period Transactions")
            {
                DataItemLink = "Employee Code" = field("No.");
                RequestFilterFields = "Payroll Period";
                column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code")
                {
                }
                column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount)
                {
                }
                column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code")
                {
                }
                column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name")
                {
                }
                column(PeriodMonth_PRPeriodTransactions; "PR Period Transactions"."Period Month")
                {
                }
                column(PeriodYear_PRPeriodTransactions; "PR Period Transactions"."Period Year")
                {
                }
                column(GlobalDimension1Code_PRPeriodTransactions; "PR Period Transactions"."Global Dimension 1 Code")
                {
                }
                column(GroupOrder_PRPeriodTransactions; "PR Period Transactions"."Group Order")
                {
                }
                column(SubGroupOrder_PRPeriodTransactions; "PR Period Transactions"."Sub Group Order")
                {
                }
                column(FullName; FullName)
                {
                }
                column(RowNum; RowNum)
                {
                }
                column(HideDetails; HideDetails)
                {
                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {

                }
                column(Status; Status)
                {

                }
                column(Gender; Gender)
                {

                }
                column(StationCode; "Current Duty Station")
                { }
                column(Station; Station)
                { }
                column(OrgUnit; "Organisation Unit Name")
                { }
                column(Category; "Employee Category Type")
                {

                }
                column(LastPromoDate; "Last Promotion Date")
                { }
                column(CostCenterName; "Implementing Unit Name")
                {

                }
                column(Designation; "Job Title2")
                {

                }
                column(Grade; "Salary Scale")
                {

                }

                dataitem("HR Bank Summary"; "HR Bank Summary")
                {
                    DataItemLink = "No." = field("No.");
                    DataItemLinkReference = Employee;
                    column(ACNumber_HRBankSummary; "A/C Number")
                    {
                    }
                    column(BankCode_HRBankSummary; "Bank Code")
                    {
                    }
                    column(BankName_HRBankSummary; "Bank Name")
                    {
                    }
                    column(BankandBranchCode_HRBankSummary; "Bank and Branch Code")
                    {
                    }
                    column(BranchName_HRBankSummary; "Branch Name")
                    {
                    }
                    column(BranchCode_HRBankSummary; "Branch Code")
                    {
                    }
                    column(DateofEmployment; "Employment Date")
                    {

                    }


                    trigger OnPreDataItem()
                    begin
                        SetRange("Payroll Period", PayPeriod);
                    end;

                    trigger OnAfterGetRecord()
                    begin


                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    FullName := '';
                    RowNum := 0;
                    GLSetup.Get();
                    if "PR Period Transactions"."Employee Code" <> "PR Period Transactions"."Employee Code" then RowNum += 1;

                    Clear(HREmp);
                    HREmp.Reset();
                    HREmp.SetRange(HREmp."No.", "PR Period Transactions"."Employee Code");
                    if HREmp.Find('-') then begin
                        FullName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                        // Designation := HREmp."Job Title2";
                        // Grade := HREmp."Salary Scale";
                        // OrgUnit := HREmp."Organisation Unit Name";
                        // DateofEmployment := HREmp."Employment Date";
                        // StationCode := HREmp."Current Duty Station";
                        CostCenterName := HREmp."Implementing Unit Name";
                        "Global Dimension 1 Code" := HREmp."Directorate Code";
                        if DutyStation.Get("Current Duty Station") then
                            Station := DutyStation.Description;
                        if HREmp."Employee Status 2" = HREmp."Employee Status 2"::" " then
                            Status := Format(HREmp.Status)
                        else
                            Status := Format(HREmp."Employee Status 2");
                        Gender := Format(HREmp.Gender);
                        //Category := Format(HREmp."Employee Category Type");
                        //LastPromoDate := HREmp."End Of Probation Date";
                    end;


                end;
            }
            dataitem("PR Employer Deductions"; "PR Employer Deductions")
            {
                DataItemLink = "Employee Code" = field("No.");
                DataItemLinkReference = Employee;
                column(Amount_PREmployerDeductions; Amount)
                {
                }
                column(EmployeeCode_PREmployerDeductions; "Employee Code")
                {
                }
                column(PayrollPeriod_PREmployerDeductions; "Payroll Period")
                {
                }
                column(PeriodClosed_PREmployerDeductions; "Period Closed")
                {
                }
                column(PeriodMonth_PREmployerDeductions; "Period Month")
                {
                }
                column(PeriodYear_PREmployerDeductions; "Period Year")
                {
                }
                column(PostingGroup_PREmployerDeductions; "Posting Group")
                {
                }
                column(TransactionCode_PREmployerDeductions; CodeName)
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Payroll Period", PayPeriod);
                end;

                trigger OnAfterGetRecord()
                begin
                    CodeName := '';
                    if TransactionCodes.Get("Transaction Code") then
                        CodeName := 'Employer ' + TransactionCodes."Transaction Name";
                    if CodeName = '' then
                        CodeName := 'Employer ' + "Transaction Code";
                end;
            }

        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(HideDetails; HideDetails)
                {
                    ApplicationArea = Basic;
                    Caption = 'Hide Details';
                }
                field(PayPeriod; PayPeriod)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods"."Date Opened";
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

    trigger OnInitReport()
    begin

        if "PR Period Transactions".GetFilter("PR Period Transactions"."Payroll Period") = '' then begin
            PRPayrollPeriods.Reset;
            PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
            if PRPayrollPeriods.Find('-') then begin
                "PR Period Transactions".SetFilter("PR Period Transactions"."Payroll Period", Format(PRPayrollPeriods."Date Opened"));
            end;
        end;
    end;

    trigger OnPreReport()
    begin
        "PR Period Transactions".SetCurrentkey("PR Period Transactions"."Employee Code", "PR Period Transactions"."Period Month", "PR Period Transactions"."Period Year",
        "PR Period Transactions"."Group Order", "PR Period Transactions"."Sub Group Order");
    end;

    var
        HREmp: Record "Employee";
        FullName: Text;
        RowNum: Integer;
        HideDetails: Boolean;
        TransactionCodes: Record "PR Transaction Codes";
        CodeName: Text[100];
        PRPayrollPeriods: Record "PR Payroll Periods";
        CostCenterName: Text[100];
        DimVal: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
        Designation: Text[100];
        Grade: Code[20];
        DateofEmployment: Date;
        Status: Text[20];
        StationCode: Code[20];
        Station: Text[100];
        OrgUnit: Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        PayPeriod: Date;
        DutyStation: Record "Duty Station";
        Category: Text[50];
        Gender: Text[10];
        LastPromoDate: Date;
}

