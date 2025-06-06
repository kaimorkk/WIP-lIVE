//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511066_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511066) { }
    //type("System.IO.Path"; System_IO_Path51511066) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193493 "book details"
{
    RDLCLayout = './Layouts/bookdetails.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Books1; Books1)
        {
            DataItemTableView = sorting(No);
            RequestFilterFields = "donation?";
            column(ReportForNavId_6127; 6127) { } // Autogenerated by ForNav - Do not delete
                                                  //column(PageConst_________FORMAT_CurrReport_PAGENO_; PageConst + ' ' + Format(//ReportForNav.PageNo))
                                                  // {
                                                  // }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Books1_No; Books1.No)
            {
            }
            column(Books1_Description; Books1.Description)
            {
            }
            column(Books1_Author; Books1.Author)
            {
            }
            column(Books1_ISBN; Books1.ISBN)
            {
            }
            column(Books1__Category_Name_; Books1."Category Name")
            {
            }
            column(Books1__donation__; "donation?")
            {
            }
            column(Books1__Classification_No_; Books1."Classification No")
            {
            }
            column(BooksCaption; BooksCaptionLbl)
            {
            }
            column(Books1_NoCaption; FieldCaption(No))
            {
            }
            column(Books1_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Books1_AuthorCaption; FieldCaption(Author))
            {
            }
            column(Books1_ISBNCaption; FieldCaption(ISBN))
            {
            }
            column(Books1__Category_Name_Caption; FieldCaption("Category Name"))
            {
            }
            column(Books1__donation__Caption; FieldCaption("donation?"))
            {
            }
            column(Books1__Classification_No_Caption; FieldCaption("Classification No"))
            {
            }
        }
        dataitem(Company; Company)
        {
            column(ReportForNavId_4444; 4444) { } // Autogenerated by ForNav - Do not delete
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
        PageConst: label 'Page';
        BooksCaptionLbl: label 'Books';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511066_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511066;
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
