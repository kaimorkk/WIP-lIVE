
table 80229 "Board Sub Activities"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
        }
        field(2; "Initiative No."; Code[30])
        {
        }
        field(3; "Objective/Initiative"; Code[255])
        {
        }
        field(4; "Activity Id"; Code[50])
        {
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
        field(7; Indentation; Decimal)
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
        field(10; "%Complete"; Decimal)
        {
        }
        field(11; "Priority Level"; Option)
        {
            OptionCaption = 'Urgent,Important,Medium,Low';
            OptionMembers = Urgent,Important,Medium,Low;
        }
        field(12; "Strategy Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans";
        }
        field(13; "Year Reporting Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes";
        }
        field(14; "Start Date"; Date)
        {
        }
        field(15; "Due Date"; Date)
        {
        }
        field(16; "Primary Directorate"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(17; "Primary Department"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(18; "Overall Owner"; Code[100])
        {
        }
        field(19; "Outcome Perfomance Indicator"; Text[2048])
        {
        }
        field(20; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(21; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(22; "KPI Type"; Option)
        {
            OptionCaption = 'Lagging,Leading,Not Applicable';
            OptionMembers = Lagging,Leading,"Not Applicable";
        }
        field(23; "Imported Annual Target Qty"; Decimal)
        {
        }
        field(24; "Q1 Target Qty"; Decimal)
        {
        }
        field(25; "Q1 Self-Review Qty"; Decimal)
        {
        }
        field(26; "Q1 ManagerReview Qty"; Decimal)
        {
        }
        field(27; "Q1 Actual Qty"; Decimal)
        {
        }
        field(28; "Q2 Target Qty"; Decimal)
        {
        }
        field(29; "Q2 Self-Review Qty"; Decimal)
        {
        }
        field(30; "Q2 ManagerReview Qty"; Decimal)
        {
        }
        field(31; "Q2 Actual Qty"; Decimal)
        {
        }
        field(32; "Q3 Target Qty"; Decimal)
        {
        }
        field(33; "Q3 Self-Review Qty"; Decimal)
        {
        }
        field(34; "Q3 ManagerReview Qty"; Decimal)
        {
        }
        field(35; "Q3 Actual Qty"; Decimal)
        {
        }
        field(36; "Q4 Target Qty"; Decimal)
        {
        }
        field(37; "Q4 Self-Review Qty"; Decimal)
        {
        }
        field(38; "Q4 ManagerReview Qty"; Decimal)
        {
        }
        field(39; "Q4 Actual Qty"; Decimal)
        {
        }
        field(40; "Global Dimension 1 Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(41; "Global Dimension 2 Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(42; "Planning Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(43; "Goal Template ID"; Code[50])
        {
            TableRelation = "Goal Template";
        }
        field(44; "Sub Initiative No."; Code[10])
        {
        }
        field(45; "Sub Targets"; Decimal)
        {
        }
        field(46; "Entry Number"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Workplan No.", "Initiative No.", "Activity Id", "Entry Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

