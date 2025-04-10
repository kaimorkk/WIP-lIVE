//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511050_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511050) { }
//type("System.IO.Path"; System_IO_Path51511050) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193478 "HODs  Notifications"
{
    RDLCLayout = './Layouts/HODsNotifications.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Campaign; Campaign)
        {
            column(ReportForNavId_4372; 4372) { } // Autogenerated by ForNav - Do not delete
            trigger OnAfterGetRecord();
            begin
                Campaign.SetRange(Campaign."Notification Date", Today);
                Commissioners.SetRange(Commissioners."Meeting Code", Campaign."No.");
                HODs.SetRange(HODs."Meeting Code", Campaign."No.");
                HODs.Reset;
                if HODs.Find('-') then
                    repeat
                        Subject := Campaign.Description + ' on ' + Format(Campaign."Starting Date");
                        Body := 'Please you are reminded that there is a ' + Campaign.Description + ' on ' + Format(Campaign."Starting Date") + '. ' +
                         'Please attend';
                    //Mail.NewIncidentMail(HODs.Email, Subject, Body);
                    until HODs.Next = 0;
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
        Commissioners: Record "Commisioner Committee1";
        HODs: Record "HoD Committee1";
        Mail: Codeunit Mail;
        Subject: Text[250];
        Body: Text[250];
        Send: Boolean;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511050_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511050;
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
