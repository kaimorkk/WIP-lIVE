//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511166_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511166) { }
    //type("System.IO.Path"; System_IO_Path51511166) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193577 "Motor Report"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/MotorReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            DataItemTableView = sorting("No.") where("FA Class Code" = filter('MV'), Disposed = filter(false));
            RequestFilterFields = "No.";
            column(ReportForNavId_3794; 3794) { } // Autogenerated by ForNav - Do not delete
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
            column(Fixed_Asset_Make; "Fixed Asset".Make)
            {
            }
            column(Fixed_Asset__C_C_; "Fixed Asset"."C.C")
            {
            }
            column(Fixed_Asset_YOM; "Fixed Asset".YOM)
            {
            }
            column(Responsible_Employee; DriverName)
            {
            }
            column(Fixed_Asset__Fuel_Consumption_Km_Ltr_; "Fixed Asset"."Fuel Consumption Km/Ltr")
            {
            }
            column(Fixed_Asset__Parastatl_Reg__No_; "Fixed Asset"."Parastatl Reg. No")
            {
            }
            column(Fixed_Asset__Car_Rating_; "Fixed Asset"."Car Rating")
            {
            }
            column(OdometerBefore; OdometerBefore)
            {
            }
            column(OdometerAfter; OdometerAfter)
            {
            }
            column(TotalKm; TotalKm)
            {
            }
            column(FuelDrawn; FuelDrawn)
            {
            }
            column(OilDrawn; OilDrawn)
            {
            }
            column(Fixed_AssetCaption; Fixed_AssetCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Fixed_Asset_MakeCaption; FieldCaption(Make))
            {
            }
            column(Fixed_Asset__C_C_Caption; FieldCaption("C.C"))
            {
            }
            column(Fixed_Asset_YOMCaption; FieldCaption(YOM))
            {
            }
            column(Responsible_EmployeeCaption; Responsible_EmployeeCaptionLbl)
            {
            }
            column(Opening_Odometer_ReadingCaption; Opening_Odometer_ReadingCaptionLbl)
            {
            }
            column(Closing_Odometer_ReadingCaption; Closing_Odometer_ReadingCaptionLbl)
            {
            }
            column(Total_Km_TravelledCaption; Total_Km_TravelledCaptionLbl)
            {
            }
            column(Fuel_ConsumptionCaption; Fuel_ConsumptionCaptionLbl)
            {
            }
            column(Reg__NoCaption; Reg__NoCaptionLbl)
            {
            }
            column(Fixed_Asset__Car_Rating_Caption; FieldCaption("Car Rating"))
            {
            }
            column(Fuel_Drawn__Ltrs_Caption; Fuel_Drawn__Ltrs_CaptionLbl)
            {
            }
            column(Oil_Drawn__Ltrs_Caption; Oil_Drawn__Ltrs_CaptionLbl)
            {
            }
            column(Fixed_Asset_No_; "Fixed Asset"."No.")
            {
            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("No.");
            end;

            trigger OnAfterGetRecord();
            begin
                TransportRequest.Reset;
                TransportRequest.SetRange(TransportRequest."Vehicle Allocated", "Fixed Asset".Description);
                if TransportRequest.Find('-') then
                    //message('initial km %1',TransportRequest."Odometer Reading Before");
                    OdometerBefore := TransportRequest."Odometer Reading Before";
                TransportRequest.Reset;
                TransportRequest.SetRange(TransportRequest."Vehicle Allocated", "Fixed Asset".Description);
                if TransportRequest.Find('-') then begin
                    DriverCode := TransportRequest.Driver;
                    // message('driver %1',TransportRequest."Driver Name");
                    DriverName := TransportRequest."Driver Name";
                    TripTotalKm := TransportRequest."Odometer Reading After" - TransportRequest."Odometer Reading Before";
                end;
                TransportRequest.Reset;
                TransportRequest.SetRange(TransportRequest."Vehicle Allocated", "Fixed Asset".Description);
                if TransportRequest.Find('+') then
                    // message('final km %1',TransportRequest."Odometer Reading After");
                    OdometerAfter := TransportRequest."Odometer Reading After";
                TotalKm := OdometerAfter - OdometerBefore;
                VehicleFilling.Reset;
                VehicleFilling.SetRange(VehicleFilling."No.", "Fixed Asset"."No.");
                //VehicleFilling.SETFILTER(VehicleFilling."End Date","Fixed Asset".GETFILTER());
                if VehicleFilling.Find('-') then begin
                    repeat
                        OilDrawn := OilDrawn + VehicleFilling."Oil Drawn (Litres)";
                        FuelDrawn := FuelDrawn + VehicleFilling."Fuel Drawn (Litres)";
                    until VehicleFilling.Next = 0;
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TransportRequest: Record "Transport Request1";
        OdometerBefore: Decimal;
        OdometerAfter: Decimal;
        DriverCode: Code[20];
        DriverName: Text[50];
        TotalKm: Decimal;
        VehicleFilling: Record "Vehicle Filling1";
        TripTotalKm: Decimal;
        OilDrawn: Decimal;
        FuelDrawn: Decimal;
        Fixed_AssetCaptionLbl: label 'Fixed Asset';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Responsible_EmployeeCaptionLbl: label 'Responsible Employee';
        Opening_Odometer_ReadingCaptionLbl: label 'Opening Odometer Reading';
        Closing_Odometer_ReadingCaptionLbl: label 'Closing Odometer Reading';
        Total_Km_TravelledCaptionLbl: label 'Total Km Travelled';
        Fuel_ConsumptionCaptionLbl: label 'Fuel Consumption';
        Reg__NoCaptionLbl: label 'Reg. No';
        Fuel_Drawn__Ltrs_CaptionLbl: label 'Fuel Drawn (Ltrs)';
        Oil_Drawn__Ltrs_CaptionLbl: label 'Oil Drawn (Ltrs)';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511166_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511166;
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
