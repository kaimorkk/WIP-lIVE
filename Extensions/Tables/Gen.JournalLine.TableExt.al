 
tableextension 52193451 "tableextension50018" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "JV Creator USER ID"; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50001; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50002; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50003; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50007; "Transaction Type"; Option)
        {
            OptionCaption = ',Contribution,Withdrawal,Interest,Transfer,Corporation Tax,Death Lumpsum';
            OptionMembers = ,Contribution,Withdrawal,Interest,Transfer,"Corporation Tax","Death Lumpsum";
            DataClassification = CustomerContent;
        }
        field(50008; "Exemption Type"; Option)
        {
            OptionMembers = ,"Tax Exempt","Non Tax Exempt";
            DataClassification = CustomerContent;
        }
        field(50009; "Investment Code"; Code[100])
        {
            // TableRelation = "Investment Asset" where("Asset Type" = filter(<> " "));
            DataClassification = CustomerContent;
        }
        field(50010; "No. Of Units"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50011; "Investment Transcation Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Deposit,Withdrawal';
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Deposit,Withdrawal;
            DataClassification = CustomerContent;
        }
        field(50012; Payee; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50013; "GL Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Expected Receipt date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50015; "Cheque Type"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50016; "Drawer Bank Name"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50017; "Books Closure Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50018; "Payment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Broker/Agency Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Sales Rep. No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Sales Rep. Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Share Of Risk (%)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Endorsement No."; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Commission Rate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50025; "Commission Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50026; "Net Premium"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50027; "Business Source"; Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
            DataClassification = CustomerContent;
        }
        field(50028; "Business Line"; Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
            DataClassification = CustomerContent;
        }
        field(50029; "Business Class"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50030; Department; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50032; "Type of Investment"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
            DataClassification = CustomerContent;
        }
        field(50033; "Deposit No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50034; "Deposit Slip"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50037; "Drawer Branch Name"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(50042; Invest; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50044; "UT Member No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50045; "unit Trust Type"; Option)
        {
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
            DataClassification = CustomerContent;
        }
        field(50048; "Payment Category"; Option)
        {
            Description = 'To tag all payments made to members who have exited the scheme';
            OptionMembers = " ",NormalPayment,"School Fees",Upkeep;
            DataClassification = CustomerContent;
        }
        field(50049; "First Premium"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50050; "PCF  Levy"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50051; "Training Levy"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50052; "Stamp Duty"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50053; "Yellow Card"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50054; "Period Start"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50055; "Period End"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50056; "Percentage Of Share"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50057; "Total Renewable Premium"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50058; "R/I Code"; Option)
        {
            OptionMembers = "1","2","3","4","5","6";
            DataClassification = CustomerContent;
        }
        field(50059; "Fund Code"; Code[20])
        {
            // TableRelation = "Fund Code".Code;
            DataClassification = CustomerContent;
        }
        field(50060; "Custodian Code"; Code[20])
        {
            // TableRelation = "Custodian Code".Code;
            DataClassification = CustomerContent;
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
               IF ProcurementPlan.FIND('-') THEN BEGIN
               IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                 Type:=Type::Item;
                 No:=ProcurementPlan."No.";
               END;
               IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                Type:=Type::"Non Stock";
                No:=ProcurementPlan."Source of Funds";
               END;
                 "Budget Line":=ProcurementPlan."Source of Funds";
                  Description:=ProcurementPlan."Item Description";
                 "Unit of Measure":=ProcurementPlan."Unit of Measure";
                 "Unit Price":=ProcurementPlan."Unit Price";
               END;
              */

            end;
        }
        field(70002; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center";
        }
        field(70003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(70004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(70005; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(70006; "Budget Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70007; "Entry Type2"; Option)
        {
            OptionMembers = " ",Retention;
        }
    }


    //Unsupported feature: Code Modification on "CopyFromInvoicePostBuffer(PROCEDURE 112)".

    //procedure CopyFromInvoicePostBuffer();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Account No." := InvoicePostBuffer."G/L Account";
    "System-Created Entry" := InvoicePostBuffer."System-Created Entry";
    "Gen. Bus. Posting Group" := InvoicePostBuffer."Gen. Bus. Posting Group";
    #4..23
    "VAT Difference" := InvoicePostBuffer."VAT Difference";
    "VAT Base Before Pmt. Disc." := InvoicePostBuffer."VAT Base Before Pmt. Disc.";

    OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
    //added by daudi for procurement plan
    "Procurement Plan":=InvoicePostBuffer."Procurement Plan";
    "Procurement Plan Item":=InvoicePostBuffer."Procurement Plan Item";
    "Responsibility Center":=InvoicePostBuffer."Responsibility Center";

    OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer,Rec);
    */
    //end;
    procedure ClearGenJnlLines(TemplateNmae: Code[50]; BatchName: Code[50])
    var
        GenJnlLine: Record "Gen. Journal Line";
    begin
        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", TemplateNmae);
        GenJnlLine.SetRange("Journal Batch Name", BatchName);
        GenJnlLine.DeleteAll();
    end;

}

