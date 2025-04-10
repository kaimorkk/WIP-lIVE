report 95023 "Management Action Status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Management Action Status.rdlc';

    dataset
    {
        dataitem("Audit Management Action Ledger"; "Audit Management Action Ledger")
        {
            RequestFilterFields = "Auditor Followup Review Status", "Engagement ID", "Primary RC ID", "Management Action ID";
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
            column(Actionownername; Actionowner)
            {
            }
            column(EntryNo_AuditManagementActionLedger; "Audit Management Action Ledger"."Entry No.")
            {
            }
            column(FinalAuditReportID_AuditManagementActionLedger; "Audit Management Action Ledger"."Final Audit Report ID")
            {
            }
            column(EngagementID_AuditManagementActionLedger; "Audit Management Action Ledger"."Engagement ID")
            {
            }
            column(ChecklistID_AuditManagementActionLedger; "Audit Management Action Ledger"."Checklist ID")
            {
            }
            column(FindingID_AuditManagementActionLedger; "Audit Management Action Ledger"."Finding ID")
            {
            }
            column(ManagementActionID_AuditManagementActionLedger; "Audit Management Action Ledger"."Management Action ID")
            {
            }
            column(Description_AuditManagementActionLedger; "Audit Management Action Ledger".Description)
            {
            }
            column(PrimaryRCID_AuditManagementActionLedger; "Audit Management Action Ledger"."Primary RC ID")
            {
            }
            column(ActionOwnerID_AuditManagementActionLedger; "Audit Management Action Ledger"."Action Owner ID")
            {
            }
            column(DueDate_AuditManagementActionLedger; "Audit Management Action Ledger"."Due Date")
            {
            }
            column(ActionType_AuditManagementActionLedger; "Audit Management Action Ledger"."Action Type")
            {
            }
            column(TaskPriority_AuditManagementActionLedger; "Audit Management Action Ledger"."Task Priority")
            {
            }
            column(AuditeeImplementationStatus_AuditManagementActionLedger; "Audit Management Action Ledger"."Auditee Implementation Status")
            {
            }
            column(AuditeeComplete_AuditManagementActionLedger; "Audit Management Action Ledger"."Auditee % Complete")
            {
            }
            column(ActualDateDone_AuditManagementActionLedger; "Audit Management Action Ledger"."Actual Date Done")
            {
            }
            column(AuditObjectiveID_AuditManagementActionLedger; "Audit Management Action Ledger"."Audit Objective ID")
            {
            }
            column(DimensionSetID_AuditManagementActionLedger; "Audit Management Action Ledger"."Dimension Set ID")
            {
            }
            column(AuditorFollowupReviewStatus_AuditManagementActionLedger; "Audit Management Action Ledger"."Auditor Followup Review Status")
            {
            }
            column(AuditorFollowupComments_AuditManagementActionLedger; "Audit Management Action Ledger"."Auditor Followup Comments")
            {
            }
            column(LastPostedImplStatusRepot_AuditManagementActionLedger; "Audit Management Action Ledger"."Last Posted Impl. Status Repot")
            {
            }
            column(LastPostedFolAuditVoucher_AuditManagementActionLedger; "Audit Management Action Ledger"."Last Posted Fol. Audit Voucher")
            {
            }
            column(LastAuditorReviewDate_AuditManagementActionLedger; "Audit Management Action Ledger"."Last Auditor Review Date")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Audit Management Action Ledger"."Action Owner ID");
                if Resource.FindSet then
                    Actionowner := Resource.Name;
            end;
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        Resource: Record Resource;
        Actionowner: Text[250];
}

