
table 69173 "Training Needs Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Source; Option)
        {
            OptionCaption = 'Appraisal,Mainstreaming Activities,OSH,Government Directive,Other';
            OptionMembers = Appraisal,"Mainstreaming Activities",OSH,"Government Directive",Other;
        }
        field(4; Comments; Text[200])
        {
        }
        field(5; "No. of Linked Objectives"; Integer)
        {
            CalcFormula = count("Training Lines Objectives" where(Code = field(Code),
                                                                   Type = const(Need)));
            FieldClass = FlowField;
        }
        field(6; "Training Header No."; Code[30])
        {
            TableRelation = "Training Courses Needs";
        }
        field(7; "No. Series"; Code[30])
        {
        }
        field(8; "Created By"; Code[30])
        {
        }
        field(9; "Created On"; DateTime)
        {
        }
        field(10; "Employee No"; Code[30])
        {
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Employees.Reset;
                Employees.SetRange("No.", "Employee No");
                if Employees.FindSet then begin
                    "Employee Name" := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name";
                end;
            end;
        }
        field(11; "Employee Name"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Training Header No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employees: Record Employee;
}

