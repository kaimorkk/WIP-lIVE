Page 52193485 "Invoice Lines"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Invoice Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(InvoiceNo; "Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo; "Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(UnitPrice; "Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Import)
            {
                ApplicationArea = Basic;
                RunObject = XMLport "Invoice Lines";
            }
            action("Load Lines")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin


                    InvoiceLine.Reset;
                    InvoiceLine.SetRange(Status, 0);
                    if InvoiceLine.Find('-') then begin
                        repeat

                            PurchaseLine.Init;
                            PurchaseLine."Document Type" := PurchaseLine."document type"::Invoice;
                            PurchaseLine."Document No." := InvoiceLine."Invoice No";
                            PurchaseLine."Line No." := InvoiceLine."Line No";
                            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                            PurchaseLine."No." := InvoiceLine."Account No";
                            PurchaseLine.Validate(PurchaseLine."No.");
                            PurchaseLine.Quantity := InvoiceLine.Quantity;
                            PurchaseLine.Validate(PurchaseLine.Quantity);
                            PurchaseLine."Unit Price (LCY)" := InvoiceLine."Unit Price";
                            PurchaseLine."Line Amount" := InvoiceLine.Amount;
                            PurchaseLine.Description := InvoiceLine.Description;
                            PurchaseLine.Insert;
                            InvoiceLine.Status := Status::"1";
                            InvoiceLine.Modify;
                        until InvoiceLine.Next = 0;

                        PurchaseLine.Modify;
                    end;
                end;
            }
        }
    }

    var
        PurchaseLine: Record "Purchase Line";
        InvoiceLine: Record "Invoice Line";
}

