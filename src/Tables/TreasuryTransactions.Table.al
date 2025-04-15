Table 52193500 "Treasury Transactions"
{
    // DrillDownPageID = "Teller n Treasury Trans List";
    // LookupPageID = "Teller n Treasury Trans List";

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."Treasury Transactions No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Transaction Date"; Date)
        {
        }
        field(3; "Transaction Type"; Option)
        {
            OptionMembers = "Issue To Teller","Return To Treasury","Issue From Bank","Return To Bank","Inter Teller Transfers","Branch Treasury Transactions";

            trigger OnValidate()
            begin
                if "Transaction Type" = "transaction type"::"Issue To Teller" then
                    Description := 'ISSUE TO TELLER';

                if "Transaction Type" = "transaction type"::"Return To Treasury" then
                    Description := 'RETURN TO TREASURY';

                if "Transaction Type" = "transaction type"::"Inter Teller Transfers" then
                    Description := 'INTER TELLER TRANSFERS';

                if "Transaction Type" = "transaction type"::"Issue From Bank" then
                    Description := 'ISSUE FROM BANK';

                if "Transaction Type" = "transaction type"::"Return To Bank" then
                    Description := 'RETURN TO BANK';

                if "Transaction Type" = "transaction type"::"Branch Treasury Transactions" then
                    Description := 'BRANCH TREASURY TRANSACTIONS';


                "From Account" := '';
                "To Account" := '';
            end;
        }
        field(4; "From Account"; Code[20])
        {
            TableRelation = if ("Transaction Type" = filter("Issue To Teller" | "Return To Bank" | "Branch Treasury Transactions")) "Bank Account"."No." where("Account Type" = const(Employee))
            else if ("Transaction Type" = filter("Return To Treasury" | "Return To Treasury" | "Inter Teller Transfers")) "Bank Account"."No." where("Account Type" = const(Employee))
            else if ("Transaction Type" = filter("Issue From Bank")) "Bank Account"."No." where("Account Type" = const(Employee));

            trigger OnValidate()
            begin
                if BankAcc.Get("From Account") then
                    "From Name" := BankAcc.Name;
            end;
        }
        field(5; "To Account"; Code[20])
        {
            TableRelation = if ("Transaction Type" = filter("Return To Treasury" | "Issue From Bank" | "Branch Treasury Transactions")) "Bank Account"."No." where("Account Type" = const(Employee))
            else if ("Transaction Type" = filter("Issue To Teller" | "Inter Teller Transfers")) "Bank Account"."No." where("Account Type" = const(Employee))
            else if ("Transaction Type" = filter("Return To Bank")) "Bank Account"."No." where("Account Type" = const(Employee));

            trigger OnValidate()
            begin
                if BankAcc.Get("To Account") then
                    "To Name" := BankAcc.Name;
            end;
        }
        field(6; Description; Text[100])
        {
        }
        field(7; Amount; Decimal)
        {
        }
        field(8; Posted; Boolean)
        {
        }
        field(9; "Date Posted"; Date)
        {
        }
        field(10; "Time Posted"; Time)
        {
        }
        field(11; "Posted By"; Text[50])
        {
        }
        field(12; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13; "Transaction Time"; Time)
        {
        }
        field(14; "Coinage Amount"; Decimal)
        {
        }
        field(15; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(16; Issued; Option)
        {
            OptionMembers = No,Yes,"N/A";
        }
        field(17; "Date Issued"; Date)
        {
        }
        field(18; "Time Issued"; Time)
        {
        }
        field(19; "Issue Received"; Option)
        {
            Editable = false;
            OptionMembers = No,Yes,"N/A";
        }
        field(20; "Date Received"; Date)
        {
            Editable = false;
        }
        field(21; "Time Received"; Time)
        {
            Editable = false;
        }
        field(22; "Issued By"; Text[50])
        {
            Editable = false;
        }
        field(23; "Received By"; Text[50])
        {
            Editable = false;
        }
        field(24; Received; Option)
        {
            Editable = false;
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(32; "Request No"; Code[20])
        {
        }
        field(33; "Bank No"; Code[20])
        {
            TableRelation = "Bank Account"."No." where("Account Type" = const(Employee));
        }
        field(34; "Denomination Total"; Decimal)
        {
        }
        field(35; "External Document No."; Code[20])
        {
        }
        field(36; "Cheque No."; Code[20])
        {
        }
        field(37; "Transacting Branch"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(38; Cashier; Code[50])
        {
            Editable = false;
        }
        field(39; "Teller Req No."; Code[30])
        {
            TableRelation = "Teller Requisition" where(Status = filter(Released),
                                                        "Requested Ownered" = const(false));

            trigger OnValidate()
            begin
                if TellerReq.Get("Teller Req No.") then
                    Amount := TellerReq.Amount;
            end;
        }
        field(40; "Global Dimension 1"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(41; "Global Dimension 2"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(42; Committed; Boolean)
        {
        }
        field(43; "From Name"; Text[50])
        {
            Editable = false;
        }
        field(44; "To Name"; Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted then begin
            Error('The transaction has been posted and therefore cannot be deleted.');
            exit;
        end;
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Treasury Transactions No");
            NoSeriesMgt.InitSeries(NoSetup."Treasury Transactions No", xRec."No. Series", 0D, No, "No. Series");
        end;

        Cashier := UserId;

        if "Transaction Type" = "transaction type"::"Issue To Teller" then
            Description := 'ISSUE TO TELLER'
        else if "Transaction Type" = "transaction type"::"Issue From Bank" then
            Description := 'ISSUE FROM BANK'
        else
            Description := 'RETURN TO TREASURY';
        /*
        IF UsersID.GET(USERID) THEN
        "Transacting Branch":=UsersID.Branch;
        */

        "Transaction Date" := Today;
        "Transaction Time" := Time;

        Denominations.Reset;
        TransactionCoinage.Reset;
        Denominations.Init;
        TransactionCoinage.Init;

        /*IF Denominations.FIND('-') THEN BEGIN
        
        REPEAT
        TransactionCoinage.No:=No;
        TransactionCoinage.Code:=Denominations.Code;
        TransactionCoinage.Description:=Denominations.Description;
        TransactionCoinage.Type:=;
        TransactionCoinage.Value:=Denominations."Currency Code";
        TransactionCoinage.Quantity:=0;
        TransactionCoinage.INSERT;
        UNTIL Denominations.NEXT = 0;
        
        END;
         */

    end;

    trigger OnModify()
    begin
        if Posted then begin
            Error('The transaction has been posted and therefore cannot be modified.');
            exit;
        end;
    end;

    trigger OnRename()
    begin
        if Posted then begin
            Error('The transaction has been posted and therefore cannot be modified.');
            exit;
        end;
    end;

    var
        NoSetup: Record "Fosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Denominations: Record Denominations;
        TransactionCoinage: Record "Treasury Coinage";
        UsersID: Record "User Setup";
        TellerReq: Record "Teller Requisition";
        BankAcc: Record "Bank Account";
}

