Codeunit 52193474 "Calculate Penalty"
{

    trigger OnRun()
    begin
    end;


    procedure CalculatePenalty(ReceiptRec: Record "Purch. Rcpt. Header")
    var
        OrderRec: Record "Purchase Header";
        OrderPenalty: Record "Order Penalty Rates";
        ExpectedReceiptDate: Date;
        OrderLines: Record "Purchase Line";
        PenaltyCharged: Decimal;
        GenJnLine: Record "Gen. Journal Line";
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup1";
        PurchaseType: Code[20];
    begin
        with ReceiptRec do begin
         if OrderRec.Get(OrderRec."document type"::Order,ReceiptRec."Order No.") then begin
            OrderRec.TestField("Order Date");
            OrderRec.TestField("Expiry Date");
            ExpectedReceiptDate:=OrderRec."Expiry Date";
            PurchaseType:=OrderRec."Purchase Type";
         end;
         //Calculate Penalties based on the Expected receipt date
         if ExpectedReceiptDate<ReceiptRec."Posting Date" then begin
         OrderPenalty.Reset;
         OrderPenalty.SetRange("Purchase Type",PurchaseType);
         OrderPenalty.SetFilter("Start Date",'<=%1',ExpectedReceiptDate);
         OrderPenalty.SetFilter("End Date",'>=%1',ReceiptRec."Posting Date");
          if OrderPenalty.Find('-') then begin
            PenaltyCharged:=(ReceiptRec."Posting Date"-ExpectedReceiptDate)*OrderPenalty."Penalty Rate";


            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name",CMSetup."Payment Voucher Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name",ReceiptRec."Order No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
            Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
            Batch.Name:=ReceiptRec."Order No.";
            if not Batch.Get(Batch."Journal Template Name",Batch.Name) then
            Batch.Insert;

            GenJnLine.Init;
            if CMSetup.Get then
            GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
            GenJnLine."Journal Batch Name":=ReceiptRec."Order No.";
            GenJnLine."Line No.":=10000;
            GenJnLine."Account Type":=GenJnLine."account type"::Vendor;
            GenJnLine."Account No.":=ReceiptRec."Buy-from Vendor No.";
            GenJnLine.Validate(GenJnLine."Account No.");
            GenJnLine."Posting Date":=ReceiptRec."Posting Date";
            GenJnLine."Document No.":=ReceiptRec."Order No.";
            GenJnLine."External Document No.":=ReceiptRec."No.";
            GenJnLine.Description:='Penalty Charged on '+ReceiptRec."Buy-from Vendor Name";
            GenJnLine.Amount:=PenaltyCharged;
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Currency Code":=ReceiptRec."Currency Code";
            GenJnLine.Validate(GenJnLine."Currency Code");
            GenJnLine."Shortcut Dimension 1 Code":=ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            if GenJnLine.Amount<>0 then
             GenJnLine.Insert;
            //"Penalty Computed":=true;
          end;
         end;
        end;
    end;
}

