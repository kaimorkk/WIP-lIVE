Page 52194308 "Levy List"
{
    PageType = Card;
    SourceTable = Levy;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LevyNo;LevyNo)
                {
                    ApplicationArea = Basic;
                }
                field(LevyTypeCode;LevyTypeCode)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(FundValue;FundValue)
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;DueDate)
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;PostingDate)
                {
                    ApplicationArea = Basic;
                }
                field(AssociatedLevyReferenceNo;"AssociatedLevyReference No")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(CustomerNo;"CustomerNo.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(DateFilter;DateFilter)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("<Action1000000004>")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Invoices';

                trigger OnAction()
                var
                    ComputeLevies: Codeunit "Compute Levies";
                    BatchNo: Code[20];
                    LevyRec: Record Levy;
                begin
                    BatchNo:=ComputeLevies.GenerateBatch;
                    CurrPage.SetSelectionFilter(LevyRec);
                     if LevyRec.Find('-') then
                      repeat
                       ComputeLevies.GenerateInvoices(LevyRec,BatchNo);
                      until
                       LevyRec.Next=0;
                    CurrPage.Update;
                end;
            }
        }
    }
}

