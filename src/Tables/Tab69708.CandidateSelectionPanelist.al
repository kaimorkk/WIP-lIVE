
table 69708 "Candidate Selection Panelist"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2; "Document No"; Code[30])
        {
        }
        field(3; "Panel ID"; Code[30])
        {
        }
        field(4; "Appointed Selection"; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher"."Document No.";
        }
        field(5; "Member No."; Code[30])
        {
            TableRelation = "Commitee Appointed Member"."Member No." where("Document No." = field("Appointed Selection"));
        }
        field(6; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(7; Name; Text[100])
        {
        }
        field(8; Email; Text[50])
        {
        }
        field(9; "Telephone No"; Text[50])
        {
        }
        field(10; Designation; Text[100])
        {
        }
        field(11; "Staff No."; Code[30])
        {
        }
        field(12; Notified; Boolean)
        {
        }
        field(13; "Notified On"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Member No.", "Panel ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

