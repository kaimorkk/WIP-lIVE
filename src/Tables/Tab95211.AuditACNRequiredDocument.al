
table 95211 "Audit ACN Required Document"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Plan"."Audit Plan ID";
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Audit Procedure ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Preferred Format"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Any Format,Soft Copy,Hard Copy';
            OptionMembers = " ","Any Format","Soft Copy","Hard Copy";
        }
        field(8; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(9; "Date Requested"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Submission Deadline"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Audit Lead ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(12; "Auditee Lead ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

