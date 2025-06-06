
table 69211 "HR Leave Register"
{
    Caption = 'Leave Register';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            // TableRelation = Table39003920;
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            // TableRelation = Table39003920;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Source Code"; Code[20])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;

            // trigger OnLookup()
            // var
            //     LoginMgt: Codeunit "User Management";
            // begin
            //     LoginMgt.LookupUserID("User ID");
            // end;
        }
        field(7; "Journal Batch Name"; Code[20])
        {
            Caption = 'Journal Batch Name';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date")
        {
        }
        key(Key3; "Source Code", "Journal Batch Name", "Creation Date")
        {
        }
    }

    fieldgroups
    {
    }
}

