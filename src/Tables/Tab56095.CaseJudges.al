
table 56095 "Case Judges"
{
    // DrillDownPageID = "Case Judges";
    // LookupPageID = "Case Judges";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "ID No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "First Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Middle Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Female,Male';
            OptionMembers = Female,Male;
        }
        field(7; Contact; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Designation; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Comments; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Remarks; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Names; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

