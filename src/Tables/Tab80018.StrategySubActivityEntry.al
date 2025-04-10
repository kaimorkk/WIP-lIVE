
table 80018 "Strategy Sub_Activity Entry"
{
    DrillDownPageID = "Strategy Activities Entries";
    LookupPageID = "Strategy Activities Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Strategic Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[50])
        {
            TableRelation = "Strategic Theme"."Theme ID";
        }
        field(3; "Objective ID"; Code[50])
        {
            TableRelation = "Strategic Objective"."Objective ID";
        }
        field(4; "Strategy ID"; Code[50])
        {
            TableRelation = Strategy."Strategy ID";
        }
        field(5; "Activity ID"; Code[50])
        {
            TableRelation = "Strategic Initiative".Code;

            trigger OnValidate()
            begin
                if StrategicInitiative.Get("Activity ID") then begin
                    "Strategic Plan ID" := StrategySub_ActivityEntry."Strategic Plan ID";
                    "Theme ID" := StrategySub_ActivityEntry."Theme ID";
                    "Objective ID" := StrategySub_ActivityEntry."Objective ID";
                    "Strategy ID" := StrategySub_ActivityEntry."Strategy ID";
                    "User ID" := StrategySub_ActivityEntry."User ID"
                end;
            end;
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Entry Description"; Text[255])
        {
        }
        field(8; "Entry Type"; Option)
        {
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(9; "Year Reporting Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(10; "Quarter Reporting Code"; Code[50])
        {
            TableRelation = "Quarterly Reporting Periods" where("Year Code" = field("Year Reporting Code"));
        }
        field(11; "Planning Date"; Date)
        {
        }
        field(12; "Primary Directorate"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(" "));
        }
        field(13; "Primary Department"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(14; Quantity; Decimal)
        {
        }
        field(15; "Cost Amount"; Decimal)
        {
        }
        field(16; "External Document No"; Code[50])
        {
            FieldClass = Normal;
            TableRelation = if ("Document Type" = const(Plog)) "Performance Diary Log".No where(No = field("External Document No"))
            else
            if ("Document Type" = const(Appraisal)) "Perfomance Evaluation".No where(No = field("External Document No"));
        }
        field(17; "Source Type"; Option)
        {
            OptionCaption = 'Strategic Plan,Perfomance Contract';
            OptionMembers = "Strategic Plan","Perfomance Contract";
        }
        field(18; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(19; "Posting Date"; Date)
        {
        }
        field(20; "Document Type"; Option)
        {
            OptionCaption = 'Plog,Appraisal';
            OptionMembers = Plog,Appraisal;
        }
        field(21; "User ID"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(22; "Region Code"; Code[30])
        {
        }
        field(23; "Performance Contract ID"; Code[30])
        {
        }
        field(24; "Annual Workplan"; Code[30])
        {
        }
        field(25; "Board PC ID"; Code[30])
        {
        }
        field(26; "CEO PC ID"; Code[30])
        {
        }
        field(27; "Functional PC ID"; Code[30])
        {
        }
        field(28; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(29; Reversed; Boolean)
        {
        }
        field(30; "Reversed By"; Code[50])
        {
        }
        field(31; "Reversed Entry No"; Integer)
        {
        }
        field(32; "Directors PC ID"; Code[20])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"),
                                                                   "Score Card Type" = filter(Departmental | Directors),
                                                                   "Approval Status" = const(Released));
        }
        field(33; "Department/Center PC ID"; Code[20])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"),
                                                                   "Score Card Type" = const(Departmental));
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StrategicInitiative: Record "Strategic Initiative";
        StrategySub_ActivityEntry: Record "Strategy Sub_Activity Entry";
}

