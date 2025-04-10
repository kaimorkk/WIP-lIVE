report 70099 "Opinion Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Opinion Report.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header"; "Bid Tabulation Header")
        {
            column(image1; corec.Picture)
            {
            }
            column(name; corec.Name)
            {
            }
            column(IFS_END_DATE; Submission_enddate)
            {
            }
            column(Code_BidTabulationHeader; "Bid Tabulation Header".Code)
            {
            }
            column(DocumentType_BidTabulationHeader; "Bid Tabulation Header"."Document Type")
            {
            }
            column(IFSCode_BidTabulationHeader; "Bid Tabulation Header"."IFS Code")
            {
            }
            column(DocumentDate_BidTabulationHeader; "Bid Tabulation Header"."Document Date")
            {
            }
            column(FinalEvaluationReportID_BidTabulationHeader; "Bid Tabulation Header"."Final Evaluation Report ID")
            {
            }
            column(Description_BidTabulationHeader; "Bid Tabulation Header".Description)
            {
            }
            column(TenderName_BidTabulationHeader; "Bid Tabulation Header"."Tender Name")
            {
            }
            column(RaisedBy_BidTabulationHeader; "Bid Tabulation Header"."Raised By")
            {
            }
            column(Name_BidTabulationHeader; "Bid Tabulation Header".Name)
            {
            }
            column(TenderCommitteeRole_BidTabulationHeader; "Bid Tabulation Header"."Tender Committee Role")
            {
            }
            column(DesignationTitle_BidTabulationHeader; "Bid Tabulation Header"."Designation/Title")
            {
            }
            column(AnnualProcurementPlanID_BidTabulationHeader; "Bid Tabulation Header"."Annual Procurement Plan ID")
            {
            }
            column(ProcurementPlanDate_BidTabulationHeader; "Bid Tabulation Header"."Procurement Plan Date")
            {
            }
            column(FinancialYearCode_BidTabulationHeader; "Bid Tabulation Header"."Financial Year Code")
            {
            }
            column(ProcurementPlanLineNo_BidTabulationHeader; "Bid Tabulation Header"."Procurement Plan Line No.")
            {
            }
            column(ProcurementPlanEntryNo_BidTabulationHeader; "Bid Tabulation Header"."Procurement Plan Entry No")
            {
            }
            column(AvailableProcurementBudget_BidTabulationHeader; "Bid Tabulation Header"."Available Procurement Budget")
            {
            }
            column(BudgetNarration_BidTabulationHeader; "Bid Tabulation Header"."Budget Narration")
            {
            }
            column(BidOpeningDate_BidTabulationHeader; "Bid Tabulation Header"."Bid Opening Date")
            {
            }
            column(EvaluationCompletionDate_BidTabulationHeader; "Bid Tabulation Header"."Evaluation Completion Date")
            {
            }
            column(AppointedBidOpeningComm_BidTabulationHeader; "Bid Tabulation Header"."Appointed Bid Opening Comm")
            {
            }
            column(AppointedBidEvaluationCom_BidTabulationHeader; "Bid Tabulation Header"."Appointed Bid Evaluation Com")
            {
            }
            column(PrimaryRegion_BidTabulationHeader; "Bid Tabulation Header"."Primary Region")
            {
            }
            column(ApprovalStatus_BidTabulationHeader; "Bid Tabulation Header"."Approval Status")
            {
            }
            column(ProfessionalOpinionID_BidTabulationHeader; "Bid Tabulation Header"."Professional Opinion ID")
            {
            }
            column(AwardedBidNo_BidTabulationHeader; "Bid Tabulation Header"."Awarded Bid No")
            {
            }
            column(AwardedBidderNo_BidTabulationHeader; "Bid Tabulation Header"."Awarded Bidder No.")
            {
            }
            column(AwardedBidderName_BidTabulationHeader; "Bid Tabulation Header"."Awarded Bidder Name")
            {
            }
            column(AwardTenderSumIncTaxes_BidTabulationHeader; "Bid Tabulation Header"."Award Tender Sum Inc Taxes")
            {
            }
            column(AwardAcceptanceDeadline_BidTabulationHeader; "Bid Tabulation Header"."Award Acceptance Deadline")
            {
            }
            column(AwardAcceptanceResponse_BidTabulationHeader; "Bid Tabulation Header"."Award Acceptance Response")
            {
            }
            column(MinContractHolding_BidTabulationHeader; "Bid Tabulation Header"."Min. Contract Holding")
            {
            }
            column(EarliestContractIssuanceDt_BidTabulationHeader; "Bid Tabulation Header"."Earliest Contract Issuance Dt")
            {
            }
            column(BidderNoAResponseType_BidTabulationHeader; "Bid Tabulation Header"."Bidder NoA Response Type")
            {
            }
            column(BidderNoAResponseDate_BidTabulationHeader; "Bid Tabulation Header"."Bidder NoA Response Date")
            {
            }
            column(NoofPostAwardDisputes_BidTabulationHeader; "Bid Tabulation Header"."No. of Post-Award Disputes")
            {
            }
            column(DocumentStatus_BidTabulationHeader; "Bid Tabulation Header"."Document Status")
            {
            }
            column(NoSeries_BidTabulationHeader; "Bid Tabulation Header"."No. Series")
            {
            }
            column(CreatedBy_BidTabulationHeader; "Bid Tabulation Header"."Created By")
            {
            }
            column(CreatedDate_BidTabulationHeader; "Bid Tabulation Header"."Created Date")
            {
            }
            column(CreatedTime_BidTabulationHeader; "Bid Tabulation Header"."Created Time")
            {
            }
            column(Posted_BidTabulationHeader; "Bid Tabulation Header".Posted)
            {
            }
            column(PostedBy_BidTabulationHeader; "Bid Tabulation Header"."Posted By")
            {
            }
            column(PostedDate_BidTabulationHeader; "Bid Tabulation Header"."Posted Date")
            {
            }
            column(FinancialEvaluationID_BidTabulationHeader; "Bid Tabulation Header"."Financial Evaluation ID")
            {
            }
            column(GeneralProcurementRemarks_BidTabulationHeader; "Bid Tabulation Header"."General Procurement Remarks")
            {
            }
            column(Noofsubmittedbids_BidTabulationHeader; "Bid Tabulation Header"."No of submitted bids")
            {
            }
            column(NoofOpenedBidsTech_BidTabulationHeader; "Bid Tabulation Header"."No of Opened Bids(Tech)")
            {
            }
            column(NoofOpenedBidsFinance_BidTabulationHeader; "Bid Tabulation Header"."No of Opened Bids(Finance)")
            {
            }
            column(NoofResponsiveTech_BidTabulationHeader; "Bid Tabulation Header"."No of Responsive(Tech)")
            {
            }
            column(NoofnonResponsiveTech_BidTabulationHeader; "Bid Tabulation Header"."No of non- Responsive(Tech)")
            {
            }
            column(NoofResponsiveFinance_BidTabulationHeader; "Bid Tabulation Header"."No of Responsive(Finance)")
            {
            }
            column(NoofnonResponsiveFinance_BidTabulationHeader; "Bid Tabulation Header"."No of non- Responsive(Finance)")
            {
            }
            column(BidOpeningRegisterTech_BidTabulationHeader; "Bid Tabulation Header"."Bid Opening Register(Tech)")
            {
            }
            column(BidOpeningRegisterFinance_BidTabulationHeader; "Bid Tabulation Header"."Bid Opening Register(Finance)")
            {
            }
            column(ProcurementOfficerLicenseNo_BidTabulationHeader; "Bid Tabulation Header"."Procurement Officer License No")
            {
            }
            column(ProcurementMethod_BidTabulationHeader; "Bid Tabulation Header"."Procurement Method")
            {
            }
            dataitem("Bid Tabulation Line"; "Bid Tabulation Line")
            {
                DataItemLink = "Tabulation ID" = field(Code);
                column(No_BidTabulationLine; "Bid Tabulation Line"."No.")
                {
                }
                column(BidderNo_BidTabulationLine; "Bid Tabulation Line"."Bidder No")
                {
                }
                column(BidderName_BidTabulationLine; "Bid Tabulation Line"."Bidder Name")
                {
                }
                column(InvitationForSupplyNo_BidTabulationLine; "Bid Tabulation Line"."Invitation For Supply No")
                {
                }
                column(ReadoutBidPriceA_BidTabulationLine; "Bid Tabulation Line"."Read-out Bid Price (A)")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                IfsCodes.Reset;
                IfsCodes.SetRange(Code, EvalReport."IFS Code");
                if IfsCodes.FindSet then
                    Submission_enddate := IfsCodes."Submission End Date";
                Message('%1', EvalReport."IFS Code");
            end;

            trigger OnPreDataItem()
            begin
                corec.Get;
                corec.CalcFields(corec.Picture);
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

    var
        corec: Record "Company Information";
        ven: Record Vendor;
        vendorname: Text;
        IFPResponseLine: Record "IFP Response Line";
        IfsCodes: Record "Standard Purchase Code";
        Submission_enddate: Date;
        EvalReport: Record "Bid Tabulation Header";
}

