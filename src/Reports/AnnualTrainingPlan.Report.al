//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511194_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511194) { }
//type("System.IO.Path"; System_IO_Path51511194) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193599 "Annual Training Plan"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/AnnualTrainingPlan.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Training Request1"; "Training Request1")
        {
            DataItemTableView = where("Group or Individual" = filter(Individual));
            RequestFilterFields = "Budget Name";
            column(ReportForNavId_8496; 8496) { } // Autogenerated by ForNav - Do not delete
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
            column(Training_Request1__GETFILTERS; "Training Request1".GetFilters)
            {
            }
            column(Training_Request1__Employee_No_; "Training Request1"."Employee No")
            {
            }
            column(Training_Request1_Designation; "Training Request1".Designation)
            {
            }
            column(Training_Request1_Description; "Training Request1".Description)
            {
            }
            column(Training_Request1__Planned_Start_Date_; "Training Request1"."Planned Start Date")
            {
            }
            column(Training_Request1__Planned_End_Date_; "Training Request1"."Planned End Date")
            {
            }
            column(Training_Request1__No__Of_Days_; "Training Request1"."No. Of Days")
            {
            }
            column(Training_Request1__Training_Insitution_; "Training Request1"."Training Insitution")
            {
            }
            column(Training_Request1_Venue; "Training Request1".Venue)
            {
            }
            column(Training_Request1_Currency; "Training Request1".Currency)
            {
            }
            column(Training_Request1__Tuition_Fee_; "Training Request1"."Tuition Fee")
            {
            }
            column(Training_Request1__Per_Diem_; "Training Request1"."Per Diem")
            {
            }
            column(Training_Request1__Air_Ticket_; "Training Request1"."Air Ticket")
            {
            }
            column(Training_Request1__Total_Cost__LCY__; "Total Cost (LCY)")
            {
            }
            column(Training_Request1__Employee_Name_; "Training Request1"."Employee Name")
            {
            }
            column(Training_Request1__Total_Cost__LCY___Control1000000007; "Total Cost (LCY)")
            {
            }
            column(Annual_Training_PlanCaption; Annual_Training_PlanCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Training_Request1__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(Training_Request1_DesignationCaption; FieldCaption(Designation))
            {
            }
            column(CourseCaption; CourseCaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(Training_Request1__No__Of_Days_Caption; FieldCaption("No. Of Days"))
            {
            }
            column(Training_Request1__Training_Insitution_Caption; FieldCaption("Training Insitution"))
            {
            }
            column(Training_Request1_VenueCaption; FieldCaption(Venue))
            {
            }
            column(Training_Request1_CurrencyCaption; FieldCaption(Currency))
            {
            }
            column(Training_Request1__Tuition_Fee_Caption; FieldCaption("Tuition Fee"))
            {
            }
            column(Training_Request1__Per_Diem_Caption; FieldCaption("Per Diem"))
            {
            }
            column(Air_Ticket_TransportCaption; Air_Ticket_TransportCaptionLbl)
            {
            }
            column(Total_Cost__KES_Caption; Total_Cost__KES_CaptionLbl)
            {
            }
            column(Training_Request1__Employee_Name_Caption; FieldCaption("Employee Name"))
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Training_Request1_Request_No_; "Training Request1"."Request No.")
            {
            }
            column(Training_Request1_Budget; "Training Request1".Budget)
            {
            }
            column(Training_Request1_Actual; "Training Request1".Actual)
            {
            }
            column(Training_Request1_Variance; "Training Request1".Variance)
            {
            }
            column(Training_Request1_Budget_Caption; FieldCaption(Budget))
            {
            }
            column(Training_Request1_Actual_Caption; FieldCaption(Actual))
            {
            }
            column(Training_Request1_Variance_Caption; FieldCaption(Variance))
            {
            }
            column(Employee_No; EmpNo)
            {
            }
            column(Employee_Name; EmpName)
            {
            }
            column(Identified_Training_Need; TrainingNeedId)
            {
            }
            column(TrainingNeedIdCaption; TrainingNeedIdCaptionLbl)
            {
            }
            trigger OnAfterGetRecord();
            begin
                //MESSAGE('Employee=%1, Name=%2',EmpNo,EmpName);
                Participants.Reset;
                Participants.SetRange(Participants."Training Request", "Request No.");
                if Participants.Find('-') then begin
                    //MESSAGE('Employee=%1, Name=%2',EmpNo,EmpName);
                    EmpNo := Participants."Employee No";
                    EmpName := Participants."Employee Name";
                    TrainingNeedId := Participants."Training Need Description";
                    /*
                   TrainingNeeds.RESET;
                   TrainingNeeds.SETRANGE(TrainingNeeds."Employee No",Participants."Employee No");
                   IF TrainingNeeds.FIND('-') THEN BEGIN
                     TrainingNeedId:=TrainingNeeds.Description;
                   END;
                   */
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
        Annual_Training_PlanCaptionLbl: label 'CMA Individual Annual Training Plan';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        CourseCaptionLbl: label 'Course';
        FromCaptionLbl: label 'From';
        ToCaptionLbl: label 'To';
        Air_Ticket_TransportCaptionLbl: label 'Air Ticket/Transport';
        Total_Cost__KES_CaptionLbl: label 'Total Cost (KES)';
        TotalCaptionLbl: label 'Total';
        EmpRec: Record Employee;
        TrainingNeeds: Record "Training Needs1";
        Participants: Record "Training Participants";
        EmpNo: Code[20];
        EmpName: Text[50];
        TrainingNeedId: Text[250];
        TrainingNeedIdCaptionLbl: label 'Training Need Identified';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511194_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511194;
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
