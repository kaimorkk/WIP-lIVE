
Table 69242 "HR Insurance Scheme Members"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Scheme No"; Code[10])
        {
            TableRelation = "Medical Scheme Coverage"."Scheme No";

            trigger OnValidate()
            begin

                Medscheme.Reset;
                Medscheme.SetRange(Medscheme."Scheme No", "Scheme No");
                if Medscheme.Find('-') then begin
                    "Out-Patient Limit" := Medscheme."Out-patient limit";
                    "In-patient Limit" := Medscheme."In-patient limit";
                    "Balance In- Patient" := "In-patient Limit" - "Cumm.Amount Spent";
                    "Balance Out- Patient" := "Out-Patient Limit" - "Cumm.Amount Spent Out";
                    "Bed Limit" := Medscheme."Bed Limit";
                    "Maternity Limit" := Medscheme."Maternity Limit";
                    "Dental Limit" := Medscheme."Dental Limit";
                    "Optical Limit" := Medscheme."Optical Limit";
                    "Last Expense Limit" := Medscheme."Last Expense Limit";
                    "Psychiatric Condition Limit" := Medscheme."Psychiatric Condition Limit";
                    "Chronic Illness Limit" := Medscheme."Chronic Illness Limit";
                    "First Caeserian Section" := Medscheme."First Caeserian Section";
                    "Post hospitalization" := Medscheme."Post hospitalization";
                    "External Aids" := Medscheme."External Aids";
                end;
            end;
        }
        field(2; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", "Employee No");
                if Emp.Find('-') then begin
                    "First Name" := Emp."First Name" + ' ' + Emp."Middle Name";
                    "Last Name" := Emp."Last Name";
                    Designation := Emp."Job Title";
                    //Department:=Emp."Department Code";
                    // "Scheme Join Date" := Emp."Medical Scheme Join Date";

                    //"In-patient Limit":=Medscheme."In-patient limit";
                end;
            end;
        }
        field(3; "First Name"; Text[30])
        {
        }
        field(4; "Last Name"; Text[30])
        {
        }
        field(5; Designation; Text[500])
        {
        }
        field(6; Department; Text[100])
        {
        }
        field(7; "Scheme Join Date"; Date)
        {
        }
        field(8; "Scheme Anniversary"; Date)
        {
        }
        field(9; "Cumm.Amount Spent"; Decimal)
        {
            CalcFormula = sum("HR Medical Claims"."Amount Charged" where("Member No" = field("Employee No"),
                                                                          "Claim Type" = const(Inpatient)));
            FieldClass = FlowField;
        }
        field(10; "Out-Patient Limit"; Decimal)
        {
        }
        field(11; "In-patient Limit"; Decimal)
        {
        }
        field(12; "Maximum Cover"; Decimal)
        {
        }
        field(13; "Cumm.Amount Spent Out"; Decimal)
        {
            CalcFormula = sum("HR Medical Claims"."Amount Charged" where("Member No" = field("Employee No"),
                                                                          "Claim Type" = const(Outpatient)));
            FieldClass = FlowField;
        }
        field(14; "Balance Out- Patient"; Decimal)
        {
        }
        field(15; "Balance In- Patient"; Decimal)
        {
        }
        field(16; "No Of Dependants"; Code[10])
        {
        }
        field(17; "Job Grade"; Code[30])
        {
            TableRelation = "Salary Scales".Scale;

            trigger OnValidate()
            begin
                SalaryScales.Reset;
                SalaryScales.SetRange("Job Grade", "Job Grade");
                if SalaryScales.FindSet then
                    "In-patient Limit" := SalaryScales."In Patient Limit";
                "Out-Patient Limit" := SalaryScales."Out Patient Limit";
                "Maximum Cover" := SalaryScales."Maximum Cover";
                "Bed Limit" := SalaryScales."Bed Limit";
                "Out-Patient Limit" := SalaryScales."Out Patient Limit";
                "In-patient Limit" := SalaryScales."In Patient limit";
                "Balance In- Patient" := "In-patient Limit" - "Cumm.Amount Spent";
                "Balance Out- Patient" := "Out-Patient Limit" - "Cumm.Amount Spent Out";
                "Bed Limit" := SalaryScales."Bed Limit";
                "Maternity Limit" := SalaryScales."Maternity Limit";
                "Dental Limit" := SalaryScales."Dental Limit";
                "Optical Limit" := SalaryScales."Optical Limit";
                "Last Expense Limit" := SalaryScales."Last Expense Limit";
                "Psychiatric Condition Limit" := SalaryScales."Psychiatric Condition Limit";
                "Chronic Illness Limit" := SalaryScales."Chronic Illness Limit";
                "First Caeserian Section" := SalaryScales."First Caeserian Section";
                "Post hospitalization" := SalaryScales."Post hospitalization";
                "External Aids" := SalaryScales."External Aids";
            end;
        }
        field(18; "Bed Limit"; Decimal)
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
        field(69613; "Congenital Condition Limit"; Decimal)
        {
        }
        field(69614; "Last Expense Limit"; Decimal)
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
    }

    keys
    {
        key(Key1; "Scheme No", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Medscheme: Record "Medical Scheme Coverage";
        Emp: Record Employee;
        SalaryScales: Record "Medical Scheme Entitlements";
}

