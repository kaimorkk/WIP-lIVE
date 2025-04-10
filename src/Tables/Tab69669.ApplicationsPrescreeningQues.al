
table 69669 "Applications Prescreening Ques"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";
        }
        field(2; "Vacancy No."; Code[30])
        {
        }
        field(3; "Pre-screening Stage"; Option)
        {
            OptionCaption = 'Application Stage,Interview-Invitation';
            OptionMembers = "Application Stage","Interview-Invitation";
        }
        field(4; "Question ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Description; Text[400])
        {
        }
        field(6; "Question Type"; Option)
        {
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7; "Close Ended Sub-type"; Code[30])
        {
        }
        field(8; "Response Option"; Code[30])
        {
            TableRelation = "Application Qsn Options"."Option Code" where("Application No." = field("Application No."),
                                                                           "Question ID" = field("Question ID"));
        }
        field(9; "Number Response"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Application No.", "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

