
table 69707 "Candidate Selection Panel"
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
        field(4; Description; Text[250])
        {
        }
        field(5; Venue; Text[150])
        {
        }
        field(6; "Room No."; Text[100])
        {
        }
        field(7; "No of Committee Members"; Integer)
        {
            CalcFormula = count("Candidate Selection Panelist" where("Panel ID" = field("Panel ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Panel ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

