Table 52193873 "Savings Withdrawal1"
{

    fields
    {
        field(1;"No.";Code[10])
        {

            trigger OnValidate()
            begin

                if "No." <> xRec."No." then begin
                  HumResSetup.Get;
                  NoSeriesMgt.TestManual(HumResSetup."Savings Withdrawal No");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Employee No.";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Emp.Get("Employee No.") then
                    "Employee Name":=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";
            end;
        }
        field(3;"Employee Name";Text[90])
        {
        }
        field(4;"Code";Code[10])
        {
            TableRelation = DeductionsX1;

            trigger OnValidate()
            begin
                  if Deduction.Get(Code) then
                  Decription:=Deduction.Description;
            end;
        }
        field(5;"Payroll Period";Date)
        {
            TableRelation = "Payroll PeriodX1";

            trigger OnValidate()
            begin
                 if PayrollPeriod.Get("Payroll Period") then
                    "Pay Period":=PayrollPeriod.Name;
            end;
        }
        field(6;Amount;Decimal)
        {
        }
        field(7;Decription;Text[100])
        {
        }
        field(8;"Pay Period";Text[30])
        {
        }
        field(9;"No. Series";Code[20])
        {
        }
        field(10;Posted;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
          HumResSetup.Get;
            HumResSetup.TestField("Savings Withdrawal No");
         NoSeriesMgt.InitSeries(HumResSetup."Savings Withdrawal No",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;

    var
        HumResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        Deduction: Record DeductionsX1;
        PayrollPeriod: Record "Payroll PeriodX1";
}

