Table 80021 "SPM General Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary key"; Code[10])
        {
        }
        field(2; "Corp Strategic Plan Nos"; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(3; "Work Plan Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(4; "PM Plans Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(5; "PET Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(6; "PWork Plans"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(7; "Corporate PC No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(8; "Functional PC No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(9; "Individual Scorecard Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(10; "PC Target Revision Voucher Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(11; "Daily Performance Diary Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(12; "Performance Evaluation Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(13; "Performance Appeals No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(14; "Enable Performance Appeals"; Boolean)
        {
        }
        field(15; "Performance Improv Review Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(16; "Review Duration"; DateFormula)
        {
        }
        field(17; "Review Description"; Code[30])
        {
        }
        field(18; "policy  Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(19; "PLog Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(20; "Appraisal Based On"; Option)
        {
            OptionCaption = ' ,Direct Input,Plog Input';
            OptionMembers = " ","Direct Input","Plog Input";
        }
        field(21; "Allow Loading of  CSP"; Boolean)
        {
        }
        field(22; "Allow Loading of JD"; Boolean)
        {
        }
        field(23; "Workplan Revision No"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(24; "Functional Annual Workplan Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(25; "Annual Performance  Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(26; "Current Reporting Period"; Code[30])
        {
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(27; "Current Reporting Quarter"; Code[30])
        {
            TableRelation = "Quarterly Reporting Periods".Code where("Year Code" = field("Current Reporting Period"));

            trigger OnValidate()
            begin
                QuarterlyReportingPeriods.Reset;
                QuarterlyReportingPeriods.SetRange(Code, "Current Reporting Quarter");
                if QuarterlyReportingPeriods.FindFirst then begin
                    "Current Quarter Start Date" := QuarterlyReportingPeriods."Reporting Start Date";
                    "Current Quarter End Date" := QuarterlyReportingPeriods."Reporting End Date";
                end;
            end;
        }
        field(28; "Notification Due Period"; DateFormula)
        {
        }
        field(29; "Current Quarter Start Date"; Date)
        {
        }
        field(30; "Current Quarter End Date"; Date)
        {
        }
        field(31; "Notification At the Begging Q"; DateFormula)
        {
        }
        field(32; "Notification Due of PC"; DateFormula)
        {
        }
        field(33; "Planning and Strategy Email"; Code[30])
        {
        }
        field(34; "Budget Consolidation Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(35; "Functional P.C No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(36; "Organizational P.C No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(37; "Current Annual Workplan"; Code[30])
        {
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational));
        }
        field(38; "HOD Planning & Strategy"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(39; "Current Rev Annual Workplan"; Code[30])
        {
            Caption = 'Current Revision Annual Workplan';
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational));
        }
        field(40; "Plan Activity Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(41; "AutoCons. Resource Req on Appr"; Boolean)
        {
            Caption = 'AutoConsolidate Resource Requirements on Approval';
            DataClassification = ToBeClassified;
        }
        field(42; "AutoCons. Spend. Unit on Appr"; Boolean)
        {
            Caption = 'AutoConsolidate  Draft Workplan on Approval';
            DataClassification = ToBeClassified;
        }
        field(43; "Draft Workplan Cons. Nos"; code[50])
        {
            Caption = 'Draft Workplan Consolidation Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(44; "Send Draft Cons JSC on Appr."; Boolean)
        {
            Dataclassification = ToBeClassified;
            Caption = 'Auto Send Draft Consolidation to JSC on Approval';
        }
        field(45; "Create Draft Plans on Approval"; Boolean)
        {
            Caption = 'Autocreate Draft Workplans on Approval';
            Dataclassification = ToBeClassified;
        }
        field(46; "AIE Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(47; "Batch AIE Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(48; "AIE Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(49; "Exp. Requisition Nos"; Code[20])
        {
            Caption = 'Expenditure Requisition Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50; "Commit Exp. Req. On Approval"; Boolean)
        {
            Caption = 'Auto Commit Expense Requisition on Approval';
            DataClassification = ToBeClassified;
        }
        field(51; "Budget Control Nos"; Code[20])
        {
            Caption = 'Budget Control Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(52; "PMMU Document Stage"; Enum "HR Performance Document Stage")
        {
        }
        field(53; "PAS Document Stage"; Enum "HR Performance Document Stage")
        {
        }
        field(54; "Target Setting Start Date"; Date)
        {

        }
        field(55; "Target Setting End Date"; Date)
        {
        }
        field(56; "Supplementary Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(57; "Special AIE Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(58; "AIE Consolidation Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(59; "SPM Commitee"; Code[20])
        {
            TableRelation = "No. Series";

        }


    }

    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AnnualReportingCodes: Record "Annual Reporting Codes";
        QuarterlyReportingPeriods: Record "Quarterly Reporting Periods";
}

