Table 52193513 "EFT Details"
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = "EFT Header";

            trigger OnValidate()
            begin
                /*IF No <> xRec.No THEN BEGIN
                  NoSetup.GET();
                  NoSeriesMgt.TestManual(NoSetup."EFT Details Nos.");
                  "No. Series" := '';
                END; */

            end;
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Account Name";Code[100])
        {
        }
        field(4;"Account Type";Code[20])
        {
        }
        field(5;"Account No";Code[20])
        {
            NotBlank = true;
            TableRelation = Vendor."No." where ("Debtor Type"=const("FOSA Account"));

            trigger OnValidate()
            begin
                if Accounts.Get("Account No") then begin
                "Account Name":=Accounts.Name;
                "Account Type":=Accounts."Account Type";
                "Member No":=Accounts."BOSA Account No";
                "Staff No":=Accounts."Staff No";
                Amount:=0;

                if AccountTypes.Get(Accounts."Account Type") then begin
                if "Destination Account Type" = "destination account type"::External then
                Charges:=AccountTypes."External EFT Charges"
                else
                Charges:=AccountTypes."Internal EFT Charges";

                AccountTypes.TestField(AccountTypes."EFT Charges Account");
                "EFT Charges Account":=AccountTypes."EFT Charges Account";
                end;

                end;

                Validate("Destination Account Type");
            end;
        }
        field(7;Amount;Decimal)
        {

            trigger OnValidate()
            begin
                AvailableBal:=0;

                //Available Bal
                if Accounts.Get("Account No") then begin
                Accounts.CalcFields(Accounts.Balance,Accounts."Uncleared Cheques",Accounts."ATM Transactions");
                if AccountTypes.Get(Accounts."Account Type") then
                AvailableBal:=Accounts.Balance-(Accounts."Uncleared Cheques"+Accounts."ATM Transactions"+Charges+AccountTypes."Minimum Balance")
                else
                Error('Account type not found.');
                end else
                Error('Account No. not found.');

                if Amount > AvailableBal then
                Error('EFT Amount cannot be more than the availble balance. %1',AvailableBal);
                //Available Bal
            end;
        }
        field(8;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11;"Destination Account No";Code[20])
        {
            TableRelation = if ("Destination Account Type"=const(Internal)) Vendor."No." where ("Debtor Type"=const("FOSA Account"));

            trigger OnValidate()
            begin
                if AccountHolders.Get("Destination Account No") then begin
                "Destination Account Name":=AccountHolders.Name;
                end;
            end;
        }
        field(12;"Destination Account Name";Text[150])
        {
        }
        field(13;"Destination Account Type";Option)
        {
            OptionMembers = External,Internal;

            trigger OnValidate()
            begin
                if AccountTypes.Get(Accounts."Account Type") then begin
                if "Destination Account Type" = "destination account type"::External then
                Charges:=AccountTypes."External EFT Charges"
                else
                Charges:=AccountTypes."Internal EFT Charges";
                end;
            end;
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
        field(17;"Transferred By";Text[20])
        {
        }
        field(18;"Date Entered";Date)
        {
        }
        field(19;"Time Entered";Time)
        {
        }
        field(20;"Entered By";Text[20])
        {
        }
        field(21;Remarks;Text[150])
        {
        }
        field(22;"Payee Bank Name";Text[100])
        {
        }
        field(23;"Bank No";Code[20])
        {
            TableRelation = Banks.Code;

            trigger OnValidate()
            begin
                BanksList.Reset;
                BanksList.SetRange(BanksList.Code,"Bank No");
                if BanksList.Find('-') then begin
                "Payee Bank Name":=BanksList."Bank Name";
                end;
            end;
        }
        field(24;Charges;Decimal)
        {
        }
        field(25;"Header No";Code[20])
        {
            TableRelation = "EFT Header".No;
        }
        field(26;"Member No";Code[20])
        {
        }
        field(27;"Amount Text";Text[20])
        {
        }
        field(28;ExportFormat;Text[73])
        {
        }
        field(29;EAccNo;Text[20])
        {
        }
        field(30;EBankCode;Text[6])
        {
        }
        field(31;EAccName;Text[32])
        {
        }
        field(32;EAmount;Text[10])
        {
        }
        field(33;EReff;Text[5])
        {
        }
        field(34;"Staff No";Code[20])
        {
        }
        field(35;"Over Drawn";Boolean)
        {
        }
        field(37;Primary;Decimal)
        {
        }
        field(38;"Standing Order No";Code[20])
        {
        }
        field(39;"EFT Type";Option)
        {
            OptionMembers = Normal,"ATM EFT";
        }
        field(40;"EFT Charges Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(41;"Standing Order Register No";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;No,"Line No.")
        {
        }
        key(Key2;"Header No","Line No.","Destination Account No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key3;"Header No",No)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //IF Transferred = TRUE THEN
        //ERROR('You cannot modify an already posted record.');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
        NoSetup.Get();
        NoSetup.TestField(NoSetup."EFT Details Nos.");
        NoSeriesMgt.InitSeries(NoSetup."EFT Details Nos.",xRec."No. Series",0D,No,"No. Series");
        end;

        "Date Entered":=Today;
        "Time Entered":=Time;
        "Entered By":=UserId;
    end;

    trigger OnModify()
    begin
        //IF Transferred = TRUE THEN
        //ERROR('You cannot modify an already posted record.');
    end;

    var
        NoSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Accounts: Record Vendor;
        Members: Record Vendor;
        AccountHolders: Record Vendor;
        Banks: Record "Bank Account";
        BanksList: Record Banks;
        StLen: Integer;
        GenAmount: Text[50];
        FundsTransferDetails: Record "EFT Details";
        AccountTypes: Record "Account Types";
        MinimumAccBal: Decimal;
        EFTCHG: Decimal;
        GenLedgerSetup: Record "General Ledger Setup";
        ATMBalance: Decimal;
        TotalUnprocessed: Decimal;
        chqtransactions: Record Transactions;
        AccBal: Decimal;
        AvailableBal: Decimal;
}

