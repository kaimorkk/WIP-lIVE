
table 69113 "Applicant Background"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No"; Code[30])
        {
            TableRelation = "Job Application Table";
        }
        field(2; "From Date"; Date)
        {
        }
        field(3; "To Date"; Date)
        {
        }
        field(4; Institution; Text[30])
        {
        }
        field(5; Attainment; Text[30])
        {
            TableRelation = "Attainment Table Setup".Attainment;
        }
        field(6; Specialization; Text[30])
        {
        }
        field(7; Grade; Text[50])
        {
        }
        field(8; "Date of renewal"; Date)
        {
        }
        field(9; Type; Option)
        {
            OptionMembers = Education,"Professional Body",Training,"Professional Qualification",Accomplishment,Employment;
        }
        field(10; Description; Text[250])
        {
        }
        field(11; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(12; Amount; Decimal)
        {
        }
        field(13; Level; Text[30])
        {
            CalcFormula = lookup("Attainment Table Setup".Level where(Attainment = field(Attainment)));
            FieldClass = FlowField;
        }
        field(14; "Gross Salary"; Decimal)
        {
        }
        field(15; "Terms of Employment"; Option)
        {
            OptionMembers = "Full-time","Part-time",Internship,Casual,"Temporary";
        }
        field(16; Email; Text[100])
        {
        }
        field(17; "Course Name"; Text[100])
        {
        }
        field(18; "Membership Type"; Text[100])
        {
        }
        field(19; "Membership No"; Text[100])
        {
        }
        field(20; "Job Title"; Text[300])
        {
        }


    }

    keys
    {
        key(Key1; "Application No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

