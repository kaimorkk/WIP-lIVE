table 50108 "Batch. Auth to Incur Expend"
{
    Caption = 'Batch Auth to Incur Expenditure';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Posted"; Boolean)
        {
            Dataclassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                if Posted then begin
                    "Posted By" := UserId;
                    "Posted On" := CurrentDateTime;
                end;
            end;
        }
        field(4; "Posted By"; Code[50])
        {
            Dataclassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Description; Text[1048])
        {
            Dataclassification = ToBeClassified;
        }
        field(7; "Approval Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Released,Reject;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            Editable = false;
        }
        field(8; "Corporate Strategy"; Code[20])
        {
            TableRelation = "Corporate Strategic Plans";
            DataClassification = ToBeClassified;
        }
        field(9; "Reporting Period"; Code[20])
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
        field(10; "Workplan"; Code[20])
        {
            TableRelation = "Annual Strategy Workplan".No where("Planning Budget Type" = const(Supplementary), Posted = Const(true), "Annual Workplan" = field("Corporate Strategy"), "Year Reporting Code" = field("Reporting Period"));
            DataClassification = ToBeClassified;
        }
        field(11; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(12; "Quarter"; Option)
        {
            OptionMembers = "Quarter 1","Quarter 2","Quarter 3","Quarter 4";
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
            end;
        }
        field(13; "Quarter Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Quarter End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Amount to Authorize"; Decimal)
        {
            FieldClass = Flowfield;
            CalcFormula = Sum("Auth. Inc Expend. Line"."Amount to Authorize" where("Batch No." = field("No.")));
            Editable = false;
        }
        field(16; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Batch,Consolidated;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Approval Status")
        {
        }
        key(Key2; Posted)
        {
        }
    }
    var
        WorkplanMgt: Codeunit "Workplan Management";
        BatchHeader: Record "Batch. Auth to Incur Expend";

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMGenSetup: Record "SPM General Setup";
    begin
        case "Document Type" of
            "Document Type"::Batch:
                begin
                    if "No." = '' then begin
                        SPMGenSetup.Get();
                        SPMGenSetup.TestField("AIE Nos");
                        NoSeriesMgt.InitSeries(SPMGenSetup."AIE Nos", XRec."No Series", 0D, "No.", "No Series");
                    end;
                end;
            "Document Type"::Consolidated:
                begin
                    if "No." = '' then begin
                        SPMGenSetup.Get();
                        SPMGenSetup.TestField("AIE Consolidation Nos");
                        NoSeriesMgt.InitSeries(SPMGenSetup."AIE Consolidation Nos", XRec."No Series", 0D, "No.", "No Series");
                    end;
                end;
        end;


        //Default 
        if "Corporate Strategy" = '' then begin
            "Corporate Strategy" := WorkplanMgt.GetCurrentCorporateStrategy();
            "Reporting Period" := WorkplanMgt.GetCurrentStrategyImplementationYear("Corporate Strategy");
            if "Reporting Period" <> '' then
                Validate("Reporting Period");
        end;
        // if "Document Type" = "Document Type"::Consolidated then begin
        //     BatchHeader.Reset();
        //     BatchHeader.SetRange("Document Type", BatchHeader."Document Type"::Consolidated);
        //     BatchHeader.SetRange("Approval Status", BatchHeader."Approval Status"::Open);
        //     if BatchHeader.FindFirst() then
        //         if "No." <> BatchHeader."No." then
        //             Error('You can only have one open consolidation template at a time.');
        // end;
    end;
}
