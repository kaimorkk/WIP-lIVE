Page 52194094 "Employee Leave Application"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Employee Leave Application1";
    SourceTableView = where("Leave Code"=filter(<>''));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ApplicationNo;"Application No")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate;"Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveCode;"Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field(Balancebroughtforward;"Balance brought forward")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEntitlment;"Leave Entitlment")
                {
                    ApplicationArea = Basic;
                }
                field(DaysApplied;"Days Applied")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ResumptionDate;"Resumption Date")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledDays;"Recalled Days")
                {
                    ApplicationArea = Basic;
                }
                field(DaysAbsent;"Days Absent")
                {
                    ApplicationArea = Basic;
                }
                field(Leavebalance;"Leave balance")
                {
                    ApplicationArea = Basic;
                }
                field(DutiesTakenOverBy;"Duties Taken Over By")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(MaturityDate;"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals;"No. of Approvals")
                {
                    ApplicationArea = Basic;
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

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        Bal: Decimal;
        "Employee Leaves": Record "Employee Leaves1";
        AcctPeriod: Record "Payroll PeriodX1";

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        Bal:=0;
        //REPEAT
        "Employee Leaves".Reset;
        "Employee Leaves".SetRange("Employee Leaves"."Employee No","Employee No");
        "Employee Leaves".SetRange("Employee Leaves"."Maturity Date","Maturity Date");
        "Employee Leaves".SetRange("Employee Leaves"."Leave Code","Leave Code");
        if "Employee Leaves".Find('-') then begin
        repeat
        Bal:=("Employee Leaves".Entitlement+ "Employee Leaves". "Balance Brought Forward"+ "Employee Leaves"."Recalled Days")-
        "Employee Leaves"."Days Absent";
        until "Employee Leaves".Next=0;
        end;

        Bal:=Bal-"Approved Days";
        //UNTIL
    end;
}
