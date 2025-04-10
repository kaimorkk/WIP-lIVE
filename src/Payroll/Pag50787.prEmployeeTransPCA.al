
page 52193648 "prEmployee Trans PCA"
{
    PageType = ListPart;
    SourceTable = "prEmployee Trans PCA";
    Caption = 'PCA Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TransactionCode; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        objPCAheader.Reset;
                        objPCAheader.SetRange(objPCAheader."Change Advice Serial No.", Rec."Change Advice Serial No.");
                        if objPCAheader.Find('-') then begin
                            SelectedPeriod := objPCAheader."Payroll Period";
                            Rec."Period Month" := objPCAheader."Period Month";
                            Rec."Period Year" := objPCAheader."Period Year";
                            Rec."Document Type" := objPCAheader."Document Type";
                            if (objPCAheader."Source Document" = objPCAheader."Source Document"::Mobility)
                            or (objPCAheader."Source Document" = objPCAheader."Source Document"::Recruitment) then
                                Inaonekana := true else
                                Inaonekana := false;

                        end;

                        SetPageControlAppearance();

                        blnIsLoan := false;
                        if objTransCodes.Get(Rec."Transaction Code") then
                            Rec."Transaction Name" := objTransCodes."Transaction Name";
                        Rec."Payroll Period" := SelectedPeriod;
                        if objTransCodes."Special Trans Deductions" = 8 then blnIsLoan := true;

                        if objTransCodes."Is Formula" = true then begin
                            empCode := Rec."Employee Code";
                            Clear(objOcx);
                            // curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes.Formula);
                            // Amount:=curTransAmount;
                        end;

                        //*************ENTER IF EMPLOYER DEDUCTION IS SET UP
                        curTransAmount := 0;

                        if objTransCodes."Include Employer Deduction" = true then begin
                            // curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes."Is Formula for employer");
                            // "Employer Amount":=curTransAmount;
                        end;
                    end;
                }
                field(TransactionName; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field("Change Type"; Rec."Change Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Change Type field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Rate; Rec.Rate)
                {
                    Visible = Inaonekana;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
                field(Kilometers; Rec.Kilometers)
                {
                    Visible = Inaonekana;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Kilometers field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    Visible = Inaonekana;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Payable; Rec.Payable)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payable field.';
                }
                field(Paid; Rec.Paid)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paid field.';
                }

                field(Difference; Rec.Difference)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Difference field.';
                }

                field(SubTotal; Rec.SubTotal)
                {

                    ApplicationArea = Basic;
                }
                field(Balance; Rec.Balance)
                {

                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployerAmount; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(StartDate; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Has Insurance Certificate"; Rec."Has Insurance Certificate")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    var
        objTransCodes: Record "pr Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "pr Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "pr Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        blnIsLoan: Boolean;
        objEmpTrans: Record "pr Employee Transactions";
        transType: Text[30];
        objOcx: Codeunit "PR Payroll Processing";
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        Employee: Record "Employee";
        EmpTrans: Record "pr Employee Transactions";
        VitalSetUp: Record "pr Vital Setup Info";
        SalaryCard: Record "pr Salary Card";
        TotalEarnings: Decimal;
        ArreasAmount: Decimal;
        ArrearsDays: Integer;
        NoOfMonthDays: Integer;
        i: Integer;
        RemainingDays: Integer;
        TDate: Date;
        objPCAheader: Record "prBasic pay PCA";
        Inaonekana: Boolean;
        IsLifeInsuranceVisible: Boolean;

    procedure IsLifeInsurance(): Boolean
    var
        prtransactioncode: Record "PR Transaction Codes";
    begin
        if prtransactioncode.Get(Rec."Transaction Code") then
            if prtransactioncode."Special Trans Deductions" in [prtransactioncode."Special Trans Deductions"::"Life Insurance"] then
                exit(true)
            else
                exit(false);
    end;

    procedure SetPageControlAppearance()
    begin
        IsLifeInsuranceVisible := IsLifeInsurance();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetPageControlAppearance();
    end;
}

#pragma implicitwith restore

