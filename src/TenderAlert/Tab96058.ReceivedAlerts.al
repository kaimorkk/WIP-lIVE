table 96058 "Received Alerts"
{
    Caption = 'Received Alerts';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Received Alerts";
    LookupPageId = "Received Alerts";
    
    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
        }
        field(2; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = "Tender Alert Portal Users";

            trigger OnValidate()
            begin
                if PortalUsers.Get("User ID") then begin
                    Username := PortalUsers."User Name";
                    "E-Mail" := PortalUsers."E-Mail";
                    "Phone No." := PortalUsers."Phone No.";
                end;
            end;
        }
        field(3; Username; Text[100])
        {
            Caption = 'Username';
        }
        field(4; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
        }
        field(5; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
        }
        field(6; "Sent Content"; Text[2048])
        {
            Caption = 'Content';
        }
        field(7; "Date Received"; DateTime)
        {
            Caption = 'Date Received';
        }
        field(8; Cost; Decimal)
        {
            Caption = 'Cost';
        }
        field(9; "Alert Type"; Option)
        {
            Caption = 'Alert Type';
            OptionMembers = ,SMS,"E-Mail";
        }
        field(10; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(11; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = ,Queued,Sent,Failed;
        }
        field(12; "Tender Notice"; Code[20])
        {
            TableRelation = "Tender Notices";
        }
        field(13; "Plan ID"; Code[20])
        {
            // TableRelation = 
        }
    }
    keys
    {
        key(PK; "No.", "User ID", "Alert Type")
        {
            Clustered = true;
        }
    }

    var
        PortalUsers: Record "Tender Alert Portal Users";
}
