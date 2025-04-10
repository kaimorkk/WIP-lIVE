
table 59025 "Fleet Vehicle Allocation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transport Requisition No"; Code[30])
        {
        }
        field(2; "Vehicle Type"; Option)
        {
            OptionMembers = "Kasneb Vehicle"," Non Kasneb Vehicle";
        }
        field(3; "Vehicle Req. No"; Code[10])
        {
            TableRelation = if ("Vehicle Type" = const("Kasneb Vehicle")) "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                Vehicles.Reset;
                Vehicles.SetRange(Vehicles."Registration No.", "Vehicle Req. No");
                if Vehicles.FindFirst then begin
                    Make := Vehicles.Make;
                    Model := Vehicles.Model;
                    Capacity := Vehicles."Passenger Capacity";
                    if Capacity = 0 then
                        Error('The vehicle %1 has a 0 Passenger Capacity, Kindly update in the vehicle card before selecting', "Vehicle Req. No");

                end;
                WorkTicket.Reset;
                WorkTicket.SetRange(WorkTicket."Vehicle Registration No", "Vehicle Req. No");
                if WorkTicket.FindLast then
                    "Work Ticket No" := WorkTicket."Daily Work Ticket";
                /*
                IF "Vehicle Req. No" <> '' THEN BEGIN
                IF CONFIRM(Text0001,TRUE) THEN BEGIN
                  FleetManagementSetup.GET;
                  SentMail := FleetManagementSetup."Transport Admin Email";
                
                  Header:='TRANSPORT REQUISITION VEHICLE REALLOCATION ALERT! ';
                
                  IF SMTPSetup.GET() THEN BEGIN
                     SenderEmail:=SMTPSetup."Email Sender Address";
                     SenderName:= SMTPSetup."Email Sender Name";
                  END;
                  IF SentMail <> '' THEN BEGIN
                    SMTPMail.Create(SenderName,SenderEmail,SentMail,Header,'',TRUE);
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.AppendToBody('Dear Sir/Madam'+Emp."First Name"+' '+Emp."Last Name"+',');
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.AppendToBody('Please note that the allocated vehicle '+xRec."Vehicle Req. No"+' has been changed to '+Rec."Vehicle Req. No"+' for trip '+"Transport Requisition No"+' by '+USERID);// for the month of January 2014')
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.AppendToBody('Please prepare accordingly');
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.AppendToBody('Thanks & Regards');
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.AppendToBody(SenderName);
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.AddAttachment(FileDirectory+Filename,Filename);
                    SMTPMail.AppendToBody('<HR>');
                    SMTPMail.AppendToBody('This is a system generated mail.');
                    SMTPMail.AppendToBody('<br><br>');
                    SMTPMail.Send;
                    MESSAGE('Mail sent to %1',SentMail);
                  END;
                END;
                END;
                */

            end;
        }
        field(4; Make; Text[30])
        {
        }
        field(5; Model; Text[30])
        {
        }
        field(6; Capacity; Integer)
        {
        }
        field(7; "Work Ticket No"; Code[30])
        {
            TableRelation = "Monthly Work Ticket Header"."Daily Work Ticket";
        }
    }

    keys
    {
        key(Key1; "Transport Requisition No", "Vehicle Type", "Vehicle Req. No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Transport Requisition No", "Vehicle Req. No") { }
    }

    var
        Vehicles: Record "Fleet Vehicles.";
        WorkTicket: Record "Monthly Work Ticket Header";
        Drivers: Record "Vehicle Drivers";
        // ProjectMembers: Record "Project Members";
        TraveStaff: Record "Travel Requisition Staff";
        TraveStaff1: Record "Travel Requisition Staff";
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        FileDirectory: Text[100];
        FleetManagementSetup: Record "Fleet Management Setup";
        SentMail: Text;
        Text0001: label 'Are you sure you want to change the allocated vehicle?\This will send a notification to the transport Admin';
}

