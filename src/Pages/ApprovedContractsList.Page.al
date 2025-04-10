Page 52194302 "Approved Contracts List"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Contract Request";
    PageType = List;
    SourceTable = Contract;
    SourceTableView = where(Status=const(Released));
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
                field(ContractDescription;"Contract Description")
                {
                    ApplicationArea = Basic;
                }
                field(ContractStartDate;"Contract Start Date")
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
                field(AgreementType;"Agreement Type")
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
                field(ComplianceDate;"Compliance Date")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentDate;"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProvider;"Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderName;"Service Provider Name")
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
                field(LawFirm;"Law Firm")
                {
                    ApplicationArea = Basic;
                }
                field(LawFirmName;"Law Firm Name")
                {
                    ApplicationArea = Basic;
                }
                field(ClientVendor;"Client Vendor")
                {
                    ApplicationArea = Basic;
                }
                field(ClientName;"Client Name")
                {
                    ApplicationArea = Basic;
                }
                field(ClientStakeHolder;"Client StakeHolder")
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
                field(StakeHolderName;"StakeHolder Name")
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
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ContractPriceAmtWords;"Contract Price Amt(Words)")
                {
                    ApplicationArea = Basic;
                }
                field(ModeofPayment;"Mode of Payment")
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
                field(PerformanceSecurityWords;"Performance Security(Words)")
                {
                    ApplicationArea = Basic;
                }
                field(Performance;Performance)
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceSecurityExpDate;"Performance Security Exp Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractRenewalClause;"Contract Renewal Clause")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field(ContractStatus;"Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

