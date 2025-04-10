//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511247_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511247) { }
    //type("System.IO.Path"; System_IO_Path51511247) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193648 "Bank Reconciliation Close"
{
    RDLCLayout = './Layouts/BankReconciliationClose.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Bank Acc. Reconciliation Line"; "Bank Acc. Reconciliation Line")
        {
            DataItemTableView = sorting("Bank Account No.", "Statement No.", "Statement Line No.");
            column(ReportForNavId_1210; 1210) { } // Autogenerated by ForNav - Do not delete
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
            column(Bank_Acc__Reconciliation_Line__Bank_Account_No__; "Bank Acc. Reconciliation Line"."Bank Account No.")
            {
            }
            column(Bank_Acc__Reconciliation_Line__Statement_No__; "Bank Acc. Reconciliation Line"."Statement No.")
            {
            }
            column(Bank_Acc__Reconciliation_Line__Statement_Line_No__; "Bank Acc. Reconciliation Line"."Statement Line No.")
            {
            }
            column(Bank_Acc__Reconciliation_Line__Document_No__; "Bank Acc. Reconciliation Line"."Document No.")
            {
            }
            column(Bank_Acc__Reconciliation_Line__Transaction_Date_; "Bank Acc. Reconciliation Line"."Transaction Date")
            {
            }
            // column(Bank_Acc__Reconciliation_Line_Closed; Closed)
            // {
            // }
            // column(Bank_Acc__Reconciliation_Line__Closing_Date_; "Closing Date")
            // {
            // }
            column(Bank_Acc__Reconciliation_LineCaption; Bank_Acc__Reconciliation_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Bank_Acc__Reconciliation_Line__Bank_Account_No__Caption; FieldCaption("Bank Account No."))
            {
            }
            column(Bank_Acc__Reconciliation_Line__Statement_No__Caption; FieldCaption("Statement No."))
            {
            }
            column(Bank_Acc__Reconciliation_Line__Statement_Line_No__Caption; FieldCaption("Statement Line No."))
            {
            }
            column(Bank_Acc__Reconciliation_Line__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(Bank_Acc__Reconciliation_Line__Transaction_Date_Caption; FieldCaption("Transaction Date"))
            {
            }
            // column(Bank_Acc__Reconciliation_Line_ClosedCaption; FieldCaption(Closed))
            // {
            // }
            // column(Bank_Acc__Reconciliation_Line__Closing_Date_Caption; FieldCaption("Closing Date"))
            // {
            // }
            trigger OnPreDataItem();
            begin
                "Bank Acc. Reconciliation Line".SetRange("Bank Acc. Reconciliation Line"."Bank Account No.", AcNo);
                "Bank Acc. Reconciliation Line".SetRange("Bank Acc. Reconciliation Line"."Statement No.", ReconNo);
                // "Bank Acc. Reconciliation Line".SetRange("Bank Acc. Reconciliation Line".Closed, false);
                "Bank Acc. Reconciliation Line".SetRange("Bank Acc. Reconciliation Line"."Transaction Date", 0D, ReconClosingDate);
            end;

            trigger OnAfterGetRecord();
            begin
                // "Bank Acc. Reconciliation Line".Closed := true;
                // "Bank Acc. Reconciliation Line"."Closing Date" := ReconClosingDate;
                "Bank Acc. Reconciliation Line".Modify;
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
                group(Date)
                {
                    field("Closing Date"; ReconClosingDate)
                    {
                        ApplicationArea = Basic;
                    }
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
        AcNo: Code[10];
        ReconNo: Code[10];
        ReconClosingDate: Date;
        Bank_Acc__Reconciliation_LineCaptionLbl: label 'Bank Acc. Reconciliation Line';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    procedure GetRecon(var BankRec: Record "Bank Acc. Reconciliation")
    begin
        AcNo := BankRec."Bank Account No.";
        ReconNo := BankRec."Statement No.";
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511247_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511247;
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
