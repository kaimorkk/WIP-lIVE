Page 52193484 "Invoice Header"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Invoice Header";
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
                field(VendorNo; "Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(VendorName; "Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(DueDate; "Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Loaded; Loaded)
                {
                    ApplicationArea = Basic;
                }
                field(PostingDescription; "Posting Description")
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
                RunObject = XMLport "Invoice Header";
            }
            action("Load Invoices")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    InvoiceRec.Reset;
                    InvoiceRec.SetRange(Status, 0);
                    if InvoiceRec.Find('-') then begin
                        repeat
                            PurchaseHeader.Init;

                            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Invoice;
                            PurchaseHeader."No." := InvoiceRec."Invoice No";
                            PurchaseHeader."Buy-from Vendor No." := InvoiceRec."Vendor No";
                            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
                            PurchaseHeader."Pay-to Vendor No." := InvoiceRec."Vendor No";
                            PurchaseHeader.Validate(PurchaseHeader."Pay-to Vendor No.");
                            PurchaseHeader."Pay-to Name" := InvoiceRec."Vendor Name";
                            PurchaseHeader.Validate(PurchaseHeader."Pay-to Name");
                            PurchaseHeader."Posting Date" := InvoiceRec."Posting Date";
                            PurchaseHeader.Validate(PurchaseHeader."Posting Date");
                            PurchaseHeader."Document Date" := InvoiceRec."Document Date";
                            PurchaseHeader.Validate(PurchaseHeader."Document Date");
                            PurchaseHeader."Due Date" := "Posting Date" + 10;
                            PurchaseHeader."Posting Description" := InvoiceRec."Posting Description";
                            PurchaseHeader."Shortcut Dimension 1 Code" := InvoiceRec."Global Dimension 1 Code";
                            PurchaseHeader."Shortcut Dimension 2 Code" := InvoiceRec."Global Dimension 2 Code";
                            //PurchaseHeader.VALIDATE(PurchaseHeader."Shortcut Dimension 1 Code");
                            //PurchaseHeader.VALIDATE(PurchaseHeader."Shortcut Dimension 2 Code");
                            Loaded := true;
                            InvoiceRec.Status := Status::"1";
                            InvoiceRec.Modify;
                            PurchaseHeader.Insert;
                        until InvoiceRec.Next = 0;

                        //Status:=1;
                        //PurchaseHeader.MODIFY;
                        //salesline.INSERT;

                    end;
                end;
            }
        }
    }

    var
        PurchaseHeader: Record "Purchase Header";
        InvoiceRec: Record "Invoice Header";
}

