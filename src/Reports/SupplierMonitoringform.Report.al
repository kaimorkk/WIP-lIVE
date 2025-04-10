//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511090_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511090) { }
//type("System.IO.Path"; System_IO_Path51511090) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193514 "Supplier Monitoring form"
{
    RDLCLayout = './Layouts/SupplierMonitoringform.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Supplier Monitoring1"; "Supplier Monitoring1")
        {
            DataItemTableView = sorting("Purchase Order No.");
            RequestFilterFields = "Purchase Order No.";
            column(ReportForNavId_5669; 5669) { } // Autogenerated by ForNav - Do not delete
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
            column(Supplier_Monitoring1__Purchase_Order_No__; "Supplier Monitoring1"."Purchase Order No.")
            {
            }
            column(Supplier_Monitoring1__Brief_Description_of_Work_done_; "Supplier Monitoring1"."Brief Description of Work done")
            {
            }
            column(Supplier_Monitoring1__Agreed_Start_Date_; "Supplier Monitoring1"."Agreed Start Date")
            {
            }
            column(Supplier_Monitoring1__Actual_Start_Date_; "Supplier Monitoring1"."Actual Start Date")
            {
            }
            column(Supplier_Monitoring1__Agreed_Completion_date_; "Supplier Monitoring1"."Agreed Completion date")
            {
            }
            column(Supplier_Monitoring1__Actual_Completion_Date_; "Supplier Monitoring1"."Actual Completion Date")
            {
            }
            column(Supplier_Monitoring1__Completed_Within_Schedule_; "Supplier Monitoring1"."Completed Within Schedule")
            {
            }
            column(Supplier_Monitoring1__Reasons_for_Late_completion_; "Supplier Monitoring1"."Reasons for Late completion")
            {
            }
            column(Supplier_Monitoring1__Quality_of_Work_; "Supplier Monitoring1"."Quality of Work")
            {
            }
            column(Supplier_MonitoringCaption; Supplier_MonitoringCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Supplier_Monitoring1__Purchase_Order_No__Caption; FieldCaption("Purchase Order No."))
            {
            }
            column(Supplier_Monitoring1__Brief_Description_of_Work_done_Caption; FieldCaption("Brief Description of Work done"))
            {
            }
            column(Supplier_Monitoring1__Agreed_Start_Date_Caption; FieldCaption("Agreed Start Date"))
            {
            }
            column(Supplier_Monitoring1__Actual_Start_Date_Caption; FieldCaption("Actual Start Date"))
            {
            }
            column(Supplier_Monitoring1__Agreed_Completion_date_Caption; FieldCaption("Agreed Completion date"))
            {
            }
            column(Supplier_Monitoring1__Actual_Completion_Date_Caption; FieldCaption("Actual Completion Date"))
            {
            }
            column(Supplier_Monitoring1__Completed_Within_Schedule_Caption; FieldCaption("Completed Within Schedule"))
            {
            }
            column(Supplier_Monitoring1__Reasons_for_Late_completion_Caption; FieldCaption("Reasons for Late completion"))
            {
            }
            column(Supplier_Monitoring1__Quality_of_Work_Caption; FieldCaption("Quality of Work"))
            {
            }
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
        Supplier_MonitoringCaptionLbl: label 'Supplier Monitoring';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511090_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511090;
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
