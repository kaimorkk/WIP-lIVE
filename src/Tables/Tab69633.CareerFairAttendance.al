
table 69633 "Career Fair Attendance"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Career Fair ID"; Code[30])
        {
            TableRelation = "Vacancy Announcement" where("Posting Type" = filter("Career Fair"));
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Attendee Type"; Option)
        {
            OptionCaption = 'Potential Candidate,HR Official';
            OptionMembers = "Potential Candidate","HR Official";
        }
        field(4; "Representative Name"; Text[50])
        {
        }
        field(5; "Representative Email"; Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(6; "Representative Tel No"; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(7; "Notified on Email"; Boolean)
        {
        }
        field(8; "Date/Time Notified"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; "Career Fair ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

