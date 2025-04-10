
table 59012 "Travel Requisition Staff"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Req No"; Code[20])
        {
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin

                if HrEmployee.Get("Employee No") then begin
                    "Employee Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                    Position := HrEmployee."Job Title";
                end;
                DwTicket.Reset;
                DwTicket.SetRange(DwTicket."Transport Requisition No", "Req No");
                if DwTicket.FindSet() then begin
                    "Date of Trip" := DwTicket."Date of Trip";
                    Validate("Date of Trip");
                    "No of Days Requested" := DwTicket."No of Days Requested";
                    "Trip End Date" := DwTicket."Trip End Date";
                    "Trip End Time" := DwTicket."Trip End Time";
                end;
            end;
        }
        field(3; "Employee Name"; Text[70])
        {
        }
        field(4; Position; Text[70])
        {
        }
        field(5; "Daily Work Ticket"; Code[20])
        {

            trigger OnValidate()
            begin
                DwTicket.Reset;
                DwTicket.SetRange(DwTicket."Transport Requisition No", "Req No");
                if DwTicket.Find('-') then
                    "Daily Work Ticket" := DwTicket."Work Ticket No";
            end;
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Reassigned?"; Boolean)
        {
        }
        field(8; "New Trip"; Code[50])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No";
        }
        field(9; "Date of Trip"; Date)
        {

            trigger OnValidate()
            begin
                TRStaff.Reset;
                TRStaff.SetRange(TRStaff."Employee No", "Employee No");
                //TRStaff.SETFILTER(TRStaff."Date of Trip",'>=%1&<=%2',"Date of Trip",TRStaff."Trip End Date");
                if TRStaff.Find() then begin
                    Message('The employee is currently assigned to trip %1 from %2 to %3', TRStaff."Req No", TRStaff."Date of Trip", TRStaff."Trip End Date");
                end;
            end;
        }
        field(10; "No of Days Requested"; Integer)
        {

            trigger OnValidate()
            begin
                "Trip End Date" := CalcDate(Format("No of Days Requested") + 'D', "Date of Trip");
            end;
        }
        field(11; "Trip End Date"; Date)
        {
        }
        field(12; "Date Reassigned"; Date)
        {
        }
        field(13; "Allocated Vehicle Reg No"; Code[30])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";
        }
        field(14; "Trip End Time"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Req No", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        if "Reassigned?" = true then
            message('');
    end;

    trigger OnRename()
    begin
        if "Reassigned?" = true then
            Error('You cannot modify this record since the employee has been assigned to another trip %1', "New Trip");
    end;

    var
        HrEmployee: Record Employee;
        DwTicket: Record "Transport Requisition";
        TRStaff: Record "Travel Requisition Staff";
}

