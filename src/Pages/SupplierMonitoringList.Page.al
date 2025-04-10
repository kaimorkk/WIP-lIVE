Page 52194290 "Supplier Monitoring List"
{
    ApplicationArea = Basic;
    CardPageID = "Supplier Monitoring";
    PageType = List;
    SourceTable = "Supplier Monitoring1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PurchaseOrderNo;"Purchase Order No.")
                {
                    ApplicationArea = Basic;
                }
                field(BriefDescriptionofWorkdone;"Brief Description of Work done")
                {
                    ApplicationArea = Basic;
                }
                field(AgreedStartDate;"Agreed Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ActualStartDate;"Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(AgreedCompletiondate;"Agreed Completion date")
                {
                    ApplicationArea = Basic;
                }
                field(ActualCompletionDate;"Actual Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field(CompletedWithinSchedule;"Completed Within Schedule")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonsforLatecompletion;"Reasons for Late completion")
                {
                    ApplicationArea = Basic;
                }
                field(QualityofWork;"Quality of Work")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(VendorName;"Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Pricing;Pricing)
                {
                    ApplicationArea = Basic;
                }
                field(ProvidesSupport;"Provides Support")
                {
                    ApplicationArea = Basic;
                }
                field(QualityofSupport;"Quality of Support")
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

