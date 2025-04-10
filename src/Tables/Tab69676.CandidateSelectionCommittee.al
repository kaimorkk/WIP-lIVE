
table 69676 "Candidate Selection Committee"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Aptitude Test Invitation,Final Candidate Shortlisting,Formal Interview Invitation';
            OptionMembers = "Aptitude Test Invitation","Final Candidate Shortlisting","Formal Interview Invitation";
        }
        field(3; "Appointed Committee ID"; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";
        }
        field(4; "Member No."; Code[30])
        {
            TableRelation = "Commitee Appointed Member"."Member No." where("Document No." = field("Appointed Committee ID"));

            trigger OnValidate()
            begin
                CommiteeMember.Reset;
                CommiteeMember.SetRange("Member No.", "Member No.");
                if CommiteeMember.Find('-') then begin
                    Role := CommiteeMember.Role;
                    Name := CommiteeMember."Member Name";
                    Email := CommiteeMember."Member Email";
                    "Phone No." := CommiteeMember."Telephone No.";
                    Designation := CommiteeMember.Designation;
                    "Staff No." := CommiteeMember."Staff No.";
                end
            end;
        }
        field(5; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant,Joint Secretary,Secretariat Support';
            OptionMembers = Member,Chairperson,Secretary,Consultant,"Joint Secretary","Secretariat Support";
        }
        field(6; Name; Text[50])
        {
        }
        field(7; Email; Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(8; "Phone No."; Text[15])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(9; Designation; Text[50])
        {
        }
        field(10; "Staff No."; Code[30])
        {
        }
        field(11; Noassigned; integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Candidate Shortlist Matrix" where("Member No." = field("Member No."), "Document No" = field("Document No.")));

        }
    }

    keys
    {
        key(Key1; "Document No.", "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CommiteeMember: Record "Commitee Appointed Member";
}

