table 50042 "Induction Lines"
{
    Caption = 'Induction Lines';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Induction No."; Code[20])
        {
            Caption = 'Induction No.';
        }
        field(2; "Employee No."; Code[20])
        {
            TableRelation = Employee."No." /*where(Inducted = filter(false))*/;
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then begin
                    "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    County := Employee.County;
                    Designation := Employee."Job Title2";
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; "Employment Date"; Date)
        {
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(16; "Cost Center Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code"), "Global Dimension No." = const(1)));
        }
        field(17; County; Text[30])
        {
        }
        field(18; Designation; Text[250])
        {
        }
    }
    keys
    {
        key(PK; "Induction No.", "Employee No.")
        {
            Clustered = true;
        }
    }
    var
        Employee: Record Employee;
}
