TableExtension 52193502 tableextension52193502 extends "Bank Account"
{
    fields
    {
        field(50000; "WB Account"; Boolean)
        {
        }
        field(50001; "Coinage Balance"; Decimal)
        {
        }
        field(50002; "Tag Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            //TableRelation = Table0;
        }
        field(50003; "Tag Code"; Code[20])
        {
            //TableRelation = Table0;
        }
        field(53000; rrrr; Option)
        {
            OptionCaption = 'tre,err,rrr';
            OptionMembers = tre,err,rrr;
        }
        field(61000; Type; Option)
        {
            OptionCaption = ' ,Normal,Petty Cash,Bank,Recurrent';
            OptionMembers = " ",Normal,"Petty Cash",Bank,Recurrent;
        }
        field(61001; Cashier; Code[70])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(68000; "Cashier ID"; Code[70])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(68001; "Account Type"; Option)
        {
            OptionCaption = ' ,Cashier,Treasury,Employer';
            OptionMembers = " ",Cashier,Treasury,Employer;
        }
        field(68002; "Maximum Teller Withholding"; Decimal)
        {
        }
        field(68003; "Max Withdrawal Limit"; Decimal)
        {
        }
        field(68004; "Max Deposit Limit"; Decimal)
        {
        }
        field(68005; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved,Released,Active,Non-Active,Suspended,Deceased,Withdrawan,Retired,Termination,Family Member,Rejected,,,BOSA';
            OptionMembers = Open,"Pending Approval",Approved,Released,Active,"Non-Active",Suspended,Deceased,Withdrawan,Retired,Termination,"Family Member",Rejected,,,BOSA;

            trigger OnValidate()
            begin
                //Advice:=TRUE;
            end;
        }
        field(68006; "No Of Employees"; Integer)
        {
            CalcFormula = count(Customer where("Employer Code" = field("No.")));
            FieldClass = FlowField;
        }
        field(68007; "Expected Contribution"; Decimal)
        {
            CalcFormula = sum(Customer."Monthly Contribution" where("Employer Code" = field("No."),
                                                                     "Customer Type" = filter(Member)));
            FieldClass = FlowField;
        }
        field(68008; "Unallocated Receipts"; Code[20])
        {
            TableRelation = "Receipts Header1"."Employer Code" where("Employer Code" = field("No."),
                                                                      Posted = filter(true));
        }
        field(68009; "Allocated Receipts"; Code[20])
        {
            TableRelation = Receipts."Employer Code" where("Employer Code" = field("No."),
                                                            Posted = filter(true));
        }
    }
    procedure GetBankCode(BankAccType: Enum BankType; Dimension1Code: Code[20]; Dimension2Code: code[20]) BnkCode: Code[20]
    var
        Error001: Label 'There is no %1 Bank Account defined for %2 %3 and %4 %5';
        Error002: Label 'There is no %1 Bank Account defined for %2 %3 ';
        Error003: Label 'There is no %1 Bank Account defined';
        BankAccs: Record "Bank Account";
        CashSetUp: Record "Cash Management Setup";
        ErrorTxt: Text;
    begin
        CashSetUp.Get();
        BanKAccs.Reset();
        BankAccs.SetRange(Type, BankAccType);
        case
            CashSetUp."Default Bank Acc. Type By" of
            CashSetUp."Default Bank Acc. Type By"::"Geographical Location & Administration Unit":
                begin
                    BankAccs.SetRange("Global Dimension 1 Code", Dimension1Code);
                    BankAccs.SetRange("Global Dimension 2 Code", Dimension2Code);
                    ErrorTxt := StrSubstNo(Error001, BankAccType, BankAccs.FieldCaption("Global Dimension 1 Code"), Dimension1Code, BankAccs.FieldCaption("Global Dimension 2 Code"), Dimension2Code);
                end;
            CashSetUp."Default Bank Acc. Type By"::"Geographical Location":
                begin
                    BankAccs.SetRange("Global Dimension 1 Code", Dimension1Code);
                    ErrorTxt := StrSubstNo(Error003, BankAccType, BankAccs.FieldCaption("Global Dimension 1 Code"), Dimension1Code);
                end;
            CashSetUp."Default Bank Acc. Type By"::"Administration Unit":
                begin
                    BankAccs.SetRange("Global Dimension 2 Code", Dimension2Code);
                    ErrorTxt := StrSubstNo(Error003, BankAccType, BankAccs.FieldCaption("Global Dimension 2 Code"), Dimension2Code);
                end;
            else
                ErrorTxt := StrSubstNo(Error003, BankAccType);
        end;
        if BankAccs.FindFirst() then
            BnkCode := BankAccs."No."
        else
            Error(ErrorTxt);
    end;



    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    IF (Name <> xRec.Name) OR
    #4..21
    THEN BEGIN
      MODIFY;
      UpdateContFromBank.OnModify(Rec);
      IF NOT FIND THEN BEGIN
        RESET;
        IF FIND THEN;
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..24
    END;
    */
    //end;
}

