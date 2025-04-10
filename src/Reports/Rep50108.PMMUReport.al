report 50108 "PMMU Report"
{
    ApplicationArea = All;
    Caption = 'PMMU Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = PMMURDLC;

    dataset
    {
        dataitem(PerfomanceContractHeader; "Perfomance Contract Header")
        {
            RequestFilterFields = No, "Document Type";

            column(CompanyName; CompInfo.Name)
            {
            }
            column(Description; Description)
            {
            }
            column(AdminUnitName_PerfomanceContractHeader; "Admin Unit Name")
            {
            }
            column(StartDate_PerfomanceContractHeader; "Start Date")
            {
            }
            column(EndDate_PerfomanceContractHeader; "End Date")
            {
            }
            column(CreatedBy_PerfomanceContractHeader; "Created By")
            {
            }
            column(CompanyPic; CompInfo.Picture)
            {
            }
            column(Filters; Filters)
            {
            }
            column(ChiefRegistrarName; ChiefRegistrar.FullName())
            {

            }
            column(ChiefRegistrarPositionName; ChiefRegistrar."Job Title2")
            {

            }
            column(DirectorHRName; DirectorHR.FullName())
            {

            }
            column(DirectorHRPositionName; DirectorHR."Job Title2")
            {

            }
            column(EvaluationPanelEmployeeName; EvaluationPanelEmployee.FullName())
            {

            }
            column(EvaluationPanelEmployeePositionName; EvaluationPanelEmployee."Job Title2")
            {

            }
            column(EvaluationCommitteeEmployeeName; EvaluationCommitteeEmployee.FullName())
            {

            }
            column(EvaluationCommitteeEmployeePositionName; EvaluationCommitteeEmployee."Job Title2")
            {

            }

            dataitem("PMMU Activities"; "PMMU Activities")
            {
                DataItemLink = "Strategy Plan ID" = field("Strategy Plan ID"), "Contract No." = field(No);
                column(Perspectives_PMMUActivities; Perspectives)
                {
                }
                column(KeyresultAreas_PMMUActivities; "Key result Areas")
                {
                }
                column(KeyIndicators_PMMUActivities; "Key Indicators")
                {
                }
                column(Activities_PMMUActivities; Activities)
                {
                }
                column(StrategyOutputCode_PMMUActivities; "Strategy Output Code")
                {
                }
                column(Outputs_PMMUActivities; Outputs)
                {
                }
                column(OutputIndicators_PMMUActivities; "Output Indicators")
                {
                }
                column(Target_PMMUActivities; Target)
                {
                }
                column(AchievedTarget_PMMUActivities; "Achieved Target")
                {
                }
                column(Weight_PMMUActivities; Weight)
                {
                }
                column(UnitofMeasure_PMMUActivities; "Unit of Measure")
                {
                }
                column(Outcome_PMMUActivities; Outcome)
                {
                }
                column(BaselineTarget_PMMUActivities; "Baseline Target")
                {
                }
                column(Comments_PMMUActivities; Comments)
                {
                }
                column(Score_PMMUActivities; Score)
                {
                }
                /* column(PmmuOutputActivity; PmmuOutputActivity)
                {
                } 
                trigger OnAfterGetRecord()
                begin
                    PmmuOutputActivity := '';
                    PMMUOutActivities.Reset();
                    PMMUOutActivities.SetRange("Contract No.", "PMMU Activities"."Contract No.");
                    PMMUOutActivities.SetRange("Strategy Output Code", "PMMU Activities"."Strategy Output Code");
                    PMMUOutActivities.SetRange("Entry No.", "PMMU Activities"."Entry No.");
                    PMMUOutActivities.SetRange("Strategy Plan ID", "PMMU Activities"."Strategy Plan ID");
                    if PMMUOutActivities.FindSet() then
                        repeat
                            PmmuOutputActivity += PMMUOutActivities."Activities" + '; ';
                        until PMMUOutActivities.Next() = 0; 
                end;
                */

                dataitem("PMMU Output Activities"; "PMMU Output Activities")
                {
                    DataItemLink = "Contract No." = field("Contract No."),
                    "Strategy Output Code" = field("Strategy Output Code"), "Entry No." = field("Entry No."),
                    "Strategy Plan ID" = field("Strategy Plan ID");
                    column(Activities_PMMUOutputActivities; Activities)
                    {
                    }
                }

            }

            trigger OnPreDataItem()
            begin
                CompInfo.GET;
                CompInfo.CalcFields(Picture);
                Filters := PerfomanceContractHeader.GetFilters;
            end;

            trigger OnAfterGetRecord()
            begin
                ChiefRegistrar.Reset();
                ChiefRegistrar.SetRange("Current Position ID", '155');
                ChiefRegistrar.SetRange(Status, ChiefRegistrar.Status::Active);
                if ChiefRegistrar.FindFirst() then;

                DirectorHR.Reset;
                DirectorHR.SetRange("No.", PerfomanceContractHeader."Responsible Employee No.");
                DirectorHR.SetRange(Status, DirectorHR.Status::Active);
                If DirectorHR.FindFirst() then;

                EvaluationPanel.Reset;
                EvaluationPanel.SetRange("Document No.", PerfomanceContractHeader."Target Setting Commitee");
                EvaluationPanel.SetRange(Role, EvaluationPanel.Role::Chairperson);
                if EvaluationPanel.FindFirst() then
                    if EvaluationPanelEmployee.Get(EvaluationPanel."Member No.") then;

                EvaluationCommittee.Reset;
                EvaluationCommittee.SetRange("Document No.", PerfomanceContractHeader."Evaluation Commitee");
                EvaluationCommittee.SetRange(Role, EvaluationCommittee.Role::Chairperson);
                if EvaluationCommittee.FindFirst() then
                    if EvaluationCommitteeEmployee.Get(EvaluationPanel."Member No.") then;
            end;
        }

    }

    rendering
    {
        layout(PMMURDLC)
        {
            Type = RDLC;
            LayoutFile = './Layouts/PMMUReportRDLC.rdlc';
        }
        // layout(PMMUWord)
        // {
        //     Type = Word;
        //     LayoutFile = './Layouts/PMMUReport.docx';
        // }
    }

    var
        CompInfo: Record "Company Information";
        Filters: Text;
        PMMUOutActivities: Record "PMMU Output Activities";
        PmmuOutputActivity: Text;
        ChiefRegistrar: Record Employee;
        DirectorHR: Record Employee;
        Employee: Record Employee;
        EvaluationPanel: Record "Commitee Appointed Member";
        EvaluationPanelEmployee: Record Employee;
        EvaluationCommittee: Record "Commitee Appointed Member";
        EvaluationCommitteeEmployee: Record Employee;
}
