
table 80193 "Policy Attestation Invitation"
{
    Caption = 'Policy Attestation Invitation';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
        }
        field(2; "Employee No"; Code[50])
        {
            TableRelation = Employee."No.";
        }
        field(3; Name; Text[100])
        {
        }
        field(4; "Email address"; Code[100])
        {
        }
        field(5; Invited; Boolean)
        {
        }
        field(6; "Date Invited"; Date)
        {
        }
        field(7; "Time Invited"; Time)
        {
        }
        field(8; "Invited By"; Code[30])
        {
        }
        field(9; "Due Date"; Date)
        {
        }
        field(10; "Attestation No."; Code[50])
        {
            CalcFormula = lookup("Employee Policy Attestation"."Attestation No." where("Policy No." = field("Policy ID")));
            FieldClass = FlowField;
        }
        field(11; "Employee Signing Status"; Option)
        {
            CalcFormula = lookup("Employee Policy Attestation"."Employee Signing Status" where("Policy No." = field("Policy ID")));
            FieldClass = FlowField;
            OptionCaption = 'Pending,Approved';
            OptionMembers = Pending,Approved;
        }
        field(12; "Date Approved"; Date)
        {
            CalcFormula = lookup("Employee Policy Attestation"."Date Approved" where("Policy No." = field("Policy ID")));
            FieldClass = FlowField;
        }
        field(13; "Policy Name"; Code[100])
        {
        }
        field(14; "External Ref No"; Code[100])
        {
        }
        field(15; "Policy Goal"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

