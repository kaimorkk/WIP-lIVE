Table 52193907 "Holidays_Off Days1"
{
    LookupPageID = Holidays;

    fields
    {
        field(1;Date;Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                 GeneralOptions.Get;

                 //if not CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code",Date,Description) then
                 //Error('You can only enter a holiday or weekend');
            end;
        }
        field(2;Description;Text[150])
        {
        }
        field(3;"Employee No.";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Emp.Get("Employee No.") then
                 begin
                 "Employee Name":=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";
                 end;
            end;
        }
        field(4;"Employee Name";Text[50])
        {
        }
        field(5;"Leave Type";Code[20])
        {
            TableRelation = "Leave Types1";
        }
        field(6;"Maturity Date";Date)
        {
        }
        field(7;"No. of Days";Decimal)
        {
        }
        field(8;"Reason for Off";Text[250])
        {
        }
        field(9;"Approved to Work";Code[20])
        {
            TableRelation = Employee;
        }
    }

    keys
    {
        key(Key1;"Employee No.",Date)
        {
            Clustered = true;
        }
        key(Key2;"Employee No.","Leave Type","Maturity Date")
        {
            SumIndexFields = "No. of Days";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
          FindMaturityDate;
         "Maturity Date":=Maturitydate;
         "No. of Days":=1;
          HRSetup.Get;
          if HRSetup."Off Days Code"='' then
          Error('You must select the off days code on human resource setup');
          "Leave Type":=HRSetup."Off Days Code";
    end;

    var
        Emp: Record Employee;
        FiscalStart: Date;
        Maturitydate: Date;
        CalendarMgmt: Codeunit "Calendar Management";
        GeneralOptions: Record "Company Information";
        HRSetup: Record "Human Resources Setup";


    procedure FindMaturityDate()
    var
        AccPeriod: Record "Payroll PeriodX1";
    begin
        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date",0D,Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
        if AccPeriod.Find('+') then
        begin
        FiscalStart:=AccPeriod."Starting Date";
        Maturitydate:=CalcDate('1Y',AccPeriod."Starting Date")-1;
        end;
    end;
}

