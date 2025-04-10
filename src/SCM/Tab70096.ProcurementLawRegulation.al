
table 70096 "Procurement Law & Regulation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ',Laws, Regulations,Policy,Procdere & Guidelines';
            OptionMembers = ,Laws," Regulations",Policy,"Procdere & Guidelines";
        }
        field(3; Description; Text[30])
        {
        }
        field(4; "No. of Versions"; Integer)
        {
        }
        field(5; "Current Version No"; Code[10])
        {
            TableRelation = "Proc Regulation Version"."Version Code";
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Draft,Active,Blocked';
            OptionMembers = Draft,Active,Blocked;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

