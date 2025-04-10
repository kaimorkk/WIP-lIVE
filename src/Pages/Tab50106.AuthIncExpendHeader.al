table 50106 "Auth. Inc. Expend. Header"
{
    Caption = 'Authority to Incur Expenditure Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Description"; Code[400])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Type"; Option)
        {
            OptionMembers = Default,Custom;
        }
        field(4; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
            Editable = false;
        }
        field(5; "No Series"; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(6; "Batch No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Corporate Strategy"; Code[20])
        {
            TableRelation = "Corporate Strategic Plans";
            DataClassification = ToBeClassified;
        }
        field(8; "Reporting Period"; Code[20])
        {
            TableRelation = "CSP Planned Years"."Annual Year Code" Where("CSP Code" = field("Corporate Strategy"));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                CSPYears: Record "CSP Planned Years";
            begin
                if CSPYears.Get("Corporate Strategy", "Reporting Period") then begin
                    "Budget Code" := CSPYears."Annual Year Code";
                    Rec.Validate("Budget Code");
                end;
            end;
        }
        field(9; "Workplan"; Code[20])
        {
            TableRelation = "Annual Strategy Workplan".No where("Planning Budget Type" = filter(Supplementary | "Supplementary 2"), Consolidated = Const(true),
                            "Strategy Plan ID" = field("Corporate Strategy"), "Year Reporting Code" = field("Reporting Period"),
                            "Global Dimension 1 Code" = field("Global Dimension 1 Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"), Archived = const(false));
            DataClassification = ToBeClassified;
        }
        field(10; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(11; "Quarter"; Enum "Financial Quarters")
        {
            //OptionMembers = "Quarter 1","Quarter 2","Quarter 3","Quarter 4";
            trigger OnValidate()
            var
                BudgetDates: array[12, 2] of Date;
            begin
                TestField("Budget Code");
                WorkPlanMgt.GetBudgetDates("Budget Code", 1, BudgetDates);
                case
                    Quarter of
                    Quarter::"Quarter 1":
                        begin
                            "Quarter Start Date" := BudgetDates[1] [1];
                            "Quarter End Date" := BudgetDates[1] [2];
                        end;
                    Quarter::"Quarter 2":
                        begin
                            "Quarter Start Date" := BudgetDates[2] [1];
                            "Quarter End Date" := BudgetDates[2] [2];
                        end;
                    Quarter::"Quarter 3":
                        begin
                            "Quarter Start Date" := BudgetDates[3] [1];
                            "Quarter End Date" := BudgetDates[3] [2];
                        end;
                    Quarter::"Quarter 4":
                        begin
                            "Quarter Start Date" := BudgetDates[4] [1];
                            "Quarter End Date" := BudgetDates[4] [2];
                        end;
                end;
                if (xRec.Quarter <> Rec.Quarter) then
                    ClearLines();
            end;
        }
        field(12; "Quarter Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Quarter End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                if Posted then begin
                    "Posted By" := UserId;
                    "Posted On" := CurrentDateTime;
                end;
            end;
        }
        field(15; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }
        field(16; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                if (xRec."Global Dimension 1 Code" <> Rec."Global Dimension 1 Code") and (xRec."Global Dimension 1 Code" <> '') then
                    ClearLines();
            end;
        }
        field(18; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            // TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Code"));
            trigger OnValidate()
            begin
                // if (xRec."Global Dimension 2 Code" <> Rec."Global Dimension 2 Code") and (xRec."Global Dimension 2 Code" <> '') then
                //     ClearLines();
            end;
        }
        field(19; "Amount to Authorize"; Decimal)
        {
            FieldClass = flowfield;
            Editable = false;
            CalcFormula = Sum("Auth. Inc Expend. Line"."Amount to Authorize" where("Document No." = field("No.")));
        }
        field(20; "Source Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Bank Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(22; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Consolidation Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Batch. Auth to Incur Expend"."No." where("Approval Status" = filter(Open));
            trigger OnValidate()
            begin
                if "Consolidation Template" <> "Batch No." then
                    "Batch No." := "Consolidation Template";
            end;

        }
        field(24; Mobile; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(25; "Funded Unit"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Approval Status")
        {
        }
        Key(Key3; Posted)
        {
        }
        Key(Key4; "Batch No.", Type)
        {
        }
        Key(Key5; Type)
        {
        }
    }

    var
        WorkplanMgt: Codeunit "Workplan Management";
        BatchHeader: Record "Batch. Auth to Incur Expend";
        UserSetup: Record "User Setup";
        AIE: Record AIE;
        Header: Record "Auth. Inc. Expend. Header";

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMGenSetup: Record "SPM General Setup";
        UserSetup: Record "User Setup";
    begin
        Header.Reset();
        Header.SetRange("Approval Status", Header."Approval Status"::Open);
        Header.SetRange(Type, Type);
        Header.SetRange(SystemCreatedBy, UserSecurityId());
        if Header.FindFirst() then
            Error('You have an open AIE record %1. Please complete the existing record before creating a new one.', Header."No.");
        case type of
            Type::Custom:
                begin
                    if "No." = '' then begin
                        SPMGenSetup.Get();
                        SPMGenSetup.TestField("Special AIE Nos");
                        NoSeriesMgt.InitSeries(SPMGenSetup."Special AIE Nos", XRec."No Series", 0D, "No.", "No Series");
                    end;
                end;
            Type::Default:
                begin
                    if "No." = '' then begin
                        SPMGenSetup.Get();
                        SPMGenSetup.TestField("AIE Nos");
                        NoSeriesMgt.InitSeries(SPMGenSetup."AIE Nos", XRec."No Series", 0D, "No.", "No Series");
                    end;
                    BatchHeader.Reset();
                    BatchHeader.SetRange("Approval Status", BatchHeader."Approval Status"::Open);
                    BatchHeader.SetRange("Document Type", BatchHeader."Document Type"::Consolidated);
                    if BatchHeader.FindFirst() then begin
                        "Consolidation Template" := BatchHeader."No.";
                        "Batch No." := BatchHeader."No.";
                    end else
                        Error('There is no open AIE Consolidation template! Please contact your finance administrator.');
                end;
        end;


        //Default 
        if "Corporate Strategy" = '' then begin
            "Corporate Strategy" := WorkplanMgt.GetCurrentCorporateStrategy();
            "Reporting Period" := WorkplanMgt.GetCurrentStrategyImplementationYear("Corporate Strategy");
            if "Reporting Period" <> '' then
                Validate("Reporting Period");
        end;
        if "Budget Code" <> '' then
            Validate(Quarter);

        if UserSetup.Get(UserId) then;
        if "Global Dimension 1 Code" = '' then
            Validate("Global Dimension 1 Code", UserSetup."Global Dimension 1 Code");

        if "Global Dimension 2 Code" = '' then
            Validate("Global Dimension 2 Code", UserSetup."Shortcut Dimension 2 Code");


    end;

    trigger OnDelete()
    begin
        UserSetup.Get(UserId);
        // if not UserSetup."Exam Support Admin" then
        //     Error('You are not authorized to delete this record.');
        if Rec.Posted then begin
            if not Confirm('This record has been posted. Do you want to delete it?') then
                Error('Action cancelled');
            AIE.Reset();
            AIE.SetRange("Source Document No.", Rec."No.");
            if AIE.FindFirst() then
                AIE.Delete(true);
        end;
        ClearLines();
    end;

    procedure ClearLines()
    var
        AuthExpLines: Record "Auth. Inc Expend. Line";
    begin
        AuthExpLines.Reset();
        AuthExpLines.SetRange("Document No.", Rec."No.");
        AuthExpLines.DeleteAll();
    end;

    procedure SendApprovalRequest()
    var
        AIEHeader: Record "Auth. Inc. Expend. Header";
    begin
        AIEHeader.Reset();
        AIEHeader.SetRange(Quarter, Rec.Quarter);
        AIEHeader.SetRange("Reporting Period", Rec."Reporting Period");
        AIEHeader.SetRange("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
        AIEHeader.SetRange(Type, Rec.Type);
        AIEHeader.SetFilter("No.", '<>%1', Rec."No.");
        if AIEHeader.FindFirst() then
            Error('There is already an AIE %1 for the selected quarter, reporting period and Admin Unit code.', AIEHeader."No.");
    end;
}
