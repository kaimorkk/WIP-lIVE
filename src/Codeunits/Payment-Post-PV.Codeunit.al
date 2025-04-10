Codeunit 52193469 "Payment- Post-PV"
{

    trigger OnRun()
    begin
    end;

    var
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup1";


    procedure PostPayment(PV: Record Payments)
    var
        Batch: Record "Gen. Journal Batch";
        PVLines: Record "PV Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TarriffCodes: Record "Tarriff Codes1";
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
    begin
        if Confirm('Are u sure u want to post the Payment Voucher No. '+PV.No+' ?')=true then begin
        if PV.Status<>PV.Status::Released then
         Error('The Payment Voucher No %1 cannot be posted before it is fully approved',PV.No);
        if PV.Posted then
         Error('Payment Voucher %1 has been posted',PV.No);
        PV.TestField(Date);
        PV.TestField("Paying Bank Account");
        PV.TestField(PV.Payee);
        PV.TestField(PV."Pay Mode");
        if PV."Pay Mode"='CHEQUE' then begin
        PV.TestField(PV."Cheque No");
        PV.TestField(PV."Cheque Date");
        end;

        //Check Lines
          PV.CalcFields("Total Amount");
          if PV."Total Amount"=0 then
          Error('Amount is cannot be zero');
          PVLines.Reset;
          PVLines.SetRange(PVLines."PV No",PV.No);
          if not PVLines.FindLast then
          Error('Payment voucher Lines cannot be empty');

          CMSetup.Get();
          // Delete Lines Present on the General Journal Line
          GenJnLine.Reset;
          GenJnLine.SetRange(GenJnLine."Journal Template Name",CMSetup."Payment Voucher Template");
          GenJnLine.SetRange(GenJnLine."Journal Batch Name",PV.No);
          GenJnLine.DeleteAll;

          Batch.Init;
          if CMSetup.Get() then
          Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
          Batch.Name:=PV.No;
          if not Batch.Get(Batch."Journal Template Name",Batch.Name) then
          Batch.Insert;

        //Bank Entries
        LineNo:=LineNo+10000;
        PV.CalcFields(PV."Total Amount");
        PVLines.Reset;
        PVLines.SetRange(PVLines."PV No",PV.No);
        PVLines.Validate(PVLines.Amount);
        PVLines.CalcSums(PVLines.Amount);
        PVLines.CalcSums(PVLines."W/Tax Amount");
        PVLines.CalcSums(PVLines."VAT Amount");
        GenJnLine.Init;
        if CMSetup.Get then
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No.":=PV."Paying Bank Account";
        GenJnLine.Validate(GenJnLine."Account No.");
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV."Cheque No";
        GenJnLine.Description:=PV.Payee;
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";

        GenJnLine.Amount:=-PV."Total Amount";
        GenJnLine.Validate(GenJnLine.Amount);

        GenJnLine."Pay Mode":=PV."Pay Mode";
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Cheque Date":=PV."Cheque Date";
        GenJnLine."Shortcut Dimension 1 Code":=PV."Global Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PV."Global Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;

        //PV Lines Entries
        PVLines.Reset;
        PVLines.SetRange(PVLines."PV No",PV.No);
        if PVLines.FindFirst then begin
        repeat
        PVLines.Validate(PVLines.Amount);
        LineNo:=LineNo+10000;
        GenJnLine.Init;
        if CMSetup.Get then
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.Validate(GenJnLine."Account No.");
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV."Cheque No";
        GenJnLine.Description:=PVLines.Description;
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";

        //GenJnLine."Description 2":=PVLines.Description;
        GenJnLine.Amount:=PVLines."Net Amount";
        GenJnLine.Validate(Amount);
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";


        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;

        //Post VAT
        if CMSetup."Post VAT" then begin
        if PV."VAT Code"<>'' then begin
        LineNo:=LineNo+10000;
        GenJnLine.Init;
        if CMSetup.Get then
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.Validate(GenJnLine."Account No.");
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV."Cheque No";
        GenJnLine.Description:=PVLines.Description+'-VAT';
        GenJnLine.Amount:=PVLines."VAT Amount";
        GenJnLine.Validate(GenJnLine.Amount);

        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";

        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."gen. posting type"::" ";
        GenJnLine.Validate("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.Validate("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.Validate("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.Validate("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.Validate("VAT Prod. Posting Group");
        //
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Applies-to Doc. Type":=GenJnLine."applies-to doc. type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;

        LineNo:=LineNo+10000;
        GenJnLine.Init;
        if CMSetup.Get then
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."account type"::"G/L Account";
        case PVLines."Account Type" of
        PVLines."account type"::"G/L Account":
        begin
        GLAccount.Get(PVLines."Line No");
        GLAccount.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(GLAccount."VAT Bus. Posting Group",PV."VAT Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        PVLines."account type"::Vendor:
        begin
        Vendor.Get(PVLines."Account No");
        Vendor.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(Vendor."VAT Bus. Posting Group",PV."VAT Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        PVLines."account type"::Customer:
        begin
        Customer.Get(PVLines."Account No");
        GenJnLine.Description:=PVLines.Description;
        Customer.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(Customer."VAT Bus. Posting Group",PV."VAT Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        end;
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV."Cheque No";
        GenJnLine.Description:=PVLines.Description;
        GenJnLine.Amount:=-PVLines."VAT Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";

        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."gen. posting type"::" ";
        GenJnLine.Validate("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.Validate("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.Validate("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.Validate("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.Validate("VAT Prod. Posting Group");
        //
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;

        end;
        //End of Posting VAT
        end;
        //Post Withholding Tax
        if PVLines."W/Tax Code"<>'' then begin
        PVLines.Validate(PVLines.Amount);
        LineNo:=LineNo+10000;
        GenJnLine.Init;
        if CMSetup.Get then
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.Validate(GenJnLine."Account No.");
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV."Cheque No";
        GenJnLine.Description:=PVLines.Description+'-WHT';
        GenJnLine.Amount:=PVLines."W/Tax Amount";
        GenJnLine.Validate(GenJnLine.Amount);

        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";

        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."gen. posting type"::" ";
        GenJnLine.Validate("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.Validate("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.Validate("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.Validate("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.Validate("VAT Prod. Posting Group");
        //
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Applies-to Doc. Type":=GenJnLine."applies-to doc. type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;

        LineNo:=LineNo+10000;
        GenJnLine.Init;
        if CMSetup.Get then
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."account type"::"G/L Account";
        case PVLines."Account Type" of
        PVLines."account type"::"G/L Account":
        begin
        GLAccount.Get(PVLines."Account No");
        GLAccount.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(GLAccount."VAT Bus. Posting Group",PVLines."W/Tax Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        PVLines."account type"::Vendor:
        begin
        Vendor.Get(PVLines."Account No");
        Vendor.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(Vendor."VAT Bus. Posting Group",PVLines."W/Tax Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        PVLines."account type"::Customer:
        begin
        Customer.Get(PVLines."Account No");
        Customer.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(Customer."VAT Bus. Posting Group",PVLines."W/Tax Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        end;
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV."Cheque No";
        GenJnLine.Description:=PVLines.Description+'-WHT';
        GenJnLine.Amount:=-PVLines."W/Tax Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";

        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."gen. posting type"::" ";
        GenJnLine.Validate("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.Validate("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.Validate("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.Validate("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.Validate("VAT Prod. Posting Group");
        //
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;
        end;
        //End of Posting Withholding Tax

        until PVLines.Next=0;
        end;

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnLine);
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.",PV.No);
        GLEntry.SetRange(GLEntry.Reversed,false);
        if GLEntry.FindFirst then begin
        PV.Posted:=true;
        PV."Posted By":=UserId;
        PV."Date Posted":=Today;
        PV."Time Posted":=Time;
        PV.Modify;
        end;

        end;
    end;
}

