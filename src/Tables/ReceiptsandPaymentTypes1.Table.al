 
   table 52193678 "Receipts and Payment Types1"
{
    DrillDownPageID = "Receipts and Payment Types";
    LookupPageID = "Receipts and Payment Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Staff,None,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Staff,"None",Employee;

            trigger OnValidate()
            begin
                if "Account Type" = "account type"::"G/L Account" then
                    "Direct Expense" := true
                else
                    "Direct Expense" := false;
            end;
        }
        field(4; Type; Option)
        {
            NotBlank = true;
            OptionMembers = " ",Receipt,Payment,Imprest;
        }
        field(5; "VAT Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(6; "Withholding Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(7; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(8; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(9; "Default Grouping"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else
            if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Posting Group"
            else
            if ("Account Type" = const("Fixed Asset")) "FA Posting Group"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";
        }
        field(10; "G/L Account"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"."No.";

            trigger OnValidate()
            begin
                GLAcc.Reset;
                if GLAcc.Get("G/L Account") then begin
                    if Type = Type::Payment then
                        GLAcc.TestField(GLAcc."Direct Posting", true);
                    if GLAcc."Direct Posting" = false then begin
                        Error('Direct Posting must be True');
                    end;
                end;
            end;
        }
        field(11; "Pending Voucher"; Boolean)
        {
        }
        field(13; "Transation Remarks"; Text[250])
        {
            NotBlank = true;
        }
        field(14; "Payment Reference"; Option)
        {
            OptionMembers = Normal,"Farmer Purchase";
        }
        field(15; "Customer Payment On Account"; Boolean)
        {
        }
        field(16; "Direct Expense"; Boolean)
        {
            Editable = false;
        }
        field(17; "Calculate Retention"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(18; "Retention Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(19; "Subsistence?"; Boolean)
        {
        }
        field(20; "VAT Withheld Code"; Code[20])
        {
            TableRelation = "Tariff Codes1";
        }
        field(57000; "Appear on Imprest?"; Boolean)
        {
            Description = '//Ushindi...Determine Types to appear on Imprest Req on go-live';
        }
        field(57001; "Account no"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Vendor)) Vendor."No."
            else
            if ("Account Type" = const("G/L Account")) "G/L Account"."No." where(Blocked = const(false), "Direct Posting" = const(true))
            else
            if ("Account Type" = const(Customer)) Customer."No."
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"."No.";
        }
        field(57002; "Appear on sclaims"; Boolean)
        {
        }
        field(57003; Subject; Text[250])
        {
        }
        field(57004; Forfeiture; Boolean)
        {
            Caption = 'Forfeiture';
            DataClassification = CustomerContent;
        }

        field(57005; "Full Utilization"; Boolean)
        {
            Caption = 'Full Utilization';
            DataClassification = CustomerContent;
        }
        field(57006; "Full Refund"; Boolean)
        {
            Caption = 'Full Refund';
            DataClassification = CustomerContent;
        }
        field(57007; "Partial Utilization"; Boolean)
        {
            Caption = 'Partial Utilization';
            DataClassification = CustomerContent;
        }
        field(57008; "Deposit Account No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Income G/L Account';
            TableRelation = "G/L Account"."No." where("Direct Posting" = filter(true), "Income/Balance" = filter("Income Statement"));

        }

        field(57009; "Purpose"; Option)
        {
            Caption = 'Utilization Type';
            OptionMembers = " ","KRA Vendor","Retention","Retention Movement","Exchequer Vendor",Payroll;
            trigger OnValidate()
            var
                ReceiptPayments: Record "Receipts and Payment Types1";
            begin
                //Validate Accounts
                if Purpose in [Purpose::"KRA Vendor", Purpose::Retention, Purpose::"Retention Movement", Purpose::"Exchequer Vendor", Purpose::Payroll] then begin
                    ReceiptPayments.Reset();
                    ReceiptPayments.SetRange(Type, ReceiptPayments.Type::Payment);
                    ReceiptPayments.SetRange(Purpose, Purpose);
                    ReceiptPayments.SetFilter(Code, '<>%1', Code);
                    if ReceiptPayments.FindFirst() then
                        Error('You can only have one %1 for %2 types', Purpose, Type);

                    if Type = Type::Payment then begin
                        if Purpose in [Purpose::"KRA Vendor", Purpose::Retention, Purpose::"Exchequer Vendor"] then
                            TestField("Account Type", "Account Type"::Vendor)
                        else
                            if (Purpose = Purpose::"Retention Movement") then
                                TestField("Account Type", "Account Type"::"G/L Account");
                        if Purpose IN [Purpose::"KRA Vendor", Purpose::"Retention Movement", Purpose::"Exchequer Vendor"] then
                            TestField("Account no");
                    end;
                end;
            end;
        }
        field(57010; "Vendor Posting Group"; Code[20])
        {
            TableRelation = "Vendor Posting Group".Code;
        }
        field(70051; "Refund Policy"; Enum "Refund Policy")
        {
            Caption = 'Refund Policy';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAcc: Record "G/L Account";

    procedure GetReceiptPaymenTypeDetails(var Details: array[3] of Text; PurposeType: Option KRA,Retention,RetentionMvt,ExchequerVendor; Type_: Option " ",Receipt,Payment,Imprest)
    var
        ReceiptTypes: Record "Receipts and Payment Types1";
    begin
        ReceiptTypes.Reset();
        ReceiptTypes.SetRange(Type, Type_);
        if PurposeType = PurposeType::KRA then
            ReceiptTypes.SetRange(Purpose, ReceiptTypes.Purpose::"KRA Vendor")
        else
            if (PurposeType = PurposeType::RetentionMvt) then
                ReceiptTypes.SetRange(Purpose, ReceiptTypes.Purpose::"Retention Movement")
            else
                if (PurposeType = PurposeType::ExchequerVendor) then
                    ReceiptTypes.SetRange(Purpose, ReceiptTypes.Purpose::"Exchequer Vendor")
                else
                    ReceiptTypes.SetRange(Purpose, ReceiptTypes.Purpose::Retention);
        if ReceiptTypes.FindFirst() then begin
            Details[1] := ReceiptTypes.Code;
            Details[2] := ReceiptTypes."Account no";
            Details[3] := ReceiptTypes."Vendor Posting Group";
        end;
    end;
}

