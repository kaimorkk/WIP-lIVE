//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511034_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511034) { }
//type("System.IO.Path"; System_IO_Path51511034) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193469 "Budget Details"
{
    RDLCLayout = './Layouts/BudgetDetails.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("G/L Budget Entry"; "G/L Budget Entry")
        {
            DataItemLinkReference = "G/L Budget Entry";
            DataItemTableView = sorting("Budget Name", "G/L Account No.", Date);
            column(ReportForNavId_3459; 3459) { } // Autogenerated by ForNav - Do not delete
            column(G_L_Budget_Entry_Date; "G/L Budget Entry".Date)
            {
            }
            column(G_L_Budget_Entry__Global_Dimension_1_Code_; "G/L Budget Entry"."Global Dimension 1 Code")
            {
            }
            column(G_L_Budget_Entry__Global_Dimension_2_Code_; "G/L Budget Entry"."Global Dimension 2 Code")
            {
            }
            column(G_L_Budget_Entry_Amount; "G/L Budget Entry".Amount)
            {
            }
            column(G_L_Budget_Entry__Entry_No__; "G/L Budget Entry"."Entry No.")
            {
            }
            column(glname; "G/L Account".Name)
            {
            }
            column(G_L_Budget_Entry__G_L_Account_No__; "G/L Budget Entry"."G/L Account No.")
            {
            }
            dataitem("G/L Account"; "G/L Account")
            {
                DataItemLink = "No." = field("G/L Account No.");
                PrintOnlyIfDetail = true;
                column(ReportForNavId_6710; 6710) { } // Autogenerated by ForNav - Do not delete
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
                column(Budget_Listing_ReportCaption; Budget_Listing_ReportCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(G_L_Budget_Entry__Entry_No__Caption; "G/L Budget Entry".FieldCaption("Entry No."))
                {
                }
                column(G_L_Budget_Entry_DateCaption; "G/L Budget Entry".FieldCaption(Date))
                {
                }
                column(G_L_Budget_Entry__Global_Dimension_1_Code_Caption; "G/L Budget Entry".FieldCaption("Global Dimension 1 Code"))
                {
                }
                column(G_L_Budget_Entry__Global_Dimension_2_Code_Caption; "G/L Budget Entry".FieldCaption("Global Dimension 2 Code"))
                {
                }
                column(G_L_Budget_Entry_AmountCaption; "G/L Budget Entry".FieldCaption(Amount))
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(UserNameCaption; UserNameCaptionLbl)
                {
                }
                column(G_L_Budget_Entry__G_L_Account_No__Caption; "G/L Budget Entry".FieldCaption("G/L Account No."))
                {
                }
                column(G_L_DescriptionCaption; G_L_DescriptionCaptionLbl)
                {
                }
                column(G_L_Account_No_; "G/L Account"."No.")
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
        //;
        //ReportsForNavPre;
    end;

    var
        Budget_Listing_ReportCaptionLbl: label 'Budget Listing Report';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        EmptyStringCaptionLbl: label '----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
        UserNameCaptionLbl: label 'UserName';
        G_L_DescriptionCaptionLbl: label 'G/L Description';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511034_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511034;
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
