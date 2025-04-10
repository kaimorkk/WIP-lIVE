table 58203 "Resource booking Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; No; Code[10])
        {
            TableRelation = "Resource Booking Header".No;
            trigger OnValidate()
            var
                ReservH: Record "Resource Booking Header";
            begin
                if ReservH.Get(No) then begin
                    Type := ReservH.Type;
                    "Resource No" := ReservH."Employee No";
                    Validate("Resource No");
                end;

            end;
        }
        field(3; Type; Option)
        {
            OptionCaption = ',Appointment,Reservation';
            OptionMembers = ,Appointment,Reservation;
            initvalue = Reservation;
        }
        field(55000; "Property Code"; Code[30])
        {
            TableRelation = "Fixed Asset"."No." where("Asset Type" = const(Property));
            trigger OnValidate()
            var
                Serviceitem: Record "Fixed Asset";
            begin
                Serviceitem.reset();
                Serviceitem.SetRange("No.", "Property Code");
                if Serviceitem.FindSet() then
                    "Property Name" := Serviceitem.Description;

            end;
        }
        field(55001; "Property Name"; Text[300])
        {
            editable = false;
        }
        field(4; "Resource No"; Code[30])
        {
            TableRelation = if (Type = const(Appointment)) Resource."No." where(Type = const(Person))
            /*else
            if (Type = const(Reservation)) "Service Item"."No." where("Property Code" = field("Property Code"), "Room Type" = field("Room Type"))*/;

            trigger OnValidate()
            var
                Serviceitem: Record "Service Item";
            begin
                if (Type = Type::Appointment) then begin
                    Resource.Reset;
                    Resource.SetRange("No.", "Resource No");
                    if Resource.FindSet then
                        Description := Resource.Name;
                    //Capacity:=Resource."Resource Capacity";
                end;
                if (Type = Type::Reservation) then begin
                    Serviceitem.Reset;
                    Serviceitem.SetRange("No.", "Resource No");
                    if Serviceitem.FindSet then
                        Description := Serviceitem.Description;
                    // Capacity := Serviceitem."Resource Capacity";
                end;
            end;
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Start Date/Time"; DateTime)
        {

            trigger OnValidate()
            begin

                TestField("Resource No");
                // ReservationEntries.Reset;
                // ReservationEntries.SetRange(IsCancelled, false);
                // ReservationEntries.SetRange("Resource No", "Resource No");
                // if ReservationEntries.FindLast then begin
                //     if ("Start Date/Time" <= ReservationEntries."End Date/Time") and ("Start Date/Time" >= ReservationEntries."Start Date/Time") then begin
                //         Error('Error ! Already Booked for the specified time');
                //     end else begin
                //         //MESSAGE(' acceptable');
                //     end;
                // end;
                // if Rec."End Date/Time"<> '' then
                // Duration := "End Date/Time" - "Start Date/Time";
            end;
        }
        field(7; "Start Time"; Time)
        {
        }
        field(8; Duration; Duration)
        {
        }
        field(9; "End Date/Time"; DateTime)
        {

            trigger OnValidate()
            begin
                TestField("Resource No");
                // ReservationEntries.Reset;
                // ReservationEntries.SetRange(IsCancelled, false);
                // ReservationEntries.SetRange("Resource No", "Resource No");
                // if ReservationEntries.FindLast then begin
                //     if ("End Date/Time" <= ReservationEntries."End Date/Time") and ("End Date/Time" >= ReservationEntries."Start Date/Time") then begin
                //         Error('Error! Already Booked for the specified time');
                //     end else begin
                //         //MESSAGE(' acceptable');
                //         Duration := "End Date/Time" - "Start Date/Time";
                //     end;
                // end;
                Duration := "End Date/Time" - "Start Date/Time";
                /*
               IF ("End Date/Time"<ReservationEntries."End Date/Time") AND ("End Date/Time">ReservationEntries."Start Date/Time") THEN BEGIN
                  IF ReservationEntries.COUNT>1 THEN
                  ERROR('Not acceptable');
                END ELSE BEGIN
                  Duration:="End Date/Time"-"Start Date/Time";
               END;
             END;
             */
                /*starttime:=DT2TIME("Start Date/Time");
                endtime:=DT2TIME("End Date/Time");
                Duration:=endtime-starttime;*/

            end;
        }
        field(10; Reason; Text[250])
        {
        }
        field(11; Capacity; Integer)
        {
        }
        field(12; "End Time"; Time)
        {

            trigger OnValidate()
            begin
                if "Start Time" >= "End Time" then begin
                    Error('End time must be later than start time');
                end;
                Duration := "End Time" - "Start Time";
            end;
        }
        field(13; Date; Date)
        {
        }
        field(14; "Allocated Resource No"; Code[30])
        {
            TableRelation = if (Type = const(Appointment)) Resource."No." where(Type = const(Person))
            /*else
            if (Type = const(Reservation)) "Service Item"."No." where("Property Code" = field("Property Code"))*/;

            trigger OnValidate()
            var
                Serviceitem: Record "Service Item";
            begin
                if (Type = Type::Appointment) then begin
                    Resource.Reset;
                    Resource.SetRange("No.", "Resource No");
                    Resource.SetRange("No.", "Allocated Resource No");
                    if Resource.FindSet then
                        "Allocated Resource Name" := Resource.Name;
                end;
                if (Type = Type::Reservation) then begin
                    Serviceitem.Reset;
                    Serviceitem.SetRange("No.", "Resource No");
                    if Serviceitem.FindSet then
                        "Allocated Resource Name" := Serviceitem.Description;
                end;
            end;

        }
        field(15; "Allocated Resource Name"; Text[250])
        {
        }
        field(58058; "Room Type"; Option)
        {
            OptionMembers = ,Office,"Board Room",Reception,"Common Room","Lounge",Chambers,"Court Room",Registry,"Waiting Room",Other;
            OptionCaption = ' ,Office,"Board Room",Reception,"Common Room","Lounge",Chambers,"Court Room",Registry,"Waiting Room",Other';

        }
        field(58059; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Floor Code"; Code[50])
        {
        }
        field(17; "Room Code"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Line No", No, Type, "Resource No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        starttime: Time;
        endtime: Time;
    //     ReservationEntries: Record "Reservation Entries";

    // local procedure FnCheckAvailability(ReservationEntries1: Record "Reservation Entries") Available: Boolean
    // begin
    // end;
}

