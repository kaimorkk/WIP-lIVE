
codeunit 69600 "Recruitment"
{

    trigger OnRun()
    begin
    end;

    procedure TransferPlanToVacancy(RecruitmentPlanPosition: Record "Recruitment Plan Position")
    var
        Vacancy: Record "Recruitment Requisition Header";
        PositionRequirements: Record "Position Requirement";
        PositionWorkCondition: Record "Position Work Condition";
        PositionResponsibilities: Record "Positions Responsibility";
        VacancyRequirement: Record "Recruitment Req Requirement";
        VacancyWorkCondition: Record "Recruitment Req Work Condition";
        VacancyResponsibility: Record "Recruitment Req Responsibility";
        LineNo: Integer;
        PositionRequirements1: Record "Position Requirement";
        PositionWorkCondition1: Record "Position Work Condition";
        PositionResponsibilities1: Record "Positions Responsibility";
        VacancyNo: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        HumanResourcesSetup.Get;
        // HumanResourcesSetup.TestField("Training Deduction");
        // NoSeriesManagement.InitSeries(HumanResourcesSetup."Training Deduction", HumanResourcesSetup."Training Deduction", 0D, VacancyNo, HumanResourcesSetup."Training Deduction");
        Vacancy."Document No." := VacancyNo;
        Vacancy."Recruitment Plan Type" := Vacancy."recruitment plan type"::"Annual HR Plan";
        Vacancy."Recruitment Plan ID" := RecruitmentPlanPosition."Recruitment Plan ID";
        Vacancy."Position ID" := RecruitmentPlanPosition."Position ID";
        Vacancy.Validate("Position ID");
        Vacancy."Document Type" := Vacancy."document type"::"Job Vacancy";
        Vacancy."Document Date" := Today;
        Vacancy."Created By" := UserId;
        Vacancy."Created On" := Today;
        Vacancy."Created Time" := Time;
        Vacancy.Insert;

        //requirements

        PositionRequirements1.Reset;
        if PositionRequirements1.FindLast then begin
            LineNo := PositionRequirements1."Requirement ID";
        end;
        PositionRequirements.Reset;
        PositionRequirements.SetRange("Position ID", RecruitmentPlanPosition."Position ID");
        if PositionRequirements.FindSet then begin
            repeat
                VacancyRequirement."Line No." := LineNo + 1;
                VacancyRequirement."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyRequirement."Document No." := VacancyNo;
                VacancyRequirement."Requirement ID" := PositionRequirements."Requirement ID";
                VacancyRequirement."Qualification Category" := PositionRequirements."Qualification Category";
                VacancyRequirement.Description := PositionRequirements.Description;
                VacancyRequirement."Requirement Type" := PositionRequirements."Requirement Type";
                VacancyRequirement."Substitute Qualification Exist" := PositionRequirements."Substitute Qualification";
                VacancyRequirement.Insert;
                LineNo += 1;
            until PositionRequirements.Next = 0;
        end;

        //Responsibilities

        PositionResponsibilities1.Reset;
        if PositionResponsibilities1.FindLast then begin
            LineNo := PositionResponsibilities1."Line No";
        end;
        PositionResponsibilities.Reset;
        PositionResponsibilities.SetRange("Position ID", RecruitmentPlanPosition."Position ID");
        if PositionResponsibilities.FindSet then begin
            repeat
                VacancyResponsibility."Line No." := LineNo + 1;
                VacancyResponsibility."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyResponsibility."Document No." := VacancyNo;
                VacancyResponsibility.Description := PositionResponsibilities.Description;
                VacancyResponsibility.Insert;
                LineNo += 1;
            until PositionResponsibilities.Next = 0;
        end;


        //work conditions

        PositionWorkCondition1.Reset;
        if PositionWorkCondition1.FindLast then begin
            LineNo := PositionWorkCondition1."Line No";
        end;
        PositionWorkCondition.Reset;
        PositionWorkCondition.SetRange("Position ID", RecruitmentPlanPosition."Position ID");
        if PositionWorkCondition.FindSet then begin
            repeat
                VacancyWorkCondition."Line No" := LineNo + 1;
                VacancyWorkCondition."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyWorkCondition."Document No" := VacancyNo;
                VacancyWorkCondition."Working Condition Category" := PositionWorkCondition."Work Condition Category";
                VacancyWorkCondition.Description := PositionWorkCondition.Description;
                VacancyWorkCondition.Insert;
                LineNo += 1;
            until PositionWorkCondition.Next = 0;
        end;
        Message('Vacancy %1,has been created successfully', VacancyNo);
        Page.Run(69630, Vacancy);
    end;

    procedure CopyApplicantDetails(ApplicantNo: Record "Job Applications")
    var
        Applicant: Record Applicant;
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicantQualificationHistor: Record "Applicant Qualification Histor";
        Applicant_EmployeeHobby: Record "Applicant_Employee Hobby";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        Employee_ApplicantLanguage: Record "Employee_Applicant Language";
        JobApplications: Record "Job Applications";
        JobApplicantsQualification1: Record "Application Qualification";
        ApplicantQualificationHistor1: Record "Application Qualification His";
        Applicant_EmployeeHobby1: Record "Application Hobby";
        Employee_ApplicantReferees1: Record "Application Referees";
        Employee_ApplicantLanguage1: Record "Application Language";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", ApplicantNo."Candidate No.");
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification1.TransferFields(JobApplicantsQualification);
            JobApplicantsQualification1."Application No." := ApplicantNo."Application No.";
            JobApplicantsQualification1.Modify;
        end
    end;

    procedure CopyPositionDetails(RecruitmentRequisitionHeader: Record "Recruitment Requisition Header")
    var
        CompanyPositions: Record "Company Positions";
        RequisitionHeader: Record "Recruitment Requisition Header";
        ReqWorkCondition: Record "Recruitment Req Work Condition";
        ReqRequirement: Record "Recruitment Req Requirement";
        ReqResponsibility: Record "Recruitment Req Responsibility";
        PositionsResponsibility: Record "Positions Responsibility";
        PositionReqSubstitute: Record "Position Req Substitute";
        PositionRequirement: Record "Position Requirement";
        LineNo: Integer;
        ReqRequirement1: Record "Recruitment Req Requirement";
        ReqResponsibility1: Record "Recruitment Req Responsibility";
        ReqWorkCondition1: Record "Recruitment Req Work Condition";
        //mtr
        ScaleBenefits: Record "Scale Benefits";
        RecruitmentSalaryBenefits: Record "Recruitment Salary Benefits";
    begin
        CompanyPositions.Reset;
        CompanyPositions.SetRange("Position ID", RecruitmentRequisitionHeader."Position ID");
        if CompanyPositions.FindFirst then begin
            //clear entries first
            ReqRequirement1.Reset;
            ReqRequirement1.SetRange("Document Type", ReqRequirement1."document type"::"Recruitment Requisition");
            ReqRequirement1.SetRange("Document No.", RecruitmentRequisitionHeader."Document No.");
            if ReqRequirement1.FindSet then begin
                ReqRequirement1.DeleteAll;
            end;
            ReqResponsibility1.Reset;
            ReqResponsibility1.SetRange("Document No.", RecruitmentRequisitionHeader."Document No.");
            if ReqResponsibility1.FindSet then begin
                ReqResponsibility1.DeleteAll;
            end;
            RecruitmentSalaryBenefits.Reset;
            RecruitmentSalaryBenefits.SetRange("Document No", RecruitmentRequisitionHeader."Document No.");
            if RecruitmentSalaryBenefits.FindSet then begin
                RecruitmentSalaryBenefits.DeleteAll;
            end;

            //copy requirements
            ReqRequirement1.Reset;
            if ReqRequirement1.FindLast then begin
                LineNo := ReqRequirement1."Line No.";
            end;
            PositionRequirement.Reset;
            PositionRequirement.SetRange("Position ID", CompanyPositions."Position ID");
            if PositionRequirement.FindSet then begin
                repeat
                    ReqRequirement."Document No." := RecruitmentRequisitionHeader."Document No.";
                    ReqRequirement."Line No." := LineNo + 1;
                    ReqRequirement."Document Type" := ReqRequirement."document type"::"Recruitment Requisition";
                    ReqRequirement."Requirement ID" := PositionRequirement."Requirement ID";
                    ReqRequirement."Requirement Type" := PositionRequirement."Requirement Type";
                    ReqRequirement."Qualification Category" := PositionRequirement."Qualification Category";
                    ReqRequirement."Qualification Code" := PositionRequirement."Qualification Code";
                    ReqRequirement.Description := PositionRequirement.Description;
                    LineNo += 1;
                    ReqRequirement.Insert;

                until PositionRequirement.Next = 0;
            end;
            //copy responsibilities
            ReqResponsibility1.Reset;
            if ReqResponsibility1.FindLast then begin
                LineNo := ReqResponsibility1."Line No.";
            end;
            PositionsResponsibility.Reset;
            PositionsResponsibility.SetRange("Position ID", RecruitmentRequisitionHeader."Position ID");
            if PositionsResponsibility.FindSet then begin
                repeat

                    ReqResponsibility."Document No." := RecruitmentRequisitionHeader."Document No.";
                    ReqResponsibility."Line No." := LineNo + 1;
                    ReqResponsibility."Document Type" := ReqResponsibility."document type"::"Recruitment Requisition";
                    ReqResponsibility.Description := PositionsResponsibility.Description;
                    ReqResponsibility.Type := PositionsResponsibility.Type;
                    ReqResponsibility.Insert;
                    LineNo += 1;
                until PositionsResponsibility.Next = 0;
            end;

            // Copy position benefits
            ScaleBenefits.Reset();
            ScaleBenefits.SetRange("Salary Scale", RecruitmentRequisitionHeader."Job Grade ID");
            ScaleBenefits.SetRange("Salary Pointer", '1');
            if ScaleBenefits.FindSet() then begin
                repeat
                    RecruitmentSalaryBenefits."Document No" := RecruitmentRequisitionHeader."Document No.";
                    RecruitmentSalaryBenefits."Salary Scale" := ScaleBenefits."Salary Scale";
                    RecruitmentSalaryBenefits."Salary Pointer" := ScaleBenefits."Salary Pointer";
                    RecruitmentSalaryBenefits."ED Code" := ScaleBenefits."ED Code";
                    RecruitmentSalaryBenefits.Amount := ScaleBenefits.Amount;
                    RecruitmentSalaryBenefits."ED Description" := ScaleBenefits."ED Description";
                    RecruitmentSalaryBenefits."G/L Account" := ScaleBenefits."G/L Account";
                    RecruitmentSalaryBenefits."Basic Salary" := ScaleBenefits."Basic Salary";
                    RecruitmentSalaryBenefits."Percentage" := ScaleBenefits."Percentage";
                    RecruitmentSalaryBenefits."Based On" := ScaleBenefits."Based On";
                    RecruitmentSalaryBenefits.insert(true);
                until ScaleBenefits.Next() = 0;

            end;



            Message('The requirements and responsibilities for the position %1, have been populated, Kindly Check', CompanyPositions."Job Title");
        end
    end;

    procedure PostFuncPlanToAnnual(RecruitmentPlan: Record "Recruitment Plan")
    var
        AnnualPlan: Record "Recruitment Plan";
        AnnualPlanPosition: Record "Recruitment Plan Position";
        AnnualPlanningLine: Record "Recruitment Planning Line";
        FunctionalPlanPosition: Record "Recruitment Planning Line";
        AnnualPlanningLine1: Record "Recruitment Planning Line";
        LineNo: Integer;
        AnnualPlanPosition1: Record "Recruitment Plan Position";
    begin
        AnnualPlan.Reset;
        AnnualPlan.SetRange("Document No.", RecruitmentPlan."Annual Recruitment Plan No.");
        if AnnualPlan.FindFirst then begin
            //insert into position and lines
            FunctionalPlanPosition.Reset;
            FunctionalPlanPosition.SetRange("Recruitment Plan ID", RecruitmentPlan."Document No.");
            if FunctionalPlanPosition.FindSet then begin
                repeat
                    AnnualPlanPosition.Reset;
                    AnnualPlanPosition.SetRange("Position ID", FunctionalPlanPosition."Position ID");
                    if not AnnualPlanPosition.FindFirst then begin
                        //insert position and relevant lines
                        AnnualPlanPosition1.Init;
                        AnnualPlanPosition1."Recruitment Plan ID" := RecruitmentPlan."Annual Recruitment Plan No.";
                        AnnualPlanPosition1."Position ID" := FunctionalPlanPosition."Position ID";
                        AnnualPlanPosition1.Validate("Position ID");
                        if AnnualPlanPosition1.Insert(true) then begin

                            CreateLines(AnnualPlan, FunctionalPlanPosition);
                        end;
                        //lines


                    end
                    else begin
                        CreateLines(AnnualPlan, FunctionalPlanPosition);
                    end
                until FunctionalPlanPosition.Next = 0;
                Message('Functional Plan-%1,has been posted succesfully to %2', RecruitmentPlan."Document No.", RecruitmentPlan."Annual Recruitment Plan No.")
            end;
            RecruitmentPlan.Posted := true;
            RecruitmentPlan."Posted By" := UserId;
            RecruitmentPlan."Posted On" := CurrentDatetime;
            RecruitmentPlan.Modify(true);

        end;
    end;

    local procedure CreateLines(AnnualPlan: Record "Recruitment Plan"; FunctionalPlanPosition: Record "Recruitment Planning Line")
    var
        AnnualPlanningLine: Record "Recruitment Planning Line";
        AnnualPlanningLine1: Record "Recruitment Planning Line";
        LineNo: Integer;
    begin
        //delet previous entries

        AnnualPlanningLine.Reset;
        if AnnualPlanningLine.FindLast then
            LineNo := AnnualPlanningLine."Line No";
        AnnualPlanningLine1.Init;
        AnnualPlanningLine1."Line No" := LineNo + 1;
        AnnualPlanningLine1."Recruitment Plan ID" := AnnualPlan."Document No.";
        AnnualPlanningLine1."Recruitment Plan Type" := FunctionalPlanPosition."recruitment plan type"::"Annual HR Plan";
        AnnualPlanningLine1."Position ID" := FunctionalPlanPosition."Position ID";
        AnnualPlanningLine1."Duty Station ID" := FunctionalPlanPosition."Duty Station ID";
        AnnualPlanningLine1."Designation Group" := FunctionalPlanPosition."Designation Group";
        AnnualPlanningLine1."Position Category" := FunctionalPlanPosition."Position Category";
        AnnualPlanningLine1."Job No." := FunctionalPlanPosition."Job No.";
        AnnualPlanningLine1."Job Task No." := FunctionalPlanPosition."Job Task No.";
        AnnualPlanningLine1.Directorate := FunctionalPlanPosition.Directorate;
        AnnualPlanningLine1.Department := FunctionalPlanPosition.Department;
        AnnualPlanningLine1.Validate("Position ID");
        AnnualPlanningLine1."Recruiter Fees %" := FunctionalPlanPosition."Recruiter Fees %";
        AnnualPlanningLine1."Recruitment Cycle Type" := FunctionalPlanPosition."Recruitment Cycle Type";
        AnnualPlanningLine1."Recruitment Justification" := FunctionalPlanPosition."Recruitment Justification";
        AnnualPlanningLine1."Primary Recruitment Reason" := FunctionalPlanPosition."Primary Recruitment Reason";
        AnnualPlanningLine1."Recruitment Lead Time" := FunctionalPlanPosition."Recruitment Lead Time";
        AnnualPlanningLine1."Recruitment Line Budget Cost" := FunctionalPlanPosition."Recruitment Line Budget Cost";
        AnnualPlanningLine1."Planned Start Date" := FunctionalPlanPosition."Planned Start Date";
        AnnualPlanningLine1.Validate("Planned Start Date");
        AnnualPlanningLine1."Planned Employment Start Date" := FunctionalPlanPosition."Planned Employment Start Date";
        AnnualPlanningLine1."Planned Employment End Date" := FunctionalPlanPosition."Planned Employment End Date";
        AnnualPlanningLine1."No. of Planned New Hires" := FunctionalPlanPosition."No. of Planned New Hires";
        AnnualPlanningLine1.Insert(true);
    end;

    procedure ShortlistBasedOnRequirements(JobApplications: Record "Job Applications")
    var
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        RequirementsChecklist: Record "Requirements Checklist";
        PassedMandatory: Record "Passed Mandatory";
        EntryNo: Integer;
    begin
        /* EntryNo:=0;
        RecruitmentReqRequirement.RESET;
        RecruitmentReqRequirement.SETRANGE("Document No.",JobApplications."Vacancy Id");
        IF RecruitmentReqRequirement.FINDSET THEN BEGIN
          REPEAT
            IF RecruitmentReqRequirement."Requirement Type"=RecruitmentReqRequirement."Requirement Type"::Mandatory THEN
              BEGIN
              RequirementsChecklist.RESET;
              RequirementsChecklist.SETRANGE("Application No.",JobApplications."Application No.");
              RequirementsChecklist.SETRANGE("Qualification Code",RecruitmentReqRequirement."Qualification Code");
              RequirementsChecklist.SETFILTER("Candidates Response",'<>%1','');
              IF RequirementsChecklist.FINDSET THEN BEGIN
                PassedMandatory.RESET;
                PassedMandatory.SETRANGE(Code,RequirementsChecklist."Application No.");
                IF PassedMandatory.FINDSET THEN BEGIN
                 PassedMandatory.DELETEALL;
                END;
                PassedMandatory.RESET;
                IF PassedMandatory.FINDLAST THEN BEGIN
                  EntryNo:=PassedMandatory."Line No";
                END;
                //insert on qualified
                PassedMandatory.INIT;
                PassedMandatory."Line No":=EntryNo+1;
                PassedMandatory.Code:=RequirementsChecklist."Application No.";
                PassedMandatory."Vacancy ID":=RequirementsChecklist."Qualification Code";
        
                IF RequirementsChecklist."Rating Type"=RequirementsChecklist."Rating Type"::"Yes/No"
                  THEN
                  IF RequirementsChecklist."Candidates Response"='Yes' THEN
                  PassedMandatory.Description:=TRUE;
        
                  PassedMandatory.INSERT(TRUE);
                 EntryNo+=1;
                END;
                END;
        
            //check if matched
          UNTIL
        RecruitmentReqRequirement.NEXT=0;
        END
        */

    end;

    procedure TransferRequisitionToVacancy(RequisitionHeader: Record "Recruitment Requisition Header")
    var
        Vacancy: Record "Recruitment Requisition Header";
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        RecruitmentReqWorkCondition: Record "Recruitment Req Work Condition";
        RecruitmentReqResponsibility: Record "Recruitment Req Responsibility";
        VacancyRequirement: Record "Recruitment Req Requirement";
        VacancyWorkCondition: Record "Recruitment Req Work Condition";
        VacancyResponsibility: Record "Recruitment Req Responsibility";
        LineNo: Integer;
        RecruitmentReqRequirement1: Record "Recruitment Req Requirement";
        RecruitmentReqWorkCondition1: Record "Recruitment Req Work Condition";
        RecruitmentReqResponsibility1: Record "Recruitment Req Responsibility";
        VacancyNo: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
        ScaleBenefits: Record "Recruitment Salary Benefits";
        RecruitmentSalaryBenefits: Record "Recruitment Salary Benefits";
    begin
        //transfer field
        Vacancy.TransferFields(RequisitionHeader);
        Vacancy."Document Type" := Vacancy."document type"::"Job Vacancy";
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Vacancy Nos.");
        NoSeriesManagement.InitSeries(HumanResourcesSetup."Vacancy Nos.", HumanResourcesSetup."Vacancy Nos.", 0D, VacancyNo, HumanResourcesSetup."Vacancy Nos.");
        Vacancy."Document No." := VacancyNo;
        Vacancy."Document Date" := Today;
        Vacancy."Created By" := UserId;
        Vacancy."Created On" := Today;
        Vacancy."Created Time" := Time;
        Vacancy."Requisition ID" := RequisitionHeader."Document No.";
        Vacancy.Insert();

        //requirements
        RecruitmentReqRequirement1.Reset;
        if RecruitmentReqRequirement1.FindLast then begin
            LineNo := RecruitmentReqRequirement1."Line No.";
        end;
        RecruitmentReqRequirement.Reset;
        RecruitmentReqRequirement.SetRange("Document No.", RequisitionHeader."Document No.");
        if RecruitmentReqRequirement.FindSet then begin
            repeat
                //get last no

                VacancyRequirement.TransferFields(RecruitmentReqRequirement);
                VacancyRequirement."Line No." := LineNo + 1;
                VacancyRequirement."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyRequirement."Document No." := VacancyNo;
                VacancyRequirement.Insert;
                LineNo += 1;
            until RecruitmentReqRequirement.Next = 0;
        end;

        //Responsibilities

        RecruitmentReqResponsibility1.Reset;
        if RecruitmentReqResponsibility1.FindLast then begin
            LineNo := RecruitmentReqResponsibility1."Line No.";
        end;
        RecruitmentReqResponsibility.Reset;
        RecruitmentReqResponsibility.SetRange("Document No.", RequisitionHeader."Document No.");
        if RecruitmentReqResponsibility.FindSet then begin
            repeat
                //get last no

                VacancyResponsibility.TransferFields(RecruitmentReqResponsibility);
                VacancyResponsibility."Line No." := LineNo + 1;
                VacancyResponsibility."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyResponsibility."Document No." := VacancyNo;
                VacancyResponsibility.Insert;
                LineNo += 1;
            until RecruitmentReqResponsibility.Next = 0;
        end;


        // Copy position benefits
        ScaleBenefits.Reset();
        ScaleBenefits.SetRange("Document No", RequisitionHeader."Document No.");
        if ScaleBenefits.FindSet() then begin
            repeat
                RecruitmentSalaryBenefits."Document No" := VacancyNo;
                RecruitmentSalaryBenefits."Salary Scale" := ScaleBenefits."Salary Scale";
                RecruitmentSalaryBenefits."Salary Pointer" := ScaleBenefits."Salary Pointer";
                RecruitmentSalaryBenefits."ED Code" := ScaleBenefits."ED Code";
                RecruitmentSalaryBenefits.Amount := ScaleBenefits.Amount;
                RecruitmentSalaryBenefits."ED Description" := ScaleBenefits."ED Description";
                RecruitmentSalaryBenefits."G/L Account" := ScaleBenefits."G/L Account";
                RecruitmentSalaryBenefits."Basic Salary" := ScaleBenefits."Basic Salary";
                RecruitmentSalaryBenefits."Percentage" := ScaleBenefits."Percentage";
                RecruitmentSalaryBenefits."Based On" := ScaleBenefits."Based On";
                RecruitmentSalaryBenefits.insert(true);
            until ScaleBenefits.Next() = 0;

        end;




        //work conditions

        RecruitmentReqWorkCondition1.Reset;
        if RecruitmentReqWorkCondition1.FindLast then begin
            LineNo := RecruitmentReqWorkCondition1."Line No";
        end;
        RecruitmentReqWorkCondition.Reset;
        RecruitmentReqWorkCondition.SetRange("Document No", RequisitionHeader."Document No.");
        if RecruitmentReqWorkCondition.FindSet then begin
            repeat
                //get last no

                VacancyWorkCondition.TransferFields(RecruitmentReqWorkCondition);
                VacancyWorkCondition."Line No" := LineNo + 1;
                VacancyWorkCondition."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyWorkCondition."Document No" := VacancyNo;
                VacancyWorkCondition.Insert;
                LineNo += 1;
            until RecruitmentReqWorkCondition.Next = 0;
        end;

        RequisitionHeader."Vacancy Created" := true;
        RequisitionHeader.Modify;
        Message('Vacancy %1,has been created successfully', VacancyNo);
    end;

    procedure AdvertiseVacancy(Announcement: Record "Vacancy Announcement")
    var
        Vacancy: Record "Recruitment Requisition Header";
        AnnouncementHeader: Record "Vacancy Announcement";
        AnnouncementLine: Record "Vacancy Announcement Line";
        AnnouncementPosting: Record "Vacancy Announcement Posting";
        LineNo: Integer;
    begin
        AnnouncementLine.Reset;
        AnnouncementLine.SetRange("Announcement No.", Announcement."Announcement No.");
        if AnnouncementLine.FindSet then begin
            repeat
                //advertise no
                Vacancy.Reset;
                Vacancy.SetRange("Document No.", AnnouncementLine."Vacancy ID");
                if Vacancy.FindFirst then begin
                    Vacancy.Published := true;
                    Vacancy."Date Published" := Today;
                    Vacancy."Application Closing Date" := Announcement."Application Closing Date";
                    Vacancy."Application Closing Time" := Announcement."Application Closing  Time";
                    Vacancy."Vacancy Status" := Vacancy."vacancy status"::Published;
                    Vacancy.Modify(true);
                end
            until
          AnnouncementLine.Next = 0;
            Message('The vacancies on this document have been advertised successfully');

        end
    end;

    procedure ShortlistBasedOnMandatory(JobApplications: Record "Job Applications")
    var
        JobApplicationRequirements: Record "Job Application Requirements";
        ApplicationRequirements: Record "Job Application Requirements";
        PassedMandatory: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
    begin
        ApplicationRequirements.Reset;
        ApplicationRequirements.SetRange("Application No.", JobApplications."Application No.");
        ApplicationRequirements.SetRange("Requirement Type", ApplicationRequirements."requirement type"::Mandatory);
        if ApplicationRequirements.FindSet then begin
            repeat
                if ApplicationRequirements."Candidates Response" = ApplicationRequirements."candidates response"::"Meets Criterion" then
                    Passed := true
                else
                    Passed := false;
            until ApplicationRequirements.Next = 0;
            if Passed = true
              then begin
                JobApplications."Application Status" := JobApplications."application status"::"System Shortlisting";
                JobApplications.Modify;
            end;
        end
    end;

    procedure ShortlistBasedOnDefinedParameters(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
    begin
        JobApplications.Reset;
        //JobApplications.SETRANGE("Application Status",JobApplications."Application Status"::"System Shortlisting");
        JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                //academic

                if SelectionHeader."Minimum Academic Qualification" <> '' then begin
                    Qualification.Reset;
                    Qualification.SetRange(Code, SelectionHeader."Minimum Academic Qualification");
                    if Qualification.FindSet then begin
                        //get the hierarchy code
                        HierarchyCode := Qualification."Academic Hierachy Code";
                        JobApplications.TestField("Highest Academic Qualification");
                        Qualification1.Reset;
                        Qualification1.SetRange(Code, JobApplications."Highest Academic Qualification");
                        if Qualification1.FindSet then begin
                            if Qualification1."Academic Hierachy Code" < HierarchyCode then begin
                                Passed := false;
                                //insert on academic table
                                CreateFailedApplicantAcc(JobApplications, SelectionHeader);
                            end
                            else
                                Passed := true
                        end
                    end;
                end;

                //General experience
                if Passed = true then begin
                    if SelectionHeader."Minimum Work Experience" <> 0 then begin
                        if JobApplications."Work Experience (Years)" < SelectionHeader."Minimum Work Experience" then begin
                            Passed := false;
                            CreateFailedApplicantGen(JobApplications, SelectionHeader);
                        end
                        else
                            Passed := true
                    end;
                end;
                //Management experience
                if Passed = true then begin
                    if SelectionHeader."Minimum Mngmnt Experience" <> 0 then begin
                        //check if appplication meets
                        if JobApplications."Management Experience (Years)" < SelectionHeader."Minimum Mngmnt Experience" then begin
                            Passed := false;

                            CreateFailedApplicantMgmnt(JobApplications, SelectionHeader);
                        end
                        else
                            Passed := true
                    end;
                end;
                if Passed = true then begin
                    //insert in selection line

                    SelectionLine.Reset;
                    SelectionLine.SetRange("Document No", SelectionHeader."Document No.");
                    if SelectionLine.FindSet then begin
                        SelectionLine.DeleteAll;
                    end;
                    //        JobApplications.RESET;
                    //        JobApplications.SETRANGE("Application No.",JobApplications."Application No.");
                    //        IF JobApplications.FINDSET THEN BEGIN
                    //          REPEAT
                    SelectionLine.Init;
                    SelectionLine."Document Type" := SelectionLine."document type"::"Candidate Shortlisting";
                    SelectionLine."Document No" := SelectionHeader."Document No.";
                    SelectionLine."Application No." := JobApplications."Application No.";
                    SelectionLine.Validate("Application No.");
                    SelectionLine.Insert(true);
                    //UNTIL JobApplications.NEXT=0;
                end;
            //END;
            until JobApplications.Next = 0;
        end
    end;

    procedure FnShortlistBasedOnDefinedParameters2(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        JobApplications2: Record "Job Applications";
        JobApplications3: Record "Job Applications";
        JobApplications4: Record "Job Applications";
    begin
        JobApplications.Reset;
        //JobApplications.SETRANGE("Application Status",JobApplications."Application Status"::"System Shortlisting");
        JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                if SelectionHeader."Minimum Academic Qualification" <> '' then begin
                    repeat
                        Qualification.Reset;
                        Qualification.SetRange(Code, JobApplications."Highest Academic Qualification");
                        if Qualification.FindSet then begin
                            repeat
                                HierarchyCode := Qualification."Academic Hierachy Code";
                                if HierarchyCode >= SelectionHeader."Min Academic Hierarchy Pointer" then begin //Academics
                                    if SelectionHeader."Minimum Work Experience" <> 0 then begin //work Experinece
                                                                                                 // MESSAGE('this %1',JobApplications."Application No.");
                                        if JobApplications."Work Experience (Years)" >= SelectionHeader."Minimum Work Experience" then begin
                                            if SelectionHeader."Minimum Mngmnt Experience" <> 0 then begin   //mgt Work Experince
                                                if JobApplications."Management Experience (Years)" >= SelectionHeader."Minimum Mngmnt Experience" then begin
                                                    JobApplications2.Reset;
                                                    JobApplications2.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
                                                    JobApplications2.SetFilter("Management Experience (Years)", '>=%1', SelectionHeader."Minimum Mngmnt Experience");
                                                    if JobApplications2.FindSet then begin
                                                        repeat
                                                            SelectionLine.Init;
                                                            SelectionLine."Document Type" := SelectionLine."document type"::"Candidate Shortlisting";
                                                            SelectionLine."Document No" := SelectionHeader."Document No.";
                                                            SelectionLine."Application No." := JobApplications2."Application No.";
                                                            SelectionLine.Validate("Application No.");
                                                            SelectionLine.Insert(true);
                                                        until JobApplications2.Next = 0;
                                                        Message('Successfully%1', JobApplications2."Application No.");
                                                    end
                                                end else begin
                                                    JobApplications3.Reset;
                                                    JobApplications3.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
                                                    JobApplications3.SetFilter("Management Experience (Years)", '<%1', SelectionHeader."Minimum Mngmnt Experience");
                                                    if JobApplications.FindSet then begin
                                                        // MESSAGE('manag %1',JobApplications3."Application No.");
                                                        CreateFailedApplicantMgmnt(JobApplications, SelectionHeader);
                                                    end;
                                                end;
                                            end else begin
                                            end;//if blank
                                        end else begin
                                            //  MESSAGE('Work %1',JobApplications."Application No.");
                                            CreateFailedApplicantGen(JobApplications, SelectionHeader);
                                        end;
                                    end else begin
                                        //MESSAGE('Work %1',JobApplications."Application No.");
                                    end;//if blank
                                end else begin
                                    // MESSAGE('edu %1',JobApplications."Application No.");
                                    CreateFailedApplicantAcc(JobApplications, SelectionHeader);
                                end;
                            until Qualification.Next = 0;
                        end;
                    until JobApplications.Next = 0;
                end else begin
                    //MESSAGE('management %1',JobApplications."Application No.");
                end;//if blank
            until JobApplications.Next = 0;
        end;
    end;

    procedure FnShortlistBasedOnDefinedParameters3(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
    begin
        JobApplications.Reset;
        //JobApplications.SETRANGE("Application Status",JobApplications."Application Status"::"System Shortlisting");
        JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                if SelectionHeader."Minimum Academic Qualification" <> '' then begin
                    repeat
                        Qualification.Reset;
                        Qualification.SetRange(Code, JobApplications."Highest Academic Qualification");
                        if Qualification.FindSet then begin
                            HierarchyCode := Qualification."Academic Hierachy Code";
                            if HierarchyCode >= SelectionHeader."Min Academic Hierarchy Pointer" then begin //Academics
                                if SelectionHeader."Minimum Work Experience" <> 0 then begin //work Experinece
                                    repeat
                                        Message('this %1', JobApplications."Application No.");
                                        JobApplications.Reset;
                                        JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
                                        JobApplications.SetFilter("Work Experience (Years)", '>=%1', SelectionHeader."Minimum Work Experience");
                                        if JobApplications.FindSet then begin
                                            if SelectionHeader."Minimum Mngmnt Experience" <> 0 then begin   //mgt Work Experince
                                                repeat
                                                    JobApplications.Reset;
                                                    JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
                                                    JobApplications.SetFilter("Management Experience (Years)", '>=%1', SelectionHeader."Minimum Mngmnt Experience");
                                                    if JobApplications.FindSet then begin
                                                        repeat
                                                            SelectionLine.Init;
                                                            SelectionLine."Document Type" := SelectionLine."document type"::"Candidate Shortlisting";
                                                            SelectionLine."Document No" := SelectionHeader."Document No.";
                                                            SelectionLine."Application No." := JobApplications."Application No.";
                                                            SelectionLine.Validate("Application No.");
                                                            SelectionLine.Insert(true);
                                                        until JobApplications.Next = 0;
                                                        Message('Successfully');
                                                    end else begin
                                                        repeat
                                                            Message('manag %1', JobApplications."Application No.");
                                                            CreateFailedApplicantMgmnt(JobApplications, SelectionHeader);
                                                        until JobApplications.Next = 0;
                                                    end;
                                                until JobApplications.Next = 0;
                                            end else begin
                                                // MESSAGE('management %1',JobApplications."Application No.");
                                            end;//if blank
                                        end else begin
                                            Message('Work %1', JobApplications."Application No.");
                                            CreateFailedApplicantGen(JobApplications, SelectionHeader);
                                        end;
                                    until JobApplications.Next = 0;
                                end else begin
                                    //MESSAGE('Work %1',JobApplications."Application No.");
                                end;//if blank
                            end else begin
                                Message('edu %1', JobApplications."Application No.");
                                CreateFailedApplicantAcc(JobApplications, SelectionHeader);
                            end;
                            //UNTIL Qualification.NEXT=0;
                        end;
                    until JobApplications.Next = 0;
                end else begin
                    //MESSAGE('management %1',JobApplications."Application No.");
                end;//if blank
            until JobApplications.Next = 0;
        end;
    end;

    local procedure CreateFailedApplicantAcc(JobApplication: Record "Job Applications"; SelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistFailed: Record "Shortlist Failed Academic";
        LineNo: Integer;
        TXT001: label 'Details Updated Succesfully';
    begin
        ShortlistFailed.Init;
        ShortlistFailed."Document Type" := ShortlistFailed."document type"::"Candidate Shortlisting";
        ShortlistFailed."Entry No" := ShortlistFailed."Entry No" + 100;
        ShortlistFailed."Document No." := SelectionHeader."Document No.";
        ShortlistFailed."Application No." := JobApplication."Application No.";
        ShortlistFailed.Validate("Application No.");
        ShortlistFailed.Validate("Highest Academic Qualification");
        ShortlistFailed.Insert(true);
    end;

    local procedure CreateFailedApplicantGen(JobApplication: Record "Job Applications"; SelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistFailed: Record "Shortlist Failed General";
        LineNo: Integer;
        TXT001: label 'Details Updated Succesfully';
    begin
        ShortlistFailed.Init;
        ShortlistFailed."Document Type" := ShortlistFailed."document type"::"Candidate Shortlisting";
        ShortlistFailed."Entry No" := ShortlistFailed."Entry No" + 100;
        ShortlistFailed."Document No." := SelectionHeader."Document No.";
        ShortlistFailed."Application No." := JobApplication."Application No.";
        ShortlistFailed.Validate("Application No.");
        ShortlistFailed.Validate("Highest Academic Qualification");
        ShortlistFailed.Insert(true);
    end;

    local procedure CreateFailedApplicantMgmnt(JobApplication: Record "Job Applications"; SelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistFailed: Record "Shortlist Failed Management";
        TXT001: label 'Details Updated Succesfully';
    begin
        ShortlistFailed.Init;
        ShortlistFailed."Document Type" := ShortlistFailed."document type"::"Candidate Shortlisting";
        ShortlistFailed."Entry No" := ShortlistFailed."Entry No" + 100;
        ShortlistFailed."Document No." := SelectionHeader."Document No.";
        ShortlistFailed."Application No." := JobApplication."Application No.";
        ShortlistFailed.Validate("Application No.");
        ShortlistFailed.Validate("Highest Academic Qualification");
        ShortlistFailed.Insert(true);
    end;

    procedure NotifyAtendees(VacancyAnnouncement: Record "Vacancy Announcement")
    var
        FairAttendance: Record "Career Fair Attendance";
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        AnnouncementLine: Record "Vacancy Announcement Line";
        Counter: Integer;
    begin
        FairAttendance.Reset;
        FairAttendance.SetRange("Career Fair ID", VacancyAnnouncement."Announcement No.");
        if FairAttendance.FindSet then begin
            repeat
                //notify attendees
                SMTPMailSetup.Get;
                Body := 'Invitation for response of job Applications will commence from' + Format(Today) + ' ' + 'to' + ' ' + Format(VacancyAnnouncement."Application Closing Date");
                Email := SMTPMailSetup."Email Address";
                Email2 := FairAttendance."Representative Email";
                //SMTP.Create('INVITATION FOR JOB APPLICATIONS', Email2,
                // Email, 'Applications ' + 'No: ' + VacancyAnnouncement."Announcement No.", '<u>RE:INFORMATION ON OPEN POSITIONS</u><BR><BR>' +
                //        'Dear candidate-' + FairAttendance."Representative Name" + ',<BR><BR>' +
                //         ' Kindly login to the portal and start the job application process if interested:<br>Use the following link to acess the system.' + ' ' + '<b><a href="https://kemri.co.ke">' + VacancyAnnouncement."Agency Name" + '</a></b><BR>', true);
                // //SMTP.AppendToBody('The open positions are:<BR>');

                AnnouncementLine.Reset;
                AnnouncementLine.SetRange("Announcement No.", VacancyAnnouncement."Announcement No.");
                if AnnouncementLine.FindSet then begin
                    repeat
                        Counter := Counter + 1;
                    //SMTP.AppendToBody(Format(Counter) + '.' + AnnouncementLine."Job Title/Designation" + '<BR>');
                    until AnnouncementLine.Next = 0;
                end;

            //SMTP.AppendToBody('Thank you for the continued support.<BR>');
            //SMTP.AddCC(Email2);
            //SMTP.AppendToBody('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            //SMTP.Send();

            until FairAttendance.Next = 0;
            FairAttendance."Notified on Email" := true;
            FairAttendance.Modify(true);
        end
    end;

    procedure NotifyPhoneInterviewApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        FairAttendance: Record "PreScreening Line";
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        FairAttendance.Reset;
        FairAttendance.SetRange("Document No.", PreScreenHeader."Document No.");
        if FairAttendance.FindSet then begin
            repeat
                //notify attendees
                SMTPMailSetup.Get;
                Email := SMTPMailSetup."Email Address";
                Email2 := FairAttendance.Email;
            //SMTP.Create(Email2, Email2,
            // Email, 'Application' + 'No: ' + FairAttendance."Application No.", '<u>RE:INVITATION FOR A PHONE INTERVIEW</u><BR><BR>' +
            //        'Dear' + FairAttendance."First Name" + ',<BR><BR>' +
            //         ' You are hereby notified that a phone interview has been scheduled in line with the application for the vacancy:' +
            //         ' ' + PreScreenHeader."Job Title/Designation" + '<br>The following are the details for the interview:<BR>' +
            //         ' ' + 'Date:' + ' ' + Format(FairAttendance."Test Start Time") + '<BR>+Duration:' + ' ' + Format(FairAttendance."Test Start Time") + ' ' + 'to' + ' ' + Format(FairAttendance."Test End Time"), true);
            //SMTP.AppendToBody('Thank you for the continued support.<BR>');
            //SMTP.AddCC(Email2);
            //SMTP.AppendToBody('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            //SMTP.Send();

            until FairAttendance.Next = 0;
            FairAttendance.Notified := true;
            FairAttendance."DateTime Notified" := CurrentDatetime;
            FairAttendance.Modify(true);
        end
    end;

    procedure SuggestPhoneInterviewApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        JobApplications: Record "Job Applications";
        PreScreeningLine1: Record "PreScreening Line";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested for the Vacancy %1';
        TXT002: label 'There are no job applicants found for the Vacancy %1';
    begin
        PreScreeningLine1.Reset;
        PreScreeningLine1.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine1.FindSet then
            PreScreeningLine1.DeleteAll;
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", PreScreenHeader."Vacancy ID");
        if JobApplications.FindSet then begin

            repeat
                //INSEERT
                PreScreeningLine.Init;
                PreScreeningLine."Document No." := PreScreenHeader."Document No.";
                PreScreeningLine."Document Type" := PreScreenHeader."Document Type";
                PreScreeningLine."Vacancy ID" := PreScreenHeader."Vacancy ID";
                PreScreeningLine."Application No." := JobApplications."Application No.";
                PreScreeningLine.Validate("Application No.");
                PreScreeningLine.Insert;
            until JobApplications.Next = 0;
            Message(TXT001, PreScreenHeader."Vacancy ID");
        end else begin
            Message(TXT002, PreScreenHeader."Vacancy ID");
        end
    end;

    procedure PostPhoneApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        RecruitmentLedger: Record "Recruitment Selection Ledger";
        LineNo: Integer;
        RecruitmentLedger1: Record "Recruitment Selection Ledger";
        TXT001: label 'The phone Interview report %1  has been posted succesfully';
    begin
        RecruitmentLedger1.Reset;
        if RecruitmentLedger1.FindLast then
            LineNo := RecruitmentLedger1."Entry No.";

        //INSERT TO LEDGER
        PreScreeningLine.Reset;
        PreScreeningLine.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine.FindSet then begin
            repeat
                RecruitmentLedger."Entry No." := LineNo + 1;
                RecruitmentLedger."Application No." := PreScreeningLine."Application No.";
                RecruitmentLedger.Validate("Application No.");
                RecruitmentLedger.Insert;
                LineNo += 1;
            until PreScreeningLine.Next = 0;
            Message(TXT001, PreScreenHeader."Document No.")
        end
    end;

    procedure NotifyAbilityTestApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        FairAttendance: Record "PreScreening Line";
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        FairAttendance.Reset;
        FairAttendance.SetRange("Document No.", PreScreenHeader."Document No.");
        if FairAttendance.FindSet then begin
            repeat
                //notify attendees
                SMTPMailSetup.Get;
                Email := SMTPMailSetup."Email Address";
                Email2 := FairAttendance.Email;
            //SMTP.Create(Email2, Email2,
            //     Email, 'Application' + 'No: ' + FairAttendance."Application No.", '<u>RE:INVITATION FOR A PHONE INTERVIEW</u><BR><BR>' +
            //            'Dear' + FairAttendance."First Name" + ',<BR><BR>' +
            //             ' You are hereby notified that a phone interview has been scheduled in line with the application for the vacancy:' +
            //             ' ' + PreScreenHeader."Job Title/Designation" + '<br>The following are the details for the interview:<BR>' +
            //             ' ' + 'Date:' + ' ' + Format(FairAttendance."Test Start Time") + '<BR>+Duration:' + ' ' + Format(FairAttendance."Test Start Time") + ' ' + 'to' + ' ' + Format(FairAttendance."Test End Time"), true);
            // //SMTP.AppendToBody('Thank you for the continued support.<BR>');
            //SMTP.AddCC(Email2);
            //SMTP.AppendToBody('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            //SMTP.Send();

            until FairAttendance.Next = 0;
            FairAttendance.Notified := true;
            FairAttendance."DateTime Notified" := CurrentDatetime;
            FairAttendance.Modify(true);
        end
    end;

    procedure SuggestAbilityTestApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        JobApplications: Record "Job Applications";
        PreScreeningLine1: Record "PreScreening Line";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested for the Vacancy %1';
        TXT002: label 'There are no job applicants found for the Vacancy %1';
    begin
        PreScreeningLine1.Reset;
        PreScreeningLine1.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine1.FindSet then
            PreScreeningLine1.DeleteAll;
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", PreScreenHeader."Vacancy ID");
        if JobApplications.FindSet then begin

            repeat
                //INSEERT
                PreScreeningLine.Init;
                PreScreeningLine."Document No." := PreScreenHeader."Document No.";
                PreScreeningLine."Document Type" := PreScreeningLine."document type"::"Ability Test Invitation";
                PreScreeningLine."Vacancy ID" := PreScreenHeader."Vacancy ID";
                PreScreeningLine."Application No." := JobApplications."Application No.";
                PreScreeningLine.Validate("Application No.");
                PreScreeningLine.Insert;
            until JobApplications.Next = 0;
            Message(TXT001, PreScreenHeader."Vacancy ID");
        end else begin
            Message(TXT002, PreScreenHeader."Vacancy ID");
        end
    end;

    procedure PostAbilityTestApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        RecruitmentLedger: Record "Recruitment Selection Ledger";
        LineNo: Integer;
        RecruitmentLedger1: Record "Recruitment Selection Ledger";
        TXT001: label 'The phone Interview report %1  has been posted succesfully';
    begin
        RecruitmentLedger1.Reset;
        if RecruitmentLedger1.FindLast then
            LineNo := RecruitmentLedger1."Entry No.";

        //INSERT TO LEDGER
        PreScreeningLine.Reset;
        PreScreeningLine.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine.FindSet then begin
            repeat
                RecruitmentLedger."Entry No." := LineNo + 1;
                RecruitmentLedger."Application No." := PreScreeningLine."Application No.";
                RecruitmentLedger.Validate("Application No.");
                RecruitmentLedger.Insert;
                LineNo += 1;
            until PreScreeningLine.Next = 0;
            Message(TXT001, PreScreenHeader."Document No.")
        end
    end;

    procedure SuggestShortlistCriteria(CandidateSelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistScoring: Record "Candidate Shortlist Scoring";
        ShortlistScoreGuide: Record "Candidate Shortlist Score Guid";
        LineNo: Integer;
        RecruitmentRequisition: Record "Recruitment Req Requirement";
        CandidateShortlistCriteria: Record "Candidate Shortlist Criteria";
        ShortlistingScoreCode: Record "Shortlisting Score Code";
    begin
        RecruitmentRequisition.Reset;
        RecruitmentRequisition.SetRange("Document Type", RecruitmentRequisition."document type"::"Job Vacancy");
        RecruitmentRequisition.SetRange("Document No.", CandidateSelectionHeader."Vacancy ID");
        if RecruitmentRequisition.FindSet then begin
            repeat
                //insert
                ShortlistScoreGuide.Reset;
                ShortlistScoreGuide.SetRange("Document No.", CandidateSelectionHeader."Document No.");
                if ShortlistScoreGuide.FindSet then
                    ShortlistScoreGuide.DeleteAll;

                //insert
                CandidateShortlistCriteria.Reset;
                CandidateShortlistCriteria.SetRange("Document No.", CandidateSelectionHeader."Document No.");
                if CandidateShortlistCriteria.FindSet then
                    CandidateShortlistCriteria.DeleteAll;

                CandidateShortlistCriteria."Document Type" := CandidateShortlistCriteria."document type"::"Candidate Shortlisting";
                CandidateShortlistCriteria."Document No." := CandidateSelectionHeader."Document No.";
                CandidateShortlistCriteria."Requirement Type" := RecruitmentRequisition."Requirement Type";
                CandidateShortlistCriteria."Requiement ID." := RecruitmentRequisition."Requirement ID";
                CandidateShortlistCriteria."Qualification Code" := RecruitmentRequisition."Qualification Code";
                CandidateShortlistCriteria."Qualification Category" := RecruitmentRequisition."Qualification Category";
                CandidateShortlistCriteria.Description := RecruitmentRequisition.Description;
                CandidateShortlistCriteria.Insert;

                //update weights
                ShortlistingScoreCode.Reset;
                if ShortlistingScoreCode.FindSet then begin
                    repeat
                        ShortlistScoreGuide.Init;
                        ShortlistScoreGuide."Document Type" := ShortlistScoreGuide."document type"::"Candidate Shortlisting";
                        ShortlistScoreGuide."Document No." := CandidateSelectionHeader."Document No.";
                        ShortlistScoreGuide."Requirement ID" := RecruitmentRequisition."Requirement ID";
                        ShortlistScoreGuide."Score Code" := ShortlistingScoreCode.Code;
                        ShortlistScoreGuide."Requirement Name" := RecruitmentRequisition.Description;
                        ShortlistScoreGuide.Validate("Score Code");
                        ShortlistScoreGuide.Insert;
                    until ShortlistingScoreCode.Next = 0
                end;
            until RecruitmentRequisition.Next = 0;
        end
    end;

    procedure CreateInterviewInvitation(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        CandidateShortlistMatrix2: Record "Candidate Shortlist Matrix";
        CandidateShortlistMatrix3: Record "Candidate Shortlist Matrix";
        ShortlistMatrix: Record "Candidate Interview Line";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        CandidateSelectionCommittee: Record "Candidate Selection Committee";
        CandidateSelectionCommittee2: Record "Candidate Selection Committee";
        JobApplications: Record "Job Applications";
    begin
        CandidateShortlistMatrix2.Reset;
        CandidateShortlistMatrix2.SetRange("Document No", SelectionHeader."Document No.");
        CandidateShortlistMatrix2.SetRange("Shortlisting Outcome", CandidateShortlistMatrix2."shortlisting outcome"::" ");
        CandidateShortlistMatrix2.setfilter("Application No.", '<>%1', '');
        if CandidateShortlistMatrix2.FindFirst() then begin
            ERROR('ERROR!, THERE IS AN APPLICATION ON THE LIST WITHOUT SHORTLISTING OUTCOME');
        end;


        CandidateShortlistMatrix3.Reset;
        CandidateShortlistMatrix3.SetRange("Document No", SelectionHeader."Document No.");
        if CandidateShortlistMatrix3.FindFirst() then begin
            repeat
                JobApplications.Reset();
                JobApplications.SetRange("Application No.", CandidateShortlistMatrix3."Application No.");
                if JobApplications.FindSet() then begin
                    JobApplications."Shorlisting Document No." := CandidateShortlistMatrix3."Shorlisting Document No.";
                    JobApplications."Committee Remarks" := CandidateShortlistMatrix3."Committee Remarks";
                    JobApplications."Shortlisting Outcome" := CandidateShortlistMatrix3."Shortlisting Outcome";
                    JobApplications.modify(true);

                end;
            until CandidateShortlistMatrix3.Next() = 0;
        end;


        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document No.", SelectionHeader."Document No.");
        if SelectionHeader.FindSet then
            CandidateSelection.Init;
        CandidateSelection."Document Type" := CandidateSelection."document type"::"Interview Invitation";
        HRSetup.Get;
        // HRSetup.TestField("Interview Invitation Nos.");
        // NoSeriesMgt.InitSeries(HRSetup."Interview Invitation Nos.", HRSetup."Interview Invitation Nos.", 0D, DocumentNo, HRSetup."Interview Invitation Nos.");
        CandidateSelection."Document No." := DocumentNo;
        CandidateSelection."Document Type" := CandidateSelection."document type"::"Interview Invitation";
        CandidateSelection.Description := 'Interview invitation for Vacancy No:' + SelectionHeader."Vacancy ID";
        CandidateSelection."Vacancy ID" := SelectionHeader."Vacancy ID";
        //CandidateSelection.
        CandidateSelection."Created By" := UserId;
        CandidateSelection."Document Date" := Today;
        CandidateSelection."Source Type" := CandidateSelection."document type"::"Interview Invitation";
        CandidateSelection."Source Document No." := SelectionHeader."Document No.";
        CandidateSelection."Appointed Selection Comm ID" := SelectionHeader."Appointed Selection Comm ID";
        CandidateSelection."Selection Committee Chair" := SelectionHeader."Selection Committee Chair";
        CandidateSelection."Position ID" := SelectionHeader."Position ID";
        CandidateSelection."Job Title" := SelectionHeader."Job Title";
        CandidateSelection."No. of openings" := SelectionHeader."No. of openings";
        CandidateSelection.Directorate := SelectionHeader.Directorate;
        CandidateSelection.Department := SelectionHeader.Department;
        CandidateSelection.Region := SelectionHeader.Region;
        CandidateSelection."Seniority Level" := SelectionHeader."Seniority Level";
        CandidateSelection."Default Terms of Service Code" := SelectionHeader."Default Terms of Service Code";
        CandidateSelection."Employment Type" := SelectionHeader."Employment Type";
        CandidateSelection."Application Closing Date" := SelectionHeader."Application Closing Date";
        CandidateSelection."Application Closing Time" := SelectionHeader."Application Closing Time";
        CandidateSelection."Created On" := CurrentDatetime;
        if CandidateSelection.Insert = true then begin
            CandidateShortlistMatrix.Reset;
            CandidateShortlistMatrix.SetRange("Document No", SelectionHeader."Document No.");
            CandidateShortlistMatrix.SetRange("Shortlisting Outcome", CandidateShortlistMatrix."shortlisting outcome"::"Invite for First Interview");
            if CandidateShortlistMatrix.FindSet then begin
                repeat

                    ShortlistMatrix.Init;
                    //ShortlistMatrix.TRANSFERFIELDS(CandidateShortlistMatrix);
                    ShortlistMatrix."Document Type" := ShortlistMatrix."document type"::"Interview Invitation";
                    ShortlistMatrix."Document No." := CandidateSelection."Document No.";
                    ShortlistMatrix."Vacancy ID" := CandidateShortlistMatrix."Vacancy ID";
                    ShortlistMatrix."Application No." := CandidateShortlistMatrix."Application No.";
                    ShortlistMatrix."Candidate No." := CandidateShortlistMatrix."Candidate No";
                    ShortlistMatrix."First Name" := CandidateShortlistMatrix."First Name";
                    ShortlistMatrix."Middle Name" := CandidateShortlistMatrix."Middle Name";
                    ShortlistMatrix."Last Name" := CandidateShortlistMatrix."Last Name";
                    ShortlistMatrix."Phone No." := CandidateShortlistMatrix."Phone No.";
                    ShortlistMatrix."Mobile Phone No." := CandidateShortlistMatrix."Mobile Phone No.";
                    ShortlistMatrix.Email := CandidateShortlistMatrix.Email;
                    ShortlistMatrix."Birth Date" := CandidateShortlistMatrix."Birth Date";
                    ShortlistMatrix."Management Experience Yrs" := CandidateShortlistMatrix."Management Experience (Years)";
                    ShortlistMatrix."General Work Experience Yrs" := CandidateShortlistMatrix."Work Experience (Years)";
                    ShortlistMatrix.Gender := CandidateShortlistMatrix.Gender;
                    ShortlistMatrix."Passport No." := CandidateShortlistMatrix."Passport No.";
                    ShortlistMatrix."Tax Registration(PIN)" := CandidateShortlistMatrix."Tax Registration No.";
                    ShortlistMatrix."ID Number" := CandidateShortlistMatrix."ID Number";
                    ShortlistMatrix."Marital Status" := CandidateShortlistMatrix."Marital Status";
                    ShortlistMatrix."Ethnic Group" := CandidateShortlistMatrix."Ethnic Group";
                    ShortlistMatrix.Religion := CandidateShortlistMatrix.Religion;
                    ShortlistMatrix.Disabled := CandidateShortlistMatrix.Disabled;
                    ShortlistMatrix."Disability Code" := CandidateShortlistMatrix."Disability Code";
                    ShortlistMatrix."Disability Description" := CandidateShortlistMatrix."Disability Description";
                    ShortlistMatrix."Disability Cert No." := CandidateShortlistMatrix."Disability Certificate No";
                    ShortlistMatrix."Specialization Area" := CandidateShortlistMatrix."Specialization Area";
                    ShortlistMatrix."Candidate Shortlist Voucher" := SelectionHeader."Document No.";
                    ShortlistMatrix.Nationality := CandidateShortlistMatrix.Nationality;
                    ShortlistMatrix."Academic Qualification Name" := CandidateShortlistMatrix."Qualification Name";
                    ShortlistMatrix."Highest Academic Qualification" := CandidateShortlistMatrix."Highest Academic Qualification";
                    //ShortlistMatrix."Document No.":=DocumentNo;
                    //ShortlistMatrix."Document Type":=ShortlistMatrix."Document Type"::"Candidate Shortlisting";
                    ShortlistMatrix.Insert(true);
                until CandidateShortlistMatrix.Next = 0;
            end;
            CandidateSelectionCommittee.Reset;
            CandidateSelectionCommittee.SetRange("Document No.", SelectionHeader."Document No.");
            if CandidateSelectionCommittee.FindSet then begin
                repeat
                    CandidateSelectionCommittee2.Init;
                    CandidateSelectionCommittee2."Document No." := CandidateSelection."Document No.";
                    CandidateSelectionCommittee2."Document Type" := CandidateSelectionCommittee2."document type"::"Formal Interview Invitation";
                    CandidateSelectionCommittee2."Appointed Committee ID" := CandidateSelectionCommittee."Appointed Committee ID";
                    CandidateSelectionCommittee2."Member No." := CandidateSelectionCommittee."Member No.";
                    CandidateSelectionCommittee2.Role := CandidateSelectionCommittee.Role;
                    CandidateSelectionCommittee2.Name := CandidateSelectionCommittee.Name;
                    CandidateSelectionCommittee2.Email := CandidateSelectionCommittee.Email;
                    CandidateSelectionCommittee2."Phone No." := CandidateSelectionCommittee."Phone No.";
                    CandidateSelectionCommittee2.Designation := CandidateSelectionCommittee.Designation;
                    CandidateSelectionCommittee2."Staff No." := CandidateSelectionCommittee."Staff No.";
                    CandidateSelectionCommittee2.Insert(true);
                until CandidateSelectionCommittee.Next = 0;
            end;
            SelectionHeader.Posted := true;
            SelectionHeader."Interview Invitation No." := CandidateSelection."Document No.";
            SelectionHeader."Document Status" := SelectionHeader."Document Status"::Closed;
            SelectionHeader.Modify(true);

        end;
    end;

    procedure Postshortlistingind(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        CandidateShortlistMatrix2: Record "Candidate Shortlist Matrix";
        ShortlistMatrix: Record "Candidate Interview Line";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        CandidateSelectionCommittee: Record "Candidate Selection Committee";
        CandidateSelectionCommittee2: Record "Candidate Selection Committee";
    begin

        CandidateShortlistMatrix2.Reset;
        CandidateShortlistMatrix2.SetRange("Document No", SelectionHeader."Document No.");
        // CandidateShortlistMatrix2.SetRange("Vacancy ID", SelectionHeader."Vacancy ID");
        // CandidateShortlistMatrix2.SetRange("Shortlisting Outcome", CandidateShortlistMatrix2."Shortlisting Outcome"::" ");
        //  CandidateShortlistMatrix2.setfilter("Application No.", '=%1', '');
        if CandidateShortlistMatrix2.FindSet then begin
            repeat

                CandidateShortlistMatrix.Reset;
                CandidateShortlistMatrix.SetRange("Document No", SelectionHeader."Shorlisting Document No.");
                CandidateShortlistMatrix.SetRange("Vacancy ID", CandidateShortlistMatrix2."Vacancy ID");
                CandidateShortlistMatrix.SetRange("Application No.", CandidateShortlistMatrix2."Application No.");
                // CandidateShortlistMatrix.SetRange("document type", CandidateShortlistMatrix."document type"::"Candidate Shortlisting");
                if CandidateShortlistMatrix.FindSet then begin

                    CandidateShortlistMatrix."Shortlisting Outcome" := CandidateShortlistMatrix2."Shortlisting Outcome";
                    CandidateShortlistMatrix."Committee Remarks" := CandidateShortlistMatrix2."Committee Remarks";
                    CandidateShortlistMatrix."ind Shorlisting Document No." := SelectionHeader."Shorlisting Document No.";
                    CandidateShortlistMatrix.modify(true);

                end;
            until CandidateShortlistMatrix2.Next = 0;
            // end else begin
            //     ERROR('ERROR!, KINDLY ENSURE YOU HAVE DEFINED THE SHORTLISTING OUTCOME FOR EACH APPLICATION')
        end;
        SelectionHeader.Posted := true;
        SelectionHeader.Modify(true);


    end;

    procedure AutoassignShortlistcomm(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        noofapplicants: Integer;
        noofapplicantsAssigned: Integer;
        noofmembers: Integer;
        MaxAssignments: Integer;
        CandidateSelectionCommittee: Record "Candidate Selection Committee";

    begin



        CandidateShortlistMatrix.RESET;
        CandidateShortlistMatrix.SETRANGE("Document No", SelectionHeader."Document No.");
        CandidateShortlistMatrix.SETFILTER("Member No.", '=%1', '');
        //Noassigned
        if CandidateShortlistMatrix.FindSet() then begin
            repeat
                CandidateSelectionCommittee.RESET;
                CandidateSelectionCommittee.SETRANGE("Document No.", SelectionHeader."Document No.");
                CandidateSelectionCommittee.CalcFields(Noassigned);
                CandidateSelectionCommittee.SetCurrentKey(Noassigned);
                CandidateSelectionCommittee.SetAscending(Noassigned, true);
                if CandidateSelectionCommittee.FindFirst() then
                    CandidateShortlistMatrix."Member No." := CandidateSelectionCommittee."Member No.";
                CandidateShortlistMatrix."Member Name" := CandidateSelectionCommittee.Name;
                CandidateShortlistMatrix.Modify(true);


            until CandidateShortlistMatrix.NEXT = 0;
        end;
    end;

    procedure Autoassigninterviewcomm(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Interview Line";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        noofapplicants: Integer;
        noofapplicantsAssigned: Integer;
        noofmembers: Integer;
        MaxAssignments: Integer;
        CandidateSelectionCommittee: Record "Commitee Appointment Voucher";
        CandidateInterviewLine: Record "Candidate Interview Line";
        CommiteeAppointment: Record "Commitee Appointment Voucher";

    begin



        CandidateShortlistMatrix.RESET;
        CandidateShortlistMatrix.SETRANGE("Document No.", SelectionHeader."Document No.");
        CandidateShortlistMatrix.SETFILTER("Assigned Panel ID", '=%1', '');
        //Noassigned
        if CandidateShortlistMatrix.FindSet() then begin
            repeat
                CandidateSelectionCommittee.RESET;
                CandidateSelectionCommittee.SETRANGE("vacancy id", SelectionHeader."vacancy id");
                CandidateSelectionCommittee.CalcFields(Noassigned);
                CandidateSelectionCommittee.SetCurrentKey(Noassigned);
                CandidateSelectionCommittee.SetAscending(Noassigned, true);
                if CandidateSelectionCommittee.FindFirst() then
                    CandidateShortlistMatrix."Assigned Panel ID" := CandidateSelectionCommittee."Document No.";
                CandidateShortlistMatrix.Modify(true);


            until CandidateShortlistMatrix.NEXT = 0;
        end;
    end;



    procedure AutoassignShortlistcomm33(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        ShortlistMatrix: Record "Candidate Shortlist Matrix";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        noofapplicants: Integer;
        noofapplicantsAssigned: Integer;
        noofmembers: Integer;
        MaxAssignments: Integer;
        CandidateSelectionCommittee: Record "Candidate Selection Committee";

    begin
        // Initialize variables and records

        // Retrieve the total number of applicants
        ShortlistMatrix.Reset;
        ShortlistMatrix.SetRange("Document No", SelectionHeader."Document No.");
        if ShortlistMatrix.FindSet then
            noofapplicants := ShortlistMatrix.Count;
        Message('noofapplicants %1', noofapplicants);
        // Retrieve the total number of committee members
        CandidateSelectionCommittee.Reset;
        CandidateSelectionCommittee.Setfilter("Member No.", '<>%1', '');
        CandidateSelectionCommittee.SetRange("Document No.", SelectionHeader."Document No.");
        if CandidateSelectionCommittee.FindSet then
            noofmembers := CandidateSelectionCommittee.Count;
        Message('noofmembers %1', noofmembers);
        // Calculate the maximum assignments per member
        MaxAssignments := noofapplicants div noofmembers;
        Message('MaxAssignments %1', MaxAssignments);
        // Iterate through each committee member
        CandidateSelectionCommittee.Reset;
        CandidateSelectionCommittee.SetRange("Document No.", SelectionHeader."Document No.");
        if CandidateSelectionCommittee.FindSet then begin
            repeat
                // Retrieve the number of applications already assigned to the committee member
                CandidateShortlistMatrix.Reset;
                CandidateShortlistMatrix.SetRange("Document No", SelectionHeader."Document No.");
                CandidateShortlistMatrix.SetRange("Member No.", CandidateSelectionCommittee."Member No.");
                if CandidateShortlistMatrix.FindSet then begin
                    noofapplicantsAssigned := CandidateShortlistMatrix.Count;
                    Message('noofapplicantsAssigned %1', noofapplicantsAssigned);
                    // Check if the number of applications assigned is less than the maximum assignments
                    if noofapplicantsAssigned < MaxAssignments then begin
                        // Assign additional applications to the committee member
                        CandidateShortlistMatrix."Member No." := CandidateSelectionCommittee."Member No.";
                        CandidateShortlistMatrix."Member Name" := CandidateSelectionCommittee.Name;
                        CandidateShortlistMatrix.Modify(true);
                    end;
                end;
            until CandidateSelectionCommittee.Next = 0;
        end;

        // Mark the header as posted
        // SelectionHeader.Posted := true;
        // SelectionHeader."Interview Invitation No." := CandidateSelection."Document No.";
        // SelectionHeader.Modify(true);
    end;

    procedure AutoassignShortlistcomm2(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        ShortlistMatrix: Record "Candidate Shortlist Matrix";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        noofapplica: Integer;
        noofapplicaass: Integer;
        noofmembers: integer;
        Maxassign: integer;
        CandidateSelectionCommittee: Record "Candidate Selection Committee";
        CandidateSelectionCommittee2: Record "Candidate Selection Committee";
    begin

        ShortlistMatrix.Reset;
        ShortlistMatrix.SetRange("Document No", SelectionHeader."Document No.");
        if ShortlistMatrix.FindSet then
            noofapplica := ShortlistMatrix.count;

        CandidateSelectionCommittee2.Reset;
        CandidateSelectionCommittee2.SetRange("Document No.", SelectionHeader."Document No.");
        if CandidateSelectionCommittee2.FindSet then
            noofmembers := CandidateSelectionCommittee2.count;
        Maxassign := (noofapplica / noofmembers);




        CandidateSelectionCommittee.Reset;
        CandidateSelectionCommittee.SetRange("Document No.", SelectionHeader."Document No.");
        if CandidateSelectionCommittee.FindSet then begin
            repeat

                CandidateShortlistMatrix.Reset;
                CandidateShortlistMatrix.SetRange("Document No", SelectionHeader."Document No.");
                CandidateShortlistMatrix.SetRange("Member No.", CandidateSelectionCommittee."Member No.");
                if CandidateShortlistMatrix.FindSet then begin
                    noofapplicaass := CandidateShortlistMatrix.count;
                    if noofapplicaass < Maxassign then begin
                        CandidateShortlistMatrix."Member No." := CandidateSelectionCommittee."Member No.";
                        CandidateShortlistMatrix."Member Name" := CandidateSelectionCommittee.Name;
                        CandidateShortlistMatrix.modify(true);

                    end

                end;



            until CandidateSelectionCommittee.Next = 0;
        end;



        SelectionHeader.Posted := true;
        SelectionHeader."Interview Invitation No." := CandidateSelection."Document No.";
        SelectionHeader.Modify(true);

    end;

    procedure SuggestInterviewCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Candidate Shortlist Matrix";
        JobApplications: Record "Job Applications";
        InterviewLine1: Record "Candidate Interview Line";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested for the Vacancy %1';
        TXT002: label 'There are no job applicants found for the Vacancy %1';
        InterviewLine2: Record "Candidate Interview Line";
        TXT003: label 'There are no succesfull candidates found for the Vacancy %1';
    begin
        if SelectionHeader."Source Type" = SelectionHeader."source type"::"Final Shortlisting" then begin
            InterviewLine1.Reset;
            InterviewLine1.SetRange("Document No.", SelectionHeader."Document No.");
            if InterviewLine1.FindSet then
                InterviewLine1.DeleteAll;

            InterviewLine.Reset;
            InterviewLine.SetRange("Document No", SelectionHeader."Source Document No.");
            InterviewLine.SetRange("Vacancy ID", SelectionHeader."Vacancy ID");
            if InterviewLine.FindSet then begin
                repeat
                    //INSERT
                    InterviewLine2.Init;
                    InterviewLine2."Document No." := SelectionHeader."Document No.";
                    InterviewLine2."Document Type" := InterviewLine2."document type"::"Candidate Shortlisting";
                    InterviewLine2."Vacancy ID" := SelectionHeader."Vacancy ID";
                    InterviewLine2."Application No." := InterviewLine."Application No.";
                    InterviewLine2.Validate("Application No.");
                    InterviewLine2.Insert;
                until InterviewLine.Next = 0;
                Message(TXT001, SelectionHeader."Vacancy ID");
            end else begin
                Message(TXT002, SelectionHeader."Vacancy ID");
            end

        end else begin
            //get from previous interview
            InterviewLine1.Reset;
            InterviewLine1.SetRange("Document No.", SelectionHeader."Source Document No.");
            InterviewLine1.SetRange("Interview Panel Outcome", InterviewLine1."interview panel outcome"::Succesful);
            InterviewLine1.SetRange("Vacancy ID", SelectionHeader."Vacancy ID");
            if InterviewLine1.FindSet then begin
                repeat
                    //INSERT
                    InterviewLine2.Init;
                    InterviewLine2."Document No." := SelectionHeader."Document No.";
                    InterviewLine2."Document Type" := InterviewLine2."document type"::"Candidate Shortlisting";
                    InterviewLine2."Vacancy ID" := SelectionHeader."Vacancy ID";
                    InterviewLine2."Application No." := InterviewLine1."Application No.";
                    InterviewLine2.Validate("Application No.");
                    InterviewLine2.Insert;
                until InterviewLine.Next = 0;
                Message(TXT001, SelectionHeader."Vacancy ID");
            end else
                Message(TXT003, SelectionHeader."Vacancy ID");
        end
    end;

    procedure SuggestOrientationCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Employment Offer";
        JobApplications: Record "Job Applications";
        InterviewLine1: Record "Candidate Interview Line";
        EmploymentOffer: Record "Employment Offer";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested';
        TXT002: label 'There are no job applicants found';
        InterviewLine2: Record "Candidate Interview Line";
        TXT003: label 'There are no succesfull candidates found for the Vacancy %1';
    begin

        InterviewLine1.Reset;
        InterviewLine1.SetRange("Document No.", SelectionHeader."Document No.");
        if InterviewLine1.FindSet then
            InterviewLine1.DeleteAll;

        InterviewLine.Reset;
        InterviewLine.SetRange("Orientation Status", InterviewLine."Orientation Status"::Open);
        InterviewLine.SetRange("Offer Acceptance Status", InterviewLine."Offer Acceptance Status"::Accepted);
        if InterviewLine.FindSet then begin
            repeat
                //INSERT
                InterviewLine2.Init;
                InterviewLine2."Document No." := SelectionHeader."Document No.";
                InterviewLine2."Document Type" := InterviewLine2."document type"::"Invitation for Orientation";
                InterviewLine2."Vacancy ID" := InterviewLine."Vacancy ID";
                InterviewLine2."Offer ID" := InterviewLine."Offer ID";
                InterviewLine2."Application No." := InterviewLine."Application No.";
                InterviewLine2.Validate("Application No.");
                if InterviewLine2.Insert(true) then begin
                    InterviewLine."Orientation Status" := InterviewLine."Orientation Status"::"Pending Orientation";
                    InterviewLine.modify(true);

                end
            until InterviewLine.Next = 0;
            Message(TXT001);
        end else begin
            Message(TXT002);
        end;


    end;

    procedure PostOrientationCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Employment Offer";
        JobApplications: Record "Job Applications";
        InterviewLine1: Record "Candidate Interview Line";
        EmploymentOffer: Record "Employment Offer";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested';
        TXT002: label 'There are no job applicants found';
        InterviewLine2: Record "Candidate Interview Line";
        TXT003: label 'There are no succesfull candidates found for the Vacancy %1';
    begin

        InterviewLine1.Reset;
        InterviewLine1.SetRange("Document No.", SelectionHeader."Document No.");
        InterviewLine1.SetRange("Orientation Attendance Status", InterviewLine1."Orientation Attendance Status"::"Attended Orientation");
        if InterviewLine1.FindSet then begin
            repeat
                InterviewLine.Reset;
                InterviewLine.SetRange("Offer ID", InterviewLine1."Offer ID");
                if InterviewLine.FindSet then begin
                    InterviewLine."Orientation Status" := InterviewLine."Orientation Status"::"Oriented";
                    InterviewLine."Orientation Date" := InterviewLine."Orientation Date";
                    InterviewLine."Orientation End Time" := InterviewLine."Orientation End Time";
                    InterviewLine."Orientation Venue" := InterviewLine."Orientation Venue";
                    InterviewLine."Orientation Room No." := InterviewLine."Orientation Room No.";
                    InterviewLine.modify(true);
                end;

            until InterviewLine1.Next = 0;
            Message('Submitted succesffully');
        end else begin
            Message(TXT002);
        end;


    end;

    procedure NotifyOrientationCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Candidate Interview Line";
        Body: Text;
        SMTP: Codeunit "Email Message";
        // Email: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        InterviewLine.Reset;
        InterviewLine.SetRange("Document No.", SelectionHeader."Document No.");
        if InterviewLine.FindSet then begin
            repeat
                EmailMessage.Create(InterviewLine.Email, 'RE:INVITATION FOR ORIENTATION', 'Dear' + InterviewLine."First Name" + ',<BR><BR>' +
                                 ' You are hereby notified that an Orientation has been scheduled in line with the offer letter acceptance for :' +
                                 ' ' + SelectionHeader."Job Title" + '<br>The following are the details for the Orientation:<BR>' +
                                 'Venue:' + ' ' + InterviewLine."Interview Venue" + '<BR>' + 'Room No:' + ' ' + InterviewLine."Room No." + '<BR>' +
                                 ' ' + 'Date:' + ' ' + Format(InterviewLine."Interview Date") + '<BR>+Duration:' + ' ' + Format(InterviewLine."Interview Start Time") + ' ' + 'to' + ' ' + Format(InterviewLine."Interview End Time") +
                         'Thank you for the continued support.<BR>', true);
                Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
            until InterviewLine.Next = 0;
            InterviewLine.Notified := true;
            InterviewLine."Notified On" := CurrentDatetime;
            InterviewLine.Modify(true);
        end;
    end;

    procedure NotifyInterviewCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Candidate Interview Line";
        Body: Text;
        SMTP: Codeunit "Email Message";
        // Email: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        InterviewLine.Reset;
        InterviewLine.SetRange("Document No.", SelectionHeader."Document No.");
        if InterviewLine.FindSet then begin
            repeat
                EmailMessage.Create(InterviewLine.Email, 'RE:INVITATION FOR AN INTERVIEW',
'Greetings,<BR>' +
'Following your successful application for the position of ' + SelectionHeader."Job Title" + ' by the Judicial Service Commision, you are hereby invited for a physical interview on ' + Format(InterviewLine."Interview Date") +
'.<BR> Please carry your ID and  original certificates. Ensure they are returned to you after the interview.<BR>' +
'Venue : ' + InterviewLine."Interview Venue" + '<BR>' +

'Time: ' + Format(InterviewLine."Interview Start Time") + '' +
'<BR>Please be prompt.<BR>' +

'DIRECTOR, HRMD', true);
                Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
            until InterviewLine.Next = 0;
            InterviewLine.Notified := true;
            InterviewLine."Notified On" := CurrentDatetime;
            InterviewLine.Modify(true);
        end;
    end;

    procedure NotifyInterviewPanelist(SelectionHeader: Record "Candidate Selection Header")
    var
        SelectionCommittee: Record "Candidate Selection Panel";
        Body: Text;
        SMTP: Codeunit "Email Message";
        // Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        SelectionCommittee1: Record "Candidate Selection Panelist";
        FileName: Text;
        FileDirectory: Text;
        InterviewLine: Record "Commitee Appointment Voucher";
        AppointedMember: Record "Commitee Appointed Member";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin


        InterviewLine.Reset;
        InterviewLine.SetRange("Vacancy ID", SelectionHeader."Vacancy ID");
        InterviewLine.setrange("Approval Status", InterviewLine."Approval Status"::Released);
        if InterviewLine.FindSet then begin
            repeat
                AppointedMember.reset();
                AppointedMember.setrange("Document No.", InterviewLine."Document No.");
                if AppointedMember.findset then begin
                    repeat
                        EmailMessage.Create(AppointedMember."Member Email", 'RE:INVITATION FOR A SELECTION  PANEL', 'Greetings <BR>' +
                                                  ' I wish to inform you that you have been appointed to interview panel ' + InterviewLine."Document No." +
                                                  ' to conduct interviews for the shortlisted candidates for ' + SelectionHeader."Job Title" +
                                                  '<br>The interviews have been scheduled between :<BR>' + format(SelectionHeader."Planned Start Date") + ' to ' + format(SelectionHeader."Planned end Date") +
'<BR> You will receive further communication on the logistics. Kindly block you diary<BR>' +
                                                  'Thank you', true);
                        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);

                    until AppointedMember.next = 0;

                end


            until InterviewLine.next = 0;
        end;

    end;

    procedure NotifyBackgroundCheckResult(BackgroundChecksHeader: Record "Background Checks Header")
    var
        ChecksDocument: Record "Background Checks Document";
        Body: Text;
        SMTP: Codeunit "Email Message";
        //Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        SendToList: List of [Text];
    begin
        BackgroundChecksHeader.TestField(Email);
        CI.Get;


        EmailMessage.Create(BackgroundChecksHeader.Email, 'RE:BACKGROUND CHECKS REPORT', 'Dear ' + BackgroundChecksHeader."First Name" + ',<BR><BR>' +
                              ' You are hereby notified that your background checks has completed in line with the application for the vacancy:' +
                              ' ' + BackgroundChecksHeader."Vacancy ID", true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);


    end;

    procedure NotifyBackgroundCheckResult2(DocNo: Text)
    var
        BackgroundChecks: Record "Background Checks Header";
        ChecksDocument: Record "Background Checks Document";
        Body: Text;
        SMTP: Codeunit "Email Message";
        //Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        BackgroundChecks.Reset();
        BackgroundChecks.SetRange(BackgroundChecks."Document No.", DocNo);
        if BackgroundChecks.find('-') then begin
            BackgroundChecks.TestField(Email);
            CI.Get;
            //notify attendees
            SMTPMailSetup.Get;
            //Email := SMTPMailSetup."Email Address";
            Email2 := BackgroundChecks.Email;
            EmailMessage.Create(BackgroundChecks.Email, 'RE:BACKGROUND CHECKS REPORT', 'Dear ' + BackgroundChecks."First Name" + ',<BR><BR>' +
                          ' You are hereby notified that your background checks has completed in line with the application for the vacancy:' +
                          ' ' + BackgroundChecks."Vacancy ID", true);
            // Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

            // ChecksDocument.Reset;
            // ChecksDocument.SetRange("Document No.", BackgroundChecksHeader."Document No.");
            // if ChecksDocument.FindSet then begin
            //     repeat
            //     //SMTP.AppendToBody(ChecksDocument."Document No." + ' ' + 'Status' + ' ' + Format(ChecksDocument."Clearing Status") + '<BR>');

            //     until ChecksDocument.Next = 0;
            // end;
            //SMTP.AppendToBody('Thank you .<BR>');
            //SMTP.AddCC(Email2);
            //SMTP.AppendToBody('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            // //SMTP.Send();
        end;
    end;


    procedure SuggestRefRequirements(RefereeRecommendation: Record "Referee Recommendation")
    var
        LineNo: Integer;
        RefereeRating: Record "Referee Recomm Rating";
        Customer: Record Customer;
        Requirements: Record "Recruitment Req Requirement";
        TXT001: label 'No requirements found for skill and competencies';
    begin
        RefereeRating.Reset;
        RefereeRating.SetRange("Document No.", RefereeRecommendation."Document No.");
        if RefereeRating.FindSet then begin
            RefereeRating.DeleteAll;
        end;
        Requirements.Reset;
        Requirements.SetRange("Document No.", RefereeRecommendation."Vacancy ID");
        Requirements.SetRange("Qualification Category", Requirements."qualification category"::"Skills & Competencies");
        if Requirements.FindSet then begin
            repeat
                RefereeRating."Document No." := RefereeRecommendation."Document No.";
                RefereeRating."Vacancy ID" := RefereeRecommendation."Vacancy ID";
                RefereeRating."Skills and Competency ID" := Requirements."Line No.";
                RefereeRating."Qualification Code" := Requirements."Qualification Code";
                RefereeRating.Description := Requirements.Description;
                RefereeRating.Insert(true);
            until Requirements.Next = 0;
        end else
            Error(TXT001);
    end;

    procedure NotifyReferee(BackgroundChecksHeader: Record "Background Checks Reference")
    var
        ChecksReference: Record "Background Checks Reference";
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
    begin
        BackgroundChecksHeader.TestField(Email);
        CI.Get;

        //notify attendees
        SMTPMailSetup.Get;
        Email := SMTPMailSetup."Email Address";
        Email2 := BackgroundChecksHeader.Email;
        // //SMTP.Create(CI.Name, Email, BackgroundChecksHeader.Email, 'Application' + 'No: ' + BackgroundChecksHeader."Application No.", '<u>RE:BACKGROUND CHECKS REPORT</u><BR><BR>' +
        // 'Dear' + BackgroundChecksHeader.Name + ',<BR><BR>' +
        // ' Kindly provide your background check on the copied herein candidate for the vacancy:' +
        // ' ' + BackgroundChecksHeader."Vacancy Id" + '<br>The following are the details for the report:<BR>', true);
        // //send pdf report
        //SMTP.AppendToBody('Thank you for the continued support.<BR>');
        //SMTP.AddCC(BackgroundChecksHeader.Email);
        //SMTP.AppendToBody('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
        // //SMTP.Send();

        BackgroundChecksHeader."Invited for Detailed Recommend" := true;
        BackgroundChecksHeader."Invited On" := CurrentDatetime;

        BackgroundChecksHeader.Modify(true);
    end;


    procedure CreateEmploymentOffer(BackgroundChecksHeader: Record "Background Checks Header")
    var
        EmploymentOffer: Record "Employment Offer";
        HumanResourcesSetup: Record "Human Resources Setup";
        OfferNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        HumanResourcesSetup.Get;
        // HumanResourcesSetup.TestField("Employment Offer Nos.");
        // NoSeriesMgt.InitSeries(HumanResourcesSetup."Employment Offer Nos.", HumanResourcesSetup."Employment Offer Nos.", 0D, OfferNo, HumanResourcesSetup."Employment Offer Nos.");
        EmploymentOffer."Offer ID" := OfferNo;
        EmploymentOffer."Document Date" := Today;
        EmploymentOffer."Document Type" := EmploymentOffer."Document Type"::"Offer letter";
        EmploymentOffer."Panel Interview Report ID" := BackgroundChecksHeader."Panel Interview Report ID";
        EmploymentOffer."Application No." := BackgroundChecksHeader."Application No.";
        EmploymentOffer.Validate("Application No.");
        EmploymentOffer."Created By" := UserId;
        EmploymentOffer."Lead HR Officer" := BackgroundChecksHeader."Lead HR Officer";
        EmploymentOffer."Employment Start Date" := Today;
        EmploymentOffer."Payroll Start Period" := Today;
        EmploymentOffer."Created On" := CurrentDatetime;
        EmploymentOffer.Insert(true);
        Message('Offer Letter No %1 created successfully', EmploymentOffer."Offer ID");
        Page.Run(69764, EmploymentOffer);
    end;

    procedure CreateEmploymentappoinment(BackgroundChecksHeader: Record "Employment Offer")
    var
        EmploymentOffer: Record "Employment Offer";
        HumanResourcesSetup: Record "Human Resources Setup";
        OfferNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        HumanResourcesSetup.Get;
        // HumanResourcesSetup.TestField("Employment Offer Nos.");
        // NoSeriesMgt.InitSeries(HumanResourcesSetup."Employment Offer Nos.", HumanResourcesSetup."Employment Offer Nos.", 0D, OfferNo, HumanResourcesSetup."Employment Offer Nos.");
        EmploymentOffer."Offer ID" := OfferNo;
        EmploymentOffer."Document Date" := Today;
        EmploymentOffer."Document Type" := EmploymentOffer."Document Type"::"Appointment Letter";
        EmploymentOffer."Panel Interview Report ID" := BackgroundChecksHeader."Panel Interview Report ID";
        EmploymentOffer."Application No." := BackgroundChecksHeader."Application No.";
        EmploymentOffer."Gross Pay" := BackgroundChecksHeader."Gross Pay";
        EmploymentOffer.Validate("Application No.");
        EmploymentOffer."Created By" := UserId;
        EmploymentOffer."Offer Letter ID" := BackgroundChecksHeader."Offer ID";
        EmploymentOffer."Lead HR Officer" := BackgroundChecksHeader."Lead HR Officer";
        EmploymentOffer."Offer Acceptance Status" := BackgroundChecksHeader."Offer Acceptance Status";
        EmploymentOffer."Employment Start Date" := BackgroundChecksHeader."Employment Start Date";
        EmploymentOffer."Payroll Start Period" := BackgroundChecksHeader."Payroll Start Period";
        EmploymentOffer."Created On" := CurrentDatetime;
        EmploymentOffer.Insert(true);
        Message('Appointment Letter No %1 created successfully', EmploymentOffer."Offer ID");
        Page.Run(69390, EmploymentOffer);
    end;

    procedure SuggestMedicalQuestions(PreHireMedicalReport: Record "PreHire Medical Report")
    var
        LineNo: Integer;
        ReportLines: Record "Prehire Medical Report Lines";
        ReportLines1: Record "Prehire Medical Report Lines";
        MedicalChecksTemplate: Record "Medical Checks Template";
        TemplateLine: Record "Medical Checks Template Line";
        TXT001: label 'No Questions found on the template selected--%1';
    begin
        PreHireMedicalReport.TestField("Medical Checks Template");
        ReportLines1.Reset;
        ReportLines1.SetRange("Document No.", PreHireMedicalReport."Document No.");
        if ReportLines1.FindSet then begin
            ReportLines1.DeleteAll;
        end;
        MedicalChecksTemplate.Reset;
        MedicalChecksTemplate.SetRange("Template ID", PreHireMedicalReport."Medical Checks Template");
        if MedicalChecksTemplate.FindFirst then begin
            TemplateLine.Reset;
            TemplateLine.SetRange("Template Id", MedicalChecksTemplate."Template ID");
            if TemplateLine.FindSet then begin
                repeat
                    ReportLines."Line No." := TemplateLine."Line No.";
                    ReportLines."Medical History Type" := TemplateLine."Medical History Type";
                    ReportLines.Code := TemplateLine.Code;
                    ReportLines."Document No." := PreHireMedicalReport."Document No.";
                    ReportLines.Description := TemplateLine.Description;
                    ReportLines.Insert;
                until TemplateLine.Next = 0;
            end else
                Error(TXT001, PreHireMedicalReport."Medical Checks Template");
        end
    end;

    procedure SendAppointLetter(EmploymentOffer: Record "Employment Offer")
    var
        Compensation: Record "Employment Offer Compensation";
        Body: Text;
        SMTP: Codeunit "Email Message";
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        RC: Record "Responsibility Center";
        employee: Record Employee;
        SendToList: List of [Text];
        SendToList2: List of [Text];
        SendToList3: List of [Text];
    begin
        //  EmploymentOffer.TestField(Email);
        CI.Get;
        RC.RESET();
        RC.setrange(Code, EmploymentOffer.Directorate);
        if RC.findset() then
            employee.reset();
        employee.setrange("No.", RC."Current Head");
        if employee.FINDSET() then
            SendToList.add(EmploymentOffer.Email);
        SendToList2.add(employee."Company E-Mail");
        SendToList3.add(employee."Company E-Mail");

        EmailMessage.Create(SendToList, 'RE:APPOINTMENT LETTER',
                'Dear' + EmploymentOffer."First Name" + ',<BR><BR>' +
      ' You are hereby notified that you have been appointed successfully for the Position of:' +
      ' <br>' + EmploymentOffer."Job Title/Designation" + '<br>You are required to physically sign the appointment letter ' +
      'by' + ' ' + Format(EmploymentOffer."Candidate Response Date") + '.<br> A Later date shall nullify your qualification.', true, SendToList2, SendToList3);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

        Message(TXT001, EmploymentOffer."Application No." + ' ' + EmploymentOffer."First Name");

    end;

    procedure SendOfferLetter(EmploymentOffer: Record "Employment Offer")
    var
        Compensation: Record "Employment Offer Compensation";
        Body: Text;
        SMTP: Codeunit "Email Message";
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        SendToList: List of [Text];
    begin
        //  EmploymentOffer.TestField(Email);
        CI.Get;
        // SMTPMailSetup.Get;

        EmailMessage.Create(EmploymentOffer.Email, 'RE:OFFER LETTER', 'Dear' + EmploymentOffer."First Name" + ',<BR><BR>' +
              ' You are hereby notified that you have been a succesfull applicant for the vacancy:' +
              ' ' + EmploymentOffer."Job Title/Designation" + '<br>Kindly login to the recruitment portal to access and  download the offer letter under employment offer:<BR>' +
              'by' + ' ' + Format(EmploymentOffer."Candidate Response Date") + '. A Later date shall nullify your qualification.', true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);



        Message(TXT001, EmploymentOffer."Application No." + ' ' + EmploymentOffer."First Name");

    end;

    procedure GenerateContractForApplicant(EmploymentOffer: Record "Employment Offer")
    var
        TXT001: label 'The notification has been succesfully sent to %1';
        Employee: Record Employee;
        EmployeeQualification: Record "Employee Qualification";
        HumanResourcesSetup: Record "Human Resources Setup";
        HRSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit "NoSeriesManagement";
        EmployeeNo: Code[30];
        Applicant: Record Applicant;
        ApplicantQualificationHistor: Record "Job Applicants Qualification";
        TXT002: label 'Employee assigned number is %1,and qualifications updated sucesfully';
        TXT003: label 'Qualifications for the existing employee %1 updated succesfully';
        ApplicantQualification1: Record "Employee Qualification";
    begin
        //generate contract if its contract based
        //generate employee
        //HRSetup.Get();
        //HRSetup.TestField("Employee Nos.");
        EmploymentOffer.testfield("ID Number");
        Employee.Reset;
        Employee.SetRange("ID Number", Format(EmploymentOffer."ID Number"));
        if not Employee.FindFirst then begin
            Applicant.Reset;
            Applicant.SetRange("Candidate No.", EmploymentOffer."Candidate No.");
            if Applicant.FindFirst then begin
                Employee.init();
                // Employee."No." := NoSeriesManagement.GetNextNo(HRSetup."Employee Nos.", TODAY, TRUE);
                Employee."No." := Employee."No.";
                Employee."First Name" := Applicant."First Name";
                Employee."Middle Name" := Applicant."Middle Name";
                Employee."Last Name" := Applicant."Last Name";
                Employee."E-Mail" := Applicant."E-Mail";
                Employee.Disabled := Applicant.Disabled;
                Employee."Marital Status" := Applicant."Marital Status";
                // Employee."Disability Code" := Applicant."Disability Code";
                Employee."Disability Description" := Applicant."Disability Description";
                Employee."Disability No." := Applicant."Disability Certificate No";
                Employee."Company E-Mail" := Applicant."E-Mail";
                Employee."Birth Date" := Applicant."Birth Date";
                Employee."Phone No." := Applicant."Phone No.";
                Employee."Directorate Code" := EmploymentOffer.Directorate;
                // Employee.Department := EmploymentOffer.Department;
                Employee."Department Code" := EmploymentOffer.Department;
                Employee."Mobile Phone No." := Applicant."Mobile Phone No.";
                Employee."Post Code" := Applicant."Post Code";
                Employee.Validate("Post Code");
                Employee."ID Number" := Format(EmploymentOffer."ID Number");
                Employee."Current Position ID" := EmploymentOffer."Position ID";
                Employee."Current Job Grade" := EmploymentOffer."Job Grade ID";
                Employee."Salary Scale" := EmploymentOffer."Job Grade ID";
                Employee.Present := EmploymentOffer."Salary Notch";
                Employee."Current Duty Station" := EmploymentOffer."Duty Station ID";
                Employee."Job Title2" := EmploymentOffer."Job Title/Designation";
                Employee."Employment Date" := EmploymentOffer."Employment Start Date";
                Employee."Date Of Join" := EmploymentOffer."Employment Start Date";
                Employee.Gender := EmploymentOffer.Gender;
                Employee."Date Of Birth" := EmploymentOffer."Birth Date";
                Employee."PIN Number" := EmploymentOffer."Tax Regitration(PIN)";
                Employee.Address := EmploymentOffer.Address;
                Employee."Address 2" := EmploymentOffer."Address 2";
                Employee.Position := EmploymentOffer."Position ID";
                // Employee."Current Terms of Service" := EmploymentOffer."Terms of Service";
                Employee.Status := Employee.status::Active;
                Employee."Employee Status 2" := Employee."Employee Status 2"::Probation;

                if Employee.Insert(true) then begin

                    //employee qualifications
                    ApplicantQualificationHistor.Reset;
                    ApplicantQualificationHistor.SetRange("Candidate No.", EmploymentOffer."Candidate No.");
                    if ApplicantQualificationHistor.FindSet then begin
                        repeat
                            EmployeeQualification."Employee No." := Employee."No.";
                            EmployeeQualification."Line No." := ApplicantQualificationHistor."Line No.";
                            EmployeeQualification."Qualification Code" := ApplicantQualificationHistor."Qualification Code";
                            EmployeeQualification."From Date" := ApplicantQualificationHistor."From Date";
                            EmployeeQualification."To Date" := ApplicantQualificationHistor."To Date";
                            EmployeeQualification.Type := ApplicantQualificationHistor.Type;
                            EmployeeQualification.Description := ApplicantQualificationHistor.Description;
                            EmployeeQualification."Institution/Company" := ApplicantQualificationHistor."Institution/Company";
                            EmployeeQualification.Insert(true);
                        until ApplicantQualificationHistor.Next = 0;
                    end;
                end;

            end;
            Message(TXT002, Employee."No.");
        end else begin
            Employee."First Name" := Applicant."First Name";
            Employee."Middle Name" := Applicant."Middle Name";
            Employee."Last Name" := Applicant."Last Name";
            Employee."E-Mail" := Applicant."E-Mail";
            Employee.Disabled := Applicant.Disabled;
            Employee."Marital Status" := Applicant."Marital Status";
            // Employee."Disability Code" := Applicant."Disability Code";
            Employee."Disability Description" := Applicant."Disability Description";
            Employee."Disability No." := Applicant."Disability Certificate No";
            Employee."Birth Date" := Applicant."Birth Date";
            Employee."Phone No." := Applicant."Phone No.";
            Employee."Directorate Code" := EmploymentOffer.Directorate;
            // Employee.Department := EmploymentOffer.Department;
            Employee."Department Code" := EmploymentOffer.Department;
            Employee."Mobile Phone No." := Applicant."Mobile Phone No.";
            Employee."Post Code" := Applicant."Post Code";
            Employee.Validate("Post Code");
            Employee."ID Number" := Format(EmploymentOffer."ID Number");
            Employee."Current Position ID" := EmploymentOffer."Position ID";
            Employee."Current Job Grade" := EmploymentOffer."Job Grade ID";
            Employee."Salary Scale" := EmploymentOffer."Job Grade ID";
            Employee.Present := EmploymentOffer."Salary Notch";
            Employee."Current Duty Station" := EmploymentOffer."Duty Station ID";
            Employee."Job Title2" := EmploymentOffer."Job Title/Designation";
            Employee.Gender := EmploymentOffer.Gender;
            Employee."Date Of Birth" := EmploymentOffer."Birth Date";
            Employee."PIN Number" := EmploymentOffer."Tax Regitration(PIN)";
            Employee.Address := EmploymentOffer.Address;
            Employee."Address 2" := EmploymentOffer."Address 2";
            Employee.Position := EmploymentOffer."Position ID";
            // Employee."Current Terms of Service" := EmploymentOffer."Terms of Service";
            Employee.Status := Employee.status::Active;
            if Employee.Modify() then begin
                ApplicantQualification1.Reset;
                ApplicantQualification1.SetRange("Employee No.", Employee."No.");
                if ApplicantQualification1.FindSet then begin
                    ApplicantQualification1.DeleteAll
                end;
                //employee qualifications
                ApplicantQualificationHistor.Reset;
                ApplicantQualificationHistor.SetRange("Candidate No.", EmploymentOffer."Candidate No.");
                if ApplicantQualificationHistor.FindSet then begin
                    repeat
                        EmployeeQualification."Employee No." := Employee."No.";
                        EmployeeQualification."Line No." := ApplicantQualificationHistor."Line No.";
                        EmployeeQualification."Qualification Code" := ApplicantQualificationHistor."Qualification Code";
                        EmployeeQualification."From Date" := ApplicantQualificationHistor."From Date";
                        EmployeeQualification."To Date" := ApplicantQualificationHistor."To Date";
                        EmployeeQualification.Type := ApplicantQualificationHistor.Type;
                        EmployeeQualification.Description := ApplicantQualificationHistor.Description;
                        EmployeeQualification."Institution/Company" := ApplicantQualificationHistor."Institution/Company";
                        EmployeeQualification.Insert(true);
                    until ApplicantQualificationHistor.Next = 0;
                end;
                Message(TXT003, Employee."No.");
            end;
        end;
        EmploymentOffer."Employee No." := Employee."No.";
        EmploymentOffer."Employee Contract No." := Employee."No.";
        EmploymentOffer."Document Status" := EmploymentOffer."document status"::Closed;
        EmploymentOffer.Modify(true);
    end;

    procedure FnSuggestapplicants(CandidateSelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
    begin
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", CandidateSelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                CandidateShortlistMatrix.Init;
                CandidateShortlistMatrix."Document Type" := CandidateSelectionHeader."Document Type";
                CandidateShortlistMatrix."Document No" := CandidateSelectionHeader."Document No.";
                CandidateShortlistMatrix."Vacancy ID" := CandidateSelectionHeader."Vacancy ID";
                CandidateShortlistMatrix."Application No." := JobApplications."Application No.";
                CandidateShortlistMatrix."Candidate No" := JobApplications."Candidate No.";
                CandidateShortlistMatrix."First Name" := JobApplications."First Name";
                CandidateShortlistMatrix."Middle Name" := JobApplications."Middle Name";
                CandidateShortlistMatrix."Last Name" := JobApplications."Last Name";
                CandidateShortlistMatrix."Phone No." := JobApplications."Phone No.";
                CandidateShortlistMatrix."Mobile Phone No." := JobApplications."Mobile Phone No.";
                CandidateShortlistMatrix.Email := JobApplications."E-Mail";
                CandidateShortlistMatrix."Birth Date" := JobApplications."Birth Date";
                CandidateShortlistMatrix."Management Experience (Years)" := JobApplications."Management Experience (Years)";
                CandidateShortlistMatrix."Work Experience (Years)" := JobApplications."Work Experience (Years)";
                CandidateShortlistMatrix.Gender := JobApplications.Gender;
                CandidateShortlistMatrix."Passport No." := JobApplications."Passport No.";
                CandidateShortlistMatrix."Tax Registration No." := JobApplications."PIN Registration";
                CandidateShortlistMatrix."ID Number" := JobApplications."ID Number";
                CandidateShortlistMatrix."Marital Status" := JobApplications."Marital Status";
                CandidateShortlistMatrix."Ethnic Group" := JobApplications."Ethnic Group";
                CandidateShortlistMatrix.Religion := JobApplications.Religion;
                CandidateShortlistMatrix.Disabled := JobApplications.Disabled;
                CandidateShortlistMatrix."Disability Code" := JobApplications."Disability Code";
                CandidateShortlistMatrix."Disability Description" := JobApplications."Disability Description";
                CandidateShortlistMatrix."Disability Certificate No" := JobApplications."Disability Certificate No";
                CandidateShortlistMatrix."Specialization Area" := JobApplications."Specialization Area";
                CandidateShortlistMatrix.Nationality := JobApplications.Nationality;
                CandidateShortlistMatrix."Qualification Name" := JobApplications."Qualification Name";
                CandidateShortlistMatrix."Highest Academic Qualification" := JobApplications."Highest Academic Qualification";
                CandidateShortlistMatrix.Insert(true);
            until JobApplications.Next = 0;
            Message('Successful');
        end;
    end;

    procedure FnSuggestapplicantsInd(CandidateSelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Candidate Shortlist Matrix";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
    begin
        CandidateShortlistMatrix.Reset();
        CandidateShortlistMatrix.SetRange("Document No", CandidateSelectionHeader."Document No.");
        if CandidateShortlistMatrix.FindSet() then begin
            CandidateShortlistMatrix.DeleteAll();
        end;

        JobApplications.Reset;
        JobApplications.SetRange("Member No.", CandidateSelectionHeader."Member No.");
        JobApplications.SetRange("Vacancy Id", CandidateSelectionHeader."Vacancy ID");
        JobApplications.SetRange("Document No", CandidateSelectionHeader."Shorlisting Document No.");
        if JobApplications.FindSet then begin
            repeat
                CandidateShortlistMatrix.Init;
                CandidateShortlistMatrix."Document Type" := CandidateShortlistMatrix."Document Type"::"Individual Candidate Shortlist";
                CandidateShortlistMatrix."Document No" := CandidateSelectionHeader."Document No.";
                message('Application %1', JobApplications."Application No.");
                CandidateShortlistMatrix."Shorlisting Document No." := CandidateSelectionHeader."Shorlisting Document No.";
                CandidateShortlistMatrix."Vacancy ID" := CandidateSelectionHeader."Vacancy ID";
                CandidateShortlistMatrix."Application No." := JobApplications."Application No.";
                CandidateShortlistMatrix."Candidate No" := JobApplications."Candidate No";
                CandidateShortlistMatrix."First Name" := JobApplications."First Name";
                CandidateShortlistMatrix."Middle Name" := JobApplications."Middle Name";
                CandidateShortlistMatrix."Last Name" := JobApplications."Last Name";
                CandidateShortlistMatrix."Phone No." := JobApplications."Phone No.";
                CandidateShortlistMatrix."Mobile Phone No." := JobApplications."Mobile Phone No.";
                CandidateShortlistMatrix.Email := JobApplications.Email;
                CandidateShortlistMatrix."Birth Date" := JobApplications."Birth Date";
                CandidateShortlistMatrix."Management Experience (Years)" := JobApplications."Management Experience (Years)";
                CandidateShortlistMatrix."Work Experience (Years)" := JobApplications."Work Experience (Years)";
                CandidateShortlistMatrix.Gender := JobApplications.Gender;
                CandidateShortlistMatrix."Passport No." := JobApplications."Passport No.";
                CandidateShortlistMatrix."Tax Registration No." := JobApplications."Tax Registration No.";
                CandidateShortlistMatrix."ID Number" := JobApplications."ID Number";
                CandidateShortlistMatrix."Marital Status" := JobApplications."Marital Status";
                CandidateShortlistMatrix."Ethnic Group" := JobApplications."Ethnic Group";
                CandidateShortlistMatrix.Religion := JobApplications.Religion;
                CandidateShortlistMatrix.Disabled := JobApplications.Disabled;
                CandidateShortlistMatrix."Disability Code" := JobApplications."Disability Code";
                CandidateShortlistMatrix."Disability Description" := JobApplications."Disability Description";
                CandidateShortlistMatrix."Disability Certificate No" := JobApplications."Disability Certificate No";
                CandidateShortlistMatrix."Specialization Area" := JobApplications."Specialization Area";
                CandidateShortlistMatrix.Nationality := JobApplications.Nationality;
                CandidateShortlistMatrix."Qualification Name" := JobApplications."Qualification Name";
                CandidateShortlistMatrix."Highest Academic Qualification" := JobApplications."Highest Academic Qualification";
                if CandidateShortlistMatrix.Insert(true) then begin


                end;
            until JobApplications.Next = 0;

        end;
        Message('Suggested Successfully');
    end;

    procedure FnSuggestINTERVIEWInd(CandidateSelectionHeader: Record "Candidate Interview Record")
    var
        JobApplications: Record "Candidate Interview Record";
        CandidateShortlistMatrix: Record "Consolidation Interview Lines";
        CandidateShortlistMatrix2: Record "Consolidation Interview Lines";
    begin
        CandidateShortlistMatrix.Reset();
        CandidateShortlistMatrix.SetRange("Document No.", CandidateSelectionHeader."Document No.");
        if CandidateShortlistMatrix.FindSet() then begin
            CandidateShortlistMatrix.DeleteAll();
        end;

        JobApplications.Reset;
        JobApplications.SetRange(Posted, true);
        JobApplications.SetRange("Vacancy Id", CandidateSelectionHeader."Vacancy ID");
        JobApplications.SetRange("Document Type", JobApplications."Document Type"::Individual);
        if JobApplications.FindFirst() then begin
            repeat

                CandidateShortlistMatrix.Reset();
                CandidateShortlistMatrix.SetRange("Document No.", CandidateSelectionHeader."Document No.");
                CandidateShortlistMatrix.SetRange("Application No.", JobApplications."Application No.");
                if not CandidateShortlistMatrix.FindSet() then begin

                    CandidateShortlistMatrix.Init;
                    CandidateShortlistMatrix."Application No." := JobApplications."Application No.";
                    CandidateShortlistMatrix."Interview Invitation No." := JobApplications."Interview Invitation No.";
                    CandidateShortlistMatrix."Interview Scoresheet Template" := JobApplications."Interview Scoresheet Template";
                    CandidateShortlistMatrix."Vacancy ID" := JobApplications."Vacancy ID";
                    CandidateShortlistMatrix."Candidate Shortlist Vouch No." := JobApplications."Candidate Shortlist Vouch No.";
                    CandidateShortlistMatrix."Candidate No." := JobApplications."Candidate No.";
                    CandidateShortlistMatrix."First Name" := JobApplications."First Name";
                    CandidateShortlistMatrix."Middle Name" := JobApplications."Middle Name";
                    CandidateShortlistMatrix."Last Name" := JobApplications."Last Name";
                    CandidateShortlistMatrix."Interview Date" := JobApplications."Interview Date";
                    CandidateShortlistMatrix."Interview Start Time" := JobApplications."Interview Start Time";
                    CandidateShortlistMatrix."Interview End Time" := JobApplications."Interview End Time";
                    CandidateShortlistMatrix."Interview Venue" := JobApplications."Interview Venue";
                    CandidateShortlistMatrix."Room No." := JobApplications."Room No.";
                    CandidateShortlistMatrix."Assigned Panel ID" := JobApplications."Assigned Panel ID";
                    CandidateShortlistMatrix."Panel Member No." := JobApplications."Panel Member No.";
                    CandidateShortlistMatrix."Panel Interview Outcome" := JobApplications."Panel Interview Outcome";
                    CandidateShortlistMatrix."Panelist Interview Remarks" := JobApplications."Panelist Interview Remarks";
                    CandidateShortlistMatrix."Unsuccesful App Reason Code" := JobApplications."Unsuccesful App Reason Code";
                    CandidateShortlistMatrix."Document Status" := JobApplications."Document Status";
                    CandidateShortlistMatrix."Document Date" := JobApplications."Document Date";
                    CandidateShortlistMatrix."Posted By" := JobApplications."Posted By";
                    CandidateShortlistMatrix.Posted := JobApplications.Posted;
                    // CandidateShortlistMatrix.TransferFields(JobApplications);
                    CandidateShortlistMatrix."Document No." := CandidateSelectionHeader."Document No.";
                    CandidateShortlistMatrix."Original Document No." := JobApplications."Document No.";
                    CandidateShortlistMatrix.Insert(true);
                end;
            until JobApplications.Next = 0;
        end;
        message('Records Retrieved');
    end;

    procedure FnSuggestINTERVIEWAGGRE(CandidateSelectionHeader: Record "Candidate Interview Record")
    var
        JobApplications: Record "Candidate Interview Record";
        CandidateShortlistMatrix: Record "Individual Interview Outcome";
    begin
        CandidateShortlistMatrix.Reset();
        CandidateShortlistMatrix.SetRange("Document No.", CandidateSelectionHeader."Document No.");
        if CandidateShortlistMatrix.FindSet() then begin
            CandidateShortlistMatrix.DeleteAll();
        end;





        JobApplications.Reset;
        JobApplications.SetRange(Posted, true);
        JobApplications.SetRange("Vacancy Id", CandidateSelectionHeader."Vacancy ID");
        JobApplications.SetRange("Document Type", JobApplications."Document Type"::Individual);
        if JobApplications.FindFirst() then begin
            repeat

                CandidateShortlistMatrix.Init;
                /// CandidateShortlistMatrix.TransferFields(JobApplications);
                CandidateShortlistMatrix."Document No." := CandidateSelectionHeader."Document No.";
                CandidateShortlistMatrix."Original Document No." := JobApplications."Document No.";
                CandidateShortlistMatrix."Application No." := JobApplications."Application No.";
                CandidateShortlistMatrix."Vacancy ID" := JobApplications."Vacancy ID";
                CandidateShortlistMatrix."Candidate No." := JobApplications."Candidate No.";
                CandidateShortlistMatrix."First Name" := JobApplications."First Name";
                CandidateShortlistMatrix."Middle Name" := JobApplications."Middle Name";
                CandidateShortlistMatrix."Last Name" := JobApplications."Last Name";
                CandidateShortlistMatrix."Assigned Panel ID" := JobApplications."Assigned Panel ID";
                CandidateShortlistMatrix."Panel Member No." := JobApplications."Panel Member No.";
                CandidateShortlistMatrix.Member := JobApplications.Member;
                CandidateShortlistMatrix."Panel Interview Outcome" := JobApplications."Panel Interview Outcome";
                JobApplications.CalcFields("Panel Interview Score %", "Oral Interview Score %", "Technical Interview Score %");
                CandidateShortlistMatrix."Panel Oral Interview Score %" := JobApplications."Technical Interview Score %";
                CandidateShortlistMatrix."Panel Tech Interview Score %" := JobApplications."Oral Interview Score %";
                CandidateShortlistMatrix."Panel Interview Score %" := JobApplications."Panel Interview Score %";
                CandidateShortlistMatrix."Panelist Interview Remarks" := JobApplications."Panelist Interview Remarks";
                CandidateShortlistMatrix."Unsuccesful App Reason Code" := JobApplications."Unsuccesful App Reason Code";
                CandidateShortlistMatrix.Posted := JobApplications.Posted;
                CandidateShortlistMatrix.insert(true);
            until JobApplications.Next = 0;

        end;
        message('Records Consolidated successfully');
    end;

    procedure SuggestTemplateScoreGuide(HRScreeningTemplate: Record "HR Screening Template")
    var
        DefaultScoreGuide: Record "Closed Qn Response Option";
        TemplateScoreGuide: Record "Screening Template Score Guide";
        LineNo: Integer;
        TemplateLine: Record "Hr Screening Template Line";
        TXT001: label 'The score guide  for the template %1 has been updated succesfully';
    begin
        TemplateScoreGuide.Reset;
        TemplateScoreGuide.SetRange("Template ID", HRScreeningTemplate.Code);
        if TemplateScoreGuide.FindSet then begin
            TemplateScoreGuide.DeleteAll;
        end;
        TemplateLine.Reset;
        TemplateLine.SetRange("Template ID", HRScreeningTemplate.Code);
        if TemplateLine.FindSet then begin
            repeat
                //check score guide
                DefaultScoreGuide.Reset;
                DefaultScoreGuide.SetRange("Type ID", TemplateLine."Default Rating Scale");
                if DefaultScoreGuide.FindSet then begin
                    repeat
                        //initialize
                        TemplateScoreGuide."Template Type" := HRScreeningTemplate."Template Type";
                        TemplateScoreGuide."Template ID" := HRScreeningTemplate.Code;
                        TemplateScoreGuide."Question Category" := TemplateLine."Question Category";
                        TemplateScoreGuide."Question ID" := TemplateLine."Question Id";
                        TemplateScoreGuide."Default Rating Scale" := TemplateLine."Default Rating Scale";
                        TemplateScoreGuide."Option Code" := DefaultScoreGuide."Option Code";
                        TemplateScoreGuide.Description := DefaultScoreGuide.Description;
                        TemplateScoreGuide."Default Points" := DefaultScoreGuide."Default Points";
                        TemplateScoreGuide.Insert(true);

                    until DefaultScoreGuide.Next = 0;
                end
            until TemplateLine.Next = 0;
            Message(TXT001, TemplateLine."Template ID");
        end
    end;

    procedure NotifyMembers(CommiteeAppoint: Record "Commitee Appointment Voucher")
    var
        FairAttendance: Record "Career Fair Attendance";
        Body: Text;
        SMTP: Codeunit "Email Message";
        // Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        AnnouncementLine: Record "Vacancy Announcement Line";
        Counter: Integer;
        CommiteeAppointedMember: Record "Commitee Appointed Member";
        CommiteeAppointedMember2: Record "Commitee Appointed Member";
        FileDirectory: Text[100];
        FileName: Text[100];
        CommiteeAppoint2: Record "Commitee Appointment Voucher";
        CompInfo: Record "Company Information";
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        SenderAddress: Text[1000];
        RequesterEmail: Text[250];
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        ActivationDetails: Text[259];
    begin

        CommiteeAppointedMember.Reset;
        CommiteeAppointedMember.SetRange("Document No.", CommiteeAppoint."Document No.");
        if CommiteeAppointedMember.FindSet then begin
            repeat

                RequesterEmail := CommiteeAppointedMember."Member Email";

                EmailMessage.Create(RequesterEmail, emailhdr, 'Dear ' + CommiteeAppointedMember."Member Name" + ',<BR><BR>' +
' You are hereby notified that you have been appointed to serve as a committee member:' +
 ' ' + CommiteeAppoint.Description, true);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                CommiteeAppointedMember."Date/Time Notified" := CurrentDatetime;
                CommiteeAppointedMember."Notified on Email" := true;
                CommiteeAppointedMember.Modify(true);
            until CommiteeAppointedMember.Next = 0;

        end
    end;

    procedure FnShortlistStep1(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        JobApplications2: Record "Job Applications";
        JobApplications3: Record "Job Applications";
        JobApplications4: Record "Job Applications";
    begin
        JobApplications.RESET;
        JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
        if JobApplications.FINDSET then begin
            repeat
                JobApplications."Passed County of Origin" := false;
                JobApplications."Passed Date of Birth" := false;
                JobApplications."Passed Ethnicity" := false;
                JobApplications."Passed Gender" := false;
                JobApplications."Passed Minimum Academic" := false;
                JobApplications."Passed Minimum Mngt Exp" := false;
                JobApplications."Passed Minimum Work Exp" := false;
                JobApplications."Passed PWD" := false;
                JobApplications.MODIFY(true);
            until JobApplications.NEXT = 0;
        end;
        SelectionLine.RESET;
        SelectionLine.SETRANGE("Document No", SelectionHeader."Document No.");
        SelectionLine.SETRANGE("Document Type", SelectionLine."Document Type"::"Candidate Shortlisting");
        if SelectionLine.FINDSET then begin
            SelectionLine.DELETEALL;
        end;
    end;

    procedure FnShortlistStep2(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        JobApplications2: Record "Job Applications";
        JobApplications3: Record "Job Applications";
        JobApplications4: Record "Job Applications";
    begin
        if SelectionHeader."Shortlisting Type" = SelectionHeader."Shortlisting Type"::"..." then begin
            ERROR('Error!, Kindly ensure you have selected the Type of Shortlisting');
        end;

        //IF SelectionHeader."Shortlisting Type"=SelectionHeader."Shortlisting Type"::"Mandatories Only" THEN BEGIN
        if SelectionHeader."Min Academic Hierarchy Pointer" <> 0 then begin
            SelectionHeader.TESTFIELD("Minimum Academic Qualification");

            JobApplications.RESET;
            JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
            if JobApplications.FINDSET then begin
                repeat
                    Qualification.RESET;
                    Qualification.SETRANGE(Code, JobApplications."Highest Academic Qualification");
                    if Qualification.FINDSET then begin
                        HierarchyCode := Qualification."Academic Hierachy Code";
                        if HierarchyCode >= SelectionHeader."Min Academic Hierarchy Pointer" then begin
                            JobApplications."Passed Minimum Academic" := true;
                            JobApplications.MODIFY(true);
                        end;
                    end;
                until JobApplications.NEXT = 0;
            end;
        end;

        //                              SelectionLine.INIT;
        //                              SelectionLine."Document Type":=SelectionLine."Document Type"::"Candidate Shortlisting";
        //                              SelectionLine."Document No":=SelectionHeader."Document No.";
        //                              SelectionLine."Application No.":=JobApplications2."Application No.";
        //                              SelectionLine.VALIDATE("Application No.");
        //                              SelectionLine.INSERT:=TRUE;
        //END;
    end;

    procedure FnShortlistStep3(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        JobApplications2: Record "Job Applications";
        JobApplications3: Record "Job Applications";
        JobApplications4: Record "Job Applications";
    begin
        //IF SelectionHeader."Shortlisting Type"=SelectionHeader."Shortlisting Type"::"Mandatories Only" THEN BEGIN
        if SelectionHeader."Minimum Work Experience" <> 0 then begin
            JobApplications.RESET;
            JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
            if JobApplications.FINDSET then begin
                repeat
                    if JobApplications."Work Experience (Years)" >= SelectionHeader."Minimum Work Experience" then begin
                        JobApplications."Passed Minimum Work Exp" := true;
                        JobApplications.MODIFY(true);
                    end;
                until JobApplications.NEXT = 0;
            end;
        end;
        //END;
    end;

    procedure FnShortlistStep4(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        JobApplications2: Record "Job Applications";
        JobApplications3: Record "Job Applications";
        JobApplications4: Record "Job Applications";
    begin
        //IF SelectionHeader."Shortlisting Type"=SelectionHeader."Shortlisting Type"::"Mandatories Only" THEN BEGIN
        if SelectionHeader."Minimum Mngmnt Experience" <> 0 then begin
            JobApplications.RESET;
            JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
            if JobApplications.FINDSET then begin
                repeat
                    if JobApplications."Management Experience (Years)" >= SelectionHeader."Minimum Mngmnt Experience" then begin
                        JobApplications."Passed Minimum Mngt Exp" := true;
                        JobApplications.MODIFY(true);
                    end;
                until JobApplications.NEXT = 0;
            end;
        end;
        //END;
    end;

    procedure FnShortlistStep5(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        JobApplications2: Record "Job Applications";
        JobApplications3: Record "Job Applications";
        JobApplications4: Record "Job Applications";
    begin
        if SelectionHeader."Shortlisting Type" = SelectionHeader."Shortlisting Type"::"Mandatories Only" then begin

            if (SelectionHeader."Min Academic Hierarchy Pointer" <> 0) and (SelectionHeader."Minimum Mngmnt Experience" <> 0) and (SelectionHeader."Minimum Work Experience" <> 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Academic" = true) and (JobApplications."Passed Minimum Work Exp" = true) and (JobApplications."Passed Minimum Mngt Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //1
            if (SelectionHeader."Min Academic Hierarchy Pointer" <> 0) and (SelectionHeader."Minimum Mngmnt Experience" = 0) and (SelectionHeader."Minimum Work Experience" = 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Academic" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //1
            //2
            if (SelectionHeader."Min Academic Hierarchy Pointer" <> 0) and (SelectionHeader."Minimum Mngmnt Experience" <> 0) and (SelectionHeader."Minimum Work Experience" = 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Academic" = true) and (JobApplications."Passed Minimum Work Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //2
            //3
            if (SelectionHeader."Min Academic Hierarchy Pointer" <> 0) and (SelectionHeader."Minimum Mngmnt Experience" = 0) and (SelectionHeader."Minimum Work Experience" <> 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Academic" = true) and (JobApplications."Passed Minimum Mngt Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //3

            //4
            if (SelectionHeader."Min Academic Hierarchy Pointer" = 0) and (SelectionHeader."Minimum Mngmnt Experience" <> 0) and (SelectionHeader."Minimum Work Experience" = 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Work Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //4
            //5
            if (SelectionHeader."Min Academic Hierarchy Pointer" = 0) and (SelectionHeader."Minimum Mngmnt Experience" <> 0) and (SelectionHeader."Minimum Work Experience" <> 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Work Exp" = true) and (JobApplications."Passed Minimum Mngt Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //5
            //6
            if (SelectionHeader."Min Academic Hierarchy Pointer" <> 0) and (SelectionHeader."Minimum Mngmnt Experience" <> 0) and (SelectionHeader."Minimum Work Experience" = 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Academic" = true) and (JobApplications."Passed Minimum Work Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //6

            //7
            if (SelectionHeader."Min Academic Hierarchy Pointer" = 0) and (SelectionHeader."Minimum Mngmnt Experience" = 0) and (SelectionHeader."Minimum Work Experience" <> 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Mngt Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //7
            //8
            if (SelectionHeader."Min Academic Hierarchy Pointer" = 0) and (SelectionHeader."Minimum Mngmnt Experience" <> 0) and (SelectionHeader."Minimum Work Experience" <> 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Work Exp" = true) and (JobApplications."Passed Minimum Mngt Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //8
            //9--
            if (SelectionHeader."Min Academic Hierarchy Pointer" <> 0) and (SelectionHeader."Minimum Mngmnt Experience" = 0) and (SelectionHeader."Minimum Work Experience" <> 0) then begin
                JobApplications.RESET;
                JobApplications.SETRANGE("Vacancy Id", SelectionHeader."Vacancy ID");
                if JobApplications.FINDSET then begin
                    repeat

                        if (JobApplications."Passed Minimum Academic" = true) and (JobApplications."Passed Minimum Mngt Exp" = true) then begin
                            SelectionLine.INIT;
                            SelectionLine."Document Type" := SelectionLine."Document Type"::"Candidate Shortlisting";
                            SelectionLine."Document No" := SelectionHeader."Document No.";
                            SelectionLine."Application No." := JobApplications."Application No.";
                            SelectionLine.VALIDATE("Application No.");
                            if SelectionLine.INSERT(true) then begin
                                JobApplications.Shortlisted := true;
                                JobApplications.MODIFY(true);
                            end;
                        end;

                    until JobApplications.NEXT = 0;
                end;
            end;
            //9--
        end;
    end;


    procedure FnCreateHandOverVoucher(EmployeeExitheader: Record "Employee Exit header")
    var
        HRSetup: Record "Human Resources Setup";
        ExitPlanLines: Record "Exit Plan Lines";
        ExitPlanLinesInsert: Record "Exit Plan Lines";
        EmployeeExitheaderInsert: Record "Employee Exit header";
        HandoverItemLines: Record "Hand over Item Lines";
        NoSeriesManagement: Codeunit "NoSeriesManagement";
        DocType: Option;
        DocNo: Code[30];
        MiscArticleInformation: Record "Misc. Article Information";

    begin
        //TESTFIELD("Date of Join");
        EmployeeExitheader.TESTFIELD("Last working Date");
        EmployeeExitheader.TESTFIELD("Notice Date");
        EmployeeExitheader.TESTFIELD("Employee Exit Date");
        HRSetup.GET;

        ExitPlanLines.RESET;
        ExitPlanLines.SETRANGE("Exit Header No", EmployeeExitheader."Document No.");
        ExitPlanLines.SETRANGE("Document Type", ExitPlanLines."Document Type"::"Exit Voucher");
        if ExitPlanLines.FINDSET then begin
            repeat
                EmployeeExitheaderInsert.INIT;
                EmployeeExitheaderInsert."Document Type" := EmployeeExitheaderInsert."Document Type"::"Hand Over Voucher";
                // EmployeeExitheaderInsert."Document No." := NoSeriesManagement.GetNextNo(HRSetup."Exit HandOver Nos", TODAY, true);
                EmployeeExitheaderInsert.Description := EmployeeExitheader.Description;
                EmployeeExitheaderInsert."Employee No" := EmployeeExitheader."Employee No";
                EmployeeExitheaderInsert."Employee Names" := EmployeeExitheader."Employee Names";
                EmployeeExitheaderInsert."Exit Method" := EmployeeExitheader."Exit Method";
                EmployeeExitheaderInsert."Job Id" := EmployeeExitheader."Job Id";
                EmployeeExitheaderInsert."Reasons Code" := EmployeeExitheader."Reasons Code";
                EmployeeExitheaderInsert."Date of Join" := EmployeeExitheader."Date of Join";
                EmployeeExitheaderInsert."Last working Date" := EmployeeExitheader."Last working Date";
                EmployeeExitheaderInsert."Notice Date" := EmployeeExitheader."Notice Date";
                EmployeeExitheaderInsert."Employee Exit Date" := EmployeeExitheader."Employee Exit Date";
                EmployeeExitheaderInsert."Primary Directorate" := ExitPlanLines."Primary Directorate";
                EmployeeExitheaderInsert."Primary Directorate Name" := ExitPlanLines."Primary Directorate Name";
                EmployeeExitheaderInsert."Primary Department" := ExitPlanLines."Primary Department";
                EmployeeExitheaderInsert."Primary Department Name" := ExitPlanLines."Primary Department Name";
                EmployeeExitheaderInsert."Responsible Employee" := ExitPlanLines."Responsible Employee";
                EmployeeExitheaderInsert."Document Date" := TODAY;
                EmployeeExitheaderInsert."Created By" := USERID;
                EmployeeExitheaderInsert."Created On" := TODAY;
                if EmployeeExitheaderInsert.INSERT(true) then begin
                    DocType := EmployeeExitheaderInsert."Document Type";
                    DocNo := EmployeeExitheaderInsert."Document No.";
                    //Get Items
                    MiscArticleInformation.RESET;
                    MiscArticleInformation.SETRANGE("Employee No.", EmployeeExitheader."Employee No");
                    if MiscArticleInformation.FINDSET then begin
                        repeat
                            HandoverItemLines.INIT;
                            HandoverItemLines."Document Type" := DocType;
                            HandoverItemLines."Exit Header No" := DocNo;
                            HandoverItemLines."Line No" := MiscArticleInformation."Line No.";
                            // HandoverItemLines.Type := MiscArticleInformation.Type;
                            // HandoverItemLines.No := MiscArticleInformation.No;
                            HandoverItemLines.Description := MiscArticleInformation.Description;
                            // HandoverItemLines."Primary Directorate" := MiscArticleInformation."Primary Directorate";
                            // HandoverItemLines."Primary Directorate Name" := MiscArticleInformation."Primary Directorate Name";
                            // HandoverItemLines."Primary Department" := MiscArticleInformation."Primary Department";
                            // HandoverItemLines."Primary Department Name" := MiscArticleInformation."Primary Department Name";
                            HandoverItemLines.INSERT;
                        // HandoverItemLines."Line No":=
                        until MiscArticleInformation.NEXT = 0;
                    end;

                end;
                ExitPlanLines."Hand Doc Over No" := DocNo;
                ExitPlanLines.MODIFY;
            until ExitPlanLines.NEXT = 0;
        end;
        MESSAGE('Departmental Hand Over Vouchers have been generated successfully');
    end;

    // procedure FnGenerateLPODirect(NOA: Record "Maintenance Header")
    // var
    //     PurchaseH: Record "Purchase Header";
    //     PurchaseHead: Record "Purchase Header";
    //     Procurement: Codeunit "Procurement Processing";
    //     IFSList: Record "Standard Purchase Code";
    //     Vendor: Record Vendor;
    //     BidOwner: Record "Bid Business Owner";
    //     VendBusinessOwner: Record "Vendor Business Owner";
    //     BidPreferences: Record "Bid Preference & Reservation";
    //     VendSpecialGroup: Record "Vendor Special Group Entry";
    //     BidLitigation: Record "Bid Litigation History";
    //     VendLitigation: Record "Vendor Litigation History";
    //     BidPastExperience: Record "Bid Past Experience";
    //     VendPastExperience: Record "Vendor Past Experience";
    //     BidAuditedBal: Record "Bid Audited Balance Sheet";
    //     VendAuditedBal: Record "Vendor Audited Balance Sheet";
    //     BidIncomeStat: Record "Bid Audited Income Statement";
    //     VendIncomeStat: Record "Vendor Audited Income Statemen";
    //     BidVendBankAccount: Record "Bid Vendor Bank Account";
    //     VendBankAccount: Record "Vendor Bank Account";
    //     BidKeyStaff: Record "Bid Key Staff";
    //     VendKeyStaff: Record "Vendor Professional Staff";
    //     BidKeyStaffQual: Record "Bid Key Staff Qualification";
    //     VendKeyStaffQual: Record "Vendor Staff Qualification";
    //     BidStaffExperience: Record "Bid Key Staff Experience";
    //     e: Record "Vendor Staff Experience";
    //     Purch: Record "Purchase Header";
    //     CopyPurchDoc: Report "Copy Purchase Document";
    //     Purch2: Record "Purchase Header";
    //     PurchLines: Record "Purchase Line";
    //     PurchLines1: Record "Purchase Line";
    //     Purch3: Record "Purchase Header";
    //     IFS: Record "Standard Purchase Code";
    //     CompanyInfo: Record "Company Information";
    //     IFSLines: Record "Purchase Line";
    //     ContractSecurity: Record "Bid_Contract Security Register";
    //     BidContractSecurity: Record "Bid_Contract Security Register";
    //     //  PurchaseContractEntries: Record "Purchase Contract Entries";
    //     IFSE: Record "Purchase Header";
    // // PurchaseContractEntries2: Record "Purchase Contract Entries";
    // begin
    //     //IF NOT ConfirmManagement.ConfirmProcess(Text001,TRUE) THEN
    //     //  EXIT;
    //     //if Contract
    //     //mtr
    //     // IF Confirm('Are you sure you want to Generate LPO/LSO or Contracts?', TRUE) then begin


    //     Vendor.Reset;
    //     Vendor.SetRange("No.", NOA."Vendor(Dealer)");
    //     if Vendor.FindSet then begin
    //         Purch.Init;
    //         Purch."Document Type" := Purch."document type"::Order;
    //         Purch."Awarded Bid No" := NOA."Vendor(Dealer)";
    //         Purch.Validate("Buy-from Vendor No.", NOA."Vendor(Dealer)");

    //         if Purch.Insert(true) then
    //             PurchLines.Reset;
    //         PurchLines.SetRange("Document No.", Purch."No.");
    //         if PurchLines.FindSet then begin
    //             PurchLines.DeleteAll;
    //         end;
    //         PurchLines.Init;
    //         PurchLines."Document Type" := PurchLines."document type"::Order;
    //         PurchLines."Document No." := Purch."No.";
    //         PurchLines.type := PurchLines.Type::"G/L Account";
    //         PurchLines."Line No." := 1000;
    //         PurchLines."No." := NOA."G/L Account";
    //         PurchLines.Description := NOA."G/L Account Name";
    //         PurchLines.Quantity := 1;
    //         PurchLines."Direct Unit Cost" := NOA."Estimated Cost";
    //         //posting groups
    //         if PurchLines.Insert(true) then begin
    //             PurchLines.Validate("Direct Unit Cost");
    //         end;





    //         Page.Run(50, Purch);

    //     end;

    //     //end;
    //     Message('Successful %1', Purch."No.");

    // end;

    // procedure AcceptJobOffer(ApplicantNo: Text; Comments: Text; OfferID: Text)
    // var
    //     EmploymentOffer: Record "Employment Offer";
    // begin
    //     EmploymentOffer.reset;
    //     EmploymentOffer.SetRange("Offer ID", OfferID);
    //     if EmploymentOffer.find('-') then begin
    //         EmploymentOffer."Candidate Response Date" := Today;
    //         EmploymentOffer."Offer Acceptance Status" := EmploymentOffer."Offer Acceptance Status"::Accepted;
    //         EmploymentOffer.Modify();
    //     end;
    // end;

    procedure RejectJobOffer(ApplicantNo: Text; Comments: Text; OfferID: Text)
    var
        EmploymentOffer: Record "Employment Offer";
    begin
        EmploymentOffer.reset;
        EmploymentOffer.SetRange("Offer ID", OfferID);
        if EmploymentOffer.find('-') then begin
            EmploymentOffer."Candidate Response Date" := Today;
            EmploymentOffer."Offer Acceptance Status" := EmploymentOffer."Offer Acceptance Status"::Rejected;
            EmploymentOffer.Modify();
        end;
    end;





}

