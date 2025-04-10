Page 52194004 "Employee Contract"
{
    PageType = Card;
    SourceTable = "Employee Contracts1";
    SourceTableView = where(Created=const(false));

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
            }
            field(ContractPeriod;"Contract Period")
            {
                ApplicationArea = Basic;
            }
            field(ContractEndDate;"Contract End Date")
            {
                ApplicationArea = Basic;
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
                Enabled = true;
                Visible = true;

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

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

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

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        if (Status=Status::Expired) or (Status=Status::Terminated) then begin
          CurrPage.Editable:=false;
        end else
         CurrPage.Editable:=true;
        /*
        //Calculate leave entitlement for the contract period
          // MESSAGE('End Date %1',"Contract End Date");
          VALIDATE("Contract Start Date");
          VALIDATE("Contract End Date");
          IF ("Contract End Date"<>0D) AND ("Contract Start Date"<>0D) THEN
             "Contract Leave Entitlement":=ROUND(((("Contract End Date"-"Contract Start Date")/30)*2.5),1);
        
           TotalDays:=0;
           Recalled:=0;
           Absent:=0;
        
        
        //Calculate avilable Leave Balance
           EmpLeaveApps.RESET;
           EmpLeaveApps.SETRANGE(EmpLeaveApps."Employee No","Employee No");
           EmpLeaveApps.SETRANGE(EmpLeaveApps."Leave Code",'ANNUAL');
           EmpLeaveApps.SETRANGE(EmpLeaveApps."Start Date","Contract Start Date","Contract End Date");
           //EmpLeaveApps.SETRANGE(EmpLeaveApps."End Date","Contract Start Date","Contract End Date");
           EmpLeaveApps.SETRANGE(EmpLeaveApps.Status,EmpLeaveApps.Status::Released);
          // EmpLeaveApps.CALCFIELDS(EmpLeaveApps."Days Applied");
           IF EmpLeaveApps.FIND('-') THEN BEGIN
           REPEAT
               TotalDays:=TotalDays+EmpLeaveApps."Days Applied";
           UNTIL EmpLeaveApps.NEXT=0;
            END;
        
            EmpOffs.RESET;
            EmpOffs.SETRANGE(EmpOffs."Employee No","Employee No");
            EmpOffs.SETRANGE(EmpOffs."Recalled From","Contract Start Date","Contract End Date");
           // EmpOffs.SETRANGE(EmpOffs."Recalled To","Contract Start Date","Contract End Date");
            IF EmpOffs.FIND('-') THEN BEGIN
            REPEAT
               Recalled:=Recalled+EmpOffs."No. of Off Days";
            UNTIL EmpOffs.NEXT=0;
             END;
        
            EmpAbsence.RESET;
            EmpAbsence.SETRANGE(EmpAbsence."Employee No","Employee No");
            EmpAbsence.SETRANGE(EmpAbsence."Absent From","Contract Start Date","Contract End Date");
            //EmpAbsence.SETRANGE(EmpAbsence."Absent To","Contract Start Date","Contract End Date");
            IF EmpAbsence.FIND('-') THEN BEGIN
            REPEAT
             Absent:=Absent+EmpAbsence."No. of  Days Absent";
            UNTIL EmpAbsence.NEXT=0;
            END;
        
        "Contract Leave Balance":=("Contract Leave Entitlement"+"Balance Brought Forward"+Recalled)-(TotalDays+Absent);
         */

    end;
}

