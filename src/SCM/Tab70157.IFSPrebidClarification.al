
table 70157 "IFS Prebid Clarification"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Prebid Register ID"; Code[30])
        {
            TableRelation = "IFS Prebid Register".Code;
        }
        field(2; "IFS Code"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(3; "Agenda Code"; Text[50])
        {
        }
        field(4; "Agenda Description"; Text[250])
        {
        }
        field(5; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Prebid Register ID", "IFS Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record "Standard Vendor Purchase Code";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

