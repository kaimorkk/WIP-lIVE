
table 80119 "Policy Committee Member"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Policy Committee Type"; Option)
        {
            OptionCaption = 'Policy Formulation,Policy Approval';
            OptionMembers = "Policy Formulation","Policy Approval";
        }
        field(4; "Resource No."; Code[10])
        {
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
        }
        field(6; Role; Option)
        {
            OptionCaption = 'Member,Secretary,Chairperson,Consultant,Other';
            OptionMembers = Member,Secretary,Chairperson,Consultant,Other;
        }
        field(7; "Tenure Start Date"; Date)
        {
        }
        field(8; "Tenure End Date"; Date)
        {
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
        Emp: Record Employee;
}

