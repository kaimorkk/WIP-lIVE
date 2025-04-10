Page 52194034 "Company Jobs"
{
    PageType = Card;
    SourceTable = "Company Jobs1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(JobTitle;"Job Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                }
                field(ImmediateSupervisor;"Position Reporting to")
                {
                    ApplicationArea = Basic;
                    Caption = 'Immediate Supervisor';
                }
                field(Dimension1;"Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName;"Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension2;"Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName;"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(Grade;Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Objective;Objective)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective/Function';
                    MultiLine = true;
                }
                field(NoofPosts;"No of Posts")
                {
                    ApplicationArea = Basic;
                }
                field(NoofHolders;"Occupied Establishments")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Holders';
                }
                field(VacantEstablishments;"Vacant Establishments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacant Positions';
                    Editable = false;
                }
                field(NoticePeriod;"Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field(ProbationPeriod;"Probation Period")
                {
                    ApplicationArea = Basic;
                }
                field(DateActive;"Date Active")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                Caption = 'Job';
                action(PositionsReportingtoJobHolder)
                {
                    ApplicationArea = Basic;
                    Caption = 'Positions Reporting to Job Holder';
                    RunObject = Page "J. Position Supervised";
                    RunPageLink = "Job ID"=field("Job ID");
                }
                action(JobSpecification)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Specification';
                    RunObject = Page "J. Specification";
                    RunPageLink = "Job ID"=field("Job ID");
                }
                action(KeyResponsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Responsibilities';
                    RunObject = Page "J. Responsiblities";
                    RunPageLink = "Job ID"=field("Job ID");
                }
                action(WorkingRelationships)
                {
                    ApplicationArea = Basic;
                    Caption = 'Working Relationships';
                    RunObject = Page "J. Working Relationships";
                    RunPageLink = "Job ID"=field("Job ID");
                }
                action(QualifiedEmployees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualified Employees';
                    RunObject = Page "Qualifying Employees";
                    RunPageLink = "Job ID"=field("Job ID");

                    trigger OnAction()
                    begin
                        Qualifying.Reset;
                        Qualifying.SetRange(Qualifying."Job ID","Job ID");
                        if Qualifying.Find('-') then
                        Qualifying.DeleteAll;


                        //Employee start
                        Employee.Reset;
                        if Employee.Find('-') then
                         repeat

                        Qualifies:=true;

                        JobReq.Reset;
                        JobReq.SetRange(JobReq."Job Id","Job ID");
                        if JobReq.Find('-') then
                        begin
                        repeat

                        EmpQualification.Reset;
                        EmpQualification.SetCurrentkey("Employee No.","Line No.");
                        EmpQualification.SetRange(EmpQualification."Employee No.",Employee."No.");
                        EmpQualification.SetRange(EmpQualification."Qualification Type",JobReq."Qualification Type");
                        EmpQualification.SetRange(EmpQualification."Qualification Code",JobReq."Qualification Code");
                        if EmpQualification.Find('-') then
                        begin repeat

                        until EmpQualification.Next=0;
                        end else Qualifies:=false;
                        until JobReq.Next = 0;
                        end;

                        if Qualifies then
                         begin
                          Qualifying.Init;
                          Qualifying."Job ID":=JobReq."Job Id";
                          Qualifying."Employee No":=EmpQualification."Employee No.";
                         Employee.Reset;
                         if Employee.Get(EmpQualification."Employee No.") then
                          Qualifying."Employee Name":=Employee."First Name"+'  '+Employee."Middle Name"+'  '+Employee."Last Name";
                        if not Qualifying.Get(Qualifying."Employee No",Qualifying."Job ID") then
                          Qualifying.Insert;
                         end;

                        until Employee.Next=0;//End Eployee

                        //Start Applicant
                        Applicant.Reset;
                        if Applicant.Find('-') then
                         repeat

                           Qualifies:=true;

                          JobReq.Reset;
                          JobReq.SetRange(JobReq."Job Id","Job ID");
                          if JobReq.Find('-') then
                          begin
                           repeat
                        ApplicantQualification.Reset;
                        ApplicantQualification.SetCurrentkey("Applicant No.","Qualification Type","Qualification Code");
                        ApplicantQualification.SetRange(ApplicantQualification."Applicant No.",Applicant."No.");
                        ApplicantQualification.SetRange(ApplicantQualification."Qualification Type",JobReq."Qualification Type");
                        ApplicantQualification.SetRange(ApplicantQualification."Qualification Code",JobReq."Qualification Code");
                        if ApplicantQualification.Find('-') then
                        begin repeat

                        until ApplicantQualification.Next=0;
                        end else Qualifies:=false;

                           until JobReq.Next = 0;
                          end;

                         if Qualifies then
                         begin
                          Qualifying.Init;
                          Qualifying."Job ID":=JobReq."Job Id";
                          Qualifying."Employee No":=ApplicantQualification."Applicant No.";
                         Applicant.Reset;
                         if Applicant.Get(ApplicantQualification."Applicant No.") then
                          Qualifying."Employee Name":=Applicant."First Name"+'  '+Applicant."Middle Name"+'  '+Applicant."Last Name";
                        if not Qualifying.Get(Qualifying."Employee No",Qualifying."Job ID") then
                          Qualifying.Insert;
                         end;

                         until Applicant.Next=0;
                        //End of Applicant
                    end;
                }
                separator(Action1000000025)
                {
                }
                action(VacantPositions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacant Positions';
                    RunObject = Page "Vacant Establishments";
                }
                action(OverStaffedPositions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Over Staffed Positions';
                    RunObject = Page "Over Staffed Establishments";
                }
            }
        }
        area(processing)
        {
            action(Preview)
            {
                ApplicationArea = Basic;
                Caption = 'Preview';

                trigger OnAction()
                begin
                    Jobs.Reset;
                    Jobs.SetRange(Jobs."Job ID","Job ID");
                    if Jobs.Find('-') then
                    Report.RunModal(51511104,true,false,Jobs);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Preview_Promoted; Preview)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        Jobs: Record "Company Jobs1";
        Qualifying: Record "Qualifying Employees";
        JobReq: Record "Job Requirementx1";
        EmpQualification: Record "Employee Qualification";
        Employee: Record Employee;
        Qualifies: Boolean;
        Applicant: Record Applicants1;
        ApplicantQualification: Record "Applicants Qualification1";

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        if "No of Posts" <> xRec."No of Posts" then
         "Vacant Establishments" := "No of Posts" - "Occupied Establishments";
    end;
}

