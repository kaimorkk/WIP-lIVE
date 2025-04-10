
table 80058 "PC Risk"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document No"; Code[100])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(3; "Risk Source Class"; Code[100])
        {
            TableRelation = "Risk Source Class";
        }
        field(4; "Risk Category"; Code[100])
        {
            TableRelation = "Risk Categories";
        }
        field(5; "Risk Description"; Code[100])
        {
        }
        field(6; "Inherent Likelihood Level"; Code[30])
        {
        }
        field(7; "Inherent Impact Level"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

