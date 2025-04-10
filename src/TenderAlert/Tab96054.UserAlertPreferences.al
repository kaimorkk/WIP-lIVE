table 96054 "User Alert Preferences"
{
    Caption = 'User Alert Preferences';
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

            trigger OnValidate()
            var
                Preferences: Record "Tender Alert Preferences";
            begin
                Preferences.Reset();
                Preferences.SetRange(Code, "Preference Code");
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
        }
        field(5; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(6; "Preference Type"; Code[50])
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
        field(7; "Preference Type Name"; Text[100])
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
        Preferences.Reset();
        if Preferences.FindLast() then
            Rec."Line No." := Preferences."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        Preferences: Record "User Alert Preferences";
        PrefTypes: Record "Preference Types";
}
