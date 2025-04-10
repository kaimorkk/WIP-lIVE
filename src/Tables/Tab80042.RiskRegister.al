
table 80042 "Risk Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Document No"; Code[50])
        {
        }
        field(3; "Risk Source Class"; Code[50])
        {
            TableRelation = "Risk Source Class".Code;
        }
        field(4; "Risk Category"; Code[50])
        {
            TableRelation = "Risk Categories".Code;
        }
        field(5; "Risk Description"; Text[50])
        {
        }
        field(6; "Inherent Likelihood Level"; Text[30])
        {
            TableRelation = "Risk Likelihood Level"."Likelihood Level";
        }
        field(7; "Inherent Impact Level"; Text[30])
        {
            TableRelation = "Risk Impact Level"."Impact Level Code";
        }
        field(8; "Residual Risk Level"; Text[30])
        {
        }
        field(9; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(10; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

