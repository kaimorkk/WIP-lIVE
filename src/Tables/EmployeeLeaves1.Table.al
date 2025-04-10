Table 52193905 "Employee Leaves1"
{
    LookupPageID = "Employee Leave Look Up";

    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";
        }
        field(2;"Leave Code";Code[20])
        {
            NotBlank = true;
            TableRelation = "Leave Types1".Code;

            trigger OnValidate()
            begin
                Period.Reset;
                Period.SetRange(Period."New Fiscal Year",true);
                Period.SetRange(Period.Closed,false);
                if Period.Find('-') then
                   StartDate:=CalcDate('1Y',Period."Starting Date")-1 ;

                "Leave Types".Reset;
                "Leave Types".SetRange("Leave Types".Code,"Leave Code");
                if "Leave Types".Find('-') then begin
                if "Leave Types".Gender <> "Leave Types".Gender::Both then begin
                EmployeeRec.Reset;
                EmployeeRec.SetRange(EmployeeRec."No.","Employee No");
                if "Leave Types".Gender = "Leave Types".Gender::Female then begin
                if EmployeeRec.Gender <> EmployeeRec.Gender::Female then begin
                "Leave Code":='';
                Balance:=0;
                Error('%1','You cannot assign this employee this leave.');
                end;
                end
                else
                Balance:="Leave Types".Days;
                end
                else
                Balance:="Leave Types".Days;
                end;

                Balance:="Leave Types".Days;

                Balance:=Entitlement+"Balance Brought Forward"+"Recalled Days"-"Total Days Taken";

                if EmployeeRec.Get("Employee No") then begin
                   Entitlement:=(StartDate-EmployeeRec."Date Of Join")/30*2.5;
                end;
            end;
        }
        field(3;"Maturity Date";Date)
        {
        }
        field(4;Balance;Decimal)
        {
        }
        field(5;"Acrued Days";Decimal)
        {
        }
        field(6;"Total Days Taken";Decimal)
        {
            CalcFormula = sum("Employee Leave Application1"."Days Applied" where ("Employee No"=field("Employee No"),
                                                                                  "Leave Code"=field("Leave Code"),
                                                                                  "Maturity Date"=field("Maturity Date"),
                                                                                  Status=const(Released)));
            FieldClass = FlowField;
        }
        field(7;Entitlement;Decimal)
        {
        }
        field(8;"Balance Brought Forward";Decimal)
        {
        }
        field(9;"Recalled Days";Decimal)
        {
            CalcFormula = sum("Employee Off/Holidays1"."No. of Off Days" where ("Employee No"=field("Employee No"),
                                                                                "Maturity Date"=field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(10;"Days Absent";Decimal)
        {
            CalcFormula = sum("Employee Absentism1"."No. of  Days Absent" where ("Employee No"=field("Employee No"),
                                                                                 "Maturity Date"=field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(11;"Leaves Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(12;"Temp. Emp. Contract";Integer)
        {
        }
        field(13;"Contract No.";Integer)
        {
        }
        field(14;"Leave  Allowance Paid";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Leave Code","Maturity Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        "Leave Types": Record "Leave Types1";
        EmployeeRec: Record Employee;
        Period: Record "Accounting Period";
        StartDate: Date;
}

