Table 52193451 "Bosa Products"
{
    // DrillDownPageID = "Bosa Product List";
    // LookupPageID = "Bosa Product List";

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Product Name"; Text[50])
        {

            trigger OnValidate()
            begin
                //Insert into Dimension Value
                BosaSetup.Get;
                if not DimenValue.Get(BosaSetup."Product Dimension", Code) then begin
                    DimenValue.Init;
                    DimenValue.Code := Code;
                    DimenValue.Name := "Product Name";
                    DimenValue."Dimension Code" := BosaSetup."Product Dimension";
                    DimenValue.Validate("Dimension Code");
                    DimenValue.Insert(true);
                    "Global Dimension 2 Code" := DimenValue.Code;
                    Validate("Global Dimension 2 Code");

                end else if DimenValue.Get(BosaSetup."Product Dimension", Code) then begin
                    DimenValue.Code := Code;
                    DimenValue.Name := "Product Name";
                    DimenValue."Dimension Code" := BosaSetup."Product Dimension";
                    DimenValue.Validate("Dimension Code");
                    DimenValue.Modify(true);
                    "Global Dimension 2 Code" := DimenValue.Code;
                    Validate("Global Dimension 2 Code");
                end;
            end;
        }
        field(3; Dividends; Code[20])
        {
            TableRelation = "Dividend Setup";
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(5; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(7; "Default Grouping"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;

            trigger OnValidate()
            begin
                if "Default Grouping" <> '' then
                    if CustPost.Get("Default Grouping") then begin
                        "G/L Account No." := CustPost."Receivables Account";
                        Validate("G/L Account No.");
                    end;
            end;
        }
        field(8; "Transaction Type"; Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;
        }
        field(9; "VAT Chargeable"; Boolean)
        {

            trigger OnValidate()
            begin
                if "VAT Chargeable" then
                    TestField("VAT Code");
            end;
        }
        field(10; "Withholding Tax Chargeable"; Boolean)
        {

            trigger OnValidate()
            begin
                if "Withholding Tax Chargeable" then
                    TestField("Withholding Tax Code");
            end;
        }
        field(11; "VAT Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(12; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(13; "G/L Account No."; Code[20])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                if "G/L Account No." <> '' then
                    TestField("Default Grouping");

                if CustPost.Get("Default Grouping") then begin
                    CustPost."Receivables Account" := "G/L Account No.";
                    CustPost.Validate("Receivables Account");
                    CustPost.Modify;
                end;

                if GLAcc.Get("G/L Account No.") then
                    "G/L Account Name" := GLAcc.Name;
            end;
        }
        field(14; "G/L Account Name"; Text[50])
        {
            Editable = false;
        }
        field(15; "Used to Guarantee Loans"; Boolean)
        {
        }
        field(16; "Max. Non Contribution Periods"; Code[10])
        {
        }
        field(17; "Min. Contribution"; Decimal)
        {
        }
        field(18; "Share Capital"; Boolean)
        {
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
        fieldgroup(DropDown; "Code", "Product Name", "G/L Account No.")
        {
        }
    }

    trigger OnInsert()
    begin
        Validate("Product Name");
    end;

    trigger OnModify()
    begin
        Validate("Product Name");
    end;

    trigger OnRename()
    begin
        Validate("Product Name");
    end;

    var
        PostCode: Record "Post Code";
        BosaSetup: Record "Bosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dimen: Record Dimension;
        DimenValue: Record "Dimension Value";
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        CustPost: Record "Customer Posting Group";
        GLAcc: Record "G/L Account";
        DimMgt: Codeunit DimensionManagement;
}

