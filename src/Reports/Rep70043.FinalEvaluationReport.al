report 70043 "Final Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Final Evaluation Report.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header"; "Bid Tabulation Header")
        {
            column(logo; corec.Picture)
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
            dataitem("Bid Tabulation Line"; "Bid Tabulation Line")
            {
                DataItemLink = "Tabulation ID" = field(Code);
                column(TabulationID_BidTabulationLine; "Bid Tabulation Line"."Tabulation ID")
                {
                }
                column(TabulationType_BidTabulationLine; "Bid Tabulation Line"."Tabulation Type")
                {
                }
                column(DocumentType_BidTabulationLine; "Bid Tabulation Line"."Document Type")
                {
                }
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
                column(BidCurrencyCode_BidTabulationLine; "Bid Tabulation Line"."Bid Currency Code")
                {
                }
                column(PrebidRegisterNo_BidTabulationLine; "Bid Tabulation Line"."Pre-bid Register No.")
                {
                }
                column(AttendedPrebidConference_BidTabulationLine; Format("Bid Tabulation Line"."Attended Pre-bid Conference"))
                {
                }
                column(PrebidConferenceDate_BidTabulationLine; "Bid Tabulation Line"."Prebid Conference Date")
                {
                }
                column(BidOpeningRegisterNo_BidTabulationLine; "Bid Tabulation Line"."Bid Opening Register No.")
                {
                }
                column(BidOpeningDate_BidTabulationLine; "Bid Tabulation Line"."Bid Opening Date")
                {
                }
                column(LateBidOpeningStage_BidTabulationLine; Format("Bid Tabulation Line"."Late Bid (Opening Stage)"))
                {
                }
                column(WithdrawnBidOpeningStage_BidTabulationLine; "Bid Tabulation Line"."Withdrawn Bid (Opening Stage)")
                {
                }
                column(WithdrawalNoticeNo_BidTabulationLine; "Bid Tabulation Line"."Withdrawal Notice No")
                {
                }
                column(SuccesfulBidOpeningStage_BidTabulationLine; Format("Bid Tabulation Line"."Succesful Bid (Opening Stage)"))
                {
                }
                column(PreliminaryEvaluationDate_BidTabulationLine; "Bid Tabulation Line"."Preliminary Evaluation Date")
                {
                }
                column(ResponsiveBid_BidTabulationLine; Format("Bid Tabulation Line"."Responsive Bid"))
                {
                }
                column(TechnicalEvaluationDate_BidTabulationLine; "Bid Tabulation Line"."Technical Evaluation Date")
                {
                }
                column(WeightedTechScore_BidTabulationLine; "Bid Tabulation Line"."Weighted Tech Score %")
                {
                }
                column(PassedTechEvaluation_BidTabulationLine; Format("Bid Tabulation Line"."Passed Tech Evaluation"))
                {
                }
                column(TechEvaluationRanking_BidTabulationLine; "Bid Tabulation Line"."Tech Evaluation Ranking")
                {
                }
                column(FinalEvaluatedBidPrice_BidTabulationLine; "Bid Tabulation Line"."Final Evaluated Bid Price")
                {
                }
                column(FinancialEvaluationDate_BidTabulationLine; "Bid Tabulation Line"."Financial Evaluation Date")
                {
                }
                column(WeightedFinancialScore_BidTabulationLine; "Bid Tabulation Line"."Weighted Financial Score %")
                {
                }
                column(FinancialEvaluationRanking_BidTabulationLine; "Bid Tabulation Line"."Financial Evaluation Ranking")
                {
                }
                column(AggregateWeightedScore_BidTabulationLine; "Bid Tabulation Line"."Aggregate Weighted Score %")
                {
                }
                column(AggregateRanking_BidTabulationLine; "Bid Tabulation Line"."Aggregate Ranking")
                {
                }
                column(DueDilgenceDate_BidTabulationLine; "Bid Tabulation Line"."Due Dilgence Date")
                {
                }
                column(DueDiligenceRating_BidTabulationLine; "Bid Tabulation Line"."Due Diligence Rating")
                {
                }
                column(ProfessionalOpionNo_BidTabulationLine; "Bid Tabulation Line"."Professional Opion No.")
                {
                }
                column(ProfessionalOpionDate_BidTabulationLine; "Bid Tabulation Line"."Professional Opion Date")
                {
                }
                column(ProfessionalOpinionOutcome_BidTabulationLine; "Bid Tabulation Line"."Professional Opinion Outcome")
                {
                }
                column(CorrectedBidPriceCAB_BidTabulationLine; "Bid Tabulation Line"."Corrected Bid Price (C=A+B)")
                {
                }
                column(UnconditionalDiscountD_BidTabulationLine; "Bid Tabulation Line"."Unconditional Discount % (D)")
                {
                }
                column(UnconditionalDiscAmountE_BidTabulationLine; "Bid Tabulation Line"."Unconditional Disc Amount (E)")
                {
                }
                column(CorrectedDiscBidPrice_BidTabulationLine; "Bid Tabulation Line"."Corrected & Disc Bid Price")
                {
                }
                column(AnyAdditionalAdjustmentsG_BidTabulationLine; "Bid Tabulation Line"."Any Additional Adjustments (G)")
                {
                }
                column(AnyPricedDeviationsH_BidTabulationLine; "Bid Tabulation Line"."Any Priced Deviations (H))")
                {
                }
                column(FinancialEvaluationCommRem_BidTabulationLine; "Bid Tabulation Line"."Financial Evaluation Comm Rem")
                {
                }
                column(EvaluationCommitteeRecomm_BidTabulationLine; "Bid Tabulation Line"."Evaluation Committee Recomm")
                {
                }
                column(ReadoutBidPriceA_BidTabulationLine; "Bid Tabulation Line"."Read-out Bid Price (A)")
                {
                }
                column(ArithmeticCorrectionsB_BidTabulationLine; "Bid Tabulation Line"."Arithmetic Corrections (B)")
                {
                }
                column(BidOpeningResult_BidTabulationLine; "Bid Tabulation Line"."Bid Opening Result")
                {
                }
                column(BidOpeningCommitteeRemarks_BidTabulationLine; "Bid Tabulation Line"."Bid Opening Committee Remarks")
                {
                }
                column(PreliminaryEvaluationReg_BidTabulationLine; "Bid Tabulation Line"."Preliminary Evaluation Reg")
                {
                }
                column(PreliminaryEvaluationOutcome_BidTabulationLine; "Bid Tabulation Line"."Preliminary Evaluation Outcome")
                {
                }
                column(PreminaryEvaluationCommittee_BidTabulationLine; "Bid Tabulation Line"."Preminary Evaluation Committee")
                {
                }
                column(BidOpeningFinanceRegister_BidTabulationLine; "Bid Tabulation Line"."Bid Opening Finance Register")
                {
                }
                column(BidOpeningDateFinancial_BidTabulationLine; "Bid Tabulation Line"."Bid Opening Date (Financial)")
                {
                }
                column(FinancialEvalRegisterNo_BidTabulationLine; "Bid Tabulation Line"."Financial Eval Register No")
                {
                }
                column(VendorPIN_BidTabulationLine; "Bid Tabulation Line"."Vendor PIN")
                {
                }
            }
            dataitem("Bid Opening Tender Committee"; "Bid Opening Tender Committee")
            {
                DataItemLink = "Document No." = field(Code);
                column(DocumentNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Document No.")
                {
                }
                column(LineNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Line No")
                {
                }
                column(AppointedBidOpeningCom_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Appointed Bid Opening Com")
                {
                }
                column(RoleType_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Role Type")
                {
                }
                column(MemberNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Member No.")
                {
                }
                column(MemberName_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Member Name")
                {
                }
                column(Designation_BidOpeningTenderCommittee; "Bid Opening Tender Committee".Designation)
                {
                }
                column(IDPassportNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Tax Registration (PIN) No.")
                {
                }
                column(Email_BidOpeningTenderCommittee; "Bid Opening Tender Committee".Email)
                {
                }
                column(TelephoneNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Telephone No.")
                {
                }
                column(StaffNo_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Staff  No.")
                {
                }
                column(IFSCode_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."IFS Code")
                {
                }
                column(OpeningPerson1_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Opening Person 1")
                {
                }
                column(OpeningPerson2_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Opening Person 2")
                {
                }
                column(OpeningPerson3_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Opening Person 3")
                {
                }
                column(NominatedBidOpening_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Nominated Bid Opening")
                {
                }
                column(OpeningPerson4_BidOpeningTenderCommittee; "Bid Opening Tender Committee"."Opening Person 4")
                {
                }
            }
            dataitem("Bid Evaluation Committee"; "Bid Evaluation Committee")
            {
                DataItemLink = "Document No." = field(Code);
                DataItemTableView = where(Type = const(Evaluation));
                column(DocumentNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Document No.")
                {
                }
                column(LineNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Line No")
                {
                }
                column(AppointedBidOpeningCom_BidEvaluationCommittee; "Bid Evaluation Committee"."Appointed Bid Opening Com")
                {
                }
                column(RoleType_BidEvaluationCommittee; "Bid Evaluation Committee"."Role Type")
                {
                }
                column(MemberNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Member No.")
                {
                }
                column(MemberName_BidEvaluationCommittee; "Bid Evaluation Committee"."Member Name")
                {
                }
                column(Designation_BidEvaluationCommittee; "Bid Evaluation Committee".Designation)
                {
                }
                column(IDPassportNo_BidEvaluationCommittee; "Bid Evaluation Committee"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Tax Registration (PIN) No.")
                {
                }
                column(Email_BidEvaluationCommittee; "Bid Evaluation Committee".Email)
                {
                }
                column(TelephoneNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Telephone No.")
                {
                }
                column(StaffNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Staff  No.")
                {
                }
                column(IFSCode_BidEvaluationCommittee; "Bid Evaluation Committee"."IFS Code")
                {
                }
                column(NotifiedonEmail_BidEvaluationCommittee; "Bid Evaluation Committee"."Notified on Email")
                {
                }
                column(DateTimeNotified_BidEvaluationCommittee; "Bid Evaluation Committee"."Date/Time Notified")
                {
                }
                column(Type_BidEvaluationCommittee; "Bid Evaluation Committee".Type)
                {
                }
            }
            dataitem("Bid_Contract Security Register"; "Bid_Contract Security Register")
            {
                DataItemLink = "IFS No" = field("IFS Code");
                column(DocumentType_BidContractSecurityRegister; "Bid_Contract Security Register"."Document Type")
                {
                }
                column(No_BidContractSecurityRegister; "Bid_Contract Security Register"."No.")
                {
                }
                column(FormofSecurity_BidContractSecurityRegister; "Bid_Contract Security Register"."Form of Security")
                {
                }
                column(VendorNo_BidContractSecurityRegister; "Bid_Contract Security Register"."Vendor No.")
                {
                }
                column(SecurityType_BidContractSecurityRegister; "Bid_Contract Security Register"."Security Type")
                {
                }
                column(IssuerInstitutionType_BidContractSecurityRegister; "Bid_Contract Security Register"."Issuer Institution Type")
                {
                }
                column(IssuerGuarantorName_BidContractSecurityRegister; "Bid_Contract Security Register"."Issuer/Guarantor Name")
                {
                }
                column(IssuerRegisteredOffices_BidContractSecurityRegister; "Bid_Contract Security Register"."Issuer Registered Offices")
                {
                }
                column(Description_BidContractSecurityRegister; "Bid_Contract Security Register".Description)
                {
                }
                column(SecurityAmountLCY_BidContractSecurityRegister; "Bid_Contract Security Register"."Security Amount (LCY)")
                {
                }
                column(BidSecurityEffectiveDate_BidContractSecurityRegister; "Bid_Contract Security Register"."Bid Security Effective Date")
                {
                }
                column(BidSecurityValidityExpiry_BidContractSecurityRegister; "Bid_Contract Security Register"."Bid Security Validity Expiry")
                {
                }
                column(SecurityID_BidContractSecurityRegister; "Bid_Contract Security Register"."Security ID")
                {
                }
                column(SecurityClosureDate_BidContractSecurityRegister; "Bid_Contract Security Register"."Security Closure Date")
                {
                }
                column(SecurityClosureVoucherNo_BidContractSecurityRegister; "Bid_Contract Security Register"."Security Closure Voucher No.")
                {
                }
                column(SecurityClosureType_BidContractSecurityRegister; "Bid_Contract Security Register"."Security Closure Type")
                {
                }
                column(Blocked_BidContractSecurityRegister; "Bid_Contract Security Register".Blocked)
                {
                }
                column(IFSNo_BidContractSecurityRegister; "Bid_Contract Security Register"."IFS No")
                {
                }
            }

            trigger OnPreDataItem()
            begin
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
}

