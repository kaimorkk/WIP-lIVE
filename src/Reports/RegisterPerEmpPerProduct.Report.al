//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51507263_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51507263) { }
//type("System.IO.Path"; System_IO_Path51507263) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193430 "Register Per Emp Per Product"
{
    RDLCLayout = './Layouts/RegisterPerEmpPerProduct.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            // DataItemTableView = where("Customer Type" = filter("Employee Type"::));
            RequestFilterFields = "Employer Code", "Registration Date", Gender, Status, "Date of Birth";
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            //column(CurrReport_PAGENO; Format(//ReportForNav.PageNo))
            // {
            // }
            column(TABLECAPTION__________CustFilter; TableCaption + ': ' + CustFilter)
            {
            }
            column(Member___ListCaption; Member_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(No_Customer; Customer."No.")
            {
            }
            column(Name_Customer; Customer.Name)
            {
            }
            column(IDNo_Customer; Customer."ID. No.")
            {
            }
            column(PassportNo_Customer; Customer."ID. No.")
            {
            }
            column(Status_Customer; Customer.Status)
            {
            }
            column(Registration_Date_Customer; Customer."Registration Date")
            {
            }
            column(Gender_Customer; Customer.Gender)
            {
            }
            column(Date_Of_Birth_Customer; Customer."Date of Birth")
            {
            }
            column(Employer_Code_Customer; Customer."Employer Code")
            {
            }
            // column(Employer_Name_Customer; Customer."Employer Name")
            // {
            // }
            column(RNo_; RNo)
            {
            }
            column(Member_No_Caption; FieldCaption("No."))
            {
            }
            column(Member_Name_Caption; FieldCaption(Name))
            {
            }
            column(Member_ID_No_Caption; FieldCaption("ID. No."))
            {
            }
            column(Member_Passport_No_Caption; FieldCaption("ID. No."))
            {
            }
            column(Member_Status_Caption; FieldCaption(Status))
            {
            }
            column(Registration_Date_Caption; FieldCaption("Registration Date"))
            {
            }
            column(Gender_Caption; FieldCaption(Gender))
            {
            }
            column(Date_Of_Birth_Caption; FieldCaption("Date of Birth"))
            {
            }
            column(Employer_Code_Caption; FieldCaption("Employer Code"))
            {
            }
            // column(Employer_Name_Caption; FieldCaption("Employer Name"))
            // {
            // }
            column(RNo_Caption; RNoLbl)
            {
            }
            column(Product_Code; "Monthly Contributions"."Product Code")
            {
            }
            column(Amount; "Monthly Contributions".Amount)
            {
            }
            column(Product_Code_Caption; Product_Code_Caption)
            {
            }
            column(Amount_Caption; Amount_Code_Caption)
            {
            }
            dataitem("Monthly Contributions"; "Monthly Contributions")
            {
                DataItemLink = "Member No." = field("No.");
                DataItemTableView = where(Status = filter(Released));
                column(ReportForNavId_1000000030; 1000000030) { } // Autogenerated by ForNav - Do not delete
                trigger OnAfterGetRecord();
                begin
                    "Monthly Contributions".CalcFields(Amount);

                end;

            }
            trigger OnAfterGetRecord();
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
                RNo := RNo + 1;
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
        Member_ListCaptionLbl: label 'Member List';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        CompInfo: Record "Company Information";
        CustAddr: array[8] of Text[50];
        CustFilter: Text;
        RNo: Integer;
        RNoLbl: label 'No';
        Product_Code_Caption: label 'Product Code';
        Amount_Code_Caption: label 'Amount';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51507263_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51507263;
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
