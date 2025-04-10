Table 80265 "Budget Consolidation Header"
{
    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Financial Year"; Code[20])
        {
            Caption = 'Reporting Year';
            DataClassification = ToBeClassified;
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Corporate Strategy"));
        }
        field(3; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Annual Workplan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational),
                                                                 "Planning Budget Type" = field("Planning Budget Type"));
        }
        field(5; "Current Job"; Code[10])
        {
            Caption = 'Previous Year Financial Bugdet';
            DataClassification = ToBeClassified;
            // TableRelation = Job."No." where(exchequer = const(true));
        }
        field(6; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Creation Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Global Annual Workplan"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan";
        }
        field(10; "Proposed Procurement Plan"; Code[30])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Procurement Plan".Code where("Document Type" = const("Procurement Plan"));
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Current Financial Budget"; Code[10])
        {
            Caption = 'Previous Year Financial Bugdet';
            DataClassification = ToBeClassified;
            // TableRelation = Job."No." where(exchequer = const(true));
        }
        field(13; "Planning Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource Requirements,Draft Workplan,Supplementary';
            OptionMembers = Original,Supplementary,"Supplementary 2";
        }
        field(14; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Draft,Posted';
            OptionMembers = Draft,Posted;
        }
        field(15; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Released;
            Editable = False;
        }
        field(19; "Archived"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Archived By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Date Archived"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Corporate Strategy"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'STAJ Blueprint';
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(23; "Draft Workplan Consolidation"; Code[20])
        {
            TableRelation = "Budget Consolidation Header".Code where("Planning Budget Type" = const(Supplementary), "Corporate Strategy" = field("Corporate Strategy"), "Financial Year" = field("Financial Year"));
        }
        field(24; "Stage"; Option)
        {
            InitValue = Finance;
            OptionMembers = Finance,JSC,NA,"Fully Approved";
            OptionCaption = 'Finance,Judicial Service Commission,National Assembly,Fully Approved';
        }

        field(26; "Previous Ceiling"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Total Submitted"; Integer)
        {
            FieldClass=FlowField;
            CalcFormula=count("Annual Strategy Workplan" where(Consolidated=const(true), "Annual Workplan"=field("Code")));
        }
    }
    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Approval Status", "Corporate Strategy", Archived)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            SPMSetup.Get;
            GenLedgerSetup.Get;
            Case
            "Planning Budget Type" of
                "Planning Budget Type"::Original:
                    begin
                        SPMSetup.TestField("Budget Consolidation Nos");
                        NoSeriesMgt.InitSeries(SPMSetup."Budget Consolidation Nos", xRec."No. Series", 0D, Code, "No. Series");
                    end;
                "Planning Budget Type"::Supplementary:
                    begin
                        SPMSetup.TestField("Draft Workplan Cons. Nos");
                        NoSeriesMgt.InitSeries(SPMSetup."Draft Workplan Cons. Nos", xRec."No. Series", 0D, Code, "No. Series");
                    end;
                // "Planning Budget Type"::"Supplementary 2":
                //     begin
                //         GenLedgerSetup.TestField("Supplementary Budget Nos");
                //         NoSeriesMgt.InitSeries(GenLedgerSetup."Supplementary Budget Nos", xRec."No. Series", 0D, Code, "No. Series");
                //     end;
            End;
        end;
        "Creation Date" := Today;
        "Creation Time" := Time;
        "Created By" := UserId;
    end;

    procedure GetSummaryTotals(var BudgetAmounts: array[6] of Decimal; Type: Option Approved,UnderReview)
    var
        // SelectionFilterMgt: Codeunit SelectionFilterMgt;
        AnnualWorkplan: Record "Annual Strategy Workplan";
        NoFilter: Text;
        WorkPlanMgt: Codeunit "Workplan Management";
    begin
        AnnualWorkplan.Reset;
        AnnualWorkplan.Setrange("Annual Workplan", Rec.Code);
        if Type = Type::Approved then begin
            AnnualWorkplan.Setrange(Consolidated, true);
            AnnualWorkplan.Setrange("Under Review", false);
        end else begin
            AnnualWorkplan.Setrange(Consolidated, false);
            AnnualWorkplan.Setrange("Under Review", true);
        end;
        if AnnualWorkplan.FindSet() then begin
            // NoFilter := SelectionFilterMgt.GetSelectionFilterForAnnualWorkplanStrategy(AnnualWorkplan);
            WorkPlanMgt.GetBudgetAmount(BudgetAmounts, NoFilter);
            BudgetAmounts[6] := WorkplanMgt.GetCeilingAmounts(NoFilter);
        end;
    end;

    procedure HasPlansUnderReviews(): Boolean
    var
        AnnualWorkplan: Record "Annual Strategy Workplan";
    begin
        AnnualWorkplan.Reset;
        AnnualWorkplan.Setrange("Annual Workplan", Rec.Code);
        AnnualWorkplan.Setrange("Under Review", true);
        if AnnualWorkPlan.FindFirst() then
            exit(true);
    end;

    procedure HasPlans(): Boolean
    var
        AnnualWorkplan: Record "Annual Strategy Workplan";
    begin
        AnnualWorkplan.Reset;
        AnnualWorkplan.Setrange("Annual Workplan", Rec.Code);
        AnnualWorkplan.Setrange(Consolidated, true);
        if AnnualWorkPlan.FindFirst() then
            exit(true);
    end;


    var
        SPMSetup: Record "SPM General Setup";
        GenLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}

