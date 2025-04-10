Page 50075 "Posted Batch Invoices List"
{
    CardPageID = "Levy List";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Batch Invoices";
    SourceTableView = where(Posted=const(true));

    layout
    {
        area(content)
        {
            repeater("Batch Invoices")
            {
                field(BatchNo;"Batch No")
                {
                    ApplicationArea = Basic;
                }
                field(BatchDescription;"Batch Description")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(DateCreated;"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field(TimeCreated;"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy;"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(NoofInvoices;"No of Invoices")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012;Notes)
            {
            }
            systempart(Control1000000013;MyNotes)
            {
            }
            systempart(Control1000000014;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("<Action1000000017>")
            {
                ApplicationArea = Basic;
                Caption = 'Post Invoices';

                trigger OnAction()
                var
                    LevyMgt: Codeunit "Compute Levies";
                begin
                    LevyMgt.PostInvoices(Rec);
                end;
            }
        }
    }
}

