
table 69411 "HSE Role Member"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Role ID"; Code[20])
        {
        }
        field(2; "Resource No."; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));

            trigger OnValidate()
            begin
                if Resources.Get("Resource No.") then begin
                    Name := Resources.Name;
                    Email := Resources.Email
                end;
            end;
        }
        field(3; Name; Text[240])
        {
        }
        field(4; "Telephone No."; Code[40])
        {
        }
        field(5; Email; Text[250])
        {
        }
        field(6; "Membership Role Type"; Option)
        {
            OptionCaption = ' ,Member,Chairperson,Secretary,Expert,3rd Party,Other';
            OptionMembers = " ",Member,Chairperson,Secretary,Expert,"3rd Party",Other;
        }
        field(7; Blocked; Boolean)
        {
        }
        field(8; "Service Start Date"; Date)
        {
        }
        field(9; "Service End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Role ID", "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
}

