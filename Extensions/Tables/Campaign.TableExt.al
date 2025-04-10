TableExtension 52193654 tableextension52193654 extends Campaign 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Starting Date"(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Starting Date" > "Ending Date") AND ("Ending Date" > 0D) THEN
              ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF ("Starting Date" > "Ending Date") AND ("Ending Date" > 0D) THEN
              ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));
                 "Ending Date":="Starting Date";
                notifications.GET;
               "Notification Date":=CALCDATE(notifications."Notification Date","Starting Date");
               "Agendas Date":=CALCDATE(notifications."Agendas Date","Starting Date");
               "Commisioner Notice":=CALCDATE(notifications."Commisioner Notice","Starting Date");
               Month:=FORMAT("Starting Date",0,'<Month Text>');
            */
        //end;
        field(50000;"Sub Type";Option)
        {
            OptionMembers = " ","Customer Satisfaction Survey","stakeholder consultation";
        }
        field(50001;"Venue Code";Code[20])
        {
            TableRelation = "Event Venues1";

            trigger OnValidate()
            begin
                  if Venue.Get("Venue Code") then
                  "Venue Name":=Venue."Venue Description";
            end;
        }
        field(50002;Type;Option)
        {
            OptionMembers = " ",Company,Legal,HR,"Corporate Affairs";
        }
        field(50003;"Start Time";Time)
        {
        }
        field(50004;"End Time";Time)
        {

            trigger OnValidate()
            begin
                //EventScheduler(Rec);
            end;
        }
        field(50006;"Language Code(Default)";Text[30])
        {
        }
        field(50007;Attachment;Option)
        {
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(50008;"Venue Name";Text[250])
        {
        }
        field(50009;"Meeting Type";Option)
        {
            OptionCaption = ' ,Meeting,Event,Meeting1';
            OptionMembers = " ",Meeting,"Event",Meeting1;
        }
        field(50010;"Committee Code";Code[20])
        {
            TableRelation = "Committee Type1";

            trigger OnValidate()
            begin
                 if Commettee.Get("Committee Code") then
                    "Committee Name":=Commettee."Committee Name";




                             HodAttendance.Reset;
                             HodAttendance.SetRange(HodAttendance."Committee Code","Committee Code");

                            if HodAttendance.Find('-') then

                             repeat
                            HodCommittee.Init;
                            HodCommittee."Meeting Code":="No.";
                            HodCommittee."HoD code":=HodAttendance."No.";
                            HodCommittee."Hod Name":=HodAttendance."Full Names";
                            HodCommittee."Committee Code":=HodAttendance."Committee Code";
                            HodCommittee.Email:=HodAttendance.Email;
                            HodCommittee.Insert;

                            until   HodAttendance.Next=0;

                         ComAttendance.Reset;
                        ComAttendance.SetRange(ComAttendance."Committee Code","Committee Code");
                         if ComAttendance.Find('-') then

                          repeat

                            ComCommittee.Init;
                            ComCommittee."Meeting Code":="No.";
                            ComCommittee.Code:=ComAttendance."Commissioner Code";
                            ComCommittee."Commisioner Name":=ComAttendance."Commissioners Name";
                            ComCommittee."Committee Code":=ComCommittee."Committee Code";
                            ComCommittee.Email:=ComAttendance.Email;
                            ComCommittee.Insert;

                         until ComAttendance.Next=0;

                         EmpAttendance.Reset;
                         EmpAttendance.SetRange(EmpAttendance."Committee Code","Committee Code");
                         if ComAttendance.Find('-') then

                          repeat

                            EmpCommittee.Init;
                            EmpCommittee."Meeting Code":="No.";
                            EmpCommittee."Employee Code":=EmpAttendance."No.";
                            EmpCommittee."Employee Name":=EmpAttendance."Full Names";
                            EmpCommittee."Committee Code":=EmpCommittee."Committee Code";
                            EmpCommittee.Email:=EmpAttendance.Email;
                            EmpCommittee.Insert;

                         until EmpAttendance.Next=0;
            end;
        }
        field(50011;"Committee Name";Text[100])
        {
        }
        field(50012;"Notification Date";Date)
        {
        }
        field(50013;"Agendas Date";Date)
        {
        }
        field(50014;"Commisioner Notice";Date)
        {
        }
        field(50015;Month;Text[30])
        {
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "No." = '' THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Campaign Nos.");
          NoSeriesMgt.InitSeries(RMSetup."Campaign Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;

        DimMgt.UpdateDefaultDim(
          DATABASE::Campaign,"No.",
          "Global Dimension 1 Code","Global Dimension 2 Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        #7..9
        GLSetup.GET;
        Commissioners.RESET;
        Commissioners.SETRANGE(Commissioners."Dimension Code",GLSetup."Global Dimension 2 Code");
        */
    //end;

    procedure EventScheduler(var Campaign: Record Campaign)
    begin
        //Find all the Events on the table

             Campaign.SetRange("Meeting Type","meeting type"::"Event");
           Campaign.SetFilter(Campaign."No.","No.");
         if Campaign.Find('-') then
           begin
            repeat
             if xRec."No."=Campaign."No." then  begin
             ;
             end
            else              //   BEGIN
               if ("Venue Code"=Campaign."Venue Code") then
                     begin
                    if ("Starting Date"=Campaign."Starting Date") and ("Ending Date"=Campaign."Ending Date") then
                    if ("Start Time"=Campaign."Start Time") and ("End Time"=Campaign."End Time")  then
                   //ERROR('Please the Schedule Meeting date Exist');
                   Message('Not Yet');
                  end;
            //   END;
        until Rec.Next=0;
           end;
    end;

    procedure SendAgendas(var Campaign: Record Campaign)
    var
        Agendas: Record Agendas1;
    begin
         Agendas.Reset;
         Agendas.SetRange(Agendas."Meeting No.","No.");

        if Agendas."Send for Approval"=true then
        begin
        if Agendas.Status<>Agendas.Status::Open  then
        Error('You have already been send by the user!!')
          else begin
          if Agendas.Find('-') then

          repeat
            Subject:='Agendas for meeting Nos'+ Format(Agendas."Meeting No.")+Format(Agendas."Line No");
            Body:=('Please approve the following Agenda Nos'+Format(Agendas."Meeting No.")+Format(Agendas."Line No"));
            //Mail.NewIncidentMail(compinfo."CS Email",Subject,Body);
        Agendas.Status:=Agendas.Status::Sent;
        Modify;
        until Agendas.Next=0;
        Message('Agenda submitted')

         end;
             end;
    end;

    var
        SalesPrice: Integer;
        attendance: Record "Commisioner Attendance1";
        Commissioners: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
        EventSchedule: Record "Event Schedule1";
        Commettee: Record "Committee Type1";
        HodAttendance: Record "Attendance Listing1";
        ComAttendance: Record "Commisioner Attendance1";
        HodCommittee: Record "HoD Committee1";
        ComCommittee: Record "Commisioner Committee1";
        notifications: Record "Notification Dates1";
        Mail: Codeunit Mail;
        Subject: Text[250];
        Body: Text[250];
        compinfo: Record "Company Information";
        Venue: Record "Event Venues1";
        EmpCommittee: Record "Employee Committee1";
        EmpAttendance: Record "Employee Attendance1";
}

