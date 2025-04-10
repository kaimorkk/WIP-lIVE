table 96055 "User Tender Subscriptions"
{
    Caption = 'User Tender Subscriptions';
    DataClassification = ToBeClassified;
    DrillDownPageId = "User Tender Subscriptions";
    LookupPageId = "User Tender Subscriptions";
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = "Tender Alert Portal Users";
        }
        field(3; "Subscription ID"; Code[20])
        {
            Caption = 'Subscription ID';
            TableRelation = "Tender Alert Subscriptions";
        }
        field(4; "Subscription Date"; DateTime)
        {
            Caption = 'Subscription Date';
        }
        field(5; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(8; Status; Option)
        {
            OptionMembers = ,Active,Inactive,Expired;
        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.","User ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            TAlertSetups.Get();
            TAlertSetups.TestField("Subscription Nos.");

            if NoSeries.AreRelated(TAlertSetups."Subscription Nos.", xRec."No. series") then
                "No. series" := xRec."No. series"
            else
                "No. series" := TAlertSetups."Subscription Nos.";
            "No." := NoSeries.GetNextNo("No. series");
            Subscriptions.ReadIsolation(IsolationLevel::ReadUncommitted);
            Subscriptions.SetLoadFields("No.");
            while Subscriptions.Get("No.") do
                "No." := NoSeries.GetNextNo("No. series");
        end;

        "Document Date" := Today;
    end;

    trigger OnDelete()
    begin
        UserAlertPref.Reset();
        UserAlertPref.SetRange("Document No.", Rec."No.");
        if UserAlertPref.FindSet() then
            UserAlertPref.DeleteAll();
    end;

    var
        Subscriptions: Record "User Tender Subscriptions";
        TAlertSetups: Record "Tender Alert Setups";
        NoSeries: Codeunit "No. Series";
        UserAlertPref: Record "User Alert Preferences";
}
