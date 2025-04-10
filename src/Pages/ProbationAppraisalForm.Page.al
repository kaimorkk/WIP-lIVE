Page 52194360 "Probation Appraisal Form"
{
    PageType = Card;
    SourceTable = "Employee Appraisals-Probation";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(AppraisalNo; "Appraisal No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraisalStartDate; "Appraisal Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalEndDate; "Appraisal End Date")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalCategory; "Appraisal Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraiseesNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s No.';
                    Editable = false;
                }
                field(AppraiseeName; "Appraisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobID; "Job ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job ID';
                }
                field(AppraiseesJobTitle; "Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(JobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(DeapartmentCode; "Deapartment Code")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateCode; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(DateofFirstAppointment; "Date of First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(PostonFirstAppointment; "Post on First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(PresentSubstantivePost; "Present Substantive Post")
                {
                    ApplicationArea = Basic;
                }
                field(MainResposibilitiesFunctions; "Main Resposibilities/Functions")
                {
                    ApplicationArea = Basic;
                }
                field(ActingAppointmentIfany; "Acting Appointment(If any)")
                {
                    ApplicationArea = Basic;
                }
                field(StartofActing; "Start of Acting")
                {
                    ApplicationArea = Basic;
                }
                field(EndofActing; "End of Acting")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserNo; "Appraiser No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraisersName; "Appraisers Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                part(Control1000000028; "Probation Appraisal Criteria")
                {
                }
                part(Control1000000020; "Probation Appraisal Criteria S")
                {
                }
            }
            part(ProbationSelfAssessment; "Probation Self Assessment")
            {
                Caption = 'Probation Self Assessment';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(ProbationQualificationandTraining; "Probation Qualif. & Training")
            {
                Caption = 'Probation Qualification and Training';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(PerformanceEvaluationSelf; "Performance Evaluation(Self)")
            {
                Caption = 'Performance Evaluation(Self)';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(PerformanceEvaluationAppraiser; "Performance Evaluation(Apprai)")
            {
                Caption = 'Performance Evaluation(Appraiser)';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(Control1000000004; "Appraiser & Appraiser Comments")
            {
                Caption = 'Probation Appraiser & Appraiser Comments';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(Control1000000011; "Probation Committee Recommend")
            {
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            group(Control1000000006)
            {
                field(TotalScoreSelfEval; "Total Score(Self Eval)")
                {
                    ApplicationArea = Basic;
                }
                field(TotalScoreAppraiserEval; "Total Score(Appraiser Eval)")
                {
                    ApplicationArea = Basic;
                }
                field(SelfEvalTotalScore; "Self Eval Total Score (%)")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserEvalTotalScore; "Appraiser Eval Total Score (%)")
                {
                    ApplicationArea = Basic;
                }
                field(OverallScore; "Overall Score(%)")
                {
                    ApplicationArea = Basic;
                }
                field(OverallGrading; "Overall Grading")
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
            group(PerformanceAppraisal)
            {
                Caption = 'Performance Appraisal';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendProbAppraisalApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelProbAppraisalApprovalRequest(Rec, true, true) then;
                    end;
                }
            }
        }
        area(processing)
        {
            action("<<Back")
            {
                ApplicationArea = Basic;
                Caption = '<<Back';
                Enabled = false;
                Visible = false;

                trigger OnAction()
                begin
                    if EmployeeAppraisals.Get("Appraisal No") then
                        Page.RunModal(51511409, EmployeeAppraisals);
                end;
            }
            action(Preview)
            {
                ApplicationArea = Basic;
                Caption = 'Preview';
                Visible = false;

                trigger OnAction()
                begin
                    EmployeeAppraisals.Reset;
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Employee No", "Employee No");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal Period", "Appraisal Period");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal Category", "Appraisal Category");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal No", "Appraisal No");
                    if EmployeeAppraisals.Find('-') then begin
                        if EmployeeAppraisals."Appraisal Type" = 'Annual' then
                            Report.RunModal(51511181, true, false, EmployeeAppraisals)
                        else if EmployeeAppraisals."Appraisal Type" = 'Mid Year' then
                            Report.RunModal(51511188, true, false, EmployeeAppraisals);
                    end;
                end;
            }
            action("Next page")
            {
                ApplicationArea = Basic;
                Enabled = false;
                RunObject = Page "Appraisal Page 2";
                Visible = false;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("<<Back_Promoted"; "<<Back")
                {
                }
                actionref(Preview_Promoted; Preview)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        "Self Eval Total Score (%)" := ("Total Score(Self Eval)" / 140) * 100;

        "Appraiser Eval Total Score (%)" := ("Total Score(Appraiser Eval)" / 140) * 100;

        "Overall Score(%)" := ("Appraiser Eval Total Score (%)" + "Self Eval Total Score (%)") / 2;
    end;

    trigger OnAfterGetRecord()
    begin
        if Employee.Get("Employee No") then
            //IF Employee.Position<>'' THEN
            if Jobs.Get(Employee.Position) then
        ;
    end;

    trigger OnOpenPage()
    begin
        SetRange("Appraisee ID", UserId);
    end;

    var
        Employee: Record Employee;
        Jobs: Record "Company Jobs1";
        EmployeeApp: Record "Employee Appraisals1";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Text19018837: label 'Technical Competences';
        Text19036363: label 'Behavioural Competencies';
        Text19036368: label 'Core Values';
        Text19018838: label 'Financial Strategic Perspective';
        Text19018839: label 'Stakeholder Strategic Perspective';
        Text19018840: label 'Inhouse Business Process Strategic Perspective';
        Text19018841: label 'Learning and Growth Strategic Perspective';
        Text19016900: label 'Mitigating Factors(if any)';
        EmployeeAppraisals: Record "Employee Appraisals1";
}

