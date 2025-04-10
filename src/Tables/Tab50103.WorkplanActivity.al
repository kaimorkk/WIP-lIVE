table 50103 "Workplan Activity"
{
    Caption = 'Workplan Activity';
    DataClassification = ToBeClassified;
    LookupPageId = "Workplan Activities";
    DrillDownPageId = "Workplan Activities";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Descriptions"; Text[1080])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Outputs"; Text[1080])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Annual Target"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Performance Measures"; Text[1080])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Strategic Plan ID"; Code[50])
        {
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(7; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Line N0."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "Strategic Plan ID", Code, "Line N0.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Descriptions, Outputs, "Performance Measures")
        {
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMSetUp: Record "SPM General Setup";
    begin
        if Code = '' then begin
            SPMSetUp.Get();
            SPMSetUp.TestField("Plan Activity Nos");
            NoSeriesMgt.InitSeries(SPMSetUp."Plan Activity Nos", XRec."No Series", 0D, Code, "No Series");
        end;
    end;
}
