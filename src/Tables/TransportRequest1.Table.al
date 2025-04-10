Table 52193949 "Transport Request1"
{
    DrillDownPageID = "Trip Listing";
    LookupPageID = "Trip Listing";

    fields
    {
        field(1; "Request No."; Code[30])
        {
        }
        field(2; "Request Date"; Date)
        {
        }
        field(3; "Request ID"; Code[30])
        {
        }
        field(4; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin

                UserSetup.Get("Employee No.");
                "User ID" := UserSetup."User ID";
            end;
        }
        field(5; "Employee Name"; Text[50])
        {
        }
        field(6; "Trip Planned Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //MESSAGE('message here');
            end;
        }
        field(7; "Trip Planned End Date"; Date)
        {
        }
        field(8; Destination; Text[250])
        {
        }
        field(9; "Geographical Terrain"; Text[30])
        {
        }
        field(10; "No. of Personnel"; Integer)
        {
            CalcFormula = count("Travelling Employees1" where("Request No." = field("Request No."),
                                                               "Employee No." = filter(<> '')));
            FieldClass = FlowField;
        }
        field(11; "Predicted Weather Conditions"; Text[30])
        {
        }
        field(12; "Vehicle Allocated"; Code[30])
        {
            TableRelation = "Fixed Asset" where("FA Class Code" = const('MV'));

            trigger OnValidate()
            begin
                if Status <> Status::Released then
                    Error('You are not allowed to assign a vehicle when the transport request has not been approved');


                /*
                     IF FA.GET("Vehicle Allocated") THEN
                  BEGIN
                  "Vehicle Description":=FA.Description;
                 // "Vehicle Allocated":="Vehicle Description";
                  FA.CALCFIELDS(FA."In Use");
                  IF FA."In Use" THEN
                  ERROR('This vehicle is currently un-available');
                  END;
                 */

            end;
        }
        field(13; "Outsourced Vehicle Reg No."; Code[10])
        {
        }
        field(14; "Vehicle Owner"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(15; "Odometer Reading Before"; Decimal)
        {

            trigger OnValidate()
            begin
                Mantainance.Reset;
                Mantainance.SetRange(Mantainance."Item No.", "Vehicle Allocated");
                if Mantainance.Find('+') then begin
                    if "Odometer Reading Before" >= (Mantainance."Current Odometer Reading" + Mantainance."Service Mileage") then begin
                        CompanyInfo.Get();
                        Recipients := CompanyInfo."Fleet Manager Support Email";
                        CompanyInfo.Get();
                        SenderName := COMPANYNAME;
                        SenderAddress := CompanyInfo."E-Mail";
                        Subject := 'Vehicle Mantainace ' + "Vehicle Allocated";
                        Body := StrSubstNo('This is to notify you that the Vehicle No. %1 is due for servicing', "Vehicle Allocated");
                        SMTPSetup.Create(Recipients, Subject, Body, true);
                        Email.Send(SMTPSetup);

                    end;
                end;
            end;
        }
        field(16; "Odometer Reading After"; Decimal)
        {

            trigger OnValidate()
            begin
                Mantainance.Reset;
                Mantainance.SetRange(Mantainance."Item No.", "Vehicle Allocated");
                if Mantainance.Find('+') then begin
                    if "Odometer Reading Before" >= (Mantainance."Current Odometer Reading" + Mantainance."Service Mileage") then begin
                        CompanyInfo.Get();
                        Recipients := CompanyInfo."Fleet Manager Support Email";
                        CompanyInfo.Get();
                        SenderName := COMPANYNAME;
                        SenderAddress := CompanyInfo."E-Mail";
                        Subject := 'Vehicle Mantainace ' + "Vehicle Allocated";
                        Body := StrSubstNo('This is to notify you that the Vehicle No. %1 is due for servicing', "Vehicle Allocated");
                        SMTPSetup.Create(Recipients, Subject, Body, true);
                        Email.Send(SMTPSetup);

                    end;
                end
            end;
        }
        field(17; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(18; Country; Code[10])
        {
        }
        field(19; "Town/City"; Code[10])
        {
        }
        field(20; Status; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(21; "No. of Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(51511275),
                                                        "Document No." = field("Request No.")));
            FieldClass = FlowField;
        }
        field(22; "Reason for Travel"; Text[250])
        {
        }
        field(23; "Start Date"; Date)
        {
        }
        field(24; "Return Date"; Date)
        {
        }
        field(25; "Start Time"; Time)
        {
        }
        field(26; "Return Time"; Time)
        {
        }
        field(27; "Vehicle Description"; Text[80])
        {
        }
        field(28; "User ID"; Code[30])
        {
        }
        field(29; "Travel Details"; Text[250])
        {
        }
        field(30; Driver; Code[20])
        {
            TableRelation = Employee where("Employee Job Type" = const(Driver));

            trigger OnValidate()
            begin
                if Status <> Status::Released then
                    Error('You are not allowed to assign a driver when the transport request has not been approved');

                if Empl.Get(Driver) then
                    // BEGIN
                    "Driver Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";

                TestField("Vehicle Allocated");

                TravellingEmployees.Reset;
                TravellingEmployees.SetRange(TravellingEmployees."Request No.", "Request No.");
                if TravellingEmployees.Find('-') then begin
                    repeat
                        UserSetup.Reset;
                        UserSetup.SetRange(UserSetup."Employee No.", TravellingEmployees."Employee No.");
                        if UserSetup.Find('-') then begin
                            UserSetup.TestField(UserSetup."E-Mail");
                            Recipients := UserSetup."E-Mail";

                            CompanyInfo.Get();
                            SenderName := COMPANYNAME;
                            SenderAddress := CompanyInfo."Fleet Manager Support Email";

                            Subject := 'Vehicle Allocation for Transport Request ' + "Request No.";
                            Body := 'This is to inform you that you have been allocated Vehicle No ' + "Vehicle Allocated" + ', ' + "Vehicle Description" + ' and Driver ' + "Driver Name" + ' for the trip to ' + Destination;
                            SMTPSetup.Create(Recipients, Subject, Body, true);
                            Email.Send(SMTPSetup);
                        end;
                    until TravellingEmployees.Next = 0;
                end;
            end;
        }
        field(31; "Driver Name"; Text[50])
        {
        }
        field(32; Taxi; Text[50])
        {

            trigger OnValidate()
            begin
                if Status <> Status::Released then
                    Error('You are not allowed to assign a Taxi when the transport request has not been approved');



                TravellingEmployees.Reset;
                TravellingEmployees.SetRange(TravellingEmployees."Request No.", "Request No.");
                if TravellingEmployees.Find('-') then begin
                    repeat
                        UserSetup.Reset;
                        UserSetup.SetRange(UserSetup."Employee No.", TravellingEmployees."Employee No.");
                        if UserSetup.Find('-') then begin
                            UserSetup.TestField(UserSetup."E-Mail");
                            Recipients := UserSetup."E-Mail";

                            CompanyInfo.Get();
                            SenderName := COMPANYNAME;
                            SenderAddress := CompanyInfo."Fleet Manager Support Email";

                            Subject := 'Vehicle Allocation for Transport Request ' + "Request No.";
                            Body := 'This is to inform you that you have been allocated ' + Taxi + ' for the trip to ' + Destination;
                            SMTPSetup.Create(Recipients, Subject, Body, true);
                            Email.Send(SMTPSetup);
                        end;
                    until TravellingEmployees.Next = 0;
                end;
            end;
        }
        field(33; Cancelled; Boolean)
        {

            trigger OnValidate()
            begin
                if Cancelled = true then begin
                    Message('The trip request is been cancelled');
                    ToName := '';
                    CName := '';

                    Subject := 'Your vehicle request has been cancelled ';
                    Body := 'You vehicle Request has been cancelled';
                    UserSetup.Get("User ID");
                    ToName := UserSetup."E-Mail";
                    //CCName:='navadmin@erc.go.ke';
                    Mail.CreateMessage(ToName, CName, '', Subject, Body, true, false);
                    if MailSent then
                        // MailSent:=Mail.Send()
                        Message('The trip request has been cancelled')
                    else
                        MailSent := true;

                end;
                if Cancelled = false then begin
                    Message('You are about to revert the cancelled trip?');
                end;
            end;
        }
        field(34; "No. of Non Employees"; Integer)
        {
            CalcFormula = count("Travelling Non Employees1" where("Request No." = field("Request No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Request No.", Destination, "Reason for Travel")
        {
        }
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin
        if "Request No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Transport Request Nos");
            NoSeriesMgt.InitSeries(HumanResSetup."Transport Request Nos", xRec."No. Series", 0D, "Request No.", "No. Series");
        end;
        "Request Date" := Today;
        "Request ID" := UserId;
        if UserSetup.Get(UserId) then begin
            if Empl.Get(UserSetup."Employee No.") then begin
                "Employee Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";
                "User ID" := UserId;
            end;
            "Employee No." := UserSetup."Employee No.";
        end;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Empl: Record Employee;
        FA: Record "Fixed Asset";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        Subject: Text[250];
        Body: Text[250];
        Recipients: Text[50];
        CName: Text[50];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        CompanyInfo: Record "Company Information";
        TravellingEmployees: Record "Travelling Employees1";
        SenderName: Text[50];
        SenderAddress: Text[50];
        ToName: Text[50];
        Mantainance: Record "Maintanance and Repair";
}

