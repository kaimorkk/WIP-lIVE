//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511396_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511396) { }
//type("System.IO.Path"; System_IO_Path51511396) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193698 "Letter of Regret"
{
    RDLCLayout = './Layouts/LetterofRegret.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Stage Shortlist1"; "Stage Shortlist1")
        {
            column(ReportForNavId_1000000004; 1000000004) { } // Autogenerated by ForNav - Do not delete
            column(Stage_Code; "Stage Shortlist1"."Stage Code")
            {
            }
            column(Applicant; "Stage Shortlist1".Applicant)
            {
            }
            column(Stage_Score; "Stage Shortlist1"."Stage Score")
            {
            }
            column(Qualified; "Stage Shortlist1".Qualified)
            {
            }
            column(Name; "Stage Shortlist1"."First Name" + ' ' + "Stage Shortlist1"."Middle Name" + ' ' + "Stage Shortlist1"."Last Name")
            {
            }
            column(ID_No; "Stage Shortlist1"."ID No")
            {
            }
            column(Gender; "Stage Shortlist1".Gender)
            {
            }
            column(Marital_Status; "Stage Shortlist1"."Marital Status")
            {
            }
            column(Manual_Change; "Stage Shortlist1"."Manual Change")
            {
            }
            column(Employ; "Stage Shortlist1".Employ)
            {
            }
            column(Date; "Stage Shortlist1".Date)
            {
            }
            column(Position; "Stage Shortlist1".Position)
            {
            }
            column(Email; ApplicantEmail)
            {
            }
            column(Postal_Address; ApplicantPostalAddress)
            {
            }
            column(City; ApplicantCity)
            {
            }
            column(Post_Code; ApplicantPostCode)
            {
            }
            column(Phone; ApplicantPhone)
            {
            }
            column(DearCaption; StrSubstNo(DearLbl, "Stage Shortlist1"."First Name"))
            {
            }
            column(BodyCaption; StrSubstNo(BodyLbl, "Stage Shortlist1"."Stage Code"))
            {
            }
            column(Regards; RegardsLbl)
            {
            }
            trigger OnAfterGetRecord();
            var
                Base64Convert: Codeunit "Base64 Convert";
                TempBlob: Codeunit "Temp Blob";
                FileContentsB64: Text;
                BlobOutStream: OutStream;
                RecRef: RecordRef;
                filename: text;
            begin
                ApplicantsRec.Reset;
                if ApplicantsRec.Get("Stage Shortlist1".Applicant) then begin
                    ApplicantEmail := ApplicantsRec."E-Mail";
                    ApplicantPostalAddress := ApplicantsRec."Postal Address";
                    ApplicantPostCode := ApplicantsRec."Post Code";
                    ApplicantCity := ApplicantsRec.City;
                    ApplicantPhone := ApplicantsRec."Cellular Phone Number"
                end;
                CompanyInfo.Get();
                SenderAddress := CompanyInfo."Administrator Email";
                SenderName := COMPANYNAME;
                Subject := StrSubstNo('Letter of Regret');
                Body := StrSubstNo('Please find attached');
                // Recipients :=Vendor."E-Mail";
                SMTPSetup.Create(ApplicantEmail, Subject, Body, true);
                // FileName := FileMangement.ServerTempFileName('.pdf');
                Report.SaveAs(Report::"Letter of Regret", '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(Report::"Letter of Regret", FileName, "Stage Shortlist1");
                // SMTPSetup.AddAttachment(FileName);
                //SMTPSetup.AddCC(CompanyInfo."HR Support Email");
                Email.Send(SMTPSetup);
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
        DearLbl: label 'Dear %1,';
        BodyLbl: label 'We have reviewed your application and are glad to inform you that you have successfully qualified in the %1 stage.';
        ApplicantsRec: Record Applicants1;
        ApplicantEmail: Text[100];
        ApplicantPostalAddress: Text[100];
        ApplicantCity: Text[50];
        ApplicantPostCode: Code[30];
        ApplicantPhone: Text[50];
        RegardsLbl: label 'Regards.';
        CompanyInfo: Record "Company Information";
        SenderAddress: Text[100];
        Subject: Text[250];
        SenderName: Text[100];
        Body: Text[250];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        FileName: Text[150];
        FileMangement: Codeunit "File Management";

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511396_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511396;
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
