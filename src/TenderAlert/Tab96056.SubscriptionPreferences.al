table 96056 "Subscription Preferences"
{
    Caption = 'Subscription Preferences';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Preference Code"; Code[50])
        {
            Caption = 'Preference Code';
            TableRelation = "Tender Alert Preferences";

            trigger OnValidate()
            begin
                Preferences.Reset();
                Preferences.SetRange(Code, Rec."Preference Code");
                if Preferences.FindFirst() then begin
                    Rec."Preference Name" := Preferences.Name;
                    Rec."Preference Type" := Preferences."Preference Type";
                    Rec.Validate("Preference Type");
                end else begin
                    Rec."Preference Name" := '';
                    Rec."Preference Type" := '';
                end;
            end;
        }
        field(4; "Preference Name"; Text[100])
        {
            Caption = 'Preference Name';
            TableRelation = "Tender Alert Preferences".Name;
            ValidateTableRelation = false;
        }
        field(5; "Preference Type"; Code[50])
        {
            Caption = 'Preference Type';
            TableRelation = "Preference Types";

            trigger OnValidate()
            begin
                PrefTypes.Reset();
                PrefTypes.SetRange("No.", "Preference Type");
                if PrefTypes.FindFirst() then
                    "Preference Type Name" := PrefTypes.Name
                else
                    "Preference Type Name" := ''
            end;
        }
        field(6; "Preference Type Name"; Text[100])
        {
            TableRelation = "Preference Types".Name;
            ValidateTableRelation = false;
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        SubPreferences.Reset();
        if SubPreferences.FindLast() then
            Rec."Line No." := SubPreferences."Line No." + 1
        else
            Rec."Line No." := 1;
    end;

    var
        Preferences: Record "Tender Alert Preferences";
        SubPreferences: Record "Subscription Preferences";
        PrefTypes: Record "Preference Types";
}
