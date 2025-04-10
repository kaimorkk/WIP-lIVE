
table 69256 "Medical Scheme Coverage"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Scheme No"; Code[20])
        {
        }
        field(2; "Code"; Code[20])
        {
        }
        field(3; Description; Text[2000])
        {
        }
        field(4; "In-Patient Limit"; Decimal)
        {
        }
        field(5; "Out-Patient Limit"; Decimal)
        {
        }
        field(6; Remarks; Text[2000])
        {
        }
        field(11; Scale; Code[20])
        {
            TableRelation = "Salary Scales";
        }
        field(12; "Minimum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
        }
        field(13; "Maximum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
        }
        field(14; "Responsibility Allowance"; Decimal)
        {
        }
        field(15; "Commuter Allowance"; Decimal)
        {
        }

        field(69607; "Bed Limit"; Decimal)
        {
        }
        field(69608; "Maternity Limit"; Decimal)
        {
        }
        field(69609; "Dental Limit"; Decimal)
        {
        }
        field(69610; "Optical Limit"; Decimal)
        {
        }
        field(69611; "Congenital Condition Limit"; Decimal)
        {
        }
        field(69612; "Last Expense Limit"; Decimal)
        {
        }
        field(69632; "Psychiatric Condition Limit"; Decimal)
        {
        }
        field(69633; "Chronic Illness Limit"; Decimal)
        {
        }
        field(69634; "First Caeserian Section"; Decimal)
        {
        }
        field(69635; "Post hospitalization"; Decimal)
        {
        }
        field(69636; "External Aids"; Decimal)
        {
        }
        field(69637; "Health Checkups"; Decimal)
        {
        }
        field(69638; "Document Type"; Option)
        {
            OptionMembers = "Medical Coverage",Airtime;
        }
        field(69639; "Airtime"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Scheme No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

