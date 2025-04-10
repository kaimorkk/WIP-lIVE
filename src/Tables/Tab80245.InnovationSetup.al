
table 80245 "Innovation Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "Idea Invitation Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(4; "Idea Capture Form Nos."; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(5; "Inno Committee Voucher Nos."; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(6; "Inno Evaluation Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(7; "Inno Reward Nos."; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(8; "Default Inno Email"; Code[30])
        {
        }
        field(9; "No. of Innov Invitations"; Integer)
        {
        }
        field(10; "No. of Innov Ideas"; Integer)
        {
        }
        field(11; "No. of Innov Comm Appointments"; Integer)
        {
        }
        field(12; "No. of Innov Evaluations"; Integer)
        {
        }
        field(13; "No. of Innovation Rewards"; Integer)
        {
        }
        field(14; "No. of Innovation Projects"; Integer)
        {
        }
        field(15; "Inno Template Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(16; "Inno Eval Committe  Nos."; Code[30])
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

