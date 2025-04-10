Table 52193802 "Request Lines1"
{

    fields
    {
        field(1;"Document No";Code[20])
        {

            trigger OnValidate()
            begin
                RequestHeader.Reset;
                if RequestHeader.Get("Document No") then
                  "Customer A/C":=RequestHeader."Customer A/C";
            end;
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;Description;Text[50])
        {
        }
        field(4;Quantity;Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Unit Price");
            end;
        }
        field(5;"Unit of Measure";Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(6;"Unit Price";Decimal)
        {

            trigger OnValidate()
            begin
                Amount:=Quantity*"Unit Price";
                "Requested Amount":=Quantity*"Unit Price";
            end;
        }
        field(7;Amount;Decimal)
        {

            trigger OnValidate()
            begin
                /*
                //Check Whether amount exceeds the budget
                //Budget Amount
                GLSetup.GET;
                BudgetEntry.SETRANGE(BudgetEntry."Budget Name",GLSetup."Current Budget");
                BudgetEntry.SETRANGE(BudgetEntry."G/L Account No.","Account No");
                BudgetEntry.CALCFIELDS(BudgetEntry.Amount);
                BudgetAmount:=BudgetEntry.Amount;
                
                //Get The Net Change
                GLEntry.SETRANGE(GLEntry."G/L Account No.","Account No");
                */

            end;
        }
        field(8;"Account Type";Option)
        {
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(9;"Account No";Code[10])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("IC Partner")) "IC Partner";
        }
        field(10;"Transaction Type";Code[10])
        {
            TableRelation = "Transactions Type Finance";

            trigger OnValidate()
            begin
                if TransactionTypeRec.Get("Transaction Type") then begin
                  "Account Type":=TransactionTypeRec."Account Type";
                  "Account No":=TransactionTypeRec."Account No.";
                  Description:=TransactionTypeRec."Transaction Name";
                end;
            end;
        }
        field(11;"Reference No";Code[20])
        {
        }
        field(12;"Requested Amount";Decimal)
        {
        }
        field(13;Type;Code[10])
        {
            TableRelation = "Trip Advances Setup1";

            trigger OnValidate()
            begin
                if RequestHeader.Get("Document No") then
                begin
                if TravelRates.Get(RequestHeader."Job Group",RequestHeader.Country,RequestHeader.City,Type) then
                begin
                "Unit Price":=TravelRates.Amount;
                end

                end;
            end;
        }
        field(14;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(15;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(16;"Asset No";Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(23;"Actual Spent";Decimal)
        {

            trigger OnValidate()
            begin
                "Remaining Amount":=Rec.Amount-Rec."Actual Spent";
            end;
        }
        field(24;"Remaining Amount";Decimal)
        {

            trigger OnValidate()
            begin
                "Remaining Amount":=Rec.Amount-Rec."Actual Spent";
            end;
        }
        field(25;"Entry No";Integer)
        {
            TableRelation = "Cust. Ledger Entry" where ("Customer No."=field("Customer A/C"),
                                                        Open=const(true));

            trigger OnValidate()
            begin
                 CustLedger.Reset;
                 CustLedger.SetRange(CustLedger."Entry No.","Entry No");
                 CustLedger.SetRange(CustLedger.Open,true);
                 if CustLedger.Find('-') then
                 begin
                  Description:=CustLedger.Description;
                  Quantity:=1;
                  CustLedger.CalcFields(CustLedger."Remaining Amount",CustLedger.Amount);
                  "Unit Price":=CustLedger."Remaining Amount";
                  Amount:=CustLedger."Remaining Amount";
                  //MESSAGE('RemainingAmt=%1\RequestedAmt=%2',CustLedger.Amount,"Requested Amount");
                  "Reference No":=CustLedger."Document No.";
                 // MESSAGE('Reference=%1',CustLedger."Document No.");
                 end;
            end;
        }
        field(26;"Customer A/C";Code[30])
        {
        }
        field(27;"Expense Type";Option)
        {
            OptionCaption = 'Accountable Expenses,Non-Accountable Expenses';
            OptionMembers = "Accountable Expenses","Non-Accountable Expenses";
        }
        field(28;Surrender;Boolean)
        {

            trigger OnValidate()
            begin
                if "Expense Type"="expense type"::"Non-Accountable Expenses" then
                    Error(Text000);
                if Amount=0 then
                  Error(Text001);
            end;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2;"Expense Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        
         /*IF RequestHeader.GET("Document No") THEN
         IF RequestHeader.Status<>RequestHeader.Status::Open THEN
         ERROR('You cannot change this document at this stage');
          */

    end;

    trigger OnInsert()
    begin
        /* IF RequestHeader.GET("Document No") THEN
         IF RequestHeader.Status<>RequestHeader.Status::Open THEN
         ERROR('You cannot change this document at this stage');
         */

    end;

    trigger OnModify()
    begin
        /* IF RequestHeader.GET("Document No") THEN
         IF RequestHeader.Status<>RequestHeader.Status::Open THEN
         ERROR('You cannot change this document at this stage');
        */

    end;

    var
        TravelRates: Record "Trip Advances1";
        RequestHeader: Record "Request Header1";
        BudgetEntry: Record "G/L Budget Entry";
        GLSetup: Record "General Ledger Setup";
        GLEntry: Record "G/L Entry";
        Committment: Decimal;
        BudgetAmount: Decimal;
        Balance: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        TransactionTypeRec: Record "Transactions Type Finance";
        Text000: label 'This transaction line cannot be surrendered since it''s not accountable';
        Text001: label 'You cannot surrender a zero amount';
}

