Codeunit 52193465 "Compute Levies"
{

    trigger OnRun()
    begin
    end;

    var
        "Computation Rates": Record "Levy Computation Rates";
        Levies: Record Levy;
        SchemeValues: Record SchemeFundValues;
        LevyValue: Decimal;
        Customer: Record Customer;
        Text000: label 'Levy Type Code %1 doesn''''t exist';
        Text001: label 'Generating Invoice for %1';
        Text002: label 'Sales setup doesn''''t exist';
        Text003: label 'Are you sure you want to post the Invoice batch %1 ?';


    procedure "Compute Levy"(var CustomerNo: Code[20])
    begin
            //  /*
            //   // ********We loop through customers*********************/
            //    Customer.SetRange(Customer."No.",CustomerNo);
            //    if Customer.Find('-') then begin
            //      // *** we pick up FundValues****************************/
            //      SchemeValues.SetRange(SchemeValues.SchemeID,Customer."No.");
            //      if SchemeValues.Find('-') then begin
            //      "Computation Rates".SetFilter("Computation Rates".RangeMin,'<=%1',SchemeValues.FundValue);
            //      "Computation Rates".SetFilter("Computation Rates".RangeMax,'>=%1',SchemeValues.FundValue);
            //        if  "Computation Rates".Find('-') then
            //            LevyValue:= SchemeValues.FundValue*"Computation Rates".Rate/100;
        
            //        //*****Inert into the levies Table*************/
            //        Levies.LevyNo:='';
            //        Levies.CustomerNo:=Customer."No.";
            //        //Levies.LevyTypeCode:=Levies.Levytypecode::"1";
            //        Levies.Amount:=LevyValue;
            //        Levies.Insert;
            //        end;
        
            //    end;
            //   */

    end;


    procedure GenerateInvoices(LevyRec: Record Levy;BatchNo: Code[20])
    var
        InvoiceHeader: Record "Sales Header";
        InvoiceLines: Record "Sales Line";
        LevyTypes: Record "Levy Types";
        BatchInvoiceLines: Record "Batch Invoice Lines";
        Window: Dialog;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
    begin

        with LevyRec do begin
         Window.Open(Text001,Name);
         if not "Invoice Generated" then begin
         InvoiceHeader.Init;
         InvoiceHeader."Document Type":=InvoiceHeader."document type"::Invoice;
         if not SalesSetup.Get then
          Error(Text002);
          SalesSetup.TestField("Invoice Nos.");
         InvoiceHeader."No.":=NoSeriesMgt.GetNextNo(SalesSetup."Invoice Nos.",Today,true);
         InvoiceHeader."Sell-to Customer No.":="CustomerNo.";
         if PostingDate<>0D then begin
         InvoiceHeader."Posting Date":=PostingDate;
         InvoiceHeader."Document Date":=PostingDate;
         end
         else begin
         InvoiceHeader."Posting Date":=Date;
         InvoiceHeader.Validate("Posting Date");
         InvoiceHeader."Document Date":=Date;
         end;
         InvoiceHeader."Shipment Date":=WorkDate;
         InvoiceHeader.Validate("Sell-to Customer No.");
          if not InvoiceHeader.Get(InvoiceHeader."document type"::Invoice,InvoiceHeader."No.") then
           InvoiceHeader.Insert;

         //Insert Lines
         InvoiceLines.Init;
         InvoiceLines."Document Type":=InvoiceLines."document type"::Invoice;
         InvoiceLines."Document No.":=InvoiceHeader."No.";
         InvoiceLines."Line No.":=10000;
         InvoiceLines.Type:=InvoiceLines.Type::"G/L Account";
          if LevyTypes.Get(LevyTypeCode) then begin
             LevyTypes.TestField("G/L Account");
         InvoiceLines."No.":=LevyTypes."G/L Account";
         end else
          Error(Text000,LevyTypeCode);
         InvoiceLines.Validate("No.");
         InvoiceLines.Quantity:=1;
         InvoiceLines.Validate(Quantity);
         InvoiceLines."Unit Price":=Amount;
         InvoiceLines.Validate("Unit Price");
          if not InvoiceLines.Get(InvoiceLines."document type"::Invoice,InvoiceLines."Document No.",InvoiceLines."Line No.") then
         InvoiceLines.Insert;

         //Create Batch
         BatchInvoiceLines."Batch No":=BatchNo;
         BatchInvoiceLines."Invoice No":=InvoiceHeader."No.";
         BatchInvoiceLines."Scheme No":="CustomerNo.";
         BatchInvoiceLines."Scheme Name":=Name;
         BatchInvoiceLines.Amount:=Amount;
         BatchInvoiceLines."Automatically Post":=true;
         if not BatchInvoiceLines.Get(BatchInvoiceLines."Batch No",BatchInvoiceLines."Invoice No") then
         BatchInvoiceLines.Insert;
         //Update Levy
         InvoiceNo:=InvoiceHeader."No.";
         "Invoice Generated":=true;
         Modify;
         end;
        Window.Close;
        end;
    end;


    procedure GenerateBatch() BatchNo: Code[20]
    var
        BatchInvoice: Record "Batch Invoices";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        BatchInvoice.Init;
         if not SalesSetup.Get then
          Error(Text002);
          SalesSetup.TestField("Batch Invoice Nos");
        BatchInvoice."Batch No":=NoSeriesMgt.GetNextNo(SalesSetup."Batch Invoice Nos",Today,true);
        BatchInvoice."Created By":=UserId;
        BatchInvoice."Date Created":=Today;
        BatchInvoice."Time Created":=Time;
        BatchInvoice.Insert;
         BatchNo:=BatchInvoice."Batch No";
    end;


    procedure PostInvoices(BatchInvoice: Record "Batch Invoices")
    var
        BatchInvoiceLines: Record "Batch Invoice Lines";
        InvoiceHeader: Record "Sales Header";
        PostedInvoice: Record "Sales Invoice Header";
        Post: Boolean;
    begin

        if Confirm(Text003,false,BatchInvoice."Batch No") then begin
        with BatchInvoice do begin
           BatchInvoiceLines.Reset;
           BatchInvoiceLines.SetRange("Batch No",BatchInvoice."Batch No");
           BatchInvoiceLines.SetFilter(BatchInvoiceLines."Invoice No",'<>%1','');
            if BatchInvoiceLines.Find('-') then begin
               repeat
                if InvoiceHeader.Get(InvoiceHeader."document type"::Invoice,BatchInvoiceLines."Invoice No") then begin
                   Codeunit.Run(Codeunit::"Sales-Post",InvoiceHeader);
                   PostedInvoice.Reset;
                   PostedInvoice.SetRange("Pre-Assigned No.",BatchInvoiceLines."Invoice No");
                    if PostedInvoice.Find('-') then begin
                     BatchInvoiceLines."Posted Invoice No":=PostedInvoice."No.";
                     BatchInvoiceLines.Posted:=true;
                     BatchInvoiceLines.Modify;
                    end;
                end;
               until
                BatchInvoiceLines.Next=0;
            end;
           //Check if Posted
           CalcFields(Posted);
            if Posted then begin
              "Posted By":=UserId;
              "Date Posted":=Today;
              "Time Posted":=Time;
            end;
        end;
        end;
    end;
}

