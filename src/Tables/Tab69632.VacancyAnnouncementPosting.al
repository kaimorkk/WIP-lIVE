
table 69632 "Vacancy Announcement Posting"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Announcement No."; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Posting Type"; Option)
        {
            OptionCaption = 'Recruitment Agency Posting,Direct Hire Announcement,Career Fair';
            OptionMembers = "Recruitment Agency Posting","Direct Hire Announcement","Career Fair";
        }
        field(4; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";
        }
        field(5; "Job Board ID"; Code[30])
        {
            TableRelation = "Job Board";

            trigger OnValidate()
            begin
                if JobBoard.Get("Job Board ID") then begin
                    Name := JobBoard.Name;
                    "Vendor No." := JobBoard."Vendor No.";
                end
            end;
        }
        field(6; Name; Text[30])
        {
        }
        field(7; "Advertisment Cost"; Decimal)
        {
        }
        field(8; "External Document No."; Code[30])
        {
        }
        field(9; "Job Posting Link"; Text[50])
        {
            ExtendedDatatype = URL;
        }
        field(10; "Channel Category"; Option)
        {
            OptionCaption = 'Online,Print Media,TV,Radio,Internal Advert,Other';
            OptionMembers = Online,"Print Media",TV,Radio,"Internal Advert",Other;
        }
        field(11; "Vendor No."; Code[30])
        {
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1; "Announcement No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobBoard: Record "Job Board";
}

