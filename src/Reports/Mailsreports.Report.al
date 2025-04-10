//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511072_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511072) { }
//type("System.IO.Path"; System_IO_Path51511072) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193498 "Mails reports"
{
    RDLCLayout = './Layouts/Mailsreports.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Mails1; Mails1)
        {
            RequestFilterFields = "code";
            column(ReportForNavId_2972; 2972) { } // Autogenerated by ForNav - Do not delete
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
            column(Mails1_code; Mails1.code)
            {
            }
            column(Mails1_Description; Mails1.Description)
            {
            }
            column(Mails1__Date_received_; Mails1."Date received")
            {
            }
            column(Mails1_Time; Mails1.Time)
            {
            }
            column(Mails1_Receiver; Mails1.Receiver)
            {
            }
            column(Mails1__Receiver_Name_; Mails1."Receiver Name")
            {
            }
            column(Mails1__Category_Name_; Mails1."Category Name")
            {
            }
            column(Mails1__Global_Dimension_1_Code_; Mails1."Global Dimension 1 Code")
            {
            }
            column(MailsCaption; MailsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Mails1_codeCaption; FieldCaption(code))
            {
            }
            column(Mails1_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Mails1__Date_received_Caption; FieldCaption("Date received"))
            {
            }
            column(Mails1_TimeCaption; FieldCaption(Time))
            {
            }
            column(Mails1_ReceiverCaption; FieldCaption(Receiver))
            {
            }
            column(Mails1__Receiver_Name_Caption; FieldCaption("Receiver Name"))
            {
            }
            column(Mails1__Category_Name_Caption; FieldCaption("Category Name"))
            {
            }
            column(Mails1__Global_Dimension_1_Code_Caption; FieldCaption("Global Dimension 1 Code"))
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
        MailsCaptionLbl: label 'Mails';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511072_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511072;
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
