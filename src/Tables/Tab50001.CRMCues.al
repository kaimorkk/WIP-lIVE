table 50121 "CRM Cues"
{
    Caption = 'CRM Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }

        field(2; Complaints; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = Count("Cases Management" where("Interaction Type" = const(Complaint)));
        }
        field(3; Enquiry; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = Count("Cases Management" where("Interaction Type" = const(Enquiry)));
        }
        field(4; Compliments; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = Count("Cases Management" where("Interaction Type" = const(Compliment)));
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
