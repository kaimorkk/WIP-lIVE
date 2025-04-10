table 50111 "Expense Requisition Line"
{
    Caption = 'Expense Requisition Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Autoincrement = true;
        }
        field(3; "Workplan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No where("Planning Budget Type" = const(Supplementary), "Global Dimension 1 Code" = field("Global Dimension 1 Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"));
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(5; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(6; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            trigger OnValidate()
            begin
                Validate("G/L Account");
            end;
        }
        field(7; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            trigger OnValidate()
            begin
                Validate("G/L Account");
            end;
        }
        field(8; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            trigger OnValidate()
            begin
                Validate("G/L Account");
            end;
        }
        field(9; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
            trigger OnValidate()
            begin
                Validate("G/L Account");
            end;
        }
        field(10; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
            trigger OnValidate()
            begin
                Validate("G/L Account");
            end;
        }
        field(11; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
            trigger OnValidate()
            begin
                Validate("G/L Account");
            end;
        }
        field(12; "Activity Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Workplan Activity".Code where("Strategic Plan ID" = field(Workplan));
            TableRelation = "Workplan Activity".Code where("Strategic Plan ID" = field("Resource Req. No."));
            trigger onvalidate()
            var
                myInt: Integer;
                ExpReq: Record "Expense Requisition";
            begin
                rec."Procurement Plan" := '';
                ExpReq.Reset();
                ExpReq.SetRange("No.", rec."Document No.");
                if ExpReq.findfirst then begin
                    rec."Procurement Plan" := ExpReq."Procurement Plan ID";
                    rec."Requires PRN" := ExpReq."Requires PRN";
                end;

            end;

        }
        field(13; "G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                WorkplanBudgetLine: Record "Workplan Budget Line";
                ExpReq: Record "Expense Requisition";
            begin
                ExpReq.reset;
                ExpReq.SetRange(ExpReq."No.", rec."Document No.");
                if ExpReq.FindFirst() then begin
                    ExpReq.Testfield("Global Dimension 1 Code");
                    ExpReq.Testfield("Global Dimension 2 Code");
                    //ExpReq.TestField(ExpReq."Activity Code");
                    rec.Workplan := ExpReq.Workplan;
                    rec."Requires PRN" := ExpReq."Requires PRN";
                    "Budget Code" := ExpReq."Budget Code";
                    rec."Procurement Plan" := ExpReq."Procurement Plan ID";
                    //"Activity Id" := ExpReq."Activity Code";
                    "Global Dimension 1 Code" := ExpReq."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := ExpReq."Global Dimension 2 Code";
                    "Requires Direct Payment" := ExpReq."Requires Direct Payment";
                    "Requires Imprest" := ExpReq."Requires Imprest";
                    "Requisition Type" := ExpReq."Requisition Type";
                end;
                WorkplanBudgetLine.Reset();
                WorkplanBudgetLine.SetRange("Strategy Plan ID", Workplan);
                if "Requisition Type" = "Requisition Type"::Normal then
                    WorkplanBudgetLine.Setrange("Activity Id", "Activity ID");
                // if Page.RunModal(Page::"Workplan Budget Lookup", WorkplanBudgetLine) = Action::LookupOK then begin
                //     "G/L Account" := WorkplanBudgetLine."Budget Item";
                //     "Dimension Set Id" := WorkplanBudgetLine."Dimension Set Id";
                //     "KRA ID" := WorkplanBudgetLine."KRA ID";
                //     UpdateDimensionsFromDimensionSet();
                // end;
                Validate("G/L Account");
            end;

            trigger OnValidate()
            var
                BudgetMgt: Codeunit "Budget Management";
                DimensionCodes: array[8] of Code[20];
                Budget: Record "G/L Budget Name";
                GLAccount: Record "G/L Account";
                BudgetAmounts: array[3] of Decimal;
                WorkplanBudgetLine: Record "Workplan Budget Line";
            begin
                // WorkplanBudgetLine.Reset();
                // WorkplanBudgetLine.SetRange("Strategy Plan ID", Workplan);
                // WorkplanBudgetLine.Setrange("Activity Id", "Activity ID");

                // "G/L Account" := WorkplanBudgetLine."Budget Item";
                // "Dimension Set Id" := WorkplanBudgetLine."Dimension Set Id";

                if GLAccount.Get("G/L Account") then
                    "G/L Account Name" := GLAccount.Name;

                Testfield("Budget Code");
                Budget.Get("Budget Code");
                DimensionCodes[1] := "Global Dimension 1 Code";
                DimensionCodes[2] := "Global Dimension 2 Code";
                DimensionCodes[3] := "Shortcut Dimension 3 Code";
                DimensionCodes[4] := "Shortcut Dimension 4 Code";
                DimensionCodes[5] := "Shortcut Dimension 5 Code";
                DimensionCodes[6] := "Shortcut Dimension 6 Code";
                DimensionCodes[7] := "Shortcut Dimension 7 Code";
                DimensionCodes[8] := "Shortcut Dimension 8 Code";
                // "Budget Balance" := BudgetMgt.GetBudgetBalance("Budget Code", "G/L Account", DimensionCodes, Budget."Start Date", Budget."End Date", BudgetAmounts);
                "Budget Allocation" := BudgetAmounts[1];
                "Expensed Amounts" := BudgetAmounts[2];
                "Total Committments" := BudgetAmounts[3];
                PropagateChanges();
            end;
        }
        field(14; "G/L Account Name"; Text[1048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Budget Allocation"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            Caption = 'Approved Estimates';
        }
        field(16; "Total Committments"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(18; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
                ExpReqLines: record "Expense Requisition Line";
            begin
                if rec."Total Amount" > rec."Budget Balance" then
                    Error('Total amount cannot be greater than the available budget balance');
                ExpReqLines.Reset;
                ExpReqLines.Setrange("Document No.", rec."Document No.");
                if ExpReqLines.FindFirst() then begin
                    ExpReqLines.error := true;
                    ExpReqLines."Error Message" := '';
                    // ExpReqLines.modify;
                end;
            end;
        }
        field(19; Status; Option)
        {
            OptionMembers = New,"Pending Commitment","Committed","Fully Utilized","Recalled";
            Editable = false;
            trigger OnValidate()
            begin
                case
                    Status of
                    Status::Recalled:
                        begin
                            "Recalled By" := UserId;
                            "Recalled On" := CurrentDateTime;
                        end;
                end;
            end;
        }
        field(20; "Recalled By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User Id";
            Editable = false;
        }
        field(21; "Recalled On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Requires Direct Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Requires Imprest"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Budget Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Available Balance';
        }
        field(27; "Total Allocation"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Amount Committed';
            Editable = false;
            CalcFormula = sum("Expense Req. Allocation".Total where("Document No." = field("Document No."), "Source Line No." = field("Line No.")));
        }
        field(28; "Error"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Error Message"; Text[1048])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(30; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Expensed Amounts"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Requires PRN"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "KRA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Requisition Type"; Enum "Requisition Type")
        {
            DataClassification = ToBeClassified;
            //OptionMembers = Normal,PRN;
        }
        field(36; "Strategic Plan ID"; Code[50])
        {
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(37; "Resource Req. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(38; "Direct Payment Type"; Option)
        {
            OptionMembers = "Non Staff Claim","Staff Claim";
        }

        field(39; "Procurement Plan"; code[40])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Resource Req. No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ExpReq: Record "Expense Requisition";
    begin
        // ExpReq.reset;
        // ExpReq.SetRange(ExpReq."No.", rec."Document No.");
        // if ExpReq.FindFirst() then begin
        //     ExpReq.Testfield("Global Dimension 1 Code");
        //     ExpReq.Testfield("Global Dimension 2 Code");
        //     //ExpReq.TestField(ExpReq."Activity Code");
        //     rec.Workplan := ExpReq.Workplan;
        //     "Budget Code" := ExpReq."Budget Code";
        //     //"Activity Id" := ExpReq."Activity Code";
        //     "Global Dimension 1 Code" := ExpReq."Global Dimension 1 Code";
        //     "Global Dimension 2 Code" := ExpReq."Global Dimension 2 Code";
        //     "Requires Direct Payment" := ExpReq."Requires Direct Payment";
        //     "Requires Imprest" := ExpReq."Requires Imprest";
        //     "Requisition Type" := ExpReq."Requisition Type";
        // end;
    end;

    procedure UpdateDimensionsFromDimensionSet()
    var
        DimensioMgt: Codeunit DimensionManagement;
        ShortcutDimensions: Array[8] of Code[20];
    begin
        if "Dimension Set Id" <> 0 then begin
            DimensioMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimensions);
            "Global Dimension 1 Code" := ShortcutDimensions[1];
            "Global Dimension 2 Code" := ShortcutDimensions[2];
            "Shortcut Dimension 3 Code" := ShortcutDimensions[3];
            "Shortcut Dimension 4 Code" := ShortcutDimensions[4];
            "Shortcut Dimension 5 Code" := ShortcutDimensions[5];
            "Shortcut Dimension 6 Code" := ShortcutDimensions[6];
            "Shortcut Dimension 7 Code" := ShortcutDimensions[7];
            "Shortcut Dimension 8 Code" := ShortcutDimensions[8];
        end;
    end;

    trigger OnDelete()
    var
        ExpReqAllocationLines: Record "Expense Req. Allocation";
    begin
        ExpReqAllocationLines.Reset;
        ExpReqAllocationLines.SetRange("Document No.", Rec."Document No.");
        ExpReqAllocationLines.SetRange("Source Line No.", "Line No.");
        ExpReqAllocationLines.DeleteAll();
    end;

    procedure PropagateChanges()
    var
        ExpReqAllocationLines: Record "Expense Req. Allocation";
    begin
        exit;
        ExpReqAllocationLines.Reset();
        ExpReqAllocationLines.SetRange("Document No.", "Document No.");
        ExpReqAllocationLines.SetRange("Source Line No.", "Line No.");
        if ExpReqAllocationLines.FindSet() then begin
            ExpReqAllocationLines.ModifyAll("G/L Account", "G/L Account");
            ExpReqAllocationLines.ModifyAll("Global Dimension 1 Code", "Global Dimension 1 Code");
            ExpReqAllocationLines.ModifyAll("Global Dimension 2 Code", "Global Dimension 2 Code");
            ExpReqAllocationLines.ModifyAll("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
            ExpReqAllocationLines.ModifyAll("Shortcut Dimension 4 Code", "Shortcut Dimension 4 Code");
            ExpReqAllocationLines.ModifyAll("Shortcut Dimension 5 Code", "Shortcut Dimension 5 Code");
            ExpReqAllocationLines.ModifyAll("Shortcut Dimension 6 Code", "Shortcut Dimension 6 Code");
            ExpReqAllocationLines.ModifyAll("Shortcut Dimension 7 Code", "Shortcut Dimension 7 Code");
            ExpReqAllocationLines.ModifyAll("Shortcut Dimension 8 Code", "Shortcut Dimension 8 Code");
        end;
    end;
}
