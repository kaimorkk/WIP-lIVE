Page 52194007 "Employee Contract2"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Employee Contracts1";

    layout
    {
        area(content)
        {
            field(EmployeeNo;"Employee No")
            {
                ApplicationArea = Basic;
            }
            field(EmployeeName;"Employee Name")
            {
                ApplicationArea = Basic;
            }
            field(ContractNo;"Contract No")
            {
                ApplicationArea = Basic;
            }
            field(ContractStartDate;"Contract Start Date")
            {
                ApplicationArea = Basic;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    /*
                    FrmCalendar.SetDate("Contract Start Date");
                    FrmCalendar.RUNMODAL;
                    D := FrmCalendar.GetDate;
                    CLEAR(FrmCalendar);
                    IF D <> 0D THEN
                      "Contract Start Date" := D;
                      VALIDATE("Contract Start Date");
                    */

                end;
            }
            field(ContractPeriod;"Contract Period")
            {
                ApplicationArea = Basic;
            }
            field(ContractEndDate;"Contract End Date")
            {
                ApplicationArea = Basic;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    /*
                    FrmCalendar.SetDate("Contract End Date");
                    FrmCalendar.RUNMODAL;
                    D := FrmCalendar.GetDate;
                    CLEAR(FrmCalendar);
                    IF D <> 0D THEN
                      "Contract End Date" := D;
                    */
                      Validate("Contract End Date");

                end;

                trigger OnValidate()
                begin
                    ContractEndDateOnAfterValidate;
                end;
            }
            field(ContractLeaveEntitlement;"Contract Leave Entitlement")
            {
                ApplicationArea = Basic;
            }
            field(BalanceBroughtForward;"Balance Brought Forward")
            {
                ApplicationArea = Basic;
            }
            field(ContractLeaveBalance;"Contract Leave Balance")
            {
                ApplicationArea = Basic;
            }
            field(Status;Status)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CreateContract)
            {
                ApplicationArea = Basic;
                Caption = 'Create Contract';
                Enabled = false;
                Visible = false;

                trigger OnAction()
                begin
                       Created:=true;
                       Modify;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CreateContract_Promoted; CreateContract)
                {
                }
            }
        }
    }

    var
        D: Date;
        EmpLeaveApps: Record "Employee Leave Application1";
        EmpOffs: Record "Employee Off/Holidays1";
        EmpAbsence: Record "Employee Absentism1";
        TotalDays: Decimal;
        Absent: Decimal;
        Recalled: Decimal;

    local procedure ContractEndDateOnAfterValidate()
    begin
          Validate("Contract End Date");
    end;
}

