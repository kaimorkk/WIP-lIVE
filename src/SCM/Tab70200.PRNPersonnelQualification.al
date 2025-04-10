
table 70200 "PRN Personnel Qualification"
{
    Caption = 'IFS Staff Min Qualification';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[50])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Staff Role Code"; Code[50])
        {
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Qualification Category"; Option)
        {
            OptionCaption = ',PhD,Masters,Post-Graduate Diploma,Undergraduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PhD,Masters,"Post-Graduate Diploma",Undergraduate,"HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(6; "Minimum Qualification Req"; Text[100])
        {
            Caption = 'Minimum Qualification Requirements';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Staff Role Code", "Entry No")
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

