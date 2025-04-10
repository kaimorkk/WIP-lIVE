Table 52193642 "Imprest Lines"
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = "Payments HeaderFin";
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Account Type";Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(4;"Account No.";Code[20])
        {

            trigger OnLookup()
            begin

                case "Account Type" of
                 "account type"::"G/L Account":
                  begin
                   if Page.RunModal(18,GLAccount)=Action::LookupOK then begin
                      GLAccount.TestField(GLAccount."Direct Posting",true);
                     "Account No.":=GLAccount."No.";
                     "Account Name":=GLAccount.Name;
                   end;
                  end;
                 "account type"::Customer:
                  begin
                   if Page.RunModal(22,Customer)=Action::LookupOK then begin
                     "Account No.":=Customer."No.";
                     "Account Name":=Customer.Name;
                   end;
                  end;
                  "account type"::Vendor:
                  begin
                   if Page.RunModal(27,Vendor)=Action::LookupOK then begin
                    "Account No.":=Vendor."No.";
                    "Account Name":=Vendor.Name;
                   end;
                  end;
                  "account type"::"Bank Account":
                  begin
                   if Page.RunModal(371,Bank)=Action::LookupOK then begin
                     "Account No.":=Bank."No.";
                     "Account Name":=Bank.Name;
                   end;
                  end;
                  "account type"::"Fixed Asset":
                  begin
                   if Page.RunModal(5601,FixedAsset)=Action::LookupOK then begin
                     "Account No.":=FixedAsset."No.";
                     "Account Name":=FixedAsset.Description;
                   end;
                  end;
                 end;
            end;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(5;"Account Name";Text[100])
        {
        }
        field(6;Description;Text[200])
        {
        }
        field(7;Amount;Decimal)
        {

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Commitment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Commitment Entries";
                ImprestHeader: Record "Payments HeaderFin";
                TotalCommittedAmount: Decimal;
            begin
                       //Confirm the Amount to be issued does not exceed the budget and amount Committed
                        //Get Budget for the G/L
                        GenLedSetup.Get;
                        GLAccount.SetFilter(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SetRange(GLAccount."No.","Account No.");
                       //Get budget amount avaliable
                       GLAccount.SetRange(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                        if GLAccount.Find('-') then begin
                         GLAccount.CalcFields(GLAccount."Budgeted Amount",GLAccount."Net Change");
                         BudgetAmount:=GLAccount."Budgeted Amount";
                         Expenses:=GLAccount."Net Change";
                         BudgetAvailable:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                        end;
                     //Get committed Amount
                     CommittedAmount:=0;
                     CommitmentEntries.Reset;
                     CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                     CommitmentEntries.SetRange(CommitmentEntries.Account,"Account No.");
                
                      ImprestHeader.Reset;
                      ImprestHeader.SetRange(ImprestHeader."No.",No);
                      if ImprestHeader.Find('-')then begin
                       if ImprestHeader.Date=0D then
                        Error('Please insert the imprest date');
                        CommitmentEntries.SetRange(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
                                                  ImprestHeader.Date);
                        CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                        CommittedAmount:=CommitmentEntries."Committed Amount";
                
                        /*IF LineBudget(No,"Account No.","Line No")THEN
                           MESSAGE('Line No %1 has been included in the Budget',"Line No")
                        ELSE*/
                
                        /*IF Rec."Account Type" = "Account Type"::"G/L Account" THEN
                          IF CommittedAmount + Amount>BudgetAvailable THEN
                             ERROR('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                            ,"Account No.",
                             ABS(BudgetAvailable - (CommittedAmount+Amount)),BudgetAvailable,CommittedAmount);*/
                
                      end;

            end;
        }
        field(8;"Applies- to Doc. No.";Code[20])
        {
        }
        field(9;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(10;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(11;"Actual Spent";Decimal)
        {

            trigger OnValidate()
            begin
                "Remaining Amount":=Amount-"Actual Spent";
            end;
        }
        field(12;"Remaining Amount";Decimal)
        {
        }
        field(13;Committed;Boolean)
        {
        }
        field(14;"Transaction Type";Code[20])
        {
            TableRelation = "Transactions Type Finance";

            trigger OnValidate()
            begin
                if TransType.Get("Transaction Type") then begin
                   "Account Type":=TransType."Account Type";
                   "Account No.":=TransType."Account No.";
                   "Account Name":=TransType."Transaction Name";
                   end;
                Validate(Amount);
            end;
        }
        field(15;"Currency Code";Code[20])
        {
            TableRelation = Currency;
        }
        field(16;"Currency Factor";Decimal)
        {
        }
        field(17;"Amount LCY";Decimal)
        {
        }
        field(18;"Expense Type";Option)
        {
            OptionCaption = 'Accountable Expenses,Non-Accountable Expenses';
            OptionMembers = "Accountable Expenses","Non-Accountable Expenses";
        }
    }

    keys
    {
        key(Key1;No,"Line No")
        {
            Clustered = true;
            SumIndexFields = Amount,"Actual Spent","Remaining Amount";
        }
        key(Key2;"Expense Type")
        {
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        Amt: Decimal;
        ImprestHeader: Record "Payments HeaderFin";
        TransType: Record "Transactions Type Finance";


    procedure LineBudget(var CommittNo: Code[20];var No: Code[20];var LineNo: Integer) Exists: Boolean
    var
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        ImprestHeader: Record "Payments HeaderFin";
    begin
        GenLedSetup.Get;
        GLAccount.SetFilter(GLAccount."Budget Filter",GenLedSetup."Current Budget");
        GLAccount.SetRange(GLAccount."No.","Account No.");

        ImprestHeader.Reset;
        ImprestHeader.SetRange(ImprestHeader."No.",No);

        Exists:=false;
        Rec.Reset;
        Rec.SetRange(No,ImprestHeader."No.");
        Rec.SetRange("Account No.",GLAccount."No.");
        Rec.SetRange("Line No",LineNo);
        if Rec.Find('-') then
        Exists:=true;
    end;
}

