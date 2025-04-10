//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511263_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511263) { }
//type("System.IO.Path"; System_IO_Path51511263) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193654 "Submitted Training Report"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/SubmittedTrainingReport.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Training Participants"; "Training Participants")
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(Training_Participants_Participant; "Training Participants".Participant)
            {
            }
            column(Training_Participants_Training_Request; "Training Participants"."Training Request")
            {
            }
            column(Training_Participants_Employee_No; "Training Participants"."Employee No")
            {
            }
            column(Training_Participants_Employee_Name; "Training Participants"."Employee Name")
            {
            }
            column(Training_Participants_Directorate; "Training Participants".Directorate)
            {
            }
            column(Training_Participants_Department; "Training Participants".Department)
            {
            }
            column(Training_Participants_Designation; "Training Participants".Designation)
            {
            }
            column(Training_Participants_Submitted_Report; "Training Participants"."Submitted Report")
            {
            }
            column(Training_Participants_Training_Need_Description; "Training Participants"."Training Need Description")
            {
            }
            column(Training_Participants_Training_Need; "Training Participants"."Training Need")
            {
            }
            column(Training_Participants_ParticipantCaption; FieldCaption(Participant))
            {
            }
            column(Training_Participants_Training_RequestCaption; FieldCaption("Training Request"))
            {
            }
            column(Training_Participants_Employee_NoCaption; FieldCaption("Employee No"))
            {
            }
            column(Training_Participants_Employee_NameCaption; FieldCaption("Employee Name"))
            {
            }
            column(Training_Participants_DirectorateCaption; FieldCaption(Directorate))
            {
            }
            column(Training_Participants_DepartmentCaption; FieldCaption(Department))
            {
            }
            column(Training_Participants_DesignationCaption; FieldCaption(Designation))
            {
            }
            column(Training_Participants_Submitted_ReportCaption; FieldCaption("Submitted Report"))
            {
            }
            column(Institution; Institution)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(Description; Description)
            {
            }
            column(CourseTitle; CourseTitle)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TrainingRequest.Reset;
                TrainingRequest.SetRange(TrainingRequest."Request No.", "Training Participants"."Training Request");
                if TrainingRequest.Find('-') then begin
                    Institution := TrainingRequest."Training Insitution";
                    CourseTitle := TrainingRequest."Course Title";
                    Description := TrainingRequest.Description;
                    StartDate := TrainingRequest."Planned Start Date";
                    EndDate := TrainingRequest."Planned End Date";
                end;
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
        TrainingRequest: Record "Training Request1";
        Institution: Text;
        StartDate: Date;
        EndDate: Date;
        Description: Text;
        CourseTitle: Text;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511263_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511263;
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
