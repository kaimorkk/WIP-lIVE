XmlPort 50013 "Bank Reconciliation1"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Bank Statement"; "Bank Statement")
            {
                XmlName = 'BankStatement';
                fieldelement(Date; "Bank Statement".Date)
                {
                }
                fieldelement(BankAccount; "Bank Statement"."Bank Account No")
                {
                }
                fieldelement(ChequeNo; "Bank Statement"."Cheque No")
                {
                }
                fieldelement(Amount; "Bank Statement".Amount)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    if LastRecord.Find('+') then
                        EntryNo := LastRecord."Entry No"
                    else
                        EntryNo := 1;
                    "Bank Statement"."Entry No" := EntryNo + 1;
                    //Check if Amount Reconciles
                    BankAccReconLines.Reset;
                    BankAccReconLines.SetRange("Bank Account No.", "Bank Statement"."Bank Account No");
                    //BankAccReconLines.SetRange(,"Bank Statement"."Cheque No");
                    BankAccReconLines.SetRange("Applied Amount", "Bank Statement".Amount);
                    if BankAccReconLines.Find('-') then begin
                        //BankAccReconLines.Reconciled:=true;
                        BankAccReconLines.Modify;
                    end
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        LastRecord: Record "Bank Statement";
        EntryNo: Integer;
        BankAccReconLines: Record "Bank Acc. Reconciliation Line";
}

