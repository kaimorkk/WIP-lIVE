
table 69620 "Recruitment Req Work Condition"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Working Condition Category"; Option)
        {
            OptionCaption = 'General Work Environment,Travel/Relocation,Special Tools & Equipment,Other Special Conditions,Workplace Rules';
            OptionMembers = "General Work Environment","Travel/Relocation","Special Tools & Equipment","Other Special Conditions","Workplace Rules";
        }
        field(5; Description; Text[300])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

