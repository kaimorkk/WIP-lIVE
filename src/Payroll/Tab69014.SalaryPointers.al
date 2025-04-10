
table 52194108 "Salary Pointers"
{
    DrillDownPageID = "Salary pointers";
    LookupPageID = "Salary pointers";
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Salary Pointer"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Basic Pay int"; Integer)
        {
        }
        field(3; "Basic Pay"; Decimal)
        {
        }
        field(4; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(5; Description; Text[100])
        {
        }
        field(69600; Description1; Text[50])
        {
        }
        field(69601; "Min Salary"; Decimal)
        {
        }
        field(69602; "Max Salary"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Min Salary" > "Max Salary" then
                    Error('The minimum salary cannot be greater than the maximum salary')
            end;
        }
        field(69603; "Gross Pay"; Decimal)
        {
        }
        field(69604; "Employee Category"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Salary Scales"."Employee Category" where("Scale" = field("Salary Scale")));
            TableRelation = "Employee Posting GroupX";
        }
        field(69605; "Arrangement"; Integer)
        {
        }

    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

