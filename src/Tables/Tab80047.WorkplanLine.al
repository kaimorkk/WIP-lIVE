
table 80047 "Workplan Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
        }
        field(2; "Initiative No."; Code[50])
        {
        }
        field(3; "Primary Initiative/Activity"; Code[50])
        {
        }
        field(4; "Goal ID"; Code[50])
        {
            TableRelation = "Workplan Goal"."Goal ID";
        }
        field(5; "Initiative Type"; Option)
        {
            OptionCaption = 'Activity,Project';
            OptionMembers = Activity,Project;
        }
        field(6; "Task Type"; Option)
        {
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(7; Indentation; Integer)
        {
        }
        field(8; Totaling; Decimal)
        {
        }
        field(9; Progress; Option)
        {
            OptionCaption = 'Not started,In progress,Completed';
            OptionMembers = "Not started","In progress",Completed;
        }
        field(10; "%Completed"; Decimal)
        {
        }
        field(11; "Priority Level"; Option)
        {
            OptionCaption = 'Urgent,Important,Medium,Low';
            OptionMembers = Urgent,Important,Medium,Low;
        }
        field(12; "Strategy Plan ID"; Code[50])
        {
        }
        field(13; "Year Reporting Code"; Code[50])
        {
        }
        field(14; "Start Date"; Date)
        {
        }
        field(15; "Due Date"; Date)
        {
        }
        field(16; "Primary Directorate"; Code[50])
        {
        }
        field(17; "Primary Department"; Code[50])
        {
        }
        field(18; "Outcome Perfomance Indicator"; Code[200])
        {
        }
        field(19; "KPI Type"; Option)
        {
            OptionCaption = 'Lagging,Leading';
            OptionMembers = Lagging,Leading;
        }
        field(20; "KPI Entry Type"; Option)
        {
            OptionCaption = 'Absolute No,Percentage';
            OptionMembers = "Absolute No",Percentage;
        }
        field(21; "Imported Annual Target Qty"; Decimal)
        {
        }
        field(22; "Imported Ann. Budget Estimate"; Decimal)
        {
        }
        field(23; "Q1 Target Qty"; Decimal)
        {
        }
        field(24; "Q1 Self-Review Qty"; Decimal)
        {
        }
        field(25; "Q1 Actual Qty"; Decimal)
        {
        }
        field(26; "Q1 Budget"; Decimal)
        {
        }
        field(27; "Q1 Actual Cost"; Decimal)
        {
        }
        field(28; "Q2 Target Qty"; Decimal)
        {
        }
        field(29; "Q2 Self-Review Qty"; Decimal)
        {
        }
        field(30; "Q2 Actual Qty"; Decimal)
        {
        }
        field(31; "Q2 Budget"; Decimal)
        {
        }
        field(32; "Q2 Actual Cost"; Decimal)
        {
        }
        field(33; "Q3 Target Qty"; Decimal)
        {
        }
        field(34; "Q3 Self-Review Qty"; Decimal)
        {
        }
        field(35; "Q3 Actual Qty"; Decimal)
        {
        }
        field(36; "Q3 Budget"; Decimal)
        {
        }
        field(37; "Q3 Actual Cost"; Decimal)
        {
        }
        field(38; "Q4 Target Qty"; Decimal)
        {
        }
        field(39; "Q4 Actual Qty"; Decimal)
        {
        }
        field(40; "Q4 Budget"; Decimal)
        {
        }
        field(41; "Q4 Actual Cost"; Decimal)
        {
        }
        field(42; "Global Dimension 1 Code"; Code[50])
        {
        }
        field(43; "Global Dimension 2 Code"; Code[50])
        {
        }
        field(44; "Planning Date Filter"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Workplan No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

