
table 69640 "Commitee Terminated Member"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Member No."; Code[30])
        {
        }
        field(5; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(6; "Member Name"; Text[50])
        {
        }
        field(7; "Member Email"; Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(8; "Telephone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(9; Designation; Text[30])
        {
        }
        field(10; "Staff No."; Code[30])
        {
        }
        field(11; "ID/Passport No"; Code[15])
        {
        }
        field(12; "Tax Registration (PIN) No."; Code[15])
        {
        }
        field(13; "Notified on Email"; Boolean)
        {
        }
        field(14; "Date/Time Notified"; DateTime)
        {
        }
        field(15; "Termination Date"; Date)
        {
        }
        field(16; "Expiry Date"; Date)
        {
        }
        field(17; "Original Appointment No."; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";
        }
        field(18; "No. Series"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

