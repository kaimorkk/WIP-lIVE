
table 70136 "Procurement Standing Committee"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Description = 'Linked to E-Procurement No. Series (Procurement Standing Committee No. Series field)';

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    ProcurementSetup.TestField("Standing Proc Committee  No.");
                    NoMgt.TestManual(ProcurementSetup."Standing Proc Committee  No.");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Committee Type"; Code[20])
        {
            TableRelation = "Procurement Committee Types"."Committee Type";
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Appointment Date"; Date)
        {
        }
        field(5; "Appointing Authority"; Code[50])
        {
        }
        field(6; "Tenure Start Date"; Date)
        {
        }
        field(7; "Tenure End Date"; Date)
        {
        }
        field(8; "Primary Region"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
        }
        field(12; "No. Series"; Code[10])
        {
        }
        field(13; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Standing Proc Committee  No.");
            NoMgt.InitSeries(ProcurementSetup."Standing Proc Committee  No.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

