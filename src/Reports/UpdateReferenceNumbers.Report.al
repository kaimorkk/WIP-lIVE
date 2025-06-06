//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511001_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511001) { }
//type("System.IO.Path"; System_IO_Path51511001) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193442 "Update Reference Numbers"
{
    RDLCLayout = './Layouts/UpdateReferenceNumbers.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Assignment Matrix-X1"; "Assignment Matrix-X1")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No");
            RequestFilterFields = Type, "Code", "Payroll Period";
            column(ReportForNavId_5751; 5751) { } // Autogenerated by ForNav - Do not delete
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
            // {
            // }
            column(USERID; UserId)
            {
            }
            column(Assignment_Matrix_X1__Employee_No_; "Assignment Matrix-X1"."Employee No")
            {
            }
            column(Assignment_Matrix_X1_Type; "Assignment Matrix-X1".Type)
            {
            }
            column(Assignment_Matrix_X1_Code; "Assignment Matrix-X1".Code)
            {
            }
            column(Assignment_Matrix_X1__Payroll_Period_; "Assignment Matrix-X1"."Payroll Period")
            {
            }
            column(Assignment_Matrix_X1_Description; "Assignment Matrix-X1".Description)
            {
            }
            column(Assignment_Matrix_X1_Amount; "Assignment Matrix-X1".Amount)
            {
            }
            column(Assignment_Matrix_XCaption; Assignment_Matrix_XCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assignment_Matrix_X1__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(Assignment_Matrix_X1_TypeCaption; FieldCaption(Type))
            {
            }
            column(Assignment_Matrix_X1_CodeCaption; FieldCaption(Code))
            {
            }
            column(Assignment_Matrix_X1__Payroll_Period_Caption; FieldCaption("Payroll Period"))
            {
            }
            column(Assignment_Matrix_X1_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Assignment_Matrix_X1_AmountCaption; FieldCaption(Amount))
            {
            }
            column(Assignment_Matrix_X1_Reference_No; "Assignment Matrix-X1"."Reference No")
            {
            }
            trigger OnAfterGetRecord();
            begin
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", "Assignment Matrix-X1"."Employee No");
                Assignmatrix.SetRange(Assignmatrix.Type, "Assignment Matrix-X1".Type);
                Assignmatrix.SetRange(Assignmatrix.Code, "Assignment Matrix-X1".Code);
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", 0D, "Assignment Matrix-X1"."Payroll Period" - 1);
                if Assignmatrix.Find('-') then
                    repeat
                        Assignmatrix.Rename(Assignmatrix."Employee No", Assignmatrix.Type, Assignmatrix.Code, Assignmatrix."Payroll Period",
                        "Assignment Matrix-X1"."Reference No");
                    until Assignmatrix.Next = 0;
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
        Assignmatrix: Record "Assignment Matrix-X1";
        Assignment_Matrix_XCaptionLbl: label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511001_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511001;
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
