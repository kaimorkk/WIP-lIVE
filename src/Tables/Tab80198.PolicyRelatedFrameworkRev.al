
table 80198 "Policy Related Framework Rev"
{

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy;
        }
        field(2; "Framework Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "External Policy Framework".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                /*IF Emp.GET("Resource No.") THEN BEGIN
                    Name:=Emp.FullName;
                    {VALIDATE("Responsibility Center",Emp."Department Code");}
                END;*/

                if External.Get("Framework Code") then begin
                    Description := External.Description;
                end;

            end;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Articles"; Integer)
        {
            CalcFormula = count("Policy Framework Article" where("Policy ID" = field("Policy ID"),
                                                                  "Framework Code" = field("Framework Code"),
                                                                  "Line No" = field("Line No")));
            FieldClass = FlowField;
        }
        field(6; "Revision No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Line No", "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        External: Record "External Policy Framework";
}

