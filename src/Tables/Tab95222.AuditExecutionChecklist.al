
table 95222 "Audit Execution Checklist"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(3; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(4; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Project Checklist"."Checklist ID" where("Fieldwork Review Status" = filter(<> Completed));

            trigger OnValidate()
            begin
                AuditProjectChecklist.Reset;
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Engagement ID", "Engagement ID");
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Checklist ID", "Checklist ID");
                if AuditProjectChecklist.FindSet then begin
                    Description := AuditProjectChecklist.Description;
                    "Audit Procedure ID" := AuditProjectChecklist."Audit Procedure ID";
                    "Audit Objective ID" := AuditProjectChecklist."Audit Objective ID";
                    "Fieldwork Review Status" := "fieldwork review status"::Completed;
                    Validate("Fieldwork Review Status");
                    "Completion %" := 100;
                end;
            end;
        }
        field(5; Description; Text[2048])
        {
        }
        field(6; "Fieldwork Review Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if (("Fieldwork Review Status" = "fieldwork review status"::Ongoing) or ("Fieldwork Review Status" = "fieldwork review status"::Planned)) then
                    "Completion %" := 0
                else
                    if "Fieldwork Review Status" = "fieldwork review status"::Completed then
                        "Completion %" := 100;
            end;
        }
        field(7; "Completion %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Completion %" = 100 then
                    "Fieldwork Review Status" := "fieldwork review status"::Completed
            end;
        }
        field(8; "No. of Audit Findings"; Integer)
        {
            CalcFormula = count("Audit Execution Finding" where("Document Type" = field("Document Type"),
                                                                 "Document No." = field("Document No."),
                                                                 "Engagement ID" = field("Engagement ID"),
                                                                 "Checklist ID" = field("Checklist ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No. of Audit Recommendations"; Integer)
        {
            CalcFormula = count("Audit Finding Recommendation" where("Document Type" = field("Document Type"),
                                                                      "Document No." = field("Document No."),
                                                                      "Engagement ID" = field("Engagement ID"),
                                                                      "Checklist ID" = field("Checklist ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "No. Of Filed Audit Work Papers"; Integer)
        {
            CalcFormula = count("Filed Audit Working Paper" where("Engagement ID" = field("Engagement ID"),
                                                                   "Audit Checklist ID" = field("Checklist ID")));
            Description = 'No. of Filed Audit Working Papers';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Audit Procedure ID"; Integer)
        {
        }
        field(12; "Audit Objective ID"; Integer)
        {
        }
        field(13; "Dimension Set ID"; Integer)
        {
        }
        field(14; "No."; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectChecklist: Record "Audit Project Checklist";
}

