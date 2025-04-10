
table 70152 "IFS Staff Min Qualification"
{
    Caption = 'IFS Staff Min Qualification';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Project Role Code"; Code[50])
        {
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Qualification Category"; Option)
        {
            OptionCaption = ',PhD,Masters,Post-Graduate Diploma,Undergraduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PhD,Masters,"Post-Graduate Diploma",Undergraduate,"HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(7; "Minimum Qualification Req"; Text[100])
        {
            Caption = 'Minimum Qualification Requirements';
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Project Role Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

