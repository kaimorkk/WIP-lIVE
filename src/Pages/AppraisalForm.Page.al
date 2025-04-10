Page 52194108 "Appraisal Form"
{
    PageType = Card;
    SourceTable = "Employee Appraisals1";

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
                field(AppraisalPeriod; "Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalType; "Appraisal Type")
                {
                    ApplicationArea = Basic;
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
                field(AppraiseesJobTitle; "Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobID; "Job ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job ID';
                }
                field(DirectorateCode; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName; "Directorate Name")
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
                field(AppraiseesJobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job Group';
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
                part(Control1000000026; "Performance Grade Definitions")
                {
                }
            }
            part(TechnicalCompetenciesFinancialStrategicPerspective; "Performance Plan")
            {
                Caption = 'Technical Competencies Financial Strategic Perspective';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(TechnicalCompetencesStakeholderStrategicPerspectiv; "Technical Competences-Stakehol")
            {
                Caption = 'Technical Competences-Stakeholder Strategic Perspective';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(Control1000000013; "Technical Competences-IBP")
            {
                Caption = 'Technical Competences-Internal Business Processes';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            part(TechnicalCompetencesLearningandGrowth; "Technical Competences-Learning")
            {
                Caption = 'Technical Competences-Learning and Growth';
                SubPageLink = "Appraisal No" = field("Appraisal No");
            }
            group(BehaviouralCompetences)
            {
                Caption = 'Behavioural Competences';
                part(Control1000000004; "Behavioural Competencies")
                {
                    SubPageLink = "Appraisal No" = field("Appraisal No");
                }
            }
            group(SCORESUMMARYANDMITIGATINGFACTORSIFANY)
            {
                Caption = 'SCORE SUMMARY AND MITIGATING FACTORS (IF ANY)';
                field(TCWeightedRatings; "TC Weighted Ratings")
                {
                    ApplicationArea = Basic;
                }
                field(BCWeightedRatings; "BC Weighted Ratings")
                {
                    ApplicationArea = Basic;
                }
                field(TCOverallScore; "TC Overall Score")
                {
                    ApplicationArea = Basic;
                }
                field(BCOverallScore; "BC Overall Score")
                {
                    ApplicationArea = Basic;
                }
                field(OverallScore; OverallScore)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overall Score';
                }
                field(Rating; Rating)
                {
                    ApplicationArea = Basic;
                }
                field(RatingDescription; "Rating Description")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeAgreementWithRating; "Agreement With Rating")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee Agreement With Rating';
                }
                label(Control1000000028)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19016900;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(MitigatingFactors; "General Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mitigating Factors';
                }
            }
            part(Control1000000011; "Appraisal Development Needs")
            {
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Employee No." = field("Employee No");
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
                        // //if ApprovalMgt.SendAppraisalApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelAppraisalApprovalRequest(Rec,true,true) then;
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
                Enabled = true;
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

                trigger OnAction()
                begin
                    EmployeeAppraisals.Reset;
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Employee No", "Employee No");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal Period", "Appraisal Period");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal Category", "Appraisal Category");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal No", "Appraisal No");
                    if EmployeeAppraisals.Find('-') then
                        // BEGIN
                        // IF EmployeeAppraisals."Appraisal Type"='Annual' THEN
                        Report.RunModal(51511181, true, false, EmployeeAppraisals);
                    // ELSE IF EmployeeAppraisals."Appraisal Type"='Mid Year' THEN
                    //    REPORT.RUNMODAL(51511188,TRUE,FALSE,EmployeeAppraisals);
                    //END;
                end;
            }
            action("Next page")
            {
                ApplicationArea = Basic;
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
        HumanResSetup.Get;
        CalcFields("TC Weighted Ratings");
        "TC Overall Score" := HumanResSetup."Technical Competence Overall %" * ("TC Weighted Ratings" / 100);

        HumanResSetup.Get;
        CalcFields("BC Weighted Ratings");
        "BC Overall Score" := HumanResSetup."Behaviour Competence Overall %" * ("BC Weighted Ratings" / 100);


        OverallScore := "TC Overall Score" + "BC Overall Score";
    end;

    trigger OnAfterGetRecord()
    begin
        if Employee.Get("Employee No") then
            //IF Employee.Position<>'' THEN
            if Jobs.Get(Employee.Position) then
        ;
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
        OverallScore: Decimal;
        HumanResSetup: Record "Human Resources Setup";
}

