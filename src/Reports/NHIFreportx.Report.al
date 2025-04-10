//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511144_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511144) { }
//type("System.IO.Path"; System_IO_Path51511144) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193559 "NHIF reportx"
{
    RDLCLayout = './Layouts/NHIFreportx.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Assignment Matrix-X1"; "Assignment Matrix-X1")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") where(Type = const(Deduction));
            RequestFilterFields = "Payroll Period", "Employee No";
            RequestFilterHeading = 'NHIF';
            column(ReportForNavId_5751; 5751) { } // Autogenerated by ForNav - Do not delete
                                                  //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
                                                  // {
                                                  // }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4____; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(EmployerNHIFNo; EmployerNHIFNo)
            {
            }
            column(Address; Address)
            {
            }
            column(Tel; Tel)
            {
            }
            column(CompPINNo; CompPINNo)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            //column(CurrReport_PAGENO_Control42; Format(//ReportForNav.PageNo))
            //   {
            //   }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME_Control1000000006; COMPANYNAME)
            {
            }
            column(EmployerNHIFNo_Control1000000007; EmployerNHIFNo)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4_____Control1000000009; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(ABS__Assignment_Matrix_X1__Amount_; Abs("Assignment Matrix-X1".Amount))
            {
            }
            column(NhifNo; NhifNo)
            {
            }
            column(LastName; LastName)
            {
            }
            column(Assignment_Matrix_X1__Assignment_Matrix_X1___Employee_No_; "Assignment Matrix-X1"."Employee No")
            {
            }
            column(FirstName; FirstName)
            {
            }
            column(YEAR; YEAR)
            {
            }
            column(Id; Id)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(Counter; Counter)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(ID_PassportCaption; ID_PassportCaptionLbl)
            {
            }
            column(Date_of_BirthCaption; Date_of_BirthCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(NHIF_No_Caption; NHIF_No_CaptionLbl)
            {
            }
            column(MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaption; MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaptionLbl)
            {
            }
            column(Name_of_EmployeeCaption; Name_of_EmployeeCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption; EMPLOYER_NOCaptionLbl)
            {
            }
            column(Payroll_No_Caption; Payroll_No_CaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(EMPLOYERCaption; EMPLOYERCaptionLbl)
            {
            }
            column(ADDRESSCaption; ADDRESSCaptionLbl)
            {
            }
            column(EMPLOYER_PIN_NOCaption; EMPLOYER_PIN_NOCaptionLbl)
            {
            }
            column(TEL_NOCaption; TEL_NOCaptionLbl)
            {
            }
            column(PageCaption_Control44; PageCaption_Control44Lbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaption; NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption_Control1000000008; EMPLOYER_NOCaption_Control1000000008Lbl)
            {
            }
            column(PERIODCaption_Control1000000010; PERIODCaption_Control1000000010Lbl)
            {
            }
            column(AmountCaption_Control1000000005; AmountCaption_Control1000000005Lbl)
            {
            }
            column(ID_PassportCaption_Control1000000049; ID_PassportCaption_Control1000000049Lbl)
            {
            }
            column(Date_of_BirthCaption_Control1000000051; Date_of_BirthCaption_Control1000000051Lbl)
            {
            }
            column(NHIF_No_Caption_Control1000000053; NHIF_No_Caption_Control1000000053Lbl)
            {
            }
            column(Name_of_EmployeeCaption_Control1000000055; Name_of_EmployeeCaption_Control1000000055Lbl)
            {
            }
            column(Payroll_No_Caption_Control1000000056; Payroll_No_Caption_Control1000000056Lbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
            {
            }
            column(Assignment_Matrix_X1_Type; "Assignment Matrix-X1".Type)
            {
            }
            column(Assignment_Matrix_X1_Code; "Assignment Matrix-X1".Code)
            {
            }
            column(Assignment_Matrix_X1_Payroll_Period; "Assignment Matrix-X1"."Payroll Period")
            {
            }
            column(Assignment_Matrix_X1_Reference_No; "Assignment Matrix-X1"."Reference No")
            {
            }
            trigger OnPreDataItem();
            begin
                DateSpecified := "Assignment Matrix-X1".GetRangeMin("Assignment Matrix-X1"."Payroll Period");
                // if CompInfoSetup.Get() then
                ;
            end;

            trigger OnAfterGetRecord();
            begin
                Deductions.SetRange(Deductions."Employee No", "Assignment Matrix-X1"."Employee No");
                Deductions.SetRange(Deductions."Normal Earnings", true);
                // Deductions.SETRANGE(Deductions."Interest Amount",FALSE);
                if Deductions.Find('-') then begin
                    if Emp.Get("Assignment Matrix-X1"."Employee No") then begin
                        NhifNo := Emp."N.H.I.F No";
                        FirstName := Emp."First Name";
                        LastName := Emp."Last Name";
                        TotalAmount := TotalAmount + Abs("Assignment Matrix-X1".Amount);
                    end;
                end;
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                    }
                }
            }
        }

    }

    trigger OnInitReport()
    begin
        //;
        //ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        //;
        ////ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        //;
        //ReportsForNavPre;
    end;

    var
        DateSpecified: Date;
        NhifNo: Code[20];
        Emp: Record Employee;
        Id: Code[20];
        FirstName: Text[30];
        LastName: Text[30];
        TotalAmount: Decimal;
        "Count": Integer;
        Deductions: Record "Assignment Matrix-X1";
        EmployerNHIFNo: Code[20];
        DOB: Date;
        // CompInfoSetup: Record "Loans transactionsX1";
        "HR Details": Record Employee;
        CompPINNo: Code[20];
        YEAR: Integer;
        Address: Text[90];
        Tel: Text[30];
        Counter: Integer;
        AmountCaptionLbl: label 'Amount';
        ID_PassportCaptionLbl: label 'ID/Passport';
        Date_of_BirthCaptionLbl: label 'Date of Birth';
        PageCaptionLbl: label 'Page';
        NHIF_No_CaptionLbl: label 'NHIF No.';
        MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaptionLbl: label 'MONTHLY PAYROLL (BY-PRODUCT) RETURNS TO NHIF';
        Name_of_EmployeeCaptionLbl: label 'Name of Employee';
        EMPLOYER_NOCaptionLbl: label 'EMPLOYER NO';
        Payroll_No_CaptionLbl: label 'Payroll No.';
        PERIODCaptionLbl: label 'PERIOD';
        EMPLOYERCaptionLbl: label 'EMPLOYER';
        ADDRESSCaptionLbl: label 'ADDRESS';
        EMPLOYER_PIN_NOCaptionLbl: label 'EMPLOYER PIN NO';
        TEL_NOCaptionLbl: label 'TEL NO';
        PageCaption_Control44Lbl: label 'Page';
        UserCaptionLbl: label 'User';
        NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaptionLbl: label 'NATIONAL HOSPITAL INSURANCE FUND REPORT';
        EMPLOYER_NOCaption_Control1000000008Lbl: label 'EMPLOYER NO';
        PERIODCaption_Control1000000010Lbl: label 'PERIOD';
        AmountCaption_Control1000000005Lbl: label 'Amount';
        ID_PassportCaption_Control1000000049Lbl: label 'ID/Passport';
        Date_of_BirthCaption_Control1000000051Lbl: label 'Date of Birth';
        NHIF_No_Caption_Control1000000053Lbl: label 'NHIF No.';
        Name_of_EmployeeCaption_Control1000000055Lbl: label 'Name of Employee';
        Payroll_No_Caption_Control1000000056Lbl: label 'Payroll No.';
        Total_AmountCaptionLbl: label 'Total Amount';

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin
        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');
        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');
        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');
        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511144_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511144;
        ReportForNavObject: Variant;
    begin
        addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_7_3_0_2559\ForNav.Reports.7.3.0.2559.dll';
        if not File.Exists(addInFileName) then begin
            tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.7.3.0.2559.dll';
            if not File.Exists(tempAddInFileName) then
                Error('Please install the ForNAV DLL version 7.3.0.2559 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
        end;
        ReportForNavObject := //ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
        ReportForNav := ReportForNavObject;
        //ReportForNav.Init();
    end;

    //local procedure ReportsForNavPre();
    // begin
    ////ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
    //if not //ReportForNav.Pre() then CurrReport.Quit();
    //end;*/

    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
