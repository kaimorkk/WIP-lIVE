table 55305 "Incident Equipments"
{
    Caption = 'Incident Equipments';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Incident Equipments";
    LookupPageId = "Incident Equipments";
    fields
    {
        field(1; "Incident ID"; Code[30])
        {
            Caption = 'Incident ID';
        }
        field(2; "Equipment ID"; Code[30])
        {
            TableRelation = "Safety Equipment Register"."Equipment ID";
            Caption = 'Equipment ID';
            trigger OnValidate()
            var
                Equipment: Record "Safety Equipment Register";
            begin
                Equipment.Reset();
                Equipment.SetRange("Equipment ID", "Equipment ID");
                if Equipment.FindSet() then
                    "Equipment Name" := Equipment.Description;
            end;
        }
        field(3; "Equipment Name"; Text[250])
        {
            Caption = 'Equipment Name';
        }
        field(4; "Used Quantity"; Decimal)
        {
        }
    }
    keys
    {
        key(PK; "Incident ID")
        {
            Clustered = true;
        }
    }
}
