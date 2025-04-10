//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511073_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511073) { }
    //type("System.IO.Path"; System_IO_Path51511073) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193499 "Book Analysis Rpt"
{
    RDLCLayout = './Layouts/BookAnalysisRpt.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Book Issue Details1"; "Book Issue Details1")
        {
            DataItemTableView = sorting(Code, "Request No") where("Book No" = filter(<> ''), "Issued?" = const(true));
            RequestFilterFields = "Request No", "Issue Date", "Due Date", "Returned?";
            column(ReportForNavId_7942; 7942) { } // Autogenerated by ForNav - Do not delete
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
            column(Book_Issue_Details1__Book_No_; "Book Issue Details1"."Book No")
            {
            }
            column(Book_Issue_Details1__Book_Description_; "Book Issue Details1"."Book Description")
            {
            }
            column(Book_Issue_Details1_ISBN; "Book Issue Details1".ISBN)
            {
            }
            column(Book_Issue_Details1__Issue_Date_; "Book Issue Details1"."Issue Date")
            {
            }
            column(Book_Issue_Details1__Due_Date_; "Book Issue Details1"."Due Date")
            {
            }
            column(Book_Issue_Details1__Issuer_Name__; "Book Issue Details1"."Issuer Name.")
            {
            }
            column(Book_Issue_Details1__Return_Date_; "Book Issue Details1"."Return Date")
            {
            }
            column(Book_Issue_Details1__Returned__; "Returned?")
            {
            }
            column(Book_Issue_Details1_Category; "Book Issue Details1".Category)
            {
            }
            column(Book_Issue_Details1__Receiver_Name_; "Book Issue Details1"."Receiver Name")
            {
            }
            column(Book_Issue_Details1__Borrower_Name_; "Book Issue Details1"."Borrower Name")
            {
            }
            column(Book_Issue_Details1_Daysoverdue; "Book Issue Details1".Daysoverdue)
            {
            }
            column(Book_Issue_Details1__Amount_overdue_; "Book Issue Details1"."Amount overdue")
            {
            }
            column(Book_Issue_Details1_paid; "Book Issue Details1".paid)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Book_Issue_Details1__Book_No_Caption; FieldCaption("Book No"))
            {
            }
            column(Book_Issue_Details1__Book_Description_Caption; FieldCaption("Book Description"))
            {
            }
            column(Book_Issue_Details1_ISBNCaption; FieldCaption(ISBN))
            {
            }
            column(Book_Issue_Details1__Issue_Date_Caption; FieldCaption("Issue Date"))
            {
            }
            column(Book_Issue_Details1__Due_Date_Caption; FieldCaption("Due Date"))
            {
            }
            column(Book_Issue_Details1__Issuer_Name__Caption; FieldCaption("Issuer Name."))
            {
            }
            column(Book_Issue_Details1__Return_Date_Caption; FieldCaption("Return Date"))
            {
            }
            column(Book_Issue_Details1__Returned__Caption; FieldCaption("Returned?"))
            {
            }
            column(Book_Issue_Details1_CategoryCaption; FieldCaption(Category))
            {
            }
            column(Book_Issue_Details1__Receiver_Name_Caption; FieldCaption("Receiver Name"))
            {
            }
            column(Book_Issue_Details1__Borrower_Name_Caption; FieldCaption("Borrower Name"))
            {
            }
            column(Book_Issue_Details1_DaysoverdueCaption; FieldCaption(Daysoverdue))
            {
            }
            column(Book_Issue_Details1__Amount_overdue_Caption; FieldCaption("Amount overdue"))
            {
            }
            column(Book_Issue_Details1_paidCaption; FieldCaption(paid))
            {
            }
            column(Book_Issue_Details1_Code; "Book Issue Details1".Code)
            {
            }
            column(Book_Issue_Details1_Request_No; "Book Issue Details1"."Request No")
            {
            }
            trigger OnPreDataItem();
            begin
                LastFieldNo := FieldNo("Request No");
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
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511073_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511073;
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
