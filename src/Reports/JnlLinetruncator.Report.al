//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511088_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511088) { }
    //type("System.IO.Path"; System_IO_Path51511088) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193512 "Jnl Line truncator"
{
    RDLCLayout = './Layouts/JnlLinetruncator.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = sorting("Journal Template Name", "Journal Batch Name", "Line No.");
            RequestFilterFields = "Journal Template Name", "Journal Batch Name";
            column(ReportForNavId_7024; 7024) { } // Autogenerated by ForNav - Do not delete
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
            column(Gen__Journal_Line__Journal_Template_Name_; "Gen. Journal Line"."Journal Template Name")
            {
            }
            column(Gen__Journal_Line__Journal_Batch_Name_; "Gen. Journal Line"."Journal Batch Name")
            {
            }
            column(Gen__Journal_Line__Line_No__; "Gen. Journal Line"."Line No.")
            {
            }
            column(Gen__Journal_Line__Account_Type_; "Gen. Journal Line"."Account Type")
            {
            }
            column(Gen__Journal_Line__Posting_Date_; "Gen. Journal Line"."Posting Date")
            {
            }
            column(Gen__Journal_Line__Document_No__; "Gen. Journal Line"."Document No.")
            {
            }
            column(Gen__Journal_Line_Description; "Gen. Journal Line".Description)
            {
            }
            column(Gen__Journal_Line_Amount; "Gen. Journal Line".Amount)
            {
            }
            column(Gen__Journal_Line__Posting_Group_; "Gen. Journal Line"."Posting Group")
            {
            }
            column(TotalFor___FIELDCAPTION__Journal_Batch_Name__; TotalFor + FieldCaption("Journal Batch Name"))
            {
            }
            column(Gen__Journal_Line_Amount_Control1000000035; "Gen. Journal Line".Amount)
            {
            }
            column(TotalFor___FIELDCAPTION__Journal_Template_Name__; TotalFor + FieldCaption("Journal Template Name"))
            {
            }
            column(Gen__Journal_Line_Amount_Control1000000037; "Gen. Journal Line".Amount)
            {
            }
            column(Gen__Journal_LineCaption; Gen__Journal_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Gen__Journal_Line__Line_No__Caption; FieldCaption("Line No."))
            {
            }
            column(Gen__Journal_Line__Account_Type_Caption; FieldCaption("Account Type"))
            {
            }
            column(Gen__Journal_Line__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Gen__Journal_Line__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(Gen__Journal_Line_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Gen__Journal_Line_AmountCaption; FieldCaption(Amount))
            {
            }
            column(Gen__Journal_Line__Posting_Group_Caption; FieldCaption("Posting Group"))
            {
            }
            column(Gen__Journal_Line__Journal_Template_Name_Caption; FieldCaption("Journal Template Name"))
            {
            }
            column(Gen__Journal_Line__Journal_Batch_Name_Caption; FieldCaption("Journal Batch Name"))
            {
            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("Journal Batch Name");
            end;

            trigger OnAfterGetRecord();
            begin
                /*IF FADepreciationBook.GET("Gen. Journal Line"."Account No.",'COMPANY') THEN
				BEGIN
				"Gen. Journal Line"."Posting Group":=FADepreciationBook."FA Posting Group";
				"Gen. Journal Line".MODIFY;
				END
				ELSE
				CurrReport.SKIP;*/
                "Gen. Journal Line".Description := CopyStr("Gen. Journal Line".Description, 1, 50);
                "Gen. Journal Line".Modify;

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
        TotalFor: label 'Total for ';
        FADepreciationBook: Record "FA Depreciation Book";
        Gen__Journal_LineCaptionLbl: label 'Gen. Journal Line';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511088_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511088;
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
