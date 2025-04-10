table 69457 "Position Exit Templates"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Postion ID"; Code[30])
        {
            TableRelation = "Company Positions"."Position ID";
        }
        field(2; "Code"; Integer)
        {
        }
        field(7; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Directorate");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(8; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Department");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Department Name" := ResponsibilityCenter.Name;
                    "Responsible Employee" := ResponsibilityCenter."Current Head";
                end;
            end;
        }
        field(26; "Primary Directorate Name"; Text[250])
        {
        }
        field(27; "Primary Department Name"; Text[250])
        {
        }
        field(28; "Responsible Employee"; Code[30])
        {
            TableRelation = Employee."No.";
        }
    }

    keys
    {
        key(Key1; "Postion ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

