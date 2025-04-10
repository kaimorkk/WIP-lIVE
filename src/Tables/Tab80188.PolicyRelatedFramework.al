
table 80188 "Policy Related Framework"
{

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
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

                if Framework1.Get("Framework Code") then begin
                    Description := Framework1.Description;
                end;

            end;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Articles"; Integer)
        {
            CalcFormula = count("Policy Framework Article" where("Policy ID" = field("Policy ID"),
                                                                  "Framework Code" = field("Framework Code"),
                                                                  "Line No" = field("Line No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Framework1: Record "External Policy Framework";
}

