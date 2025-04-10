
table 80091 "Performance Diary Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line Number"; Code[30])
        {
        }
        field(2; "Employee No"; Code[30])
        {
        }
        field(3; "Posting Date"; Date)
        {
        }
        field(4; "Performance Entry Type"; Option)
        {
            OptionCaption = 'Positive Performance,Negative Performance';
            OptionMembers = "Positive Performance","Negative Performance";
        }
        field(5; "Diary Source"; Option)
        {
            OptionCaption = 'Self-Log,Supervisor-Log';
            OptionMembers = "Self-Log","Supervisor-Log";
        }
        field(6; Description; Text[255])
        {
        }
        field(7; "Personal Scorecard ID"; Code[50])
        {
        }
        field(8; "Goal ID"; Code[50])
        {
        }
        field(9; "Objective ID"; Code[50])
        {
        }
        field(10; "Disciplinary Case ID"; Code[50])
        {
        }
        field(11; "Primary Directorate"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(" "));
        }
        field(12; "Primary Department"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(13; Quantity; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Line Number", "Employee No", "Posting Date", "Personal Scorecard ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

