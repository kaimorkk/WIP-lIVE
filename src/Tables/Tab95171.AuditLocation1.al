
table 95171 "Audit Location1"
{
    DrillDownPageID = "Audit Locations";
    LookupPageID = "Audit Locations";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Responsibility Center ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = const(false));
        }
        field(4; "Audit Site Type"; Option)
        {
            OptionCaption = ' ,Within Organization,External to Organization';
            OptionMembers = " ","Within Organization","External to Organization";
        }
        field(5; "Contact Person"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Contact Person");
                if Employee.FindSet then begin
                    "Contact Person" := Employee."No.";
                    "Primary Email" := Employee."E-Mail";
                    "Telephone No." := Employee."Phone No.";
                end;
            end;
        }
        field(6; "Primary Email"; Text[100])
        {
            Editable = false;
            TableRelation = Employee;
        }
        field(7; "Telephone No."; Code[20])
        {
            Editable = false;
            TableRelation = Employee;
        }
        field(8; "No. of Audit Projects"; Integer)
        {
            CalcFormula = count("Audit ProjectLocation");
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Blocked; Boolean)
        {
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

    var
        Employee: Record Employee;
}

