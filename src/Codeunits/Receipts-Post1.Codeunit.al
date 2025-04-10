Codeunit 52193468 "Receipts-Post1"
{

    trigger OnRun()
    begin
    end;

    var
        CMSetup: Record "Cash Management Setup1";


    procedure PostReceipt(RptHeader: Record "Receipts Header1")
    var
        GenJnLine: Record "Gen. Journal Line";
        RcptLine: Record "Receipt Lines1";
        LineNo: Integer;
        Batch: Record "Gen. Journal Batch";
        GLEntry: Record "G/L Entry";
    begin

        if Confirm('Are you sure you want to post the receipt no '+RptHeader."No."+' ?')=true then begin

          if RptHeader.Posted then
             Error('The Receipt has been posted');
          // Check Amount
          RptHeader.CalcFields(RptHeader."Total Amount");
         if RptHeader.Amount<>RptHeader."Total Amount" then
              Error(' The Amount must be equal to the Total Amount on the Lines');

           RptHeader.TestField("Bank Code");
           RptHeader.TestField("Pay Mode");
           RptHeader.TestField("Received From");
           RptHeader.TestField(Date);

           if RptHeader."Pay Mode"='CHEQUE' then begin
              RptHeader.TestField("Cheque No");
              RptHeader.TestField("Cheque Date");
           end;

          CMSetup.Get();
          // Delete Lines Present on the General Journal Line
          GenJnLine.Reset;
          GenJnLine.SetRange(GenJnLine."Journal Template Name",CMSetup."Receipt Template");
          GenJnLine.SetRange(GenJnLine."Journal Batch Name",RptHeader."No.");
          GenJnLine.DeleteAll;

          Batch.Init;
          if CMSetup.Get() then
          Batch."Journal Template Name":=CMSetup."Receipt Template";
          Batch.Name:=RptHeader."No.";
          if not Batch.Get(Batch."Journal Template Name",Batch.Name) then
          Batch.Insert;

          //Post Bank entries
          RptHeader.CalcFields(RptHeader."Total Amount");
          LineNo:=LineNo+1000;
          GenJnLine.Init;
          GenJnLine."Journal Template Name":=CMSetup."Receipt Template";
          GenJnLine."Journal Batch Name":=RptHeader."No.";
          GenJnLine."Line No.":=LineNo;
          GenJnLine."Account Type":=GenJnLine."account type"::"Bank Account";
          GenJnLine."Account No.":=RptHeader."Bank Code";
          GenJnLine."Posting Date":=RptHeader.Date;
          GenJnLine."Document No.":=RptHeader."No.";
          GenJnLine.Description:=RptHeader."Received From";
          GenJnLine.Amount:=RptHeader."Total Amount";
          GenJnLine."Pay Mode":=RptHeader."Pay Mode";
          GenJnLine."Currency Code":=RptHeader."Currency Code";
          GenJnLine."Pay Mode":=RptHeader."Pay Mode";
          GenJnLine.Remarks:=RptHeader.Remarks;
          GenJnLine."Received From":=RptHeader."Received From";
          GenJnLine."On Behalf Of":=RptHeader."On Behalf Of";
          GenJnLine.Validate(GenJnLine."Currency Code");


          GenJnLine.Validate(GenJnLine.Amount);
          GenJnLine."External Document No.":=RptHeader."Cheque No";



          GenJnLine."Pay Mode":=RptHeader."Pay Mode";
          if RptHeader."Pay Mode"='CHEQUE' then
          GenJnLine."Cheque Date":=RptHeader."Cheque Date";
          GenJnLine."Shortcut Dimension 1 Code":=RptHeader."Global Dimension 1 Code";
          GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
          GenJnLine."Shortcut Dimension 2 Code":=RptHeader."Global Dimension 2 Code";
          GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

          if GenJnLine.Amount<>0 then
             GenJnLine.Insert;


         //Post the receipt lines
         RcptLine.Reset;
          RcptLine.SetRange(RcptLine."Receipt No.",RptHeader."No.");
          if RcptLine.FindFirst then begin
             repeat
             RcptLine.Validate(Amount);
             LineNo:=LineNo+1000;
             GenJnLine.Init;
             GenJnLine."Journal Template Name":=CMSetup."Receipt Template";
             GenJnLine."Journal Batch Name":=RptHeader."No.";
             GenJnLine."Line No.":=LineNo;
             GenJnLine."Account Type":=RcptLine."Account Type";
             GenJnLine."Account No.":=RcptLine."Account No.";
             GenJnLine."Posting Date":=RptHeader.Date;
             GenJnLine."Document No.":=RptHeader."No.";
             GenJnLine.Description:=RcptLine.Description;
             GenJnLine.Amount:=-RcptLine."Net Amount";
             //MESSAGE('%1',GenJnLine.Amount);
             GenJnLine."External Document No.":=RptHeader."Cheque No";
             GenJnLine."Currency Code":=RptHeader."Currency Code";

            // GenJnLine.VALIDATE(GenJnLine."Account No.");
             //GenJnLine.VALIDATE(GenJnLine.Amount);
             GenJnLine.Validate(GenJnLine."Currency Code");
             GenJnLine."Shortcut Dimension 1 Code":=RcptLine."Global Dimension 1 Code";
             GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
             GenJnLine."Shortcut Dimension 2 Code":=RcptLine."Global Dimension 2 Code";
             GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
             if RcptLine."Applies to Doc. No"<>'' then begin
             GenJnLine."Applies-to Doc. Type":=RcptLine."Applies-to Doc. Type";
             GenJnLine."Applies-to Doc. No.":=RcptLine."Applies to Doc. No";
             GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
             end;
             if GenJnLine.Amount<>0 then
                GenJnLine.Insert;
             until
              RcptLine.Next=0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.",RptHeader."No.");
            GLEntry.SetRange(GLEntry.Reversed,false);
            if GLEntry.FindFirst then begin
            RptHeader.Posted:=true;
            RptHeader."Posted Date":=Today;
            RptHeader."Posted Time":=Time;
            RptHeader."Posted By":=UserId;
            RptHeader.Modify;
                end;
        end;
    end;
}

