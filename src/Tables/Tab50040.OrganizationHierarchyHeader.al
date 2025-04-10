table 50040 "Organization Hierarchy Header"
{
    Caption = 'Organization Hierarchy Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(3; "Structure Type"; Option)
        {
            Caption = 'Structure Type';
            OptionMembers = ,Administrative,Functional;
        }
        field(4; Description; Text[1000])
        {
            Caption = 'Description';
        }
        field(5; "Done By"; Code[20])
        {
            Caption = 'Created By';
        }
        field(6; Status; option)
        {
            Caption = 'Status';
            OptionMembers = New,"Under Review",Approved;
        }
        field(7; "Implementing Unit"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center" | "Division/Section" | Directorate | Office | "Court Stations"));
            trigger OnValidate()
            begin
                if RespC.get("Implementing Unit") then
                    "Implementing Unit Name" := RespC.Name;

            end;
        }
        field(8; "Implementing Unit Name"; Text[200])
        {
        }
    }
    keys
    {
        key(PK; "Document No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        HRsetup.Get();
        HRsetup.TestField("Organization Hierachy Nos");
        if "Document No" = '' then
            "Document No" := NoSeries.GetNextNo(HRsetup."Organization Hierachy Nos", 0D, true);
        "Document Date" := Today;
        "Done By" := UserId;
    end;

    var
        HRsetup: record "Human Resources Setup";
        NoSeries: Codeunit NoSeriesManagement;
        RespC: Record "Responsibility Center";
}
