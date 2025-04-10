
table 95163 "Audit & Assurance Setup"
{
    DrillDownPageID = "Audit & Assurance Setup";
    LookupPageID = "Audit & Assurance Setup";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Default CAE ID"; Code[20])
        {
            Description = 'Default Chief Audit Executive (CAE) ID';
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(4; "Def. Internal Audit Charter ID"; Text[20])
        {
            Description = 'Def. Internal Audit Charter ID';
            TableRelation = "Internal Audit Charter".Code;
        }
        field(5; "No. of Audit Plans"; Integer)
        {
            CalcFormula = count("Audit Plan" where("Audit Plan Type" = filter("Internal Audit Plan")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No. of Project Quality Plans"; Integer)
        {
            CalcFormula = count("Audit Plan" where("Audit Plan Type" = filter("Project Audit Plan")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "No. of Audit Engagements"; Integer)
        {
            Editable = false;
        }
        field(8; "No. of Project Quality Inspect"; Integer)
        {
            Description = 'No. of Audit Comm Notices';
            Editable = false;
            FieldClass = Normal;
        }
        field(9; "No. of Audit Commencem Notices"; Integer)
        {
            CalcFormula = count("Audit Mobilization Header1" where("Document Type" = filter("Audit Commencement Notice")));
            Description = 'No. of Audit Comm Notices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "No. of Auditee Notice Resps"; Integer)
        {
            CalcFormula = count("Audit Mobilization Header1" where("Document Type" = filter("Auditee Notice Response")));
            Description = 'No. of Auditee Not Resps';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Audit Entrace Meetings"; Integer)
        {
            CalcFormula = count("Audit Mobilization Header1" where("Document Type" = filter("Audit Entrace Meeting")));
            Description = 'No. of Audit Entrace Meetings';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. of Pre-Audit Suvy Invitati"; Integer)
        {
            CalcFormula = count("Audit Mobilization Header1" where("Document Type" = filter("Pre-Audit Survey Invitations")));
            Description = 'No. of Pre-Audit Suvy Invitans';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "No. of Pre-Audit Suvy Response"; Integer)
        {
            CalcFormula = count("Audit Mobilization Header1" where("Document Type" = filter("Pre-Audit Survey Responses")));
            Description = 'No. of Pre-Audit Survey Responses';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Audit Plan Nos."; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(15; "Project Supervision Plan Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Audit Commencement Notice Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Auditee Notice Response Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(18; "Audit Entrace Meeting Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(19; "PreAudit Survey InvitationNos."; Code[20])
        {
            Description = 'Pre-Audit Survey Invit Nos.';
            TableRelation = "No. Series";
        }
        field(20; "PreAudit Survey Response Nos."; Code[20])
        {
            Description = 'Pre-Audit Survey Resp. Nos.';
            TableRelation = "No. Series";
        }
        field(21; "Audit Project Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(22; "Fieldwork Voucher Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "Audit Exit Conference Nos"; Code[20])
        {
            Description = 'Audit Exit Conference,Draft Audit Report,Final Audit Report';
            TableRelation = "No. Series";
        }
        field(24; "Draft AUidt Report Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(25; "Final Audit Report Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(26; "Audit Implementation Log Nos"; Code[20])
        {
            Description = ' ,Audit Implementation Log,Follow-up Audit Voucher';
            TableRelation = "No. Series";
        }
        field(27; "Follow-up Audit Voucher  Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(28; "PostAudit Survey Invitation No"; Code[20])
        {
            Description = ' ,Pre-Audit Survey Invitation,Pre-Audit Survey Response,Post-Audit Survey Invitation,Post-Audit Survey Response';
            TableRelation = "No. Series";
        }
        field(29; "PostAudit Survey Response Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(30; "Working Paper Nos"; Code[20])
        {
        }
        field(31; "e_Notify Audit Mobilization"; Boolean)
        {
        }
        field(32; "Committees No."; Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

