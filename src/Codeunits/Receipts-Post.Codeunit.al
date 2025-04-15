Codeunit 52193466 "Receipts-Post"
{

    trigger OnRun()
    begin
    end;

    var
        CMSetup: Record "General Ledger Setup";


    procedure PostReceipt(RptHeader: Record "Levy Receipt Header")
    var
        GenJnLine: Record "Gen. Journal Line";
        RcptLine: Record "Levy Receipt Lines";
        LineNo: Integer;
        Batch: Record "Gen. Journal Batch";
        GLEntry: Record "G/L Entry";
    begin

        /*IF CONFIRM('Are you sure you want to post the receipt no '+RptHeader.No+' ?')=TRUE THEN BEGIN
        
          IF RptHeader.Posted THEN
             ERROR('The Receipt has been posted');
        
           RptHeader.TESTFIELD("Bank Code");
           RptHeader.TESTFIELD("Payment Mode");
           RptHeader.TESTFIELD("Paid in By");
           RptHeader.TESTFIELD("Receipt Date");
        
           IF RptHeader."Payment Mode"='CHEQUE' THEN BEGIN
              RptHeader.TESTFIELD("Cheque No.");
              RptHeader.TESTFIELD("Cheque Date");
           END;
        
          CMSetup.GET();
          // Delete Lines Present on the General Journal Line
          GenJnLine.RESET;
          GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Receipt Template");
          GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",RptHeader.No);
          GenJnLine.DELETEALL;
        
          Batch.INIT;
          IF CMSetup.GET() THEN
          Batch."Journal Template Name":=CMSetup."Receipt Template";
          Batch.Name:=RptHeader.No;
          IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
          Batch.INSERT;
        
          //Post Bank entries
          RptHeader.CALCFIELDS(RptHeader.Amount);
          LineNo:=LineNo+1000;
          GenJnLine.INIT;
          GenJnLine."Journal Template Name":=CMSetup."Receipt Template";
          GenJnLine."Journal Batch Name":=RptHeader.No;
          GenJnLine."Line No.":=LineNo;
          GenJnLine."Account Type":=GenJnLine."Account Type"::"Bank Account";
          GenJnLine."Account No.":=RptHeader."Bank Code";
          GenJnLine."Posting Date":=RptHeader."Receipt Date";
          GenJnLine."Document No.":=RptHeader.No;
          GenJnLine.Description:=RptHeader."Paid in By";
          GenJnLine.Amount:=RptHeader.Amount;
          GenJnLine.VALIDATE(GenJnLine.Amount);
          GenJnLine."External Document No.":=RptHeader."Cheque No.";
          GenJnLine."Currency Code":=RptHeader."Currency Code";
          GenJnLine.VALIDATE(GenJnLine."Currency Code");
          //GenJnLine."Pay Mode":=RptHeader."Payment Mode";
          IF RptHeader."Payment Mode"='CHEQUE' THEN
          //GenJnLine."Cheque Date":=RptHeader."Cheque Date";
          GenJnLine."Shortcut Dimension 1 Code":=RptHeader."Global Dimension 1 Code";
          GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
          GenJnLine."Shortcut Dimension 2 Code":=RptHeader."Global Dimension 2 Code";
          GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
          IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;
        
        
         //Post the receipt lines
            RcptLine.SETRANGE(RcptLine."Registration No.",RptHeader.No);
          IF RcptLine.FINDFIRST THEN BEGIN
             REPEAT
        
             RcptLine.VALIDATE(Amount);
             LineNo:=LineNo+1000;
             GenJnLine.INIT;
             GenJnLine."Journal Template Name":=CMSetup."Receipt Template";
             GenJnLine."Journal Batch Name":=RptHeader.No;
             GenJnLine."Line No.":=LineNo;
             MESSAGE('%1',RcptLine."Account Type");
             GenJnLine."Account Type":=RcptLine."Account Type";
             GenJnLine."Account No.":=RcptLine."Account No.";
             // GenJnLine.VALIDATE(GenJnLine."Account No.");
             GenJnLine."Posting Date":=RptHeader."Receipt Date";
             GenJnLine."Document No.":=RptHeader.No;
             GenJnLine.Description:=RcptLine."In Payment For"+''+RcptLine."Account Name";
             GenJnLine.Amount:=-RcptLine.Amount;
             GenJnLine.VALIDATE(GenJnLine.Amount);
             GenJnLine."External Document No.":=RptHeader."Cheque No.";
             GenJnLine."Currency Code":=RptHeader."Currency Code";
             GenJnLine.VALIDATE(GenJnLine."Currency Code");
             GenJnLine."Shortcut Dimension 1 Code":=RcptLine."Global Dimension 1 Code";
             GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
             GenJnLine."Shortcut Dimension 2 Code":=RcptLine."Global Dimension 2 Code";
             GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
             IF GenJnLine.Amount<>0 THEN
                GenJnLine.INSERT;
             UNTIL
              RcptLine.NEXT=0;
            END;
        
            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnLine);
            GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",RptHeader.No);
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            IF GLEntry.FINDFIRST THEN BEGIN
            RptHeader.Posted:=TRUE;
            RptHeader."Posted Date":=TODAY;
            RptHeader."Posted Time":=TIME;
            RptHeader."Posted By":=USERID;
            RptHeader.MODIFY;
            END;
        END;
         */

    end;
}

