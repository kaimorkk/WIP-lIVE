
table 95126 "New Risk Line Ownership"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Responsibility Center ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Responsibility Center ID");
                if ResponsibilityCenter.FindSet then begin
                    Desciption := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(5; Desciption; Text[250])
        {
            Editable = false;
        }
        field(6; "Responsible Officer No."; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Responsible Officer No.");
                if Resource.FindSet then
                    "Responsible Officer Name" := Resource.Name;
            end;
        }
        field(7; "Responsible Officer Name"; Text[250])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Responsibility Center ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
        Resource: Record Resource;
}

