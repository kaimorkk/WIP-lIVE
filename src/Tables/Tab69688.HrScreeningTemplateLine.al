
table 69688 "Hr Screening Template Line"
{
    LookupPageId = "Hr Screening Qn Group";
    DrillDownPageId = "Hr Screening Qn Group";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template Type"; Option)
        {
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2; "Template ID"; Code[30])
        {
        }
        field(3; "Question Category"; Code[30])
        {
            TableRelation = "Hr Screening Qn Group"."Question Category" where("Header No." = field("Template ID"));
        }
        field(4; "Question Id"; Code[30])
        {
        }
        field(5; Description; Text[350])
        {
        }
        field(6; "Question Type"; Option)
        {
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7; "Closed-ended Question Sub-Type"; Code[30])
        {
        }
        field(8; Weight; Decimal)
        {
        }
        field(9; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(10; "Minimum Points Accepted"; Integer)
        {
        }
        field(11; "Maximum Points Accepted"; Integer)
        {
        }
        field(12; "Default Rating Scale"; Code[30])
        {
            TableRelation = "Close Ended Qn Type"."Type ID";
        }
        field(13; "Interview Area"; Option)
        {
            OptionCaption = 'Technical Interview,Oral Interview';
            OptionMembers = "Technical Interview","Oral Interview";
        }
    }

    keys
    {
        key(Key1; "Template ID", "Line No.", "Template Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

