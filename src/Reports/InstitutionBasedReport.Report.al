//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511150_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511150) { }
//type("System.IO.Path"; System_IO_Path51511150) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193565 "Institution Based Report"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/InstitutionBasedReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Institution1; Institution1)
        {
            DataItemTableView = sorting(Code);
            PrintOnlyIfDetail = true;
            column(ReportForNavId_4195; 4195) { } // Autogenerated by ForNav - Do not delete
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(USERID; UserId)
            {
            }
            //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
            // {
            // }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4____; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(GrandTotal; GrandTotal)
            {
            }
            column(SALARY_DEDUCTIONS_PER_INSTITUTIONCaption; SALARY_DEDUCTIONS_PER_INSTITUTIONCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assignment_Matrix_X1__Employee_No_Caption; "Assignment Matrix-X1".FieldCaption("Employee No"))
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Institution1_Code; Institution1.Code)
            {
            }
            dataitem(DeductionsX1; DeductionsX1)
            {
                DataItemLink = "Institution Code" = field(Code);
                DataItemTableView = sorting("Institution Code");
                PrintOnlyIfDetail = true;
                RequestFilterFields = "Institution Code", "Pay Period Filter";
                column(ReportForNavId_1209; 1209) { } // Autogenerated by ForNav - Do not delete
                column(DeductionsX1_Code; DeductionsX1.Code)
                {
                }
                column(DeductionsX1_Description; DeductionsX1.Description)
                {
                }
                column(Institution1_Name; Institution1.Name)
                {
                }
                column(InstitutionTotal; InstitutionTotal)
                {
                }
                column(Institution1_Address; Institution1.Address)
                {
                }
                column(Institution1_City; Institution1.City)
                {
                }
                column(Institution1_Code_Control1000000008; Institution1.Code)
                {
                }
                column(DeductionsX1_Institution_Code; DeductionsX1."Institution Code")
                {
                }
                column(DeductionsX1_Pay_Period_Filter; DeductionsX1."Pay Period Filter")
                {
                }
                column(GrandTotal2; GrandTotal)
                {
                }
                dataitem("Assignment Matrix-X1"; "Assignment Matrix-X1")
                {
                    DataItemLink = Code = field(Code), "Payroll Period" = field("Pay Period Filter");
                    DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") where(Type = const(Deduction));
                    column(ReportForNavId_5751; 5751) { } // Autogenerated by ForNav - Do not delete
                    column(Assignment_Matrix_X1__Employee_No_; "Assignment Matrix-X1"."Employee No")
                    {
                    }
                    column(ABS_Amount_; Abs(Amount))
                    {
                    }
                    column(EmployeeName; EmployeeName)
                    {
                    }
                    column(ABS_Amount__Control1000000021; Abs(Amount))
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

                    end;

                    trigger OnAfterGetRecord();
                    begin
                        if EmpRec.Get("Assignment Matrix-X1"."Employee No") then
                            EmployeeName := EmpRec."First Name" + ' ' + EmpRec."Middle Name" + ' ' + EmpRec."Last Name";
                    end;

                }
                trigger OnPreDataItem();
                begin
                    LastFieldNo := FieldNo("Institution Code");

                end;

                trigger OnAfterGetRecord();
                begin
                    DeductionsX1.CalcFields(DeductionsX1."Total Amount");
                    InstitutionTotal := InstitutionTotal + Abs(DeductionsX1."Total Amount");
                    GrandTotal := GrandTotal + InstitutionTotal;
                end;

            }
            trigger OnAfterGetRecord();
            begin
                InstitutionTotal := 0;
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
        DateSpecified := DeductionsX1.GetRangeMin(DeductionsX1."Pay Period Filter");
        //;
        //ReportsForNavPre;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        InstitutionTotal: Decimal;
        DateSpecified: Date;
        GrandTotal: Decimal;
        EmployeeName: Text[50];
        EmpRec: Record Employee;
        SALARY_DEDUCTIONS_PER_INSTITUTIONCaptionLbl: label 'SALARY DEDUCTIONS PER INSTITUTION';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        AmountCaptionLbl: label 'Amount';
        NameCaptionLbl: label 'Name';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511150_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511150;
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
