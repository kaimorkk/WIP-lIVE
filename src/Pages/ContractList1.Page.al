Page 52193788 "Contract List1"
{
    ApplicationArea = Basic;
    //CardPageID = Contract;
    PageType = List;
    SourceTable = Contract;
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
                field(ContractExpiryDate;"Contract Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractRenewalDate;"Contract Renewal Date")
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
                field(ClientStakeHolder;"Client StakeHolder")
                {
                    ApplicationArea = Basic;
                }
                field(StakeHolderName;"StakeHolder Name")
                {
                    ApplicationArea = Basic;
                }
                field(Expired;Expired)
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

