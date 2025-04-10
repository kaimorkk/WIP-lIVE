Codeunit 52193456 "Employee Presence"
{
    // Documentation()
    //  {
    //   code unit by: isaac Kiplagat
    //   Employees at a very particular time
    //   Date assumed to be today
    //   date 11/082011


    trigger OnRun()
    begin
           DateToday:=Today;
            EmplPresents.Init;
         EmplPresents.DeleteAll;

        Location:='Office';
        Des:='---';
        Empl.SetFilter(Empl.Status,'active');// filter inactive employees
        if Empl.Find('-') then
         repeat     //find all employees
           EmplPresents.Name:= Empl."First Name"+' '+Empl."Last Name" ;
           EmplPresents."Employee No.":= Empl."No." ;
           EmplPresents.Description  :=Des;
           EmplPresents."Start date":=Today;
           EmplPresents."End Date":=Today;
           EmplPresents.Location:=Location;
           //  MESSAGE(' %1 ',EmplPresents.Location);
           EmplPresents.Insert;

            Imprest(Empl."No.",DateToday);
            Travelling(Empl."No.",DateToday);
            Leave(Empl."No.",DateToday);
            Transport(Empl."No.",DateToday);
            SickOff(Empl."No.",DateToday);
            Absence(Empl."No.",DateToday);
            Others(Empl."No.",DateToday);
           //MESSAGE('%1 message',Empl."No.")
          // EmplPresents.GET;
        until Empl.Next=0;
    end;

    var
        Empl: Record Employee;
        EmpLeaveApp: Record "Employee Leave Application1";
        DateToday: Date;
        TransportRequest: Record "Transport Request1";
        TravellingEmployees: Record "Travelling Employees1";
        RequestHeader: Record "Request Header1";
        "Start Date": Date;
        "End Date": Date;
        Location: Text[30];
        Des: Text[100];
        EmplPresents: Record "Employee presents1";
        Recallform: Record "Holidays_Off Days1";
        SickOffRec: Record "Sick Off1";
        AbsentismRec: Record "Employee Absentism1";


    procedure Imprest(var empcode: Code[20];var CurDate: Date)
    begin
        RequestHeader.SetFilter(RequestHeader.Status,'Released');
        RequestHeader.SetFilter(RequestHeader."Employee No",empcode);
        if RequestHeader."External Application"=RequestHeader."external application"::No then
        if RequestHeader.Find('-') then
        repeat
         if (RequestHeader."Trip Start Date"<=CurDate) and  (RequestHeader."Trip Expected End Date">=CurDate) then  begin
            EmplPresents.Init;
           EmplPresents.Name:=RequestHeader."Employee Name";
          // EmplPresents."Employee No.":= Empl."No." ;
           EmplPresents.Description  :='Business Travel' ;
           EmplPresents."Start date":=RequestHeader."Trip Start Date";
           EmplPresents."End Date":=RequestHeader."Trip Expected End Date";
           EmplPresents.Location:='Business Travel';
           // MESSAGE(' %1 ','Imprest');
            EmplPresents.Modify
            end;
          until RequestHeader.Next=0;
    end;


    procedure Travelling(var empcode: Code[20];var CurDate: Date)
    begin
    end;


    procedure Leave(var empcode: Code[20];var CurDate: Date)
    begin
          // Empl.GET(empcode);
          EmpLeaveApp.SetFilter(EmpLeaveApp."Employee No",empcode);
         EmpLeaveApp.SetFilter(EmpLeaveApp.Status,'Released');
         if EmpLeaveApp.Find('-') then
         repeat
         if (EmpLeaveApp."Start Date"<=CurDate) then
         if  (EmpLeaveApp."End Date">=CurDate) then  begin
            EmplPresents.Init;
           EmplPresents.Name:= EmpLeaveApp."Employee Name";  ;
          //     EmplPresents."Employee No.":= Empl."No." ;
           EmplPresents.Description  :=Format(EmpLeaveApp."Leave Code") +' Leave ';
           EmplPresents."Start date":=EmpLeaveApp."Start Date";
           EmplPresents."End Date":=EmpLeaveApp."End Date";
           EmplPresents.Location:='Home';
            // MESSAGE(' %1 ','Home');
            EmplPresents.Modify;
            end;
        until EmpLeaveApp.Next=0;
    end;


    procedure Transport(var empcode: Code[20];var CurDate: Date)
    begin
        TransportRequest.SetFilter(TransportRequest.Status,'Released');
        TransportRequest.SetFilter(TransportRequest."Employee No.",empcode);
        //IF EmpLeaveApp.FIND('-') THEN
         if TransportRequest.Find('-') then
         repeat
         if (TransportRequest."Trip Planned Start Date"<=CurDate) then
             if  (TransportRequest."Trip Planned End Date">=CurDate) then  begin
             EmplPresents.Init;
           EmplPresents.Name:=TransportRequest."Employee Name"  ;
          //     EmplPresents."Employee No.":= Empl."No." ;
           EmplPresents.Description  :='Trip ' + TransportRequest.Destination ;
           EmplPresents."Start date":=TransportRequest."Trip Planned Start Date";
           EmplPresents."End Date":=TransportRequest."Trip Planned End Date";
           EmplPresents.Location:='Trip';
           // MESSAGE(' %1 ','Trip');
            EmplPresents.Modify;
          end;
            until TransportRequest.Next=0;
    end;


    procedure ResetForm(var myd: Date)
    begin
        DateToday:=myd;
        //CODEUNIT.RUN();
    end;


    procedure Recall(var Empcode: Code[20];var TodayDate: Date)
    begin
    end;


    procedure SickOff(var empcode: Code[20];var CurDate: Date)
    begin
         SickOffRec.SetFilter(SickOffRec."Employee No",empcode);
         if SickOffRec.Find('-') then
         repeat
         if (SickOffRec."Sick off Date(From)"<=CurDate) then
         if  (SickOffRec."Sick Off Date(To)">=CurDate) then  begin
            EmplPresents.Init;
           EmplPresents.Name:= SickOffRec."Employee Name";  ;
          //     EmplPresents."Employee No.":= Empl."No." ;
           EmplPresents.Description  :=' Sick Off ';
           EmplPresents."Start date":=SickOffRec."Sick off Date(From)";
           EmplPresents."End Date":=SickOffRec."Sick Off Date(To)";
           EmplPresents.Location:='Home';
            // MESSAGE(' %1 ','Home');
            EmplPresents.Modify;
            end;
        until SickOffRec.Next=0;
    end;


    procedure Absence(var empcode: Code[20];var CurDate: Date)
    begin
         AbsentismRec.SetFilter(AbsentismRec."Employee No",empcode);
         AbsentismRec.SetFilter(AbsentismRec.Status,'Released');
         if AbsentismRec.Find('-') then
         repeat
         if (AbsentismRec."Absent From"<=CurDate) then
         if  (AbsentismRec."Absent To">=CurDate) then  begin
            EmplPresents.Init;
           EmplPresents.Name:= AbsentismRec."Employee Name";
          //     EmplPresents."Employee No.":= Empl."No." ;
           EmplPresents.Description  :=' Absent ';
           EmplPresents."Start date":=AbsentismRec."Absent From";
           EmplPresents."End Date":=AbsentismRec."Absent To";
           EmplPresents.Location:='Home';
            // MESSAGE(' %1 ','Home');
            EmplPresents.Modify;
            end;
        until AbsentismRec.Next=0;
    end;


    procedure Others(var empcode: Code[20];var CurDate: Date)
    begin
    end;
}

