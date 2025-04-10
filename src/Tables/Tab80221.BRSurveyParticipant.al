
table 80221 "BR Survey Participant"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Target Respondent Type"; Option)
        {
            OptionCaption = 'Employees,Stakeholders,Contacts,Vendors';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(3; "Participant ID"; Code[30])
        {
        }
        field(4; Name; Code[100])
        {
        }
        field(5; Email; Code[100])
        {
        }
        field(6; "Response Due Date"; Date)
        {
        }
        field(7; Invited; Boolean)
        {
        }
        field(8; "Date Invited"; Date)
        {
        }
        field(9; "Time Invited"; Time)
        {
        }
        field(10; "Invited By"; Code[30])
        {
        }
        field(11; "Survey Response ID"; Code[30])
        {
        }
        field(12; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Target Respondent Type", "Participant ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

