Page 52193669 "Approved SMS Batch Card"
{
    PageType = Card;
    SourceTable = "SMS Batches";

    layout
    {
        area(content)
        {
            group(General)
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
                field(SMSCount;"SMS Count")
                {
                    ApplicationArea = Basic;
                }
                field(Sent;Sent)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000014;"SMS Lines")
            {
                Editable = false;
                SubPageLink = "Batch No"=field("Batch No");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012;Notes)
            {
            }
            systempart(Control1000000011;MyNotes)
            {
            }
            systempart(Control1000000010;Links)
            {
            }
        }
    }

    actions
    {
    }
}

