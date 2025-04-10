
table 95214 "Entrance Meeting Agenda"
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
            // TableRelation = "Audit Execution Header"."Engagement ID";
            TableRelation = "Audit Project"."Engagement ID" where(Status = filter(<> Completed));

            trigger OnValidate()
            begin
                // AuditMobilizationHeader.Reset;
                // AuditMobilizationHeader.SetRange("Engagement ID", "Engagement ID");
                // if AuditMobilizationHeader.FindSet then
                //     "Engagement ID" := AuditMobilizationHeader."Engagement ID";
            end;
        }
        field(4; "Agenda Code"; Code[20])
        {
        }
        field(5; "Agenda Description"; Text[2048])
        {
        }
        field(6; "Estimate Time (Minutes)"; Integer)
        {
        }
        field(7; "No. of Discussed Items"; Integer)
        {
            CalcFormula = count("Entrance Meeting Summary" where("Document Type" = field("Document Type"),
                                                                  "Document No." = field("Document No."),
                                                                  "Engagement ID" = field("Engagement ID"),
                                                                  "Agenda Code" = field("Agenda Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // AuditExecutionHeader.Reset;
        // AuditExecutionHeader.SetRange(AuditExecutionHeader."Document No.", "Document No.");
        // if AuditExecutionHeader.FindFirst() then begin
        //     "Engagement ID" := AuditExecutionHeader."Engagement ID";
        // end;
        AuditMobilizationHeader.Reset;
        AuditMobilizationHeader.SetRange("Document No.", Rec."Document No.");
        if AuditMobilizationHeader.FindFirst() then
            "Engagement ID" := AuditMobilizationHeader."Engagement ID";
    end;

    var
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditMobilizationHeader: Record "Audit Mobilization Header1";
}

