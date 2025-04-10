//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
    //assembly("ForNav.Reports.7.3.0.2559")
    // {
    //   type(ForNav.Report_7_3_0_2559; ForNavReport51511078_v7_3_0_2559) { }
    //}
    //assembly("mscorlib")
    //  {
    //    Version = '4.0.0.0';
    //    type("System.IO.Stream"; SystemIOStream51511078) { }
    //type("System.IO.Path"; System_IO_Path51511078) { }
    //   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193502 "Fix claim lines"
{
    RDLCLayout = './Layouts/Fixclaimlines.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Claim Line1"; "Claim Line1")
        {
            DataItemTableView = sorting("Claim No", "Line No");
            column(ReportForNavId_8957; 8957) { } // Autogenerated by ForNav - Do not delete
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
            column(Claim_Line1__Claim_No_; "Claim Line1"."Claim No")
            {
            }
            column(Claim_Line1__Line_No_; "Claim Line1"."Line No")
            {
            }
            column(Claim_Line1__Patient_No_; "Claim Line1"."Patient No")
            {
            }
            column(Claim_Line1__Patient_Name_; "Claim Line1"."Patient Name")
            {
            }
            column(Claim_Line1__Hospital_Specialist_; "Claim Line1"."Hospital/Specialist")
            {
            }
            column(Claim_Line1__Invoice_Number_; "Claim Line1"."Invoice Number")
            {
            }
            column(Claim_Line1_Amount; "Claim Line1".Amount)
            {
            }
            column(Claim_Line1__Approved_Amount_; "Claim Line1"."Approved Amount")
            {
            }
            column(Claim_Line1__Employee_No_; "Claim Line1"."Employee No")
            {
            }
            column(Claim_Line1__Medical_Scheme_; "Claim Line1"."Medical Scheme")
            {
            }
            column(Claim_Line1_Status; "Claim Line1".Status)
            {
            }
            column(Claim_Line1__Amount_Spend__In_Patient__; "Amount Spend (In-Patient)")
            {
            }
            column(Claim_Line1__Amout_Spend__Out_Patient__; "Amout Spend (Out-Patient)")
            {
            }
            column(Claim_Line1__Claim_Type_; "Claim Line1"."Claim Type")
            {
            }
            column(Claim_Line1__Balance__In_Patient__; "Balance (In-Patient)")
            {
            }
            column(Claim_Line1__Balance__Out_Patient__; "Balance (Out-Patient)")
            {
            }
            column(Claim_Line1__Visit_Date_; "Claim Line1"."Visit Date")
            {
            }
            column(Claim_Line1__Employee_Name_; "Claim Line1"."Employee Name")
            {
            }
            column(Claim_Line1_Relationship; "Claim Line1".Relationship)
            {
            }
            column(Claim_Line1__Policy_Start_Date_; "Claim Line1"."Policy Start Date")
            {
            }
            column(Claim_LineCaption; Claim_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Claim_Line1__Claim_No_Caption; FieldCaption("Claim No"))
            {
            }
            column(Claim_Line1__Line_No_Caption; FieldCaption("Line No"))
            {
            }
            column(Claim_Line1__Patient_No_Caption; FieldCaption("Patient No"))
            {
            }
            column(Claim_Line1__Patient_Name_Caption; FieldCaption("Patient Name"))
            {
            }
            column(Claim_Line1__Hospital_Specialist_Caption; FieldCaption("Hospital/Specialist"))
            {
            }
            column(Claim_Line1__Invoice_Number_Caption; FieldCaption("Invoice Number"))
            {
            }
            column(Claim_Line1_AmountCaption; FieldCaption(Amount))
            {
            }
            column(Claim_Line1__Approved_Amount_Caption; FieldCaption("Approved Amount"))
            {
            }
            column(Claim_Line1__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(Claim_Line1__Medical_Scheme_Caption; FieldCaption("Medical Scheme"))
            {
            }
            column(Claim_Line1_StatusCaption; FieldCaption(Status))
            {
            }
            column(Claim_Line1__Amount_Spend__In_Patient__Caption; FieldCaption("Amount Spend (In-Patient)"))
            {
            }
            column(Claim_Line1__Amout_Spend__Out_Patient__Caption; FieldCaption("Amout Spend (Out-Patient)"))
            {
            }
            column(Claim_Line1__Claim_Type_Caption; FieldCaption("Claim Type"))
            {
            }
            column(Claim_Line1__Balance__In_Patient__Caption; FieldCaption("Balance (In-Patient)"))
            {
            }
            column(Claim_Line1__Balance__Out_Patient__Caption; FieldCaption("Balance (Out-Patient)"))
            {
            }
            column(Claim_Line1__Visit_Date_Caption; FieldCaption("Visit Date"))
            {
            }
            column(Claim_Line1__Employee_Name_Caption; FieldCaption("Employee Name"))
            {
            }
            column(Claim_Line1_RelationshipCaption; FieldCaption(Relationship))
            {
            }
            column(Claim_Line1__Policy_Start_Date_Caption; FieldCaption("Policy Start Date"))
            {
            }
            trigger OnAfterGetRecord();
            begin
                "Claim Line1".Validate("Claim Line1"."Visit Date");
                "Claim Line1".Modify;
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
        Claim_LineCaptionLbl: label 'Claim Line';
        CurrReport_PAGENOCaptionLbl: label 'Page';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511078_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511078;
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
