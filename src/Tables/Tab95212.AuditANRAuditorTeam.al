
table 95212 "Audit ANR Auditor Team"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Engagement ID"; Code[20])
        {
        }
        field(4; "Resource No."; Code[20])
        {
        }
        field(5; Name; Text[100])
        {
        }
        field(6; "Engagement Role"; Code[20])
        {
        }
        field(7; "Start Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; "Job Title"; Text[200])
        {
        }
        field(10; "Phone No."; Code[20])
        {
        }
        field(11; Email; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

