
table 69445 "Safety Permit Completion Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = " ","Safe Work Permit Application","Safe Work Completion Report";
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "Safe Work Permit Header"."Document No.";
        }
        field(3; "Restricted Activity ID"; Code[20])
        {
            TableRelation = "Safe Work Permit Header"."Permit Type" where("Document No." = field("Document No."));
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Compliance Requirement"; Text[2048])
        {
        }
        field(6; "Requirement Type"; Option)
        {
            OptionMembers = " ",Mandatory,Optional;
        }
        field(7; "Severity Level for Violation"; Code[20])
        {
            TableRelation = "Incident Severity Level".Code;
        }
        field(8; "Compliance Status"; Option)
        {
            OptionMembers = " ",Compliant,"Non-Compliant","Not Applicable";
        }
        field(9; "Additional Compliance Notes"; Text[2048])
        {
            Description = 'Additional Compliance Notes/Evidence/Explanations';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Restricted Activity ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

