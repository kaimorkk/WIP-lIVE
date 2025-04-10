table 50107 "Auth. Inc Expend. Line"
{
    Caption = 'Authority to Incur Expense Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            trigger OnValidate()
            var
                authIncur: Record "Auth. Inc. Expend. Header";
            begin


            end;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "G/L Account"; Code[20])
        {
            Caption = 'Budget Line';
            DataClassification = ToBeClassified;
            TableRelation = "Workplan Budget Line"."Budget Item" where("Strategy Plan ID" = field(Workplan));
            trigger OnLookup()
            begin
                AIEHeader.Reset();
                AIEHeader.SetRange("No.", "Document No.");
                AIEHeader.FindFirst();
                WorkplanBudgetLine.Reset();
                WorkplanBudgetLine.SetRange("Strategy Plan ID", AIEHeader.Workplan);
                if Page.RunModal(Page::"Workplan Budget Lookup", WorkplanBudgetLine) = Action::LookupOK then begin
                    CopyDimensions(WorkplanBudgetLine);
                    GetAmounts(WorkplanBudgetLine);
                end;
            end;


        }
        field(4; "G/L Account Name"; Text[1048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Budget Line Name';
        }
        field(5; "Planned Amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(6; "Amount to Authorize"; Decimal)
        {
            DataClassification = ToBeClassified;
            //Editable = false;
            trigger onValidate()
            var
                Line: Record "Auth. Inc Expend. Line";
            begin
                if "Amount to Authorize" > "Planned Amount" then
                    Error('Amount to Authorize cannot be greater than Planned Amount');
                if "Amount to Authorize" > Balance then
                    Error('Amount to Authorize cannot be greater than the Balance');
                Line.Reset();
                Line.SetRange("Document No.", "Document No.");
                Line.SetRange("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
                Line.SetRange("Shortcut Dimension 4 Code", "Shortcut Dimension 4 Code");
                Line.SetRange("Shortcut Dimension 5 Code", "Shortcut Dimension 5 Code");
                Line.SetRange("Shortcut Dimension 6 Code", "Shortcut Dimension 6 Code");
                Line.SetRange("G/L Account", "G/L Account");
                Line.SetFilter("Line No.", '<>%1', "Line No.");
                if Line.FindSet() then begin
                    Line.CalcSums("Amount to Authorize");
                    if "Amount to Authorize" + Line."Amount to Authorize" > "Planned Amount" then
                        Error('Amount to Authorize cannot be greater than Planned Amount. Nice try though!');
                end;
            end;
        }
        field(8; "Utilized Amounts"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            //Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            //Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Code"));

            trigger OnValidate()
            var
                WPLans: Record "Annual Strategy Workplan";
            begin
                if AIEHeader.Get("Document No.") then
                    if AIEHeader.Type = AIEHeader.Type::Custom then begin
                        WPlans.Reset();
                        WPlans.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                        WPLans.SetRange(Posted, true);
                        WPLans.SetRange(Archived, false);
                        if not WPlans.FindFirst() then
                            Error('Workplan not found')
                        else
                            Workplan := WPLans.No;
                    end;
            end;

        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(12; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(13; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(14; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(15; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(16; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
        }
        field(17; "Dimension Set Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Source Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Receiving Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Workplan; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(22; Quarter; Enum "Financial Quarters")
        {
            DataClassification = ToBeClassified;
        }
        field(23; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Activity ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(25; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
            Editable = false;
            TableRelation = "Auth. Inc. Expend. Header"."Approval Status" WHERE("No." = FIELD("Document No."));



        }
        field(26; Posted; Boolean)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Auth. Inc. Expend. Header".Posted WHERE("No." = FIELD("Document No.")));

        }
        field(27; "Type"; Option)
        {
            OptionMembers = Default,Custom;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Auth. Inc. Expend. Header"."Type" WHERE("No." = FIELD("Document No.")));
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document No.")
        {
            SumIndexFields = "Planned Amount", "Amount to Authorize", "Utilized Amounts";
        }
        key(Key3; "Batch No.")
        {
            SumIndexFields = "Planned Amount", "Amount to Authorize", "Utilized Amounts";
        }
    }
    trigger OnInsert()
    begin
        if AIEHeader.Get("Document No.") then begin
            AIEHeader.TestField(Workplan);
            Workplan := AIEHeader.Workplan;
            Quarter := AIEHeader.Quarter;
        end;
    end;

    var
        AIEHeader: Record "Auth. Inc. Expend. Header";
        DimensionCode: array[8] of Code[20];
        WorkplanBudgetLine: Record "Workplan Budget Line";
        AWP: Record "Annual Strategy Workplan";

    procedure CopyDimensions(BudgetLine: Record "Workplan Budget Line")
    var

    begin
        "Shortcut Dimension 3 Code" := BudgetLine."Shortcut Dimension 3 Code";
        "Shortcut Dimension 4 Code" := BudgetLine."Shortcut Dimension 4 Code";
        "Shortcut Dimension 5 Code" := BudgetLine."Shortcut Dimension 5 Code";
        "Shortcut Dimension 6 Code" := BudgetLine."Shortcut Dimension 6 Code";
        "G/L Account" := BudgetLine."Budget Item";
        "G/L Account Name" := BudgetLine."Budget Item Description";
        "Activity ID" := BudgetLine."Activity ID";
        DimensionCode[1] := BudgetLine."Global Dimension 1 Code";
        DimensionCode[2] := BudgetLine."Global Dimension 2 Code";
        DimensionCode[3] := BudgetLine."Shortcut Dimension 3 Code";
        DimensionCode[4] := BudgetLine."Shortcut Dimension 4 Code";
        DimensionCode[5] := BudgetLine."Shortcut Dimension 5 Code";
        DimensionCode[6] := BudgetLine."Shortcut Dimension 6 Code";
        DimensionCode[7] := BudgetLine."Shortcut Dimension 7 Code";
        DimensionCode[8] := BudgetLine."Shortcut Dimension 8 Code";
    end;

    procedure GetAmounts(BudgetLine: Record "Workplan Budget Line")
    var
        BudgetMgt: Codeunit "Budget Management";
    begin
        Case Quarter of
            Quarter::"Quarter 1":
                begin
                    "Planned Amount" := BudgetLine."Q1 Amount";
                end;
            Quarter::"Quarter 2":
                begin
                    "Planned Amount" := BudgetLine."Q2 Amount";
                end;
            Quarter::"Quarter 3":
                begin
                    "Planned Amount" := BudgetLine."Q3 Amount";
                end;
            Quarter::"Quarter 4":
                begin
                    "Planned Amount" := BudgetLine."Q4 Amount";
                end;
        End;
        AIEHeader.Get("Document No.");
        Balance := "Planned Amount" - BudgetMgt.getAIEUnallocatedAmount(AIEHeader."Budget Code", "G/L Account", DimensionCode, AIEHeader."Quarter Start Date", AIEHeader."Quarter End Date");
    end;
}
