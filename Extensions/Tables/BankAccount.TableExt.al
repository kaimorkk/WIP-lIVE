#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50053 "Bank Account Ext" extends "Bank Account"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on "Balance(Field 58)".
        modify("Bank Branch No.")
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank Code"));
            Caption = 'Branch Code';
            trigger OnAfterValidate()
            var
                BankBranch: Record "PR Bank Branches";
            begin
                if BankBranch.Get("Bank Branch No.", "Bank Code") then
                    "Bank Branch Name" := BankBranch."Branch Name";
            end;
        }
        field(50000; Test; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(57000; Type; Enum BankType)
        {
            DataClassification = CustomerContent;
        }
        field(57001; "Bank Type"; Option)
        {
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

                //TestNoEntriesExist(FIELDCAPTION("Bank Type"));
            end;
        }
        field(57002; "Pending Voucher Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(57014; AllowedOverDraft; Boolean)
        {
            Caption = 'Allowed Overdraft';
        }
        field(57003; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text005,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                
                */

            end;
        }
        field(57004; "Bank Branch Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(57005; "Cheque Numbers"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(57006; "Main Bank"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(57007; "Closed Entries Net Change"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry".Amount where("Bank Account No." = field("No."),
                                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                        "Posting Date" = field("Date Filter")));
            // "Fee Account Entries" = filter(true)));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57008; "PRN No."; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(57009; "HQ Account"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57010; "Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Bank Accounts"."Bank Code";
            trigger OnValidate()
            var
                Banks: Record "PR Bank Accounts";
            begin
                if Banks.Get("Bank Code") then
                    "Bank Name" := Banks."Bank Name";
            end;
        }
        field(57011; "Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(57012; "Bank Account Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(57018; "Actual Bank Bal"; Text[100])
        {

        }
        field(57013; "IFT Enabled"; Boolean)
        {
            Caption = 'Internal Fund Transfer Enabled';
            DataClassification = ToBeClassified;
        }
        field(58000; "Account Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Employer,Employee;
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

    procedure GetHQBankAccount(BankAccType: enum BankType) BnkCode: Code[20]
    var
        BankAcc: Record "Bank Account";
        Error001: Label 'There is  no %1 bank defined for HQ';
    begin
        BankAcc.Reset();
        BankAcc.SetRange("HQ Account", true);
        BankAcc.SetRange(Type, BankAccType);
        if BankAcc.FindFirst() then
            BnkCode := BankAcc."No."
        else
            Error(Error001, BankAccType);
    end;
}

