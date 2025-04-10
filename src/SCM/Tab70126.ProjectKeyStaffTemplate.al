
table 70126 "Project Key Staff Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            Description = 'Linked to Project Key Staff Template No. Series in the E-Procurement Setup';
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Project Key Staff Temp Nos");
                    NoMgt.TestManual(ProcurementSetup."Project Key Staff Temp Nos");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; Description; Text[60])
        {
        }
        field(3; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Works Category"; Code[50])
        {
            //TableRelation = "Works Category".Code;
        }
        field(5; "Effective Date"; Date)
        {
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; "No. Series"; Code[10])
        {
        }
        field(8; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(9; "Created Date"; Date)
        {
            Editable = false;
        }
        field(10; "Created Time"; Time)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Project Key Staff Temp Nos");
            NoMgt.InitSeries(ProcurementSetup."Project Key Staff Temp Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

