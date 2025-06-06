//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511435_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511435) { }
//type("System.IO.Path"; System_IO_Path51511435) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193718 "Vehicle Servicing"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/VehicleServicing.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Maintanance and Repair"; "Maintanance and Repair")
        {
            DataItemTableView = where("Item Class Code" = filter('MV'));
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(ItemNo; "Maintanance and Repair"."Item No.")
            {
            }
            column(ItemDescription; "Maintanance and Repair"."Item Description")
            {
            }
            column(SP; "Maintanance and Repair"."Service Provider")
            {
            }
            column(SPName; "Maintanance and Repair"."Service Provider Name")
            {
            }
            column(DateOfServuce; "Maintanance and Repair"."Date of Service")
            {
            }
            column(NextService; "Maintanance and Repair"."Next Service")
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            dataitem("Fixed Asset"; "Fixed Asset")
            {
                DataItemLink = "No." = field("Item No.");
                DataItemTableView = where("FA Class Code" = filter('MV'));
                column(ReportForNavId_1000000007; 1000000007) { } // Autogenerated by ForNav - Do not delete
                column(NO; "Fixed Asset"."No.")
                {
                }
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
        CompanyInfo.CalcFields(Picture);
        //;
        //ReportsForNavPre;
    end;

    var
        CompanyInfo: Record "Company Information";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511435_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511435;
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
