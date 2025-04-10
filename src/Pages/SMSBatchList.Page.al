Page 52193664 "SMS Batch List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "SMS Batches";
    SourceTableView = where(Status=filter(Open|"Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(BatchNo;"Batch No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(SMSVendor;"SMS Vendor")
                {
                    ApplicationArea = Basic;
                }
                field(NoofValidSMS;"No of Valid SMS")
                {
                    ApplicationArea = Basic;
                }
                field(NoofInvalidSMS;"No of Invalid SMS")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010;Notes)
            {
            }
            systempart(Control1000000009;MyNotes)
            {
            }
            systempart(Control1000000008;Links)
            {
            }
        }
    }

    actions
    {
    }
}

