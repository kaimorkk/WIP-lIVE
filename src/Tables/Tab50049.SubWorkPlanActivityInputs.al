table 50049 "SubWorkPlan Activity Inputs"
{
    Caption = 'SubWorkPlan Activity Inputs';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Budget G/L"; Code[20])
        {
            Caption = 'Budget G/L';
            TableRelation = "G/L Account" where("Account Type" = const(Posting));
            trigger OnValidate()
            var
                GL: Record "G/L Account";
            begin
                GL.Get("Budget G/L");
                "Budget G/L Description" := GL.Name;
            end;
        }
        field(5; "Quarter One Target"; Decimal)
        {
            Caption = 'Quarter One Target';
            trigger OnValidate()
            begin
                Rec.GetTotalTarget();
            end;
        }
        field(6; "Quarter One Budget"; Decimal)
        {
            Caption = 'Quarter One Budget';
            fieldClass = Flowfield;
            Editable = false;
            Calcformula = Sum("Workplan Budget Line"."Q1 Amount" where("Strategy Plan ID" = field("Workplan No."), "KRA ID" = field("KRA ID"),
                                                                      "Core Strategy ID" = field("Core Strategy ID"), "Strategy ID" = field("Strategy ID"),
                                                                      "Activity ID" = field("Activity Id"), "Input Line No." = field("Line No.")));

        }
        field(7; "Quarter Two Target"; Decimal)
        {
            Caption = 'Quarter Two Target';
            trigger OnValidate()
            begin
                GetTotalTarget();
            end;
        }
        field(8; "Quarter Two Budget"; Decimal)
        {
            Caption = 'Quarter Two Budget';
            fieldClass = Flowfield;
            Editable = false;
            Calcformula = Sum("Workplan Budget Line"."Q2 Amount" where("Strategy Plan ID" = field("Workplan No."), "KRA ID" = field("KRA ID"),
                                                                      "Core Strategy ID" = field("Core Strategy ID"), "Strategy ID" = field("Strategy ID"),
                                                                      "Activity ID" = field("Activity Id"), "Input Line No." = field("Line No.")));
        }
        field(9; "Quarter Three Target"; Decimal)
        {
            Caption = 'Quarter Three Target';
            trigger OnValidate()
            begin
                GetTotalTarget();
            end;
        }
        field(10; "Quarter Three Budget"; Decimal)
        {
            Caption = 'Quarter Three Budget';
            fieldClass = Flowfield;
            Editable = false;
            Calcformula = Sum("Workplan Budget Line"."Q3 Amount" where("Strategy Plan ID" = field("Workplan No."), "KRA ID" = field("KRA ID"),
                                                                      "Core Strategy ID" = field("Core Strategy ID"), "Strategy ID" = field("Strategy ID"),
                                                                      "Activity ID" = field("Activity Id"), "Input Line No." = field("Line No.")));
        }
        field(11; "Quarter Four Target"; Decimal)
        {
            Caption = 'Quarter Four Target';
            trigger OnValidate()
            begin
                GetTotalTarget();
            end;
        }
        field(12; "Quarter Four Budget"; Decimal)
        {
            Caption = 'Quarter Four Budget';
            fieldClass = Flowfield;
            Editable = false;
            Calcformula = Sum("Workplan Budget Line"."Q4 Amount" where("Strategy Plan ID" = field("Workplan No."), "KRA ID" = field("KRA ID"),
                                                                      "Core Strategy ID" = field("Core Strategy ID"), "Strategy ID" = field("Strategy ID"),
                                                                      "Activity ID" = field("Activity Id"), "Input Line No." = field("Line No.")));
        }
        field(13; "Total Target"; Decimal)
        {
            Caption = 'Total Target';
            Editable = false;
        }
        field(14; "Total Budget"; Decimal)
        {
            Caption = 'Total Budget';
            fieldClass = Flowfield;
            Editable = false;
            Calcformula = Sum("Workplan Budget Line"."Total Amount" where("Strategy Plan ID" = field("Workplan No."), "KRA ID" = field("KRA ID"),
                                                                      "Core Strategy ID" = field("Core Strategy ID"), "Strategy ID" = field("Strategy ID"),
                                                                      "Activity ID" = field("Activity Id"), "Input Line No." = field("Line No.")));
        }
        field(15; "Budget G/L Description"; Text[100])
        {
            Editable = false;
        }
        field(16; "Activity Id"; Code[20])
        {
            //Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
                Activity: Record "Workplan Activity";
            begin
                Activity.Reset();
                Activity.SetRange("Strategic Plan ID", Rec."Workplan No.");
                Activity.SetRange(Code, Rec."Activity Id");
                if Activity.FindFirst() then
                    Rec."Activity Description" := Activity.Descriptions;
            end;
        }
        field(17; "Initiative No."; Code[30])
        {
        }
        field(18; "Sub Initiative No."; Code[10])
        {
        }
        field(65; "Core Strategy ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."Core Strategy ID" where("No" = field("Workplan No."));
        }
        field(66; "KRA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."KRA ID" where("No" = field("Workplan No."));
        }
        field(67; "Strategy ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."Strategy ID" where("No" = field("Workplan No."));
        }
        field(68; "Activity Description"; Text[1048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(69; "Resource Req. No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70; Source; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Source Process"; Enum "Budget Processes")
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Workplan No.", "KRA ID", "Core Strategy ID", "Strategy ID", "Activity Id", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Activity: Record "Workplan Activity";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
    begin
        if AnnualStrategyWorkplan.Get("Workplan No.") then
            "Resource Req. No." := AnnualStrategyWorkplan."Resource Req. No";
        if Activity.Get("Resource Req. No.", "Activity Id") then begin
            "Activity Description" := Activity.Descriptions;
        end;
    end;

    procedure GetTotalTarget()
    begin
        "Total Target" := 0;
        "Total Target" := "Quarter One Target" + "Quarter Two Target" + "Quarter Three Target" + "Quarter Four Target";
    end;

    procedure GetTotalBudget()
    begin
        "Total Budget" := 0;
        "Total Budget" := "Quarter One Budget" + "Quarter Two Budget" + "Quarter Three Budget" + "Quarter Four Budget";
    end;
}
