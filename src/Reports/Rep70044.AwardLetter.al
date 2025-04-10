report 70044 "Award Letter"
{
    DefaultLayout = RDLC;
    // RDLCLayout = './Layouts/Award Letter.rdlc';
    RDLCLayout = './Layouts/Award Letter1.rdlc';


    dataset
    {
        dataitem("Bid Tabulation Header"; "Bid Tabulation Header")
        {
            column(logo; corec.Picture)
            {
            }
            column(CompanyName;corec.Name)
            {
            }
            column(CompanyName2; corec."Name 2")
            {
            }
            column(CompanyAddress; corec.Address)
            {
            }
            column(CompanyAddress2; corec."Address 2")
            {
            }
            column(CompanyEmail; corec."E-Mail")
            {
            }
            column(CompanyPhone; corec."Phone No.")
            {
            }
            column(CompanyPostCode; corec."Post Code")
            {
            }
            column(CompanyCity; corec.City)
            {
            }
            column(CompanyHeadName; CompanyHeadName)
            {
            }
            column(CompanyHeadTitle; CompanyHeadTitle)
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
            dataitem("Standard Purchase Code";"Standard Purchase Code")
            {
                DataItemLink = Code = field("IFS Code");
                DataItemLinkReference = "Bid Tabulation Header";
                DataItemTableView =  sorting(Code);

                column(Code_Tender;Code)
                {
                }
                column(Tender_Name;"Tender Name")
                {
                }
                column(Tender_Summary;"Tender Summary")
                {
                }
                column(Tender_Validity_Duration;"Tender Validity Duration")
                {
                }
                column(Purchaser_Code;"Purchaser Code")
                {
                }
                column(OfficerName;OfficerName)
                {
                }
                column(OfficerEmail;OfficerEmail)
                {
                }
                column(OfficerPhone;OfficerPhone)
                {
                }
            }
            dataitem("Bid Tabulation Line";"Bid Tabulation Line")
            {
                DataItemLink = "Tabulation ID" = field(Code), "Bidder No" = field("Awarded Bid No");
                DataItemLinkReference = "Bid Tabulation Header";
                DataItemTableView = sorting("Tabulation ID", "Tabulation Type", "Document Type", "No.", "Line No");

                dataitem("Purchase Header";"Purchase Header")
                {
                    DataItemLink = "No." = field("No."), "Document Type" = field("Document Type");
                    DataItemTableView = sorting("Document Type", "No.");

                    column(No_PHead;"No.")
                    {
                    }
                    column(Amount_PHead;Amount)
                    {
                    }

                    dataitem("Purchase Line";"Purchase Line")
                    {
                        DataItemLink = "Document No." = field("No."), "Document Type" = field("Document Type");
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");

                        column(No_Quote;"No.")
                        {
                        }
                        column(Type_Quote;Type)
                        {
                        }
                        column(Description_Quote;Description)
                        {
                        }
                        column(Location_Code_Quote;"Location Code")
                        {
                        }
                        column(Quantity_Quote;Quantity)
                        {
                        }
                        column(Unit_of_Measure_Code_Quote;"Unit of Measure Code")
                        {
                        }
                        column(Direct_Unit_Cost_Quote;"Direct Unit Cost")
                        {
                        }
                        column(Line_Discount__Quote;"Line Discount %")
                        {
                        }
                        column(Line_Discount_Amount_Quote;"Line Discount Amount")
                        {
                        }
                        column(Line_Amount_Quote;"Line Amount")
                        {
                        }
                    }
                }
            }
            dataitem(Vendor;Vendor)
            {
                DataItemLink = "No." = field("Awarded Bidder No.");
                DataItemLinkReference = "Bid Tabulation Header";
                DataItemTableView = sorting("No.");

                column(No_Vend;"No.")
                {
                }
                column(Name_Vend;Name)
                {
                }
                column(Post_Code_Vend;"Post Code")
                {
                }
                column(City_Vend;City)
                {
                }
                column(E_Mail_Vend;"E-Mail")
                {
                }
                column(Address_Vend;Address)
                {
                }
                column(Address_2_Vend;"Address 2")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                corec.Get();
                corec.CalcFields(corec.Picture);

                Emp.Reset();
                Emp.SetRange("No.", corec."Company Head");
                if Emp.FindFirst() then begin
                    CompanyHeadName := Emp.FullName();
                    CompanyHeadTitle := Emp."Job Title";
                end;

                Officer.Reset();
                Officer.SetRange(Code, "Standard Purchase Code"."Purchaser Code");
                if Officer.FindFirst() then begin
                    OfficerName := Officer.Name;
                    OfficerEmail := Officer."E-Mail";
                    OfficerPhone := Officer."Phone No.";
                end;
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
        CompanyHeadName: Text;
        CompanyHeadTitle: Text;
        Emp: Record Employee;
        Officer: Record "Salesperson/Purchaser";
        OfficerName: Text;
        OfficerEmail: Text;
        OfficerPhone: Text;
}

