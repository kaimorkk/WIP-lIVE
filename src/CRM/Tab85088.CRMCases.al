
table 85088 "CRM Cases"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Case Type"; Option)
        {
            OptionCaption = 'Enquiry,Complaint,Request,Complement';
            OptionMembers = Enquiry,Complaint,Request,Complement;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

