
table 69437 "Emergency Drill Team"
{

    fields
    {
        field(1; "Drill ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Emergency Drill Log"."Drill ID";
        }
        field(2; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
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
        field(3; Name; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Safety Manager,Evacuation Manager,Assembly Point Manager,Emergency Response Member,First Aid Coordinator,Observer,Other Participant';
            OptionMembers = " ","Safety Manager","Evacuation Manager","Assembly Point Manager","Emergency Response Member","First Aid Coordinator",Observer,"Other Participant";
        }
        field(5; "Telephone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(6; Email; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1; "Drill ID", "Resource No.")
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

