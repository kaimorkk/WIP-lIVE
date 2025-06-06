//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511083_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511083) { }
    //type("System.IO.Path"; System_IO_Path51511083) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193507 "Insert all deductions"
{
    RDLCLayout = './Layouts/Insertalldeductions.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where(Status = const(Active));
            column(ReportForNavId_7528; 7528) { } // Autogenerated by ForNav - Do not delete
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
            column(Employee__No__; Employee."No.")
            {
            }
            column(Employee__First_Name_; Employee."First Name")
            {
            }
            column(Employee__Middle_Name_; Employee."Middle Name")
            {
            }
            column(Employee__Last_Name_; Employee."Last Name")
            {
            }
            column(EmployeeCaption; EmployeeCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; FieldCaption("No."))
            {
            }
            column(Employee__First_Name_Caption; FieldCaption("First Name"))
            {
            }
            column(Employee__Middle_Name_Caption; FieldCaption("Middle Name"))
            {
            }
            column(Employee__Last_Name_Caption; FieldCaption("Last Name"))
            {
            }
            trigger OnAfterGetRecord();
            begin
                // Deducton
                Ded.Reset;
                Ded.SetRange("Applies to All", true);
                if Ded.Find('-') then begin
                    repeat
                        AssMatrix.Init;
                        AssMatrix."Employee No" := Employee."No.";
                        AssMatrix.Type := AssMatrix.Type::Deduction;
                        AssMatrix."Payroll Period" := 20080501D;
                        AssMatrix."Global Dimension 1 code" := "Global Dimension 1 Code";
                        AssMatrix.Code := Ded.Code;
                        AssMatrix.Validate(Code);
                        if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period",
                        AssMatrix."Global Dimension 1 code", AssMatrix."Reference No") then
                            AssMatrix.Insert;
                    until Ded.Next = 0;
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
        Ded: Record DeductionsX1;
        AssMatrix: Record "Assignment Matrix-X1";
        EmployeeCaptionLbl: label 'Employee';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511083_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511083;
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
