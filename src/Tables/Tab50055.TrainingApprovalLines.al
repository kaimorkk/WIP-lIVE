table 50055 "Training Approval Lines"
{
    Caption = 'Training Approval Lines';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Application No"; Code[20])
        {
            //TableRelation=Training
            Caption = 'Application No';
        }
        field(3; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
        }
        field(4; "Employee Name"; Text[150])
        {
            Caption = 'Employee Name';
        }
        field(5; Course; Text[150])
        {
            Caption = 'Course';
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(8; Verdict; Option)
        {
            OptionMembers = "",Approved,Rejected;
            OptionCaption = ',Approved,Rejected';
        }
        field(9; Comments; Text[150])
        {
        }
    }
    keys
    {
        key(PK; "Document No", "Application No")
        {
            Clustered = true;
        }
    }
}
