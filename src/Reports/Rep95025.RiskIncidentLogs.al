report 95025 "Risk Incident Logs"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Risk Incident Logs.rdlc';

    dataset
    {
        dataitem("Risk Incident Log"; "Risk Incident Log")
        {
            column(IncidentID_RiskIncidentLog; "Risk Incident Log"."Incident ID")
            {
            }
            column(RiskRegisterType_RiskIncidentLog; "Risk Incident Log"."Risk Register Type")
            {
            }
            column(RiskManagementPlanID_RiskIncidentLog; "Risk Incident Log"."Risk Management Plan ID")
            {
            }
            column(RiskID_RiskIncidentLog; "Risk Incident Log"."Risk ID")
            {
            }
            column(RiskIncidentCategory_RiskIncidentLog; "Risk Incident Log"."Risk Incident Category")
            {
            }
            column(IncidentDescription_RiskIncidentLog; "Risk Incident Log"."Incident Description")
            {
            }
            column(SeverityLevel_RiskIncidentLog; "Risk Incident Log"."Severity Level")
            {
            }
            column(OccurrenceType_RiskIncidentLog; "Risk Incident Log"."Occurrence Type")
            {
            }
            column(IncidentDate_RiskIncidentLog; "Risk Incident Log"."Incident Date")
            {
            }
            column(IncidentStartTime_RiskIncidentLog; "Risk Incident Log"."Incident Start Time")
            {
            }
            column(IncidentEndTime_RiskIncidentLog; "Risk Incident Log"."Incident End Time")
            {
            }
            column(IncidentLocationDetails_RiskIncidentLog; "Risk Incident Log"."Incident Location Details")
            {
            }
            column(PrimaryTriggerID_RiskIncidentLog; "Risk Incident Log"."Primary Trigger ID")
            {
            }
            column(RootCauseSummary_RiskIncidentLog; "Risk Incident Log"."Root Cause Summary")
            {
            }
            column(CategoryofPersonReporting_RiskIncidentLog; "Risk Incident Log"."Category of Person Reporting")
            {
            }
            column(ReportedByName_RiskIncidentLog; "Risk Incident Log"."Reported By (Name)")
            {
            }
            column(IncidentClass_RiskIncidentLog; "Risk Incident Log"."Incident Class")
            {
            }
            column(HSEManagementPlanID_RiskIncidentLog; "Risk Incident Log"."HSE Management Plan ID")
            {
            }
            column(HazardID_RiskIncidentLog; "Risk Incident Log"."Hazard ID")
            {
            }
            column(ActualFinancialImpactLCY_RiskIncidentLog; "Risk Incident Log"."Actual Financial Impact (LCY)")
            {
            }
            column(ActualScheduleDelayDays_RiskIncidentLog; "Risk Incident Log"."Actual Schedule Delay(Days)")
            {
            }
            column(ActualNoInjuredPersons_RiskIncidentLog; "Risk Incident Log"."Actual No. Injured Persons")
            {
            }
            column(ActualNoofFatalities_RiskIncidentLog; "Risk Incident Log"."Actual No. of Fatalities")
            {
            }
            column(NoofPartiesInvolved_RiskIncidentLog; "Risk Incident Log"."No. of Parties Involved")
            {
            }
            column(NoofCorrectiveActions_RiskIncidentLog; "Risk Incident Log"."No. of Corrective Actions")
            {
            }
            column(NoofPreventiveActions_RiskIncidentLog; "Risk Incident Log"."No. of Preventive Actions")
            {
            }
            column(PoliceReportReferenceNo_RiskIncidentLog; "Risk Incident Log"."Police Report Reference No.")
            {
            }
            column(PoliceReportDate_RiskIncidentLog; "Risk Incident Log"."Police Report Date")
            {
            }
            column(PoliceStation_RiskIncidentLog; "Risk Incident Log"."Police Station")
            {
            }
            column(ReportingOfficer_RiskIncidentLog; "Risk Incident Log"."Reporting Officer")
            {
            }
            column(ProjectID_RiskIncidentLog; "Risk Incident Log"."Project ID")
            {
            }
            column(WorkExecutionPlanID_RiskIncidentLog; "Risk Incident Log"."Work Execution Plan ID")
            {
            }
            column(CorporateStrategicPlanID_RiskIncidentLog; "Risk Incident Log"."Corporate Strategic Plan ID")
            {
            }
            column(YearCode_RiskIncidentLog; "Risk Incident Log"."Year Code")
            {
            }
            column(DirectorateID_RiskIncidentLog; "Risk Incident Log"."Directorate ID")
            {
            }
            column(DepartmentID_RiskIncidentLog; "Risk Incident Log"."Department ID")
            {
            }
            column(RegionID_RiskIncidentLog; "Risk Incident Log"."Region ID")
            {
            }
            column(DimensionSetID_RiskIncidentLog; "Risk Incident Log"."Dimension Set ID")
            {
            }
            column(Status_RiskIncidentLog; "Risk Incident Log".Status)
            {
            }
            column(CreatedBy_RiskIncidentLog; "Risk Incident Log"."Created By")
            {
            }
            column(CreatedDateTime_RiskIncidentLog; "Risk Incident Log"."Created Date Time")
            {
            }
            column(Posted_RiskIncidentLog; "Risk Incident Log".Posted)
            {
            }
            column(PostingDate_RiskIncidentLog; "Risk Incident Log"."Posting Date")
            {
            }
            column(NoSeries_RiskIncidentLog; "Risk Incident Log"."No. Series")
            {
            }
            column(RiskDescription_RiskIncidentLog; "Risk Incident Log"."Risk Description")
            {
            }
            column(IncidentTime_RiskIncidentLog; "Risk Incident Log"."Incident Time")
            {
            }
            column(EscalatetoOfficerNo_RiskIncidentLog; "Risk Incident Log"."Escalate to Officer No")
            {
            }
            column(EcalatetoOfficerName_RiskIncidentLog; "Risk Incident Log"."Ecalate to Officer Name")
            {
            }
            column(Email_RiskIncidentLog; "Risk Incident Log".Email)
            {
            }
            column(DocumentCreator_RiskIncidentLog; "Risk Incident Log".DocumentCreator)
            {
            }
            column(Escalated_RiskIncidentLog; "Risk Incident Log"."Escalated?")
            {
            }
            column(Response_RiskIncidentLog; "Risk Incident Log".Response)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

