Table 80019 "Annual Strategy Workplan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[30])
        {
        }
        field(2; Description; Code[255])
        {
            Caption = 'Spending Unit';
        }
        field(3; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
            Caption = 'STAJ Blueprint';
            trigger OnValidate()
            begin
                CSP.Reset;
                CSP.SetRange(Code, "Strategy Plan ID");
                if CSP.FindSet then begin
                    "Strategy Framework" := CSP."Strategy Framework";
                end;
            end;
        }
        field(4; "Year Reporting Code"; Code[50])
        {
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Strategy Plan ID"));
            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Strategy Plan ID", "Year Reporting Code") then begin
                    "Start Date" := AnnualReportingCodes."Start Date";
                    "End Date" := AnnualReportingCodes."End Date";
                end;
            end;
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; "Unit of Measure"; Text[100])
        {
        }
        field(10; "Current AWP"; Boolean)
        {
        }
        field(38; "Strategy Framework"; Code[100])
        {
            TableRelation = "Strategy Framework";
        }
        field(39; "No. of Directors PCs"; Integer)
        {
            CalcFormula = count("Perfomance Contract Header" where("Document Type" = filter("Functional/Operational PC"),
                                                                    "Score Card Type" = filter(Directors),
                                                                    "Annual Workplan" = field(No)));
            FieldClass = FlowField;
        }
        field(40; "No. of Department Pcs"; Integer)
        {
            CalcFormula = count("Perfomance Contract Header" where("Document Type" = filter("Functional/Operational PC"),
                                                                    "Score Card Type" = filter(Departmental),
                                                                    "Annual Workplan" = field(No)));
            FieldClass = FlowField;
        }
        field(41; "No. of Staff PCs"; Integer)
        {
            CalcFormula = count("Perfomance Contract Header" where("Document Type" = filter("Functional/Operational PC"),
                                                                    "Score Card Type" = filter(Staff),
                                                                    "Annual Workplan" = field(No)));
            FieldClass = FlowField;
        }
        field(42; "Annual Strategy Type"; Option)
        {
            OptionCaption = 'Organizational,Functional,Functional PC,Organizational PC';
            OptionMembers = Organizational,Functional,"Functional PC","Organizational PC";
        }
        field(43; "Annual Workplan"; Code[30])
        {
            Caption = 'AWP Consolidation Template';
            TableRelation = if ("Planning Budget Type" = const(Original)) "Budget Consolidation Header".Code where(
                                                                                                             "Planning Budget Type" = const(Original),
                                                                                                             "Corporate Strategy" = field("Strategy Plan ID"),
                                                                                                             "Financial Year" = field("Year Reporting Code"),
                                                                                                             "Approval Status" = const(Open))
            else
            if ("Planning Budget Type" = const(Supplementary)) "Budget Consolidation Header".Code where("Planning Budget Type" = const(Supplementary),
                                                                                                          "Corporate Strategy" = field("Strategy Plan ID"),
                                                                                                          "Financial Year" = field("Year Reporting Code"),
                                                                                                          "Approval Status" = const(Open))
            else
            "Budget Consolidation Header".Code where("Planning Budget Type" = const("Supplementary 2"),
                                                                                                          "Corporate Strategy" = field("Strategy Plan ID"),
                                                                                                          "Financial Year" = field("Year Reporting Code"),
                                                                                                          "Approval Status" = const(Open));
        }
        field(44; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));

            trigger OnValidate()
            begin
                /*AnnualStrategyWorkplan.RESET;
                AnnualStrategyWorkplan.SETRANGE("Annual Strategy Type",AnnualStrategyWorkplan."Annual Strategy Type"::"Functional PC");
                AnnualStrategyWorkplan.SETRANGE(Department,Department);
                AnnualStrategyWorkplan.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                AnnualStrategyWorkplan.SETRANGE("Year Reporting Code","Year Reporting Code");
                AnnualStrategyWorkplan.SETRANGE("Approval Status",AnnualStrategyWorkplan."Approval Status"::Open);
                AnnualStrategyWorkplan.SETRANGE("Planning Budget Type",AnnualStrategyWorkplan."Planning Budget Type"::Original);
                IF AnnualStrategyWorkplan.FINDSET THEN BEGIN
                   ERROR('You have already an ongoing Departmental Workplan No %1 for Department %2, Please proceed and Edit it',
                   AnnualStrategyWorkplan.No,AnnualStrategyWorkplan."Department Name");
                END;
                */
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, Department);
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate" := ResponsibilityCenter."Direct Reports To";
                end;

            end;
        }
        field(45; "Department Name"; Text[250])
        {
        }
        field(46; Posted; Boolean)
        {
        }
        field(47; "Total Assigned Weight(%)"; Decimal)
        {
            CalcFormula = sum("Strategy Workplan Lines"."Departmental Activity Weight" where(No = field(No)));
            FieldClass = FlowField;
        }
        field(48; "Total  Departments Count"; Integer)
        {
            CalcFormula = count("Responsibility Center" where("Operating Unit Type" = const("Department/Center")));
            FieldClass = FlowField;
        }
        field(49; "Total Weight(%)"; Decimal)
        {
        }
        field(50; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(51; "Created By"; Code[50])
        {
        }
        field(52; "Created at"; Date)
        {
        }
        field(53; "Functional Procurment Plan No"; Code[30])
        {
            // TableRelation = if ("Planning Budget Type" = const(Original)) "Procurement Plan".Code where(Department = field(Department),
            //                                                                                            Type = const(Functional),
            //                                                                                            "Revision Voucher" = const(false),
            //                                                                                            "Document Type" = const("Procurement Plan"))
            // else
            // if ("Planning Budget Type" = const(Supplementary)) "Procurement Plan".Code where(Department = field(Department),
            //                                                                                                                                                                                 Type = const(Functional),
            //                                                                                                                                                                                 "Revision Voucher" = const(true),
            //                                                                                                                                                                                 "Document Type" = const("Revision Voucher"));
        }
        field(54; "Division Filter"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Responsibility Center".Code;
        }
        field(55; "Department Filter"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Responsibility Center".Code;
        }
        field(56; "Total Budget"; Decimal)
        {
            CalcFormula = sum("Strategy Workplan Lines"."Total Subactivity budget" where(No = field(No),
                                                                                          "Primary Directorate" = field("Division Filter"),
                                                                                          "Primary Department" = field("Department Filter")));
            FieldClass = FlowField;
        }
        field(57; "Organiztional PC"; Code[30])
        {
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const("Organizational PC"));
        }
        field(58; "Total Assigned PC Weight(%)"; Decimal)
        {
            CalcFormula = sum("Board Activities"."WT(%)" where("AWP No" = field(No)));
            FieldClass = FlowField;
        }
        field(59; Archived; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Archived On" := CurrentDateTime;
                "Archived By" := UserId;
            end;
        }
        field(60; "Archived On"; DateTime)

        {
            DataClassification = ToBeClassified;
        }
        field(61; "Archived By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Workplan No"; Code[30])
        {
            InitValue = '<UNDEFINED>S';
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational),
                                                                 "Strategy Plan ID" = field("Strategy Plan ID"),
                                                                 "Year Reporting Code" = field("Year Reporting Code"));
        }
        field(63; "Approved Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Planning Budget Type"; Option)
        {
            OptionCaption = 'Resource Requirements,Draft,Supplementary 2';
            OptionMembers = Original,Supplementary,"Supplementary 2";
        }
        field(65; "Alligned Wishlist Temp"; Code[30])
        {
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational),
                                                                 "Strategy Plan ID" = field("Strategy Plan ID"),
                                                                 "Year Reporting Code" = field("Year Reporting Code"));
        }
        field(66; "Dimension Set ID"; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1), Blocked = const(false));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(68; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), "Dimension Value Type" = const(Standard), Blocked = const(false));
            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
            begin
                DimensionMgt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");
                DimVal.Reset();
                DimVal.SetRange("Global Dimension No.", 2);
                DimVal.SetRange(Code, "Global Dimension 2 Code");
                if DimVal.FindFirst() then
                    Description := DimVal.Name;
            end;
        }
        field(69; "Shorcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(3, "Shorcut Dimension 3 Code", "Dimension Set ID");
            end;
        }
        field(70; "Shorcut Dimension 4 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(4, "Shorcut Dimension 4 Code", "Dimension Set ID");
            end;
        }
        field(71; "Shorcut Dimension 5 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(5, "Shorcut Dimension 5 Code", "Dimension Set ID");
            end;
        }
        field(72; "Shorcut Dimension 6 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(6, "Shorcut Dimension 6 Code", "Dimension Set ID");
            end;
        }
        field(73; "Shorcut Dimension 7 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(7, "Shorcut Dimension 7 Code", "Dimension Set ID");
            end;
        }
        field(74; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(8, "Shortcut Dimension 8 Code", "Dimension Set ID");
            end;
        }
        field(75; "Consolidated"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = False;
            trigger OnValidate()
            begin
                "Consolidated By" := UserId;
                "Date Consolidated" := CurrentDateTime;
            end;
        }
        field(76; "Ceiling Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(77; "Consolidated By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Tablerelation = "User SetUp"."User Id";
        }
        field(78; "Date Consolidated"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(79; "Draft Workplan Generated"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(80; "Draft Workplan No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(81; "Draft Workplan Generated By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(82; "Date Draft Workplan Generated"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(83; "Select"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(84; "Resource Req. No"; Code[20])
        {
            Editable = false;
        }
        field(85; "Under Review"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(86; "Budget Posted to G/L"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = False;
        }
        field(87; "Rejection Reasons"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(88; "Supplementary Ceiling"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(89; "Supplementary Ceiling Amount"; Decimal)
        {
            fieldclass = FlowField;
            CalcFormula = sum("Workplan Budget Line"."Total Ceiling" where("Strategy Plan ID" = field(No)));
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Year Reporting Code", "Strategy Plan ID", "Annual Strategy Type", "Annual Workplan")
        {
        }
        key(Key3; "Annual Workplan", "Approval Status")
        {
        }
        key(key4; "Annual Strategy Type", "Annual Workplan")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; No, Description, "Strategy Plan ID", "Year Reporting Code", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
    }

    var
        DimensionMgt: Codeunit DimensionManagement;

    trigger OnInsert()
    var
        UserSetUp: Record "User Setup";
    begin
        //Get Strategy Type No. Series..
        if "Annual Strategy Type" = "annual strategy type"::Organizational then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Work Plan Nos");
                NoSeriesMgt.InitSeries(SPMSetup."Work Plan Nos", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Annual Strategy Type" = "annual strategy type"::Functional then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Functional Annual Workplan Nos");
                NoSeriesMgt.InitSeries(SPMSetup."Functional Annual Workplan Nos", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Annual Strategy Type" = "annual strategy type"::"Functional PC" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Functional P.C No. Series");
                NoSeriesMgt.InitSeries(SPMSetup."Functional P.C No. Series", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Annual Strategy Type" = "annual strategy type"::"Organizational PC" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Organizational P.C No. Series");
                NoSeriesMgt.InitSeries(SPMSetup."Organizational P.C No. Series", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        // if (UserSetUp.Get(UserId)) AND ("Planning Budget Type" = "Planning Budget Type"::Original) then begin
        //     if UserSetUp."Global Dimension 1 Code" <> '' then
        //         Validate("Global Dimension 1 Code", UserSetUp."Global Dimension 1 Code");
        //     if UserSetUp."Shortcut Dimension 2 Code" <> '' then
        //         Validate("Global Dimension 2 Code", UserSetUp."Shortcut Dimension 2 Code");
        // end;

        if "Resource Req. No" = '' then
            "Resource Req. No" := No;
        if GuiAllowed then begin
            "Created By" := UserId;
            "Created at" := Today;
        end;

        if "Planning Budget Type" <> "Planning Budget Type"::"Supplementary 2" then begin
            AnnualStrategyWorkplan.Reset();
            AnnualStrategyWorkplan.SetRange("Year Reporting Code", "Year Reporting Code");
            AnnualStrategyWorkplan.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
            AnnualStrategyWorkplan.SetRange("Planning Budget Type", "Planning Budget Type");
            AnnualStrategyWorkplan.SetFilter(No, '<>%1', No);
            if AnnualStrategyWorkplan.FindFirst() then
                Error(StrSubstNo('Annual Strategy Workplan %1 with the same Year Reporting Code and Admin Unit already exists', AnnualStrategyWorkplan.No));
        end;
    end;

    trigger OnDelete()
    begin
        UserSetup.Get(UserId);
        // if not UserSetup."Exam Support Admin" then
        //     Error('You do not have the rights to delete this document');
        WPLines.Reset();
        WPLines.SetRange("Strategy Plan ID", "Strategy Plan ID");
        WPLines.SetRange(No, No);
        WPLines.SetRange("Cross Cutting", false);
        WPLines.DeleteAll();
        Activity.Reset();
        Activity.SetRange("Workplan No.", No);
        Activity.DeleteAll();
        WorkplanBudgets.Reset();
        WorkplanBudgets.SetRange("Strategy Plan ID", No);
        WorkplanBudgets.DeleteAll();
        Outputs.Reset();
        Outputs.SetRange("Strategic Plan ID", No);
        Outputs.DeleteAll();
    end;

    var
        SPMSetup: Record "SPM General Setup";
        WorkplanBudgets: Record "Workplan Budget Line";
        Outputs: Record "Workplan Activity";
        Activity: Record "SubWorkPlan Activity Inputs";
        UserSetup: Record "User Setup";
        WPLines: Record "Strategy Workplan Lines";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AnnualReportingCodes: Record "CSP Planned Years";
        CSP: Record "Corporate Strategic Plans";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        ResponsibilityCenter: Record "Responsibility Center";

    procedure GetBudgetAmount(var QuarterAmount: array[5] of Decimal) Amt: Decimal;
    var
        WorkplanBudgetLine: Record "Workplan Budget Line";
    begin
        clear(QuarterAmount);
        WorkplanBudgetLine.Reset;
        WorkplanBudgetLine.Setrange("Strategy Plan ID", No);
        // if (Rec."Planning Budget Type" = Rec."Planning Budget Type"::"Supplementary 2") and (Rec.Posted = false) then
        //     WorkplanBudgetLine.SetRange("G/L Updated", false);
        if WorkplanBudgetLine.Findset() then begin
            WorkplanBudgetLine.Calcsums("Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount", "Total Amount");
            QuarterAmount[1] := WorkplanBudgetLine."Q1 Amount";
            QuarterAmount[2] := WorkplanBudgetLine."Q2 Amount";
            QuarterAmount[3] := WorkplanBudgetLine."Q3 Amount";
            QuarterAmount[4] := WorkplanBudgetLine."Q4 Amount";
            QuarterAmount[5] := WorkplanBudgetLine."Total Amount";
        end;
        Amt := QuarterAmount[5];
    end;

    procedure GetBudgetAmount() Amt: Decimal;
    var
        WorkplanBudgetLine: Record "Workplan Budget Line";
        QuarterAmount: array[5] of Decimal;
    begin
        clear(QuarterAmount);
        WorkplanBudgetLine.Reset;
        WorkplanBudgetLine.Setrange("Strategy Plan ID", No);
        if WorkplanBudgetLine.Findset() then begin
            WorkplanBudgetLine.Calcsums("Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount", "Total Amount");
            QuarterAmount[1] := WorkplanBudgetLine."Q1 Amount";
            QuarterAmount[2] := WorkplanBudgetLine."Q2 Amount";
            QuarterAmount[3] := WorkplanBudgetLine."Q3 Amount";
            QuarterAmount[4] := WorkplanBudgetLine."Q4 Amount";
            QuarterAmount[5] := WorkplanBudgetLine."Total Amount";
        end;
        Amt := QuarterAmount[5];
    end;

    procedure ConsolidatePlan()
    begin
        Rec.Validate(Consolidated, true);
        Rec.Validate("Under Review", false);
        Rec.Validate(Select, false);
        Rec.Modify();
    end;

    procedure SendApprovalRequest()
    var
        WorkPlanBudgetLines: Record "Workplan Budget Line";
        QuarterAmount: array[5] of Decimal;
        Supp: Decimal;
    begin
        Rec.TestField("Global Dimension 1 Code");
        Rec.TestField("Global Dimension 2 Code");
        Rec.Testfield("Annual Workplan");
        GetBudgetAmount(QuarterAmount);

        if QuarterAmount[5] = 0 then
            Error('There are no budget lines for the plan, Please add some to continue');
        if "Planning Budget Type" in ["Planning Budget Type"::Supplementary, "Planning Budget Type"::"Supplementary 2"] then begin
            if Round(QuarterAmount[5], 1) > Round("Ceiling Amount", 1) then
                Error('Total Budget amount of %1 exceeds the allocated amount of %2. Please correct to proceed!', Round(QuarterAmount[5], 1), "Ceiling Amount");
            if Round(QuarterAmount[5], 1) > Round("Ceiling Amount", 1) then
                IF not Confirm(StrSubstNo('Total Budget amount of %1 is less than the allocated amount of %2. Do you want to proceed?', Round(QuarterAmount[5], 1), "Ceiling Amount")) then
                    Error('Sending for approval aborted');
        end;

        // if "Planning Budget Type" = "Planning Budget Type"::"Supplementary 2" then begin
        //     if Round(QuarterAmount[5], 1) > getSupplementaryAmount(Supp) then
        //         Error('Total Budget amount of %1 exceeds the allocated amount of %2. Please correct to proceed!', Round(QuarterAmount[5], 1), Supp);
        //     if Round(QuarterAmount[5], 1) < getSupplementaryAmount(Supp) then
        //         IF not Confirm(StrSubstNo('Total Budget amount of %1 is less than the allocated amount of %2. Do you want to proceed?', Round(QuarterAmount[5], 1), Supp)) then
        //             Error('Sending for approval aborted');
        // end;
    end;

    procedure getSupplementaryAmount(var Supp: Decimal): Decimal;
    var
        wpbudgetline: Record "Workplan Budget Line";
        budgetitem: Code[20];
    begin
        Supp := 0;
        budgetitem := '';
        wpbudgetline.Reset();
        wpbudgetline.SetRange("Strategy Plan ID", No);
        wpbudgetline.SetCurrentKey("Budget Item");
        wpbudgetline.SetAscending("Budget Item", false);
        if wpbudgetline.FindSet() then
            repeat
                if budgetitem <> wpbudgetline."Budget Item" then begin
                    budgetitem := wpbudgetline."Budget Item";
                    Supp += wpbudgetline."Total Ceiling";
                end;
            until wpbudgetline.Next() = 0;
        exit(Supp);
    end;

    procedure getTotalSupplementaryAmount(var Supp: Decimal): Decimal;
    var
        wpbudgetline: Record "Workplan Budget Line";
        budgetitem: Code[20];
    begin
        Supp := 0;
        budgetitem := '';
        wpbudgetline.Reset();
        wpbudgetline.SetRange("Strategy Plan ID", No);
        wpbudgetline.SetCurrentKey("Budget Item");
        wpbudgetline.SetAscending("Budget Item", false);
        if wpbudgetline.FindSet() then
            repeat
                if budgetitem <> wpbudgetline."Budget Item" then begin
                    wpbudgetline.CalcFields("Total Item Amount");
                    budgetitem := wpbudgetline."Budget Item";
                    if wpbudgetline."Total Ceiling" <> 0 then
                        Supp += wpbudgetline."Total Ceiling"
                    else
                        Supp += wpbudgetline."Total Item Amount";
                end;
            until wpbudgetline.Next() = 0;
        exit(Supp);
    end;

    procedure ValidateDims(ASW: Record "Annual Strategy Workplan")
    var
        BudgetEntry: Record "G/L Budget Entry";
        WorkplanLines: Record "Workplan Budget Line";
    begin
        BudgetEntry.Reset();
        // BudgetEntry.SetRange("Source Document", ASW.No);
        if BudgetEntry.FindSet() then
            repeat
                if BudgetEntry."Global Dimension 1 Code" <> ASW."Global Dimension 1 Code" then
                    BudgetEntry."Global Dimension 1 Code" := ASW."Global Dimension 1 Code";
                if BudgetEntry."Global Dimension 2 Code" <> ASW."Global Dimension 2 Code" then
                    BudgetEntry."Global Dimension 2 Code" := ASW."Global Dimension 2 Code";
                BudgetEntry.Modify();
            until BudgetEntry.Next() = 0;
        WorkplanLines.Reset();
        WorkplanLines.SetRange("Strategy Plan ID", ASW.No);
        if WorkplanLines.FindSet() then
            repeat
                if WorkplanLines."Global Dimension 1 Code" <> ASW."Global Dimension 1 Code" then
                    WorkplanLines."Global Dimension 1 Code" := ASW."Global Dimension 1 Code";
                if WorkplanLines."Global Dimension 2 Code" <> ASW."Global Dimension 2 Code" then
                    WorkplanLines."Global Dimension 2 Code" := ASW."Global Dimension 2 Code";
                WorkplanLines.Modify();
            until WorkplanLines.Next() = 0;
    end;
}

