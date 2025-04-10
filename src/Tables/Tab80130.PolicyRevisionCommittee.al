
table 80130 "Policy Revision Committee"
{

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Policy Committee Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Policy Formulation,Policy Approval';
            OptionMembers = "Policy Formulation","Policy Approval";
        }
        field(4; "Resource No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Resource No.") then begin
                    Name := Emp.FullName;
                    /*VALIDATE("Responsibility Center",Emp."Department Code");*/
                end;

            end;
        }
        field(5; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Secretary,Chairperson,Consultant,Other';
            OptionMembers = Member,Secretary,Chairperson,Consultant,Other;
        }
        field(7; "Tenure Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Tenure End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Revision No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Revision No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
}

