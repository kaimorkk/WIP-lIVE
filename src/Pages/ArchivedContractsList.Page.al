Page 52194314 "Archived Contracts List"
{
    ApplicationArea = Basic;
    CardPageID = "Archived Contract Card";
    PageType = List;
    SourceTable = Contract;
    SourceTableView = where(Status=const(Archived));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ContractNo;"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(ContractServiceCode;"Contract Service Code")
                {
                    ApplicationArea = Basic;
                }
                field(ContractDescription;"Contract Description")
                {
                    ApplicationArea = Basic;
                }
                field(LawFirm;"Law Firm")
                {
                    ApplicationArea = Basic;
                }
                field(ContractStartDate;"Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ComplianceDate;"Compliance Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractExpiryDate;"Contract Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractRenewalDate;"Contract Renewal Date")
                {
                    ApplicationArea = Basic;
                }
                field(AnniversaryDate;"Anniversary Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProvider;"Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ClientVendor;"Client Vendor")
                {
                    ApplicationArea = Basic;
                }
                field(LanguageCodeDefault;"Language Code (Default)")
                {
                    ApplicationArea = Basic;
                }
                field(Attachment;Attachment)
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderName;"Service Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(LawFirmName;"Law Firm Name")
                {
                    ApplicationArea = Basic;
                }
                field(ClientName;"Client Name")
                {
                    ApplicationArea = Basic;
                }
                field(Durationn;Durationn)
                {
                    ApplicationArea = Basic;
                }
                field(Property;Property)
                {
                    ApplicationArea = Basic;
                }
                field(PropertyName;"Property Name")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderCategory;"Service Provider Category")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentSchedule;"Payment Schedule")
                {
                    ApplicationArea = Basic;
                }
                field(Vote;Vote)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(ClientStakeHolder;"Client StakeHolder")
                {
                    ApplicationArea = Basic;
                }
                field(StakeHolderName;"StakeHolder Name")
                {
                    ApplicationArea = Basic;
                }
                field(ClientPPS;"Client PPS")
                {
                    ApplicationArea = Basic;
                }
                field(PPSName;"PPS Name")
                {
                    ApplicationArea = Basic;
                }
                field(OnExpiryNotice;"On Expiry Notice")
                {
                    ApplicationArea = Basic;
                }
                field(ThreeMonthsNotice;"Three Months Notice")
                {
                    ApplicationArea = Basic;
                }
                field(SixMonthsNotice;"Six Months Notice")
                {
                    ApplicationArea = Basic;
                }
                field(ModeofPayment;"Mode of Payment")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentDate;"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentCurrency;"Payment Currency")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceSecurity;"Performance Security %")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceSecurityAmount;"Performance Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Expired;Expired)
                {
                    ApplicationArea = Basic;
                }
                field(TenderNo;"Tender No")
                {
                    ApplicationArea = Basic;
                }
                field(ContractPriceAmtWords;"Contract Price Amt(Words)")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceSecurityWords;"Performance Security(Words)")
                {
                    ApplicationArea = Basic;
                }
                field(Performance;Performance)
                {
                    ApplicationArea = Basic;
                }
                field(ContractAwardDate;"Contract Award Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractSigningDate;"Contract Signing Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(AgreementType;"Agreement Type")
                {
                    ApplicationArea = Basic;
                }
                field(ContractStatus;"Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceSecurityExpDate;"Performance Security Exp Date")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field(ContractRenewalClause;"Contract Renewal Clause")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

