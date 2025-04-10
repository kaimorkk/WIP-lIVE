//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511165_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511165) { }
//type("System.IO.Path"; System_IO_Path51511165) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193576 "Training Evaluation Report"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/TrainingEvaluationReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Training Evaluation1"; "Training Evaluation1")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_5435; 5435) { } // Autogenerated by ForNav - Do not delete
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
            column(Training_Evaluation1__Employee_No_; "Training Evaluation1"."Employee No")
            {
            }
            column(Training_Evaluation1__Employee_Name_; "Training Evaluation1"."Employee Name")
            {
            }
            column(Training_Evaluation1_Designation; "Training Evaluation1".Designation)
            {
            }
            column(Training_Evaluation1__No__Of_Days_; "Training Evaluation1"."No. Of Days")
            {
            }
            column(Training_Evaluation1__Training_Insitution_; "Training Evaluation1"."Training Insitution")
            {
            }
            column(Training_Evaluation1_Venue; "Training Evaluation1".Venue)
            {
            }
            column(Training_Evaluation1_Description; "Training Evaluation1".Description)
            {
            }
            column(Training_Evaluation1__Planned_Start_Date_; "Training Evaluation1"."Planned Start Date")
            {
            }
            column(Training_Evaluation1__Planned_End_Date_; "Training Evaluation1"."Planned End Date")
            {
            }
            column(Training_Evaluation1__Qualification_Type_; "Training Evaluation1"."Qualification Type")
            {
            }
            column(Training_Evaluation1__Qualification_Code_; "Training Evaluation1"."Qualification Code")
            {
            }
            column(Training_Evaluation1__Planned_Start_Date__Control1000000032; "Training Evaluation1"."Planned Start Date")
            {
            }
            column(Training_Evaluation1__Planned_End_Date__Control1000000034; "Training Evaluation1"."Planned End Date")
            {
            }
            column(Training_EvaluationCaption; Training_EvaluationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Training_Evaluation1__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(Training_Evaluation1__Employee_Name_Caption; FieldCaption("Employee Name"))
            {
            }
            column(Training_Evaluation1_DesignationCaption; FieldCaption(Designation))
            {
            }
            column(Training_Evaluation1__No__Of_Days_Caption; FieldCaption("No. Of Days"))
            {
            }
            column(Training_Evaluation1__Training_Insitution_Caption; FieldCaption("Training Insitution"))
            {
            }
            column(Training_Evaluation1_VenueCaption; FieldCaption(Venue))
            {
            }
            column(Training_Evaluation1_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Training_Evaluation1__Planned_Start_Date_Caption; FieldCaption("Planned Start Date"))
            {
            }
            column(Training_Evaluation1__Planned_End_Date_Caption; FieldCaption("Planned End Date"))
            {
            }
            column(Training_Evaluation1__Qualification_Type_Caption; FieldCaption("Qualification Type"))
            {
            }
            column(Training_Evaluation1__Qualification_Code_Caption; FieldCaption("Qualification Code"))
            {
            }
            column(Training_Evaluation1__Planned_Start_Date__Control1000000032Caption; FieldCaption("Planned Start Date"))
            {
            }
            column(Training_Evaluation1__Planned_End_Date__Control1000000034Caption; FieldCaption("Planned End Date"))
            {
            }
            column(Training_Evaluation1_No_; "Training Evaluation1"."No.")
            {
            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("No.");
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Training_EvaluationCaptionLbl: label 'Training Evaluation';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511165_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511165;
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
