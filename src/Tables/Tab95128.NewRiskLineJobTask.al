
table 95128 "New Risk Line Job Task"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(4; "Job No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5; "Job Task No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));
        }
        field(6; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Job No", "Job Task No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

