report 50003 "Professional Opinion Statement"
{
    // ApplicationArea = All;
    Caption = 'Professional Opinion Report';
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Professional Opinion Statement.rdlc';

    dataset
    {
        dataitem(BidTabulationHeader; "Bid Tabulation Header")
        {
            RequestFilterFields = Code;

            column(logo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyName2; CompanyInfo."Name 2")
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyHeadName; CompanyHeadName)
            {
            }
            column(CompanyHeadTitle; CompanyHeadTitle)
            {
            }
            column(Code; "Code")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(FinalEvaluationReportID; "Final Evaluation Report ID")
            {
            }
            column(IFSCode; "IFS Code")
            {
            }
            column(TenderName; "Tender Name")
            {
            }
            column(Description; Description)
            {
            }
            column(Procurement_Method; "Procurement Method")
            {
            }
            column(AwardedBidNo; "Awarded Bid No")
            {
            }
            column(AwardedBidderNo; "Awarded Bidder No.")
            {
            }
            column(AwardedBidderName; "Awarded Bidder Name")
            {
            }
            column(AwardTenderSumIncTaxes; "Award Tender Sum Inc Taxes")
            {
            }
            column(GeneralProcurementRemarks; "General Procurement Remarks")
            {
            }
            column(BidOpeningDate; "Bid Opening Date")
            {
            }
            column(AppointedBidOpeningComm; "Appointed Bid Opening Comm")
            {
            }
            column(BidOpeningRegisterFinance; "Bid Opening Register(Finance)")
            {
            }
            column(BidOpeningRegisterTech; "Bid Opening Register(Tech)")
            {
            }
            column(TenderCancellationReason; "Tender Cancellation Reason")
            {
            }
            column(ReasonforTenderTermination; "Reason for Tender Termination")
            {
            }
            column(ReasonforRejection; "Reason for Rejection")
            {
            }
            column(RaisedBy; "Raised By")
            {
            }
            column(ProfessionalOpinionID; "Professional Opinion ID")
            {
            }
            column(ProcurementPlanDate; "Procurement Plan Date")
            {
            }
            column(ProcurementPlanEntryNo; "Procurement Plan Entry No")
            {
            }
            column(ProcurementPlanLineNo; "Procurement Plan Line No.")
            {
            }
            column(PurchaseAgreementType; "Purchase Agreement Type")
            {
            }
            column(ProcurementOfficerLicenseNo; "Procurement Officer License No")
            {
            }
            column(Noofsubmittedbids; "No of submitted bids")
            {
            }
            column(NoofOpenedBidsFinance; "No of Opened Bids(Finance)")
            {
            }
            column(NoofOpenedBidsTech; "No of Opened Bids(Tech)")
            {
            }
            column(NoofResponsiveFinance; "No of Responsive(Finance)")
            {
            }
            column(NoofResponsivePreli; "No of Responsive(Preli)")
            {
            }
            column(NoofResponsiveTech; "No of Responsive(Tech)")
            {
            }
            column(NoofnonResponsiveFinance; "No of non- Responsive(Finance)")
            {
            }
            column(NoofnonResponsivePreli; "No of non- Responsive(Preli)")
            {
            }
            column(NoofnonResponsiveTech; "No of non- Responsive(Tech)")
            {
            }
            column(Name; Name)
            {
            }
            column(IFPCode; "IFP Code")
            {
            }
            column(LinkedtoNOA; "Linked to NOA")
            {
            }
            column(FinancialYearCode; "Financial Year Code")
            {
            }
            column(FinancialEvaluationID; "Financial Evaluation ID")
            {
            }
            column(AwardType; "Award Type")
            {
            }
            column(AwardAcceptanceResponse; "Award Acceptance Response")
            {
            }
            column(AwardAcceptanceDeadline; "Award Acceptance Deadline")
            {
            }
            column(AvailableProcurementBudget; "Available Procurement Budget")
            {
            }
            column(AppointedBidEvaluationCom; "Appointed Bid Evaluation Com")
            {
            }
            column(AnnualProcurementPlanID; "Annual Procurement Plan ID")
            {
            }
            column(AGPOCategory; "AGPO Category")
            {
            }
            column(AGPOCertficateNumber; "AGPO Certficate Number")
            {
            }
            column(BidEvaluationTemplate; "Bid Evaluation Template")
            {
            }
            dataitem("Bid Tabulation Line"; "Bid Tabulation Line")
            {
                column(Tabulation_ID; "Tabulation ID")
                {

                }
                column(Tabulation_Type; "Tabulation Type")
                {

                }
                column(Document_Type; "Document Type")
                {

                }
                column(No_; "No.")
                {

                }
                column(Bidder_No; "Bidder No")
                {

                }
                column(Bidder_Name; "Bidder Name")
                {

                }
                column(Invitation_For_Supply_No; "Invitation For Supply No")
                {

                }
                column(Evaluation_Committee_Recomm; "Evaluation Committee Recomm")
                {

                }
                column(Pre_bid_Register_No_; "Pre-bid Register No.")
                {

                }
                column(Prebid_Conference_Date; "Prebid Conference Date")
                {

                }
                column(Bid_Opening_Date; "Bid Opening Date")
                {

                }
                column(Preliminary_Evaluation_Date; "Preliminary Evaluation Date")
                {

                }
                column(Preliminary_Evaluation_Outcome; "Preliminary Evaluation Outcome")
                {

                }
                column(Technical_Evaluation_Date; "Technical Evaluation Date")
                {

                }
                column(Final_Evaluated_Bid_Price; "Final Evaluated Bid Price")
                {

                }
            }
            dataitem("Standard Purchase Code"; "Standard Purchase Code")
            {
                DataItemLink = Code = field("IFS Code");

                column(Code_StandardPurchaseCode; Code)
                {
                }
                column(Document_Date_StandardPurchaseCode; "Document Date")
                {
                }
                column(Tender_Name_StandardPurchaseCode; "Tender Name")
                {
                }
                column(Tender_Summary_StandardPurchaseCode; "Tender Summary")
                {
                }
                column(Global_Dimension_1_Code_StandardPurchaseCode; "Global Dimension 1 Code")
                {
                }
                column(Global_Dimension_2_Code_StandardPurchaseCode; "Global Dimension 2 Code")
                {
                }
                column(Procurement_Plan_ID_StandardPurchaseCode; "Procurement Plan ID")
                {
                }
                column(Procurement_Method_StandardPurchaseCode; "Procurement Method")
                {
                }
                column(Submission_Start_Date_StandardPurchaseCode; "Submission Start Date")
                {
                }
                column(Submission_Start_Time_StandardPurchaseCode; "Submission Start Time")
                {
                }
                column(Submission_End_Date_StandardPurchaseCode; "Submission End Date")
                {
                }
                column(Submission_End_Time_StandardPurchaseCode; "Submission End Time")
                {
                }
                column(Bid_Opening_Date_StandardPurchaseCode; "Bid Opening Date")
                {
                }
                column(Bid_Opening_Time_StandardPurchaseCode; "Bid Opening Time")
                {
                }
                column(Bid_Opening_Committe; "Bid Opening Committe")
                {
                }
                column(Bid_Evaluation_Committe; "Bid Evaluation Committe")
                {
                }
                dataitem(InvitedBidders; "Standard Vendor Purchase Code")
                {
                    DataItemLink = Code = field(Code);

                    column(Vendor_No_InvitedBidders; "Vendor No.")
                    {
                    }
                    column(Vendor_Name_InvitedBidders; "Vendor Name")
                    {
                    }
                    column(Vendor_Phone_No_InvitedBidders; "Vendor Phone No.")
                    {
                    }
                    column(Primary_Email_InvitedBidders; "Primary Email")
                    {
                    }
                }
            }
            dataitem(BidResponses; "Purchase Header")
            {
                DataItemLink = "Invitation For Supply No" = field("IFS Code");
                DataItemTableView = where("Document Type" = filter(Quote));

                column(Buy_from_Vendor_No_BidResponses; "Buy-from Vendor No.")
                {
                }
                column(Buy_from_Vendor_Name_BidResponses; "Buy-from Vendor Name")
                {
                }
                dataitem(Vendor_Responded; Vendor)
                {
                    DataItemLink = "No." = field("Buy-from Vendor No.");

                    column(No_BidResponses;"No.")
                    {

                    }
                    column(Name_BidResponses;Name)
                    {

                    }
                    column(E_Mail_BidResponses; "E-Mail")
                    {
                    }
                }
                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLink = "Document No." = field("No.");

                    column(Document_No_BidResponses; "Document No.")
                    {

                    }
                    column(Quantity_BidResponses; Quantity)
                    {

                    }
                    column(Direct_Unit_Cost_BidResponses; "Direct Unit Cost")
                    {

                    }
                    column(Line_Amount_BidResponses; "Line Amount")
                    {
                    }
                }
            }
            dataitem("Opening Committe"; "IFS Tender Committee")
            {
                DataItemLink = "Document No." = field("Appointed Bid Opening Comm");

                dataitem("Opening Committee Member"; "IFS Tender Committee Member")
                {
                    DataItemLink = "Document No." = field("Document No.");

                    column(Member_No_Opening_Committe; "Member No.")
                    {

                    }
                    column(Member_Name_Opening_Committe; "Member Name")
                    {

                    }
                    column(Role_Opening_Committe; Role)
                    {

                    }
                }
            }
            dataitem("Evaluation Committe"; "IFS Tender Committee")
            {
                DataItemLink = "Document No." = field("Appointed Bid Evaluation Com");

                dataitem("Evaluation Committee Member"; "IFS Tender Committee Member")
                {
                    DataItemLink = "Document No." = field("Document No.");

                    column(Member_No_Evaluation_Committe; "Member No.")
                    {

                    }
                    column(Member_Name_Evaluation_Committe; "Member Name")
                    {

                    }
                    column(Role_Evaluation_Committe; Role)
                    {

                    }
                }
            }
            dataitem("Procurement Plan"; "Procurement Plan")
            {
                DataItemLink = Code = field("Annual Procurement Plan ID");

                column(Financial_Budget_ID; "Financial Budget ID")
                {
                }
            }
            dataitem("Preliminary Evaluation"; "Bid Evaluation Register")
            {
                DataItemLink = "IFS Code" = field("IFS Code");
                DataItemTableView = where("Evaluation Type" = filter("Preliminary Evaluation"));

                column(Code_Preliminary_Evaluation; Code)
                {

                }
                column(IFS_Code_Preliminary_Evaluation; "IFS Code")
                {

                }
                column(Bid_No_Preliminary_Evaluation; "Bid No.")
                {

                }
                column(Bidder_Name_Preliminary_Evaluation; "Bidder Name")
                {

                }
                dataitem("Bid Evaluation Score Entry Preliminary"; "Bid Evaluation Score Entry")
                {
                    DataItemLink = Code = field(Code);

                    column(Requirement_ID_Preliminary_Evaluation; "Requirement ID")
                    {

                    }
                    column(Evaluation_Requirement_Preliminary_Evaluation; "Evaluation Requirement")
                    {

                    }
                    column(Criteria_Group_Preliminary_Evaluation; "Criteria Group")
                    {

                    }
                    column(Rating_Type_Preliminary_Evaluation; "Rating Type")
                    {

                    }
                    column(Response_Value_Preliminary_Evaluation; "Response Value")
                    {

                    }
                    column(Evaluation_Results_Preliminary_Evaluation; "Evaluation Results")
                    {

                    }
                }
            }
            dataitem("Technical Evaluation"; "Bid Evaluation Register")
            {
                DataItemLink = "IFS Code" = field("IFS Code");
                DataItemTableView = where("Evaluation Type" = filter("Technical Evaluation"));

                column(Code_Technical_Evaluation; Code)
                {

                }
                column(IFS_Code_Technical_Evaluation; "IFS Code")
                {

                }
                column(Bid_No_Technical_Evaluation; "Bid No.")
                {

                }
                column(Bidder_Name_Technical_Evaluation; "Bidder Name")
                {

                }
                dataitem("Bid Evaluation Score Entry Tech"; "Bid Evaluation Score Entry")
                {
                    DataItemLink = Code = field(Code);

                    column(Requirement_ID_Technical_Evaluation; "Requirement ID")
                    {

                    }
                    column(Evaluation_Requirement_Technical_Evaluation; "Evaluation Requirement")
                    {

                    }
                    column(Criteria_Group_Technical_Evaluation; "Criteria Group")
                    {

                    }
                    column(Rating_Type_Technical_Evaluation; "Rating Type")
                    {

                    }
                    column(Response_Value_Technical_Evaluation; "Response Value")
                    {

                    }
                    column(Evaluation_Results_Technical_Evaluation; "Evaluation Results")
                    {

                    }
                }
            }
            dataitem("Financial Evaluation"; "Bid Evaluation Register")
            {
                DataItemLink = "IFS Code" = field("IFS Code");
                DataItemTableView = where("Evaluation Type" = filter("Financial Evaluation"));

                column(Code_Financial_Evaluation; Code)
                {

                }
                column(IFS_Code_Financial_Evaluation; "IFS Code")
                {

                }
                column(Bid_No_Financial_Evaluation; "Bid No.")
                {

                }
                column(Bidder_Name_Financial_Evaluation; "Bidder Name")
                {

                }
                dataitem("Bid Evaluation Score Entry Fin"; "Bid Evaluation Score Entry")
                {
                    DataItemLink = Code = field(Code);

                    column(Requirement_ID_Financial_Evaluation; "Requirement ID")
                    {

                    }
                    column(Evaluation_Requirement_Financial_Evaluation; "Evaluation Requirement")
                    {

                    }
                    column(Criteria_Group_Financial_Evaluation; "Criteria Group")
                    {

                    }
                    column(Rating_Type_Financial_Evaluation; "Rating Type")
                    {

                    }
                    column(Response_Value_Financial_Evaluation; "Response Value")
                    {

                    }
                    column(Evaluation_Results_Financial_Evaluation; "Evaluation Results")
                    {

                    }
                }
            }
            // dataitem("Finance Evaluation Line";"Finance Evaluation Line")
            // {
            //     DataItemLink = "Invitation For Supply No" = field("IFS Code");
            //     DataItemTableView = where("Document Type" = filter(Quote));

            // }

            trigger OnAfterGetRecord()
            begin
                ProcSetup.Get();

                PPlan.Reset();
                PPlan.SetRange(Code, BidTabulationHeader."Annual Procurement Plan ID");
                if PPlan.FindSet() then
                    BudgetName := PPlan."Financial Budget ID";
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);

        Emp.Reset();
        Emp.SetRange("No.", CompanyInfo."Company Head");
        if Emp.FindFirst() then begin
            CompanyHeadName := Emp.FullName();
            CompanyHeadTitle := Emp."Job Title";
        end;
    end;

    var
        CompanyInfo: Record "Company Information";
        Emp: Record Employee;
        CompanyHeadName: Text;
        CompanyHeadTitle: Text;
        ProcSetup: Record "Procurement Setup";
        PPlan: Record "Procurement Plan";
        BudgetName: Text;
}
