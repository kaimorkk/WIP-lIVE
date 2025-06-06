//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511183_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511183) { }
    //type("System.IO.Path"; System_IO_Path51511183) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193588 "Employee Appraisal List"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/EmployeeAppraisalList.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Employee Appraisals1"; "Employee Appraisals1")
        {
            RequestFilterFields = "Appraisal No", "Deapartment Code";
            column(ReportForNavId_2409; 2409) { } // Autogenerated by ForNav - Do not delete
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
            column(Employee_Appraisals1__Appraisee_Name_; "Employee Appraisals1"."Appraisee Name")
            {
            }
            column(Employee_Appraisals1__Appraisee_s_Job_Title_; "Employee Appraisals1"."Appraisee's Job Title")
            {
            }
            column(Employee_Appraisals1__Appraisers_Name_; "Employee Appraisals1"."Appraisers Name")
            {
            }
            column(Employee_Appraisals1__Appraiser_s_Job_Title_; "Employee Appraisals1"."Appraiser's Job Title")
            {
            }
            column(Employee_Appraisals1__Appraisal_Period_; "Employee Appraisals1"."Appraisal Period")
            {
            }
            column(Employee_Appraisals1_Date; "Employee Appraisals1".Date)
            {
            }
            column(Employee_Appraisals1_Rating; "Employee Appraisals1".Rating)
            {
            }
            column(Employee_Appraisals1__Deapartment_Code_; "Employee Appraisals1"."Deapartment Code")
            {
            }
            column(Employee_Appraisals1__General_Comments_; "Employee Appraisals1"."General Comments")
            {
            }
            column(Appraisal_Summary_ReportCaption; Appraisal_Summary_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_Appraisals1__Appraisee_Name_Caption; FieldCaption("Appraisee Name"))
            {
            }
            column(Employee_Appraisals1__Appraisee_s_Job_Title_Caption; FieldCaption("Appraisee's Job Title"))
            {
            }
            column(Employee_Appraisals1__Appraisers_Name_Caption; FieldCaption("Appraisers Name"))
            {
            }
            column(Employee_Appraisals1__Appraiser_s_Job_Title_Caption; FieldCaption("Appraiser's Job Title"))
            {
            }
            column(Employee_Appraisals1__Appraisal_Period_Caption; FieldCaption("Appraisal Period"))
            {
            }
            column(Employee_Appraisals1_DateCaption; FieldCaption(Date))
            {
            }
            column(Overall_RatingCaption; Overall_RatingCaptionLbl)
            {
            }
            column(Employee_Appraisals1__Deapartment_Code_Caption; FieldCaption("Deapartment Code"))
            {
            }
            column(Training_NeedCaption; Training_NeedCaptionLbl)
            {
            }
            column(Additional_Remarks_Caption; Additional_Remarks_CaptionLbl)
            {
            }
            column(Employee_Appraisals1_Appraisal_No; "Employee Appraisals1"."Appraisal No")
            {
            }
            column(Employee_Appraisals1_TC_Overall_Score; "Employee Appraisals1"."TC Overall Score")
            {
            }
            column(Employee_Appraisals1_BC_Overall_Score; "Employee Appraisals1"."BC Overall Score")
            {
            }
            column(Employee_Appraisals1_Rating_Description; "Employee Appraisals1"."Rating Description")
            {
            }
            column(TCOverallScoreCaption; TCOverallScoreLbl)
            {
            }
            column(BCOverallScoreCaption; BCOverallScoreLbl)
            {
            }
            column(OverallScoreCaption; OverallScoreLbl)
            {
            }
            column(Overall_Score; OverallScore)
            {
            }
            trigger OnAfterGetRecord();
            begin
                OverallScore := "TC Overall Score" + "BC Overall Score";
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
        Appraisal_Summary_ReportCaptionLbl: label 'Appraisal Summary Report';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Overall_RatingCaptionLbl: label 'Overall Rating';
        Training_NeedCaptionLbl: label 'Training Need';
        Additional_Remarks_CaptionLbl: label 'Additional Remarks ';
        TCOverallScoreLbl: label 'Technical Competences Score';
        BCOverallScoreLbl: label 'Behavioural Competences Score';
        OverallScoreLbl: label 'Total Score';
        OverallScore: Decimal;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511183_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511183;
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
