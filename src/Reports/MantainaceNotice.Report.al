//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511449_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511449) { }
    //type("System.IO.Path"; System_IO_Path51511449) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193728 "Mantainace Notice"
{
    RDLCLayout = './Layouts/MantainaceNotice.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Maintenance Registration"; "Maintenance Registration")
        {
            DataItemTableView = where(Notified = const(false));
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            trigger OnAfterGetRecord();
            begin
                if "Service Date" = Today then begin
                    CompanyInfo.Get();
                    Recipients := CompanyInfo."Fleet Manager Support Email";
                    CompanyInfo.Get();
                    SenderName := COMPANYNAME;
                    SenderAddress := CompanyInfo."E-Mail";
                    Subject := 'ASSET MAINTENANCE ' + "Maintenance Registration"."FA No.";
                    Body := StrSubstNo('This is to notify you that the Asset No. %1 is due for servicing', "FA No.");
                    SMTPSetup.Create(Recipients, Subject, Body, true);
                    Email.Send(SMTPSetup);
                    Notified := true;
                    Modify;
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
        CompanyInfo: Record "Company Information";
        Recipients: Text[100];
        SenderName: Text[100];
        SenderAddress: Text[100];
        Subject: Text[100];
        Body: Text[250];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511449_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511449;
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
