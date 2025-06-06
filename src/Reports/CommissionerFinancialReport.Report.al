//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511057_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511057) { }
//type("System.IO.Path"; System_IO_Path51511057) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193484 "Commissioner Financial Report"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/CommissionerFinancialReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = sorting("Dimension Code", Code) where("Global Dimension No." = const(2));
            column(ReportForNavId_6363; 6363) { } // Autogenerated by ForNav - Do not delete
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; UserId)
            {
            }
            //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
            // {
            // }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Dimension_Value_Name; "Dimension Value".Name)
            {
            }
            column(COMMISSIONER_REPORTCaption; COMMISSIONER_REPORTCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Dimension_Value_Dimension_Code; "Dimension Value"."Dimension Code")
            {
            }
            column(Dimension_Value_Code; "Dimension Value".Code)
            {
            }
            dataitem("Accounting Period"; "Accounting Period")
            {
                DataItemTableView = sorting("Starting Date");
                RequestFilterFields = "Starting Date";
                column(ReportForNavId_4301; 4301) { } // Autogenerated by ForNav - Do not delete
                column(GLAccArrayName_1_; GLAccArrayName[1])
                {
                }
                column(GLAccArrayName_2_; GLAccArrayName[2])
                {
                }
                column(GLAccArrayName_3_; GLAccArrayName[3])
                {
                }
                column(GLAccArrayName_4_; GLAccArrayName[4])
                {
                }
                column(GLAccArrayName_5_; GLAccArrayName[5])
                {
                }
                column(GLAccArrayName_6_; GLAccArrayName[6])
                {
                }
                column(GLAccArrayName_7_; GLAccArrayName[7])
                {
                }
                column(GLAccArrayName_8_; GLAccArrayName[8])
                {
                }
                column(GLAccArrayName_12_; GLAccArrayName[12])
                {
                }
                column(GLAccArrayName_13_; GLAccArrayName[13])
                {
                }
                column(GLAccArrayName_15_; GLAccArrayName[15])
                {
                }
                column(GLAccArrayName_16_; GLAccArrayName[16])
                {
                }
                column(GLAccArrayName_17_; GLAccArrayName[17])
                {
                }
                column(GLAccArrayName_18_; GLAccArrayName[18])
                {
                }
                column(Accounting_Period_Name; "Accounting Period".Name)
                {
                }
                column(AmtArray_Row_1_; AmtArray[Row, 1])
                {
                }
                column(AmtArray_Row_2_; AmtArray[Row, 2])
                {
                }
                column(LineTotal; LineTotal)
                {
                }
                column(AmtArray_Row_3_; AmtArray[Row, 3])
                {
                }
                column(AmtArray_Row_4_; AmtArray[Row, 4])
                {
                }
                column(AmtArray_Row_5_; AmtArray[Row, 5])
                {
                }
                column(AmtArray_Row_6_; AmtArray[Row, 6])
                {
                }
                column(AmtArray_Row_7_; AmtArray[Row, 7])
                {
                }
                column(AmtArray_Row_8_; AmtArray[Row, 8])
                {
                }
                column(AmtArray_Row_12_; AmtArray[Row, 12])
                {
                }
                column(AmtArray_Row_13_; AmtArray[Row, 13])
                {
                }
                column(AmtArray_Row_15_; AmtArray[Row, 15])
                {
                }
                column(AmtArray_Row_16_; AmtArray[Row, 16])
                {
                }
                column(AmtArray_Row_17_; AmtArray[Row, 17])
                {
                }
                column(AmtArray_Row_18_; AmtArray[Row, 18])
                {
                }
                column(AmtArray_Row_1__Control1000000033; AmtArray[Row, 1])
                {
                }
                column(AmtArray_Row_2__Control1000000051; AmtArray[Row, 2])
                {
                }
                column(AmtArray_Row_3__Control1000000053; AmtArray[Row, 3])
                {
                }
                column(AmtArray_Row_4__Control1000000054; AmtArray[Row, 4])
                {
                }
                column(AmtArray_Row_5__Control1000000055; AmtArray[Row, 5])
                {
                }
                column(AmtArray_Row_6__Control1000000056; AmtArray[Row, 6])
                {
                }
                column(AmtArray_Row_7__Control1000000057; AmtArray[Row, 7])
                {
                }
                column(AmtArray_Row_8__Control1000000060; AmtArray[Row, 8])
                {
                }
                column(AmtArray_Row_12__Control1000000066; AmtArray[Row, 12])
                {
                }
                column(AmtArray_Row_13__Control1000000067; AmtArray[Row, 13])
                {
                }
                column(AmtArray_Row_15__Control1000000070; AmtArray[Row, 15])
                {
                }
                column(AmtArray_Row_16__Control1000000071; AmtArray[Row, 16])
                {
                }
                column(AmtArray_Row_17__Control1000000072; AmtArray[Row, 17])
                {
                }
                column(AmtArray_Row_18__Control1000000073; AmtArray[Row, 18])
                {
                }
                column(LineTotal_Control1000000074; LineTotal)
                {
                }
                column(Accounting_Period_NameCaption; FieldCaption(Name))
                {
                }
                column(TotalsCaption; TotalsCaptionLbl)
                {
                }
                column(Accounting_Period_Starting_Date; "Accounting Period"."Starting Date")
                {
                }
                trigger OnPreDataItem();
                begin
                    Row := 0;

                end;

                trigger OnAfterGetRecord();
                begin
                    Row := Row + 1;
                    LineTotal := 0;
                    for i := 1 to 20 do begin
                        if GLAccounts.Get(GLAccArrayCode[i]) then begin
                            GLAccounts.SetRange(GLAccounts."Date Filter", "Accounting Period"."Starting Date", CalcDate('1M', "Accounting Period"."Starting Date")
                            - 1);
                            GLAccounts.SetRange(GLAccounts."Global Dimension 2 Filter", "Dimension Value".Code);
                            GLAccounts.CalcFields(GLAccounts."Net Change");
                            AmtArray[Row, i] := GLAccounts."Net Change";
                            LineTotal := LineTotal + AmtArray[Row, i];
                        end;
                    end;
                end;

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
        GLAccounts.CalcFields(GLAccounts."Net Change");
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
        GLAccounts.Reset;
        GLAccounts.SetRange(GLAccounts."No.", '610100', '611200');
        if GLAccounts.Find('-') then
            repeat
                GLAccounts.CalcFields(GLAccounts."Net Change");
                i := i + 1;
                GLAccArrayCode[i] := GLAccounts."No.";
                GLAccArrayName[i] := GLAccounts.Name;
            until GLAccounts.Next = 0;
        //;
        //ReportsForNavPre;
    end;

    var
        GLAccounts: Record "G/L Account";
        GLAccArrayCode: array[20] of Code[20];
        i: Integer;
        GLAccArrayName: array[20] of Text[50];
        AmtArray: array[120, 20] of Decimal;
        Row: Integer;
        LineTotal: Decimal;
        COMMISSIONER_REPORTCaptionLbl: label 'COMMISSIONER REPORT';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        TotalsCaptionLbl: label 'Totals';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511057_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511057;
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
