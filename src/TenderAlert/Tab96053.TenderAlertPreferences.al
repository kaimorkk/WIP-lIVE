table 96053 "Tender Alert Preferences"
{
    Caption = 'Tender Alert Preferences';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Preference Type"; Code[50])
        {
            Caption = 'Preference Type';
            TableRelation = "Preference Types";

            trigger OnValidate()
            begin
                PrefTypes.Reset();
                PrefTypes.SetRange("No.", Rec."Preference Type");
                if PrefTypes.FindFirst() then
                    Rec."Preference Type Name" := PrefTypes.Name
                else
                    Rec."Preference Type Name" := ''
            end;
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(6; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(7; "Preference Type Name"; Text[100])
        {
            TableRelation = "Preference Types".Name;
            ValidateTableRelation = false;
        }
    }
    keys
    {
        key(PK; "Code")
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

    var
        PrefTypes: Record "Preference Types";


    local procedure SetLastDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;
}
