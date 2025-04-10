
table 95227 "Audit Management Comment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Engagement ID"; Code[20])
        {
            TableRelation = "Audit Execution Finding"."Engagement ID";
        }
        field(4; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Execution Finding"."Checklist ID";
        }
        field(5; "Finding ID"; Integer)
        {
            AutoIncrement = false;
            TableRelation = "Audit Execution Finding"."Finding ID";
        }
        field(6; "Management Comment ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Action Owner ID"; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Action Owner ID");
                if Resource.FindSet then
                    "Action Owner Name" := Resource.Name;
            end;
        }
        field(9; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if (("Action Status" = "action status"::Planned) or ("Action Status" = "action status"::Ongoing)) then
                    "% Complete" := 0
                else
                    if "Action Status" = "action status"::Completed then
                        "% Complete" := 100;
            end;
        }
        field(10; "% Complete"; Decimal)
        {
            Editable = false;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "% Complete" = 100 then
                    "Actual Date Done" := Today;
            end;
        }
        field(11; "Actual Date Done"; Date)
        {
        }
        field(12; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(13; "Planned Start Date"; Date)
        {
        }
        field(14; "Planned End Date"; Date)
        {
        }
        field(15; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(16; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(17; "Dimension Set ID"; Integer)
        {
        }
        field(18; "Action Owner Name"; Text[2048])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID", "Finding ID", "Management Comment ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

