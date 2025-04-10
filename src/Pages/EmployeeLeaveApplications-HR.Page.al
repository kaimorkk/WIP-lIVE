Page 52194013 "Employee Leave Applications-HR"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Employee;
    UsageCategory = Lists;

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
                field(Bal;Bal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Available Leave Balance';
                }
            }
            group(Leaves)
            {
                Caption = 'Leaves';
                part(Control1000000015;"Employee Leave Application")
                {
                    SubPageLink = "Employee No"=field("No.");
                }
            }
            group(RecalledDays)
            {
                Caption = 'Recalled Days';
                part(Control1000000025;"Recall List")
                {
                    SubPageLink = "Employee No"=field("No.");
                }
            }
            group(DaysAbsent)
            {
                Caption = 'Days Absent';
                Visible = false;
                part(Control1000000028;"Employee Absentism Line")
                {
                    SubPageLink = "Employee No"=field("No.");
                    Visible = false;
                }
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
        AcctPeriod: Record "Accounting Period";
        "Employee Leaves": Record "Employee Leaves1";
        Bal: Decimal;
        MaturityDateFilter: Date;
        EmpLeaveApps: Record "Employee Leave Application1";
        EmpOffs: Record "Employee Off/Holidays1";
        EmpAbsence: Record "Employee Absentism1";
        TotalDays: Decimal;
        Recalled: Decimal;
        Absent: Decimal;
        UserSetup: Record "User Setup";

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        AcctPeriod.Reset;
        AcctPeriod.SetRange(AcctPeriod."Starting Date",0D,Today);
        AcctPeriod.SetRange(AcctPeriod."New Fiscal Year",true);
        if AcctPeriod.Find('+') then
        MaturityDateFilter:=CalcDate('1Y',AcctPeriod."Starting Date")-1;
        Bal:=0;
        TotalDays:=0;
        Recalled:=0;
        Absent:=0;

        "Employee Leaves".Reset;
        "Employee Leaves".SetRange("Employee Leaves"."Employee No","No.");
        "Employee Leaves".SetRange("Employee Leaves"."Maturity Date",MaturityDateFilter);
        if "Employee Leaves".Find('-') then  begin
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

            Bal:=("Employee Leaves".Entitlement+ "Employee Leaves". "Balance Brought Forward"+Recalled)-
            (TotalDays+Absent);

        end;
    end;
}

