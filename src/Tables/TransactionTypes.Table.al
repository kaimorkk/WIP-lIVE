Table 52193491 "Transaction Types"
{
    DrillDownPageID = "Transaction Type - List";
    LookupPageID = "Transaction Type - List";

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Name; Text[50])
        {
        }
        field(4; "No. Series"; Code[20])
        {
        }
        field(5; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(7; "Last Modified Date"; Date)
        {
        }
        field(8; "Created By"; Code[50])
        {
        }
        field(9; Type; Option)
        {
            OptionCaption = ' ,Cash Deposit,Withdrawal,Cheque Deposit,ATM Cash Deposit,ATM Cheque Deposit,ATM Withdrawal,BOSA Receipt,BOSA Withdrawal,Bankers Cheque,Encashment,Other Withdrawal';
            OptionMembers = " ","Cash Deposit",Withdrawal,"Cheque Deposit","ATM Cash Deposit","ATM Cheque Deposit","ATM Withdrawal","BOSA Receipt","BOSA Withdrawal","Bankers Cheque",Encashment,"Other Withdrawal";
        }
        field(10; "Account Type"; Code[20])
        {
            TableRelation = "Account Types";

            trigger OnValidate()
            begin
                if AccTypes.Get("Account Type") then
                    "Account Type Name" := AccTypes.Description;
            end;
        }
        field(11; "Has Schedule"; Boolean)
        {
        }
        field(12; "Transaction Category"; Option)
        {
            OptionMembers = General,"Account Opening","Normal Cheques","Bankers Cheque";
        }
        field(13; "Transaction Span"; Option)
        {
            OptionMembers = FOSA,BOSA;
        }
        field(14; "Lower Limit"; Decimal)
        {
        }
        field(15; "Upper Limit"; Decimal)
        {
        }
        field(16; "Default Mode"; Option)
        {
            OptionCaption = 'Cash,Cheque';
            OptionMembers = Cash,Cheque;
        }
        field(17; "Account Type Name"; Text[50])
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
        key(Key2; Name)
        {
        }
        key(Key3; Description)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /*IF Posted THEN
        ERROR('The the transaction is posted'); */

    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            FosaSetup.Get;
            FosaSetup.TestField(FosaSetup."Transaction Types Nos.");
            NoSeriesMgt.InitSeries(FosaSetup."Transaction Types Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Created By" := UserId;
        "Creation Date" := Today;
    end;

    var
        FosaSetup: Record "Fosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AccTypes: Record "Account Types";


    procedure AssistEdit(): Boolean
    begin
        /*MemberSetup.GET;
        MemberSetup.TESTFIELD("Contributions Numbers");
        IF NoSeriesMgt.SelectSeries(MemberSetup."Contributions Numbers",xRec."No.","No.") THEN BEGIN
          NoSeriesMgt.SetSeries("No.");
          EXIT(TRUE);
        END;  */

    end;
}

