
table 51275 "ICT Equipment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
        }
        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Academic ICT Type"; Code[30])
        {
            TableRelation = "ICT Equipment Types" where(Category = field(Category));

            trigger OnValidate()
            begin
                ICTEquipmentTypes.Reset;
                ICTEquipmentTypes.SetRange(Code, "Academic ICT Type");
                if ICTEquipmentTypes.FindFirst then begin
                    "Academic Type Name" := ICTEquipmentTypes.Description;
                end
            end;
        }
        field(4; "Academic Type Name"; Text[100])
        {
        }
        field(5; Number; Integer)
        {
        }
        field(6; "Type Available"; Text[150])
        {
        }
        field(7; Category; Option)
        {
            OptionCaption = 'Item/Accessory,Connected to the LAN,Academic software';
            OptionMembers = "Item/Accessory","Connected to the LAN","Academic software";
        }
    }

    keys
    {
        key(Key1; "Application No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTEquipmentTypes: Record "ICT Equipment Types";
}

