
table 69443 "Safety Permit Team"
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
        field(3; "Resource No."; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resources.Reset;
                Resources.SetRange("No.", "Resource No.");
                if Resources.FindSet then
                    Name := Resources.Name;
                // "Telephone No." := Resources."M-Pesa Number";
                Email := Resources.Email;
            end;
        }
        field(4; Name; Text[100])
        {
        }
        field(5; Role; Option)
        {
            OptionCaption = ' ,Safety Manager,Evacuation Manager,Assembly Point Manager,Emergency Response Member,First Aid Coordinator,Observer,Other Participant,Contractor Team';
            OptionMembers = " ","Safety Manager","Evacuation Manager","Assembly Point Manager","Emergency Response Member","First Aid Coordinator",Observer,"Other Participant","Contractor Team";
        }
        field(6; "Telephone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(7; Email; Text[50])
        {
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
}

