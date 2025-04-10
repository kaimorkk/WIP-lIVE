Page 52194015 "Employee Claim Records"
{
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoin;"Date Of Join")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000028;"Claim Lines")
            {
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        UserSetup: Record "User Setup";
        "Employee Leaves": Record "Employee Leaves1";
        Bal: Decimal;
        MaturityDateFilter: Date;
        AcctPeriod: Record "Payroll PeriodX1";
        EmpLeaveApps: Record "Employee Leave Application1";
        EmpOffs: Record "Employee Off/Holidays1";
        EmpAbsence: Record "Employee Absentism1";
        TotalDays: Decimal;
        Recalled: Decimal;
        Absent: Decimal;
        EmpContracts: Record "Employee Contracts1";
        TotalDays2: Decimal;
        Recalled2: Decimal;
        Absent2: Decimal;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        AcctPeriod.Reset;
        AcctPeriod.SetRange(AcctPeriod."Starting Date",0D,Today);
        AcctPeriod.SetRange(AcctPeriod."New Fiscal Year",true);
        if AcctPeriod.Find('+') then
        MaturityDateFilter:=CalcDate('1Y',AcctPeriod."Starting Date")-1;

        Bal:=0;
        if ("Posting Group"='TEMP') or ("Posting Group"='INTERN') then begin

           EmpContracts.Reset;
           EmpContracts.SetRange(EmpContracts."Employee No","No.");
           EmpContracts.SetRange(EmpContracts.Expired,false);
           if EmpContracts.Find('-') then begin
            TotalDays2:=0;
            Recalled2:=0;
            Absent2:=0;
              EmpLeaveApps.Reset;
              EmpLeaveApps.SetRange(EmpLeaveApps."Employee No",EmpContracts."Employee No");
              EmpLeaveApps.SetRange(EmpLeaveApps."Leave Code",'ANNUAL');
              EmpLeaveApps.SetRange(EmpLeaveApps."Contract No.",EmpContracts."Contract No");
              EmpLeaveApps.SetRange(EmpLeaveApps.Status,EmpLeaveApps.Status::Released);
          // EmpLeaveApps.CALCFIELDS(EmpLeaveApps."Days Applied");
              if EmpLeaveApps.Find('-') then begin
              repeat
               TotalDays2:=TotalDays2+EmpLeaveApps."Days Applied";
              until EmpLeaveApps.Next=0;
              end;
              EmpOffs.Reset;
              EmpOffs.SetRange(EmpOffs."Employee No",EmpContracts."Employee No");
              EmpOffs.SetRange(EmpOffs."Contract No.",EmpContracts."Contract No");
              if EmpOffs.Find('-') then begin
              repeat
               Recalled2:=Recalled2+EmpOffs."No. of Off Days";
              until EmpOffs.Next=0;
              end;

              EmpAbsence.Reset;
              EmpAbsence.SetRange(EmpAbsence."Employee No",EmpContracts."Employee No");
              EmpAbsence.SetRange(EmpAbsence."Contract No.",EmpContracts."Contract No");
              if EmpAbsence.Find('-') then begin
              repeat
               Absent2:=Absent2+EmpAbsence."No. of  Days Absent";
              until EmpAbsence.Next=0;
             end;
        //MESSAGE('TOTAL %1 RECALLED %2 ABSENT %3',TotalDays2,Recalled2,Absent2);

            Bal:=(EmpContracts."Contract Leave Entitlement"+EmpContracts."Balance Brought Forward"+Recalled2)-(TotalDays2+Absent2);

           end;

        end else begin

        "Employee Leaves".Reset;
        "Employee Leaves".SetRange("Employee Leaves"."Employee No","No.");
        "Employee Leaves".SetRange("Employee Leaves"."Maturity Date",MaturityDateFilter);
        if "Employee Leaves".Find('-') then begin

            TotalDays:=0;
            Recalled:=0;
            Absent:=0;


           EmpLeaveApps.Reset;
           EmpLeaveApps.SetRange(EmpLeaveApps."Employee No","Employee Leaves"."Employee No");
           EmpLeaveApps.SetRange(EmpLeaveApps."Leave Code","Employee Leaves"."Leave Code");
           EmpLeaveApps.SetRange(EmpLeaveApps."Maturity Date","Employee Leaves"."Maturity Date");
           EmpLeaveApps.SetRange(EmpLeaveApps.Status,EmpLeaveApps.Status::Released);
          // EmpLeaveApps.CALCFIELDS(EmpLeaveApps."Days Applied");
           if EmpLeaveApps.Find('-') then begin
           repeat
               TotalDays:=TotalDays+EmpLeaveApps."Days Applied";
           until EmpLeaveApps.Next=0;
            end;

            EmpOffs.Reset;
            EmpOffs.SetRange(EmpOffs."Employee No","Employee Leaves"."Employee No");
            EmpOffs.SetRange(EmpOffs."Maturity Date","Employee Leaves"."Maturity Date");
            if EmpOffs.Find('-') then begin
            repeat
               Recalled:=Recalled+EmpOffs."No. of Off Days";
            until EmpOffs.Next=0;
             end;

            EmpAbsence.Reset;
            EmpAbsence.SetRange(EmpAbsence."Employee No","Employee Leaves"."Employee No");
            EmpAbsence.SetRange(EmpAbsence."Maturity Date","Employee Leaves"."Maturity Date");
            if EmpAbsence.Find('-') then begin
            repeat
             Absent:=Absent+EmpAbsence."No. of  Days Absent";
            until EmpAbsence.Next=0;
            end;
        //MESSAGE('Emp %1 TOTAL %2 RECALLED %3 ABSENT %4',"No.",TotalDays,Recalled,Absent);
            Bal:=("Employee Leaves".Entitlement+ "Employee Leaves". "Balance Brought Forward"+Recalled)-(TotalDays+Absent);
         end;
        end;
    end;
}

