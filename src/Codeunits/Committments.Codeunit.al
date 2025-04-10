Codeunit 52193442 Committments
{

    trigger OnRun()
    begin
    end;


    procedure TreasuryCommittment(var Treasury: Record "Treasury Transactions")
    var
        Committments: Record "Commitment Entries";
        TellerReq: Record "Teller Requisition";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Commitment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Bank: Record "Bank Account";
    begin
        
            Treasury.SetRange("Teller Req No.",TellerReq."Request No.");
            if Treasury.FindFirst then begin
              if TellerReq.Status<>TellerReq.Status::Released then
                  Error('The imprest is not fully approved');
              if Committments.FindLast then
                EntryNo:=Committments."Entry No";
              //REPEAT
                Committments.Init;
                Committments."Commitment No":=Treasury."Teller Req No.";
                Committments."Commitment Type":=Committments."commitment type"::Committmemt;
                Treasury.TestField("Date Issued");
                Committments."Commitment Date":=Treasury."Date Issued";
                Committments."Global Dimension 1 Code":=Treasury."Global Dimension 1";
                Committments."Global Dimension 2 Code":=Treasury."Global Dimension 2";
                Committments.Account:=Treasury."From Account";
                Committments."Committed Amount":=Treasury.Amount;
        
               //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                GenLedSetup.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                GLAccount.SetRange(GLAccount."No.",Treasury."From Account");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                if GLAccount.Find('-') then begin
                 GLAccount.CalcFields(GLAccount."Budgeted Amount",GLAccount."Net Change");
                 BudgetAmount:=GLAccount."Budgeted Amount";
                 Expenses:=GLAccount."Net Change";
                 BudgetAvailable:=GLAccount."Budgeted Amount"-GLAccount."Net Change";//Amount in Bank: Maximum Holding
                end;
             //Get committed Amount
             CommittedAmount:=0;
             CommitmentEntries.Reset;
             CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
             CommitmentEntries.SetRange(CommitmentEntries.Account,Treasury."From Account");
             if Treasury."Date Issued"=0D then
                Error('Please insert the imprest date');
             CommitmentEntries.SetRange(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
                                       Treasury."Date Issued");
             CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
             CommittedAmount:=CommitmentEntries."Committed Amount";
             /*IF LineCommitted(Treasury."No.",ImprestLines."Account No.",ImprestLines."Line No")THEN
                MESSAGE('Line No %1 has been commited',ImprestLines."Line No")
             ELSE*/
             if CommittedAmount+Treasury.Amount>BudgetAvailable then
                Error('You have Exceeded Amount for Treasury Account No %1 By %2 Amount Available %3 CommittedAmount %4'
               ,Committments.Account,
                Abs(BudgetAvailable-(CommittedAmount+Treasury.Amount)),BudgetAvailable,CommittedAmount);
        
               Committments.User:=UserId;
               Committments."Document No":=Treasury.No;
               Committments.No:=Treasury."From Account";
               Committments."Account Type":=Committments."account type"::"Bank Account";
               Committments."Account No.":=Treasury."From Account";
               if Bank.Get(Treasury."From Account") then
               Committments."Account Name":=Bank.Name;
               //CommitmentEntries.Description:=ImprestLines.Description;
               //Check whether line is committed.
              /*IF NOT LineCommitted(Treasury."No.",ImprestLines."Account No.",ImprestLines."Line No")THEN BEGIN*/
                   EntryNo:=EntryNo+1;
                   Committments."Entry No":=EntryNo;
                   Committments.Insert;
                   Treasury.Committed:=true;
                   Treasury.Modify;
               /*END;*/
              //UNTIL ImprestLines.NEXT=0;
              end;
              Message('Amount Committed Successfully and the balance is %1',
              Abs(BudgetAvailable-(CommittedAmount+Treasury.Amount)));
              /*CreatePV(Treasury);*/

    end;
}

