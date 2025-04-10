
table 95221 "Audit Project Final Finding"
{

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Audit Finding ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Final Audit Report ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Checklist"."Document No." where("Document Type" = filter("Final Audit Report"));
        }
        field(4; "Checklist ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Checklist"."Checklist ID";
        }
        field(5; "Finding ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Finding ID";

            trigger OnValidate()
            begin
                AuditExecutionFinding.Reset;
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Engagement ID", "Engagement ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Finding ID", "Finding ID");
                if AuditExecutionFinding.FindSet then begin


                end;
            end;
        }
        field(6; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Compliance Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Compliant,Partially Compliant,Substantially Compliant,Fully Compliant,Not Applicable';
            OptionMembers = " ","Non-Compliant","Partially Compliant","Substantially Compliant","Fully Compliant","Not Applicable";
        }
        field(8; "Risk Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Finding Rating Code".Code where(Blocked = filter(false));
        }
        field(9; Implication; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Affects All Audit Locations"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Mgt Commenet Received Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Management Comment Received Date';
        }
        field(13; "Auditee Response Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agrees with Finding,Disagrees with Findings,Unresponsive';
            OptionMembers = " ","Agrees with Finding","Disagrees with Findings",Unresponsive;
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Audit Finding ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        AuditExecutionFinding: Record "Audit Execution Finding";
}

