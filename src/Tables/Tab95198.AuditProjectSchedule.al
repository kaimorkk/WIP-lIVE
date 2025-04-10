
table 95198 "Audit Project Schedule"
{
    DrillDownPageID = "Audit Project Schedules";
    LookupPageID = "Audit Project Schedules";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
        }
        field(2; "Audit Phase"; Option)
        {
            OptionCaption = ' ,Planning,Fieldwork,Reporting & Exit,Followup';
            OptionMembers = " ",Planning,Fieldwork,"Reporting & Exit",Followup;
        }
        field(3; "Task No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; "Audit Duration (Days)"; Integer)
        {
        }
        field(8; Status; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(9; "Completion %"; Decimal)
        {
        }
        field(10; "Lead Auditor ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where(Blocked = filter(false),
                                                                       "Engagement ID" = field("Engagement ID"),
                                                                       "Audit Team Type" = filter("Auditor Team"));
        }
        field(11; "Lead Auditee Representative ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where(Blocked = filter(false),
                                                                       "Engagement ID" = field("Engagement ID"),
                                                                       "Audit Team Type" = filter("Auditee Team"));
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Audit Phase", "Task No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProject: Record "Audit Project";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditSurveyHeader: Record "Audit Survey Header";
        AuditFollowupHeader: Record "Audit Followup Header";
}

