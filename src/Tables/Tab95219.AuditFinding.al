
table 95219 "Audit Finding"
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
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; Implications; Text[2048])
        {
        }
        field(6; "Finding Rating Code"; Code[20])
        {
            TableRelation = "Audit Finding Rating Code".Code where(Blocked = filter(false));
        }
        field(7; Recommendations; Text[2048])
        {
        }
        field(8; "Applicable To All Locations"; Boolean)
        {
        }
        field(9; "Engagement  ID"; Code[20])
        {
            TableRelation = "Audit Project"."Engagement ID" where(Status = filter(<> Completed));
        }
        field(10; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Project Checklist"."Checklist ID";
        }
        field(11; "Management Response"; Text[2048])
        {
        }
        field(12; "Start Date"; Date)
        {
        }
        field(13; "Response Submission Deadline"; Date)
        {
        }
        field(14; "Responsible Person"; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Responsible Person") then begin
                    "Responsible Person Name" := Resource.Name;
                end;
            end;
        }
        field(15; "Verdict/Opinion"; Option)
        {
            OptionCaption = ' ,Agree,Disagree';
            OptionMembers = " ",Agree,Disagree;
        }
        field(16; "Date Requested"; Date)
        {
        }
        field(17; "Responsible Person Name"; Text[100])
        {
        }
        field(18; "Action Plan"; Text[2048])
        {
        }
        field(19; "Action Plan Deadline"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No", "Checklist ID")
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

