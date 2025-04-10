codeunit 50003 "Create Receipt"
{
    TableNo = "E-Citizen Payment Entries";

    trigger OnRun()
    begin
        ECitizen.Copy(Rec);
        CreateReceipt(ECitizen);
    end;

    local procedure CreateReceipt(var RecCitizen: Record "E-Citizen Payment Entries")
    var
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLine: Record "Receipt Lines1";
        PostReceipt: Codeunit "Receipts-Post1";
    begin
        CMS.Get();
        CMS.TestField("Licensing Bank Code");
        PostInvoice(RecCitizen);
        ReceiptHeader.Init();
        ReceiptHeader.Type := RecCitizen."Payment Type";
        ReceiptHeader."Cheque No" := RecCitizen."Transaction Code";
        ReceiptHeader.Date := DT2Date(RecCitizen."Transaction Date");
        ReceiptHeader."Received From" := RecCitizen."Account Name";
        ReceiptHeader."On Behalf Of" := RecCitizen."Account Name";
        ReceiptHeader."Bank Code" := CMS."Licensing Bank Code";
        ReceiptHeader."Pay Mode" := 'E-CITIZEN';
        if ReceiptHeader.Insert(true) then begin
            ReceiptLine.Init();
            ReceiptLine."Receipt No." := ReceiptHeader."No.";
            ReceiptLine."Transaction Type" := ReceiptHeader.Type;
            ReceiptLine."Account Type" := ReceiptLine."Account Type"::Customer;
            ReceiptLine."Account No." := fnGetAccountNoFromInvoice(RecCitizen."Invoice No.");
            ReceiptLine.Validate("Account No.");
            ReceiptLine.Description := Format(RecCitizen."Payment Type");
            ReceiptLine.Amount := RecCitizen.Amount;
            // ReceiptLine.validate("Global Dimension 1 Code", ReceiptH."Global Dimension 1 Code");
            // ReceiptLine.Validate("Global Dimension 2 Code", ReceiptH."Global Dimension 2 Code");
            ReceiptLine.validate(Amount);
            ReceiptLine.Insert();
            RecCitizen.fetched := true;
            RecCitizen.Modify();
        end;
        if not ReceiptHeader.Posted then
            PostReceipt.PostReceipt(ReceiptHeader);

    end;

    local procedure PostInvoice(var RecCitizen: Record "E-Citizen Payment Entries")
    var
        Sales: Record "Sales Header";
        SalesInvoice: Record "Sales Invoice Header";
        SalesPost: Codeunit "Sales-Post (Yes/No)";
    begin
        if Sales.Get(RecCitizen."Invoice No.") then begin
            SalesPost.Run(Sales);
        end else begin
            SalesInvoice.Reset();
            SalesInvoice.SetRange("Pre-Assigned No.", RecCitizen."Invoice No.");
            if SalesInvoice.FindFirst() then
                exit;
            RecCitizen.failed := true;
            RecCitizen."Error Message" := 'Invoice not found';
            RecCitizen.Modify();
        end;
    end;

    procedure fnGetAccountNoFromInvoice(PrnNo: Code[20]): Code[50]
    var
        SalesHeader: Record "Sales Header";
        SalesInv: Record "Sales Invoice Header";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("No.", PrnNo);
        if SalesHeader.FindSet() then
            exit(SalesHeader."Sell-to Customer No.");
        SalesInv.Reset();
        SalesInv.SetRange("Pre-Assigned No.", PrnNo);
        if SalesInv.FindFirst() then
            exit(SalesInv."Sell-to Customer No.");
    end;

    var
        ECitizen: Record "E-Citizen Payment Entries";
        CMS: Record "Cash Management Setup1";
}
