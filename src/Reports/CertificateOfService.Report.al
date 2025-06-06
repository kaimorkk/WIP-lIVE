//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511168_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511168) { }
//type("System.IO.Path"; System_IO_Path51511168) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193578 "Certificate Of Service"
{
    RDLCLayout = './Layouts/CertificateOfService.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_7528; 7528) { } // Autogenerated by ForNav - Do not delete
            column(Employee__Job_Title_; Employee."Job Title")
            {
            }
            column(Employee__Date_Of_Join_; Employee."Date Of Join")
            {
            }
            column(Employee__Contract_End_Date_; Employee."Contract End Date")
            {
            }
            column(Performance; Performance)
            {
            }
            column(GeneralConduct; GeneralConduct)
            {
            }
            column(Name; Name)
            {
            }
            column(CERTIFICATE_OF_SERVICECaption; CERTIFICATE_OF_SERVICECaptionLbl)
            {
            }
            column(NAME_Caption; NAME_CaptionLbl)
            {
            }
            column(POSITION_HELD_Caption; POSITION_HELD_CaptionLbl)
            {
            }
            column(PERIOD_OF_SERVICE_Caption; PERIOD_OF_SERVICE_CaptionLbl)
            {
            }
            column(FROM_Caption; FROM_CaptionLbl)
            {
            }
            column(TO_Caption; TO_CaptionLbl)
            {
            }
            column(GENERAL_CONDUCT_Caption; GENERAL_CONDUCT_CaptionLbl)
            {
            }
            column(EFFICIENCY_Caption; EFFICIENCY_CaptionLbl)
            {
            }
            column(This_Certificate_has_been_issued_without_any_erasure_or_alteration_whatsoeverCaption; This_Certificate_has_been_issued_without_any_erasure_or_alteration_whatsoeverCaptionLbl)
            {
            }
            column(APPROVED_Caption; APPROVED_CaptionLbl)
            {
            }
            column(HUMAN_RESOURCE___ADMINISTRATION_DEPARTMENTCaption; HUMAN_RESOURCE___ADMINISTRATION_DEPARTMENTCaptionLbl)
            {
            }
            column(NAME___________________________________________________________________________________Caption; NAME___________________________________________________________________________________CaptionLbl)
            {
            }
            column(SIGNATURE_______________________________________________________________________Caption; SIGNATURE_______________________________________________________________________CaptionLbl)
            {
            }
            column(DIRECTOR_GENERALCaption; DIRECTOR_GENERALCaptionLbl)
            {
            }
            column(NAME_____________________________________________________________Caption; NAME_____________________________________________________________CaptionLbl)
            {
            }
            column(SIGNATURE______________________________________________________________________Caption; SIGNATURE______________________________________________________________________CaptionLbl)
            {
            }
            column(DATE_______________________________________________________________________________Caption; DATE_______________________________________________________________________________CaptionLbl)
            {
            }
            column(ASSESSMENT__Performance_and_general_conduct_are_assessed_as__very_Good____Good____Fair__Caption; ASSESSMENT__Performance_and_general_conduct_are_assessed_as__very_Good____Good____Fair__CaptionLbl)
            {
            }
            column(or__Indifferent_Caption; or__Indifferent_CaptionLbl)
            {
            }
            column(Employee_No_; Employee."No.")
            {
            }
            trigger OnAfterGetRecord();
            begin
                Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
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
        CoRec: Record "Company Information";
        Performance: Option "Very Good",Good,Fair,Indifferent;
        GeneralConduct: Option "Very Good",Good,Fair,Indifferent;
        Name: Text[50];
        CERTIFICATE_OF_SERVICECaptionLbl: label 'CERTIFICATE OF SERVICE';
        NAME_CaptionLbl: label 'NAME:';
        POSITION_HELD_CaptionLbl: label 'POSITION HELD:';
        PERIOD_OF_SERVICE_CaptionLbl: label 'PERIOD OF SERVICE:';
        FROM_CaptionLbl: label 'FROM:';
        TO_CaptionLbl: label 'TO:';
        GENERAL_CONDUCT_CaptionLbl: label 'GENERAL CONDUCT:';
        EFFICIENCY_CaptionLbl: label 'EFFICIENCY:';
        This_Certificate_has_been_issued_without_any_erasure_or_alteration_whatsoeverCaptionLbl: label 'This Certificate has been issued without any erasure or alteration whatsoever';
        APPROVED_CaptionLbl: label 'APPROVED:';
        HUMAN_RESOURCE___ADMINISTRATION_DEPARTMENTCaptionLbl: label 'HUMAN RESOURCE & ADMINISTRATION DEPARTMENT';
        NAME___________________________________________________________________________________CaptionLbl: label 'NAME:..................................................................................';
        SIGNATURE_______________________________________________________________________CaptionLbl: label 'SIGNATURE:......................................................................';
        DIRECTOR_GENERALCaptionLbl: label 'DIRECTOR GENERAL';
        NAME_____________________________________________________________CaptionLbl: label 'NAME:............................................................';
        SIGNATURE______________________________________________________________________CaptionLbl: label 'SIGNATURE:.....................................................................';
        DATE_______________________________________________________________________________CaptionLbl: label 'DATE:..............................................................................';
        ASSESSMENT__Performance_and_general_conduct_are_assessed_as__very_Good____Good____Fair__CaptionLbl: label 'ASSESSMENT -Performance and general conduct are assessed as "very Good", "Good", "Fair",';
        or__Indifferent_CaptionLbl: label 'or "Indifferent"';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511168_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511168;
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
