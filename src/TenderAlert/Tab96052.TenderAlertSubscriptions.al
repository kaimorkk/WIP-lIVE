table 96052 "Tender Alert Subscriptions"
{
    Caption = 'Tender Alert Subscriptions';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[2048])
        {
            Caption = 'Name';
        }
        field(3; "Subscription Type"; Option)
        {
            Caption = 'Subscription Type';
            OptionMembers = ,"Free Trial",Premium;
        }
        field(4; "Has Expiry"; Boolean)
        {
            Caption = 'Has Expiry';
        }
        field(5; "Expiry Period"; Code[10])
        {
            Caption = 'Expiry Period';
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(7; Comments; Boolean)
        {
            Caption = 'Comments';
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(9; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        SetLastDateTimeModified();
    end;

    trigger OnRename()
    begin
        SetLastDateTimeModified();
    end;

    trigger OnDelete()
    begin
        
    end;

    var
        // Preferences: Record "";

    local procedure SetLastDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;
}
