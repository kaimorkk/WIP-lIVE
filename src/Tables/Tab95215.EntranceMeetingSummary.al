
table 95215 "Entrance Meeting Summary"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Engagement ID"; Code[20])
        {
        }
        field(4; "Agenda Code"; Code[20])
        {
        }
        field(5; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Item Discussed"; Text[2048])
        {
        }
        field(7; "Summary Notes"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Agenda Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        AuditMobilizationHeader.Reset;
        AuditMobilizationHeader.SetRange(AuditMobilizationHeader."Document No.", "Document No.");
        if AuditMobilizationHeader.FindSet then begin
            "Engagement ID" := AuditMobilizationHeader."Engagement ID";

        end;
    end;

    var
        AuditMobilizationHeader: Record "Audit Mobilization Header1";
}

