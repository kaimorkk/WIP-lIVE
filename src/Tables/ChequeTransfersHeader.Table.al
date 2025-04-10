Table 52193579 "Cheque Transfers Header"
{
    DrillDownPageID = "Cheque Transfer Lis";
    LookupPageID = "Cheque Transfer Lis";

    fields
    {
        field(1;No;Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                  NoSetup.Get;
                  NoSeriesMgt.TestManual(NoSetup."Normal Cheque Transfers Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(8;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9;"Journal Template Name";Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(10;"Journal Batch Name";Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name where ("Journal Template Name"=field("Journal Template Name"));
        }
        field(14;Transferred;Boolean)
        {
        }
        field(15;"Date Transferred";Date)
        {
        }
        field(16;"Time Transferred";Time)
        {
        }
        field(17;"Transferred By";Text[30])
        {
        }
        field(18;"Date Entered";Date)
        {
        }
        field(19;"Time Entered";Time)
        {
        }
        field(20;"Entered By";Text[30])
        {
        }
        field(21;Remarks;Text[150])
        {
        }
        field(22;"Payee Bank Name";Text[30])
        {
        }
        field(23;"Bank  No";Code[30])
        {
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin

                Banks.Reset;
                if Banks.Get("Bank  No") then begin
                "Payee Bank Name":=Banks.Name;
                end;
            end;
        }
        field(24;Charges;Decimal)
        {
        }
        field(25;"Line Totals";Decimal)
        {
            CalcFormula = sum(Transactions.Amount where ("Transfer No"=field(No)));
            FieldClass = FlowField;
        }
        field(26;"Expected Amount";Decimal)
        {
        }
        field(27;"Cheque Type";Option)
        {
            OptionMembers = ,"Normal Cheque","Salary Cheque";
        }
        field(28;"Deposit Slip No";Code[20])
        {
        }
        field(29;"BIH No";Code[20])
        {
        }
        field(30;"Bank Account No";Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(31;"Total Banking Amount";Decimal)
        {
            CalcFormula = sum("Cheque Transactions".Amount where ("Transfer Header No"=field(No)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Transferred then begin
        Error('The transaction has been transferred and therefore cannot be deleted.');
        end;
    end;

    trigger OnInsert()
    begin

          if No = '' then begin
          NoSetup.Get;
          NoSetup.TestField(NoSetup."Normal Cheque Transfers Nos");
          NoSeriesMgt.InitSeries(NoSetup."Normal Cheque Transfers Nos",xRec."No. Series",0D,No,"No. Series");
          end;

        "Date Entered":=Today;
        "Time Entered":=Time;
        "Entered By":=UserId;
    end;

    trigger OnModify()
    begin
        if Transferred then begin
        Error('The transaction has been transferred and therefore cannot be modified.');
        end;
    end;

    trigger OnRename()
    begin
        if Transferred then begin
        Error('The transaction has been transferred and therefore cannot be modified.');
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Accounts: Record Vendor;
        Members: Record Vendor;
        AccountHolders: Record Vendor;
        Banks: Record "Bank Account";
        GLSetup: Record "General Ledger Setup";
        NoSetup: Record "Purchases & Payables Setup";
}

