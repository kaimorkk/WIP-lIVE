
table 69601 "Designation Groups"
{
    DrillDownPageID = "Designation Groups";
    LookupPageID = "Designation Groups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[2000])
        {
        }
        field(3; "No. of Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Designation Group" = field(Code)));
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "Job Grade"; Code[20])
        {
            TableRelation = "Salary Scales".Scale;
        }
        // field(8; "Overall Appointment Authority"; Code[30])
        // {
        //     TableRelation = "Responsibility Center".Code where("Blocked?" = const(false),
        //                                                         "Organization Head Type" = filter(Board | CEO));
        // }
        field(9; "Seniority Level"; Option)
        {
            OptionCaption = ',Operational Level,Mid-Level,Senior-Level,Executive,Supervisory Level';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive,"Supervisory Level";
        }
        field(10; "Default Terms of Service"; Code[30])
        {
            TableRelation = "Terms of Service";
        }
        field(11; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

