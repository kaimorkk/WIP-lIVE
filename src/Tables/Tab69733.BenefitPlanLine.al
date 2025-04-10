
table 69733 "Benefit Plan Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Package ID"; Code[30])
        {
        }
        field(2; "Plan ID"; Code[30])
        {
            TableRelation = "Benefit Plan Grade"."Plan ID";
        }
        field(3; Description; Text[300])
        {
        }
        field(4; "No. of Job Grades"; Integer)
        {
            CalcFormula = count("Benefit Plan Grade" where("Plan ID" = field("Plan ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
    }

    keys
    {
        key(Key1; "Package ID", "Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

