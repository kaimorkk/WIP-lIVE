Codeunit 52193467 "Payment- Post"
{

    trigger OnRun()
    begin
    end;

    var
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup1";
        Text000: label 'You cannot refund an amount that is greater than the what has been overpaid.\';
        Text001: label 'The refund should be %1 and not %2 as the overpayment is %3';
        Text002: label '%1 of %2 does''''nt exist on the Levy Types';


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
        LevyRec: Record Levy;
        LastLevy: Record Levy;
        EntryNo: Integer;
        LevyTypeRec: Record "Levy Types";
    begin
        
        
        if Confirm('Are u sure u want to post the Payment Voucher No. '+PV.No+' ?')=true then begin
        
        //IF PV.Status<>PV.Status::Released THEN
        /// ERROR('The Payment Voucher No %1 cannot be posted before it is fully approved',PV.No);
        
        /*IF PV.Posted THEN
         ERROR('Payment Voucher %1 has been posted',PV.No);*/
        // MESSAGE('Payment Voucher %1 has been posted',PV.No);
        
        PV.TestField(Date);
        PV.TestField("Paying Bank Account");
        PV.TestField(PV.Payee);
        PV.TestField(PV."Pay Mode");
        
        if PV."Pay Mode"='CHEQUE' then begin
        
        PV.TestField(PV."Cheque No");
        //PV.TESTFIELD(PV."Cheque Date");
        end;
        
        //Check Lines
          PV.CalcFields("Total Amount");
          if PV."Total Amount"=0 then
          Error('Amount is cannot be zero');
          if PV."Total Amount"<>PV.Amount then
          Error('Amount must be equal to Total amount on the Lines');
        
        
          PVLines.Reset;
          PVLines.SetRange(PVLines."PV No",PV.No);
          PVLines.SetFilter(PVLines.Amount,'<>%1',0);
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
        GenJnLine.Init;
        if CMSetup.Get then
        
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //added by debbie to change the document no to cheque number
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        // GenJnLine."Document No.":=PV."Cheque No";
        GenJnLine."Account Type":=GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No.":=PV."Paying Bank Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        // changed by Debbie
        GenJnLine."External Document No.":= GenJnLine."Document No.";
        GenJnLine.Description:=PV.No;
        GenJnLine.Description:=PV.Payee;
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";
        
        GenJnLine.Amount:=-PV."Total Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PV."Global Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PV."Global Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        //GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        GenJnLine."Posting Date":=PV.Date;
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
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.Validate(GenJnLine."Account No.");
        
        GenJnLine.Validate(GenJnLine."Posting Date");
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        //  GenJnLine."Document No.":=PV."Cheque No";
        //GenJnLine."Document No.":=PV.No;
        // GenJnLine."External Document No.":=PV."Cheque No" ;
        GenJnLine."External Document No.":=GenJnLine."Document No." ;
        GenJnLine.Description:=PVLines.Description;
        //GenJnLine."Description 2":=PVLines.Description;
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        if PV."Exchange Rate"<>0 then
        GenJnLine."Currency Factor":=1/PV."Exchange Rate";
        
        GenJnLine.Amount:=PVLines."Net Amount";
        GenJnLine.Validate(Amount);
        
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";
        
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        if PVLines."Applies to Doc. No"<>'' then begin
        GenJnLine."Applies-to Doc. Type":=PVLines."Applies-to Doc. Type";
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
        end;
        
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
        //MESSAGE('Posting date lines=%1',GenJnLine."Posting Date");
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;
        
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
        //Added by Debbie to post cheque number as document no
        if PV."Cheque No"<>'' then
        GenJnLine."Document No.":=PV."Cheque No"
        else
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-WHVAT';
        GenJnLine.Amount:=PVLines."W/Tax Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        
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
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        /*
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
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
        //Added by Debbie to post cheque number as document no
        if PV."Cheque No"<>'' then
        GenJnLine."Document No.":=PV."Cheque No"
        else
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-WHVAT';
        GenJnLine.Amount:=-PVLines."W/Tax Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
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
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        /*
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;
        end;
        //End of Posting Withholding Tax
        //Post Payee
        if PVLines."Payee Code"<>'' then begin
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
        //Added by Debbie to post cheque number as document no
        if PV."Cheque No"<>'' then
        GenJnLine."Document No.":=PV."Cheque No"
        else
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-PAYE';
        GenJnLine.Amount:=PVLines."Payee Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        
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
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        /*
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
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
        if VATSetup.Get(GLAccount."VAT Bus. Posting Group",PVLines."Payee Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        PVLines."account type"::Vendor:
        begin
        Vendor.Get(PVLines."Account No");
        Vendor.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(Vendor."VAT Bus. Posting Group",PVLines."Payee Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        PVLines."account type"::Customer:
        begin
        Customer.Get(PVLines."Account No");
        Customer.TestField("VAT Bus. Posting Group");
        if VATSetup.Get(Customer."VAT Bus. Posting Group",PVLines."Payee Code") then
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        end;
        end;
         if PV.Date=0D then
          Error('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //Added by Debbie to post cheque number as document no
        if PV."Cheque No"<>'' then
        GenJnLine."Document No.":=PV."Cheque No"
        else
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-PAYE';
        GenJnLine.Amount:=-PVLines."Payee Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
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
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        /*
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;
        end;
        //End of Posting Payee
        
        
        /*
        //Post Retention
        IF PVLines."Retention Code"<>'' THEN BEGIN
        PVLines.VALIDATE(PVLines.Amount);
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
         IF PV.Date=0D THEN
          ERROR('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-Retention';
        GenJnLine.Amount:=PVLines."Retention Amount";
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        
        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
        GenJnLine.VALIDATE("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.VALIDATE("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.VALIDATE("VAT Prod. Posting Group");
        //
        IF PV."Pay Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        //GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        {
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        }
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        
        
        
        
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."Account Type"::"G/L Account";
        CASE PVLines."Account Type" OF
        PVLines."Account Type"::"G/L Account":
        BEGIN
        GLAccount.GET(PVLines."Account No");
        GLAccount.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(GLAccount."VAT Bus. Posting Group",PVLines."Retention Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        PVLines."Account Type"::Vendor:
        BEGIN
        Vendor.GET(PVLines."Account No");
        Vendor.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(Vendor."VAT Bus. Posting Group",PVLines."Retention Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        PVLines."Account Type"::Customer:
        BEGIN
        Customer.GET(PVLines."Account No");
        Customer.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(Customer."VAT Bus. Posting Group",PVLines."Retention Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        END;
         IF PV.Date=0D THEN
          ERROR('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        GenJnLine.VALIDATE(GenJnLine."Posting Date");
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-Retention';
        GenJnLine.Amount:=-PVLines."Retention Amount";
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
        GenJnLine.VALIDATE("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.VALIDATE("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.VALIDATE("VAT Prod. Posting Group");
        //
        IF PV."Pay Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        {
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        }
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        END;
        //End of Posting Retention
        
        
        //Post VAT
        IF CMSetup."Post VAT" THEN BEGIN
        IF PV."VAT Code"<>'' THEN BEGIN
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
         IF PV.Date=0D THEN
          ERROR('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-VAT';
        GenJnLine.Amount:=PVLines."VAT Amount";
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        
        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
        GenJnLine.VALIDATE("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.VALIDATE("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.VALIDATE("VAT Prod. Posting Group");
        //
        IF PV."Pay Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        {
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        }
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."Account Type"::"G/L Account";
        CASE PVLines."Account Type" OF
        PVLines."Account Type"::"G/L Account":
        BEGIN
        GLAccount.GET(PVLines."Line No");
        GLAccount.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(GLAccount."VAT Bus. Posting Group",PV."VAT Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        PVLines."Account Type"::Vendor:
        BEGIN
        Vendor.GET(PVLines."Account No");
        Vendor.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(Vendor."VAT Bus. Posting Group",PV."VAT Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        PVLines."Account Type"::Customer:
        BEGIN
        Customer.GET(PVLines."Account No");
        Customer.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(Customer."VAT Bus. Posting Group",PV."VAT Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        END;
         IF PV.Date=0D THEN
          ERROR('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-VAT';
        GenJnLine.Amount:=-PVLines."VAT Amount";
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
        GenJnLine.VALIDATE("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.VALIDATE("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.VALIDATE("VAT Prod. Posting Group");
        //
        IF PV."Pay Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        {
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        }
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        
        END;
        //End of Posting VAT
        END;
        //Post Withholding Tax
        IF PVLines."W/Tax Code"<>'' THEN BEGIN
        PVLines.VALIDATE(PVLines.Amount);
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=PVLines."Account Type";
        GenJnLine."Account No.":=PVLines."Account No";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
         IF PV.Date=0D THEN
          ERROR('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-WHVAT';
        GenJnLine.Amount:=PVLines."W/Tax Amount";
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        
        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
        GenJnLine.VALIDATE("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.VALIDATE("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.VALIDATE("VAT Prod. Posting Group");
        //
        IF PV."Pay Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        {
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        }
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=PV.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."Account Type"::"G/L Account";
        CASE PVLines."Account Type" OF
        PVLines."Account Type"::"G/L Account":
        BEGIN
        GLAccount.GET(PVLines."Account No");
        GLAccount.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(GLAccount."VAT Bus. Posting Group",PVLines."W/Tax Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        PVLines."Account Type"::Vendor:
        BEGIN
        Vendor.GET(PVLines."Account No");
        Vendor.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(Vendor."VAT Bus. Posting Group",PVLines."W/Tax Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        PVLines."Account Type"::Customer:
        BEGIN
        Customer.GET(PVLines."Account No");
        Customer.TESTFIELD("VAT Bus. Posting Group");
        IF VATSetup.GET(Customer."VAT Bus. Posting Group",PVLines."W/Tax Code") THEN
        GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
        END;
        END;
         IF PV.Date=0D THEN
          ERROR('You must specify the PV date');
        GenJnLine."Posting Date":=PV.Date;
        //Added by Debbie to post cheque number as document no
        IF PV."Cheque No"<>'' THEN
        GenJnLine."Document No.":=PV."Cheque No"
        ELSE
        GenJnLine."Document No.":=PV.No;
        
        //GenJnLine."Document No.":=PV.No;
        GenJnLine."External Document No.":=PV.No;
        GenJnLine.Description:=PVLines.Description+'-WHVAT';
        GenJnLine.Amount:=-PVLines."W/Tax Amount";
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        //Set these fields to blanks
        GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
        GenJnLine.VALIDATE("Gen. Posting Type");
        GenJnLine."Gen. Bus. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Bus. Posting Group");
        GenJnLine."Gen. Prod. Posting Group":='';
        GenJnLine.VALIDATE("Gen. Prod. Posting Group");
        GenJnLine."VAT Bus. Posting Group":='';
        GenJnLine.VALIDATE("VAT Bus. Posting Group");
        GenJnLine."VAT Prod. Posting Group":='';
        GenJnLine.VALIDATE("VAT Prod. Posting Group");
        //
        IF PV."Pay Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID":=PVLines."Dimension Set ID";
        {
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        }
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        END;*/
        //End of Posting Withholding Tax
        
        until PVLines.Next=0;
        end;
        
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnLine);
        PV.Posted:=true;
        PV."Posted By":=UserId;
        PV."Date Posted":=Today;
        PV."Time Posted":=Time;
        PV.Modify;
        
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."External Document No.",PV.No);
        
        GLEntry.SetRange(GLEntry.Reversed,false);
        if GLEntry.FindFirst then begin
        PV.Posted:=true;
        PV."Posted By":=UserId;
        PV."Date Posted":=Today;
        PV."Time Posted":=Time;
        PV.Modify;
        end;
        PV.Posted:=true;
        PV."Posted By":=UserId;
        PV."Date Posted":=Today;
        PV."Time Posted":=Time;
        PV.Modify;
        
        
        end;

    end;


    procedure PostLevies(LevyReceipt: Record "Levy Receipt Header")
    var
        LevyReceiptLines: Record "Levy Receipt Lines";
        LineNo: Integer;
        GenJnLine: Record "Gen. Journal Line";
        GLEntry: Record "G/L Entry";
    begin
        /*
        IF CONFIRM('Are u sure u want to post the Levy Receipt No. '+LevyReceipt.No+' ?')=TRUE THEN BEGIN
        IF LevyReceipt.Posted THEN
         ERROR('Levy Receipt %1 has been posted',LevyReceipt.No);
        LevyReceipt.TESTFIELD("Receipt Date");
        LevyReceipt.TESTFIELD("Bank Code");
        LevyReceipt.TESTFIELD("Payment Mode");
        IF LevyReceipt."Payment Mode"='CHEQUE' THEN BEGIN
        LevyReceipt.TESTFIELD("Cheque No.");
        LevyReceipt.TESTFIELD("Cheque Date");
        END;
        
        //Check Lines
          LevyReceipt.CALCFIELDS(Amount);
          IF LevyReceipt.Amount=0 THEN
          ERROR('Amount cannot be zero');
          LevyReceiptLines.RESET;
          LevyReceiptLines.SETRANGE("Registration No.",LevyReceipt.No);
          IF NOT LevyReceiptLines.FINDLAST THEN
          ERROR('Levy Receipt Lines cannot be empty');
        
          CMSetup.GET();
          CMSetup.TESTFIELD("Receipt Template");
          // Delete Lines Present on the General Journal Line
          GenJnLine.RESET;
          GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Receipt Template");
          GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",LevyReceipt.No);
          GenJnLine.DELETEALL;
        
          Batch.INIT;
          IF CMSetup.GET() THEN
          Batch."Journal Template Name":=CMSetup."Receipt Template";
          Batch.Name:=LevyReceipt.No;
          IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
          Batch.INSERT;
        
        //Bank Entries
        LineNo:=LineNo+10000;
        LevyReceipt.CALCFIELDS(Amount);
        LevyReceiptLines.RESET;
        LevyReceiptLines.SETRANGE("Registration No.",LevyReceipt.No);
        LevyReceiptLines.VALIDATE(Amount);
        LevyReceiptLines.CALCSUMS(Amount);
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name":=LevyReceipt.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."Account Type"::"Bank Account";
        GenJnLine."Account No.":=LevyReceipt."Bank Code";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
         IF LevyReceipt."Receipt Date"=0D THEN
          ERROR('You must specify the Receipt date');
        GenJnLine."Posting Date":=LevyReceipt."Receipt Date";
        GenJnLine."Document No.":=LevyReceipt.No;
        GenJnLine."External Document No.":=LevyReceipt."Cheque No.";
        GenJnLine.Description:=LevyReceipt."Paid in By";
        GenJnLine.Amount:=LevyReceipt.Amount;
        GenJnLine.VALIDATE(GenJnLine.Amount);
        GenJnLine."Currency Code":=LevyReceipt."Currency Code";
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        GenJnLine."Pay Mode":=LevyReceipt."Payment Mode";
        IF LevyReceipt."Payment Mode"='CHEQUE' THEN
        GenJnLine."Cheque Date":=LevyReceipt."Cheque Date";
        GenJnLine."Shortcut Dimension 1 Code":=LevyReceipt."Global Dimension 1 Code";
        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=LevyReceipt."Global Dimension 2 Code";
        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        
        //Levy Receipt Lines Entries
        LevyReceiptLines.RESET;
        LevyReceiptLines.SETRANGE("Registration No.",LevyReceipt.No);
        IF GenJnLine.FIND('-') THEN BEGIN
        REPEAT
        LevyReceiptLines.VALIDATE(Amount);
        LineNo:=LineNo+10000;
        GenJnLine.INIT;
        IF CMSetup.GET THEN
        GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
        GenJnLine."Journal Batch Name":=LevyReceipt.No;
        GenJnLine."Line No.":=LineNo;
        GenJnLine."Account Type":=GenJnLine."Account Type"::Customer;
        GenJnLine."Account No.":=LevyReceiptLines."Customer No.";
        GenJnLine.VALIDATE(GenJnLine."Account No.");
         IF LevyReceipt."Receipt Date"=0D THEN
          ERROR('You must specify the Receipt date');
        GenJnLine."Posting Date":=LevyReceipt."Receipt Date";
        GenJnLine."Document No.":=LevyReceipt.No;
        GenJnLine."External Document No.":=LevyReceipt."Cheque No.";
        GenJnLine.Description:=LevyReceiptLines."In Payment For";
        GenJnLine.Amount:=-LevyReceiptLines.Amount;
        GenJnLine.VALIDATE(Amount);
        IF LevyReceipt."Payment Mode"='CHEQUE' THEN
        GenJnLine."Pay Mode":=LevyReceipt."Payment Mode";
        GenJnLine."Currency Code":=LevyReceipt."Currency Code";
        GenJnLine.VALIDATE(GenJnLine."Currency Code");
        GenJnLine."Shortcut Dimension 1 Code":=LevyReceiptLines."Global Dimension 1 Code";
        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=LevyReceiptLines."Global Dimension 2 Code";
        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
        IF LevyReceiptLines."Applies to Doc. No"<>'' THEN BEGIN
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=LevyReceiptLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        END;
        IF GenJnLine.Amount<>0 THEN
         GenJnLine.INSERT;
        
        UNTIL LevyReceiptLines.NEXT=0;
        END;
        
        //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnLine);
        GLEntry.RESET;
        GLEntry.SETRANGE(GLEntry."Document No.",LevyReceipt.No);
        GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
        IF GLEntry.FINDFIRST THEN BEGIN
        LevyReceipt.Posted:=TRUE;
        LevyReceipt."Posted By":=USERID;
        LevyReceipt."Posted Date":=TODAY;
        LevyReceipt."Posted Time":=TIME;
        LevyReceipt.MODIFY;
        END;
        
        END;
         */

    end;


    procedure PostBatch(PV: Record Payments)
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
        LevyRec: Record Levy;
        LastLevy: Record Levy;
        EntryNo: Integer;
        LevyTypeRec: Record "Levy Types";
    begin
        
        /*
        IF PV.Status<>PV.Status::Released THEN
         ERROR('The Payment Voucher No %1 cannot be posted before it is fully approved',PV.No);
         */
        if PV.Posted then
         Error('Payment Voucher %1 has been posted',PV.No);
        
        PV.TestField(Date);
        PV.TestField("Paying Bank Account");
        PV.TestField(PV.Payee);
        PV.TestField(PV."Pay Mode");
        
        if PV."Pay Mode"='CHEQUE' then begin
        
        PV.TestField(PV."Cheque No");
        //PV.TESTFIELD(PV."Cheque Date");
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
        GenJnLine.Amount:=-PV."Total Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        GenJnLine."Pay Mode":=PV."Pay Mode";
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
        //GenJnLine."Description 2":=PVLines.Description;
        GenJnLine.Amount:=PVLines."Net Amount";
        GenJnLine.Validate(Amount);
        if PV."Pay Mode"='CHEQUE' then
        GenJnLine."Pay Mode":=PV."Pay Mode";
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        if PVLines."Applies to Doc. No"<>'' then begin
        GenJnLine."Applies-to Doc. Type":=PVLines."Applies-to Doc. Type";
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
        end;
        
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
        /*
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
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
        GenJnLine.Description:=PVLines.Description+'-VAT';
        GenJnLine.Amount:=-PVLines."VAT Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
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
        /*
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
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
        GenJnLine.Description:=PVLines.Description+'-WHVAT';
        GenJnLine.Amount:=PVLines."W/Tax Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
        
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
        /*
        GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
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
        GenJnLine.Description:=PVLines.Description+'-WHVAT';
        GenJnLine.Amount:=-PVLines."W/Tax Amount";
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Currency Code":=PV.Currency;
        GenJnLine.Validate(GenJnLine."Currency Code");
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
        /*
        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
        GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
        */
        if GenJnLine.Amount<>0 then
         GenJnLine.Insert;
        end;
        //End of Posting Withholding Tax
        
        until PVLines.Next=0;
        end;
        
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch",GenJnLine);
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
}

