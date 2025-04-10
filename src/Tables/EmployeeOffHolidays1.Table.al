Table 52193909 "Employee Off/Holidays1"
{
    DrillDownPageID = "Recall List";
    LookupPageID = "Recall List";

    fields
    {
        field(1;"Employee No";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Emp.Get("Employee No") then
                  begin
                   "Employee Name":=Emp."First Name"+' '+Emp."Middle Name"+' '+ Emp."Last Name";
                    if Emp."Contract Number"<>0 then
                   "Contract No.":=Emp."Contract Number";
                  end;
            end;
        }
        field(3;Date;Date)
        {
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(4;Approved;Boolean)
        {

            trigger OnValidate()
            begin

                     "Leave Types".Reset;
                     "Leave Types".SetRange("Leave Types"."Off/Holidays Days Leave",true);
                     if "Leave Types".Find('-') then;
                          "Employee Leave".Reset;
                          "Employee Leave".SetRange("Employee Leave"."Employee No","Employee No");
                          "Employee Leave".SetRange("Employee Leave"."Leave Code","Leave Types".Code);
                          if "Employee Leave".Find('-') then;
                               if Approved= true then begin;
                               "Employee Leave".Balance := "Employee Leave".Balance + 1;
                               "Employee Leave".Modify;
                               end
                               else begin
                               "Employee Leave".Balance := "Employee Leave".Balance - 1;
                               "Employee Leave".Modify;
                               end;
            end;
        }
        field(5;"Leave Application";Code[20])
        {
            TableRelation = "Employee Leave Application1" where (Status=const(Released),
                                                                 "Leave Code"=filter(<>'SICK'|<>'MATERNITY'));

            trigger OnValidate()
            begin
                 /*
                 GeneralOptions.GET;
                 IF LeaveApplication.GET("Leave Application") THEN
                 BEGIN
                   NoOfDaysOff:=0;
                     "Leave Ending Date":=LeaveApplication."End Date";
                   IF LeaveApplication."End Date"<>0D THEN
                   BEGIN
                   NextDate:="Recall Date";
                   REPEAT
                   IF NOT CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code",NextDate,Description) THEN
                   NoOfDaysOff:=NoOfDaysOff+1;
                
                   NextDate:=CALCDATE('1D',NextDate);
                   UNTIL NextDate=LeaveApplication."End Date";
                   END;
                
                 END;
                  "No. of Off Days":=NoOfDaysOff;
                                  */
                 LeaveApplication.Reset;
                 if LeaveApplication.Get("Leave Application") then
                 begin
                 //  NoOfDaysOff:=0;
                     "Leave Ending Date":=LeaveApplication."End Date";
                     "Employee No":=LeaveApplication."Employee No";
                     "Employee Name":=LeaveApplication."Employee Name";
                      "Directorate Code":=LeaveApplication."Directorate Code";
                
                   DimensionsValue.Reset;
                   DimensionsValue.SetRange(DimensionsValue."Dimension Code",'DEPARTMENT');
                   DimensionsValue.SetRange(DimensionsValue.Code,LeaveApplication."Department Code");
                   if DimensionsValue.Find('-') then
                     "Department Name":=DimensionsValue.Name;
                   DimensionsValue.Reset;
                   DimensionsValue.SetRange(DimensionsValue."Dimension Code",'DIRECTORATE');
                   DimensionsValue.SetRange(DimensionsValue.Code,LeaveApplication."Directorate Code");
                   if DimensionsValue.Find('-') then
                     "Directorate Name":=DimensionsValue.Name;
                
                
                end;

            end;
        }
        field(6;"Recall Date";Date)
        {

            trigger OnValidate()
            begin
                  Validate("Leave Application");
            end;
        }
        field(7;"No. of Off Days";Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                LeaveApplication.Reset;
                LeaveApplication.SetRange(LeaveApplication."Application No","Leave Application");
                if LeaveApplication.Find('-') then
                  if LeaveApplication."Days Applied" < "No. of Off Days" then
                  Error('The days you are trying to recall for %1 are more than the leave days applied they for', "Employee Name");
            end;
        }
        field(8;"Leave Ending Date";Date)
        {
        }
        field(9;"Maturity Date";Date)
        {
        }
        field(10;"No. Series";Code[10])
        {
        }
        field(11;"Employee Name";Text[50])
        {
        }
        field(12;"No.";Code[20])
        {
        }
        field(13;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(14;"Fiscal Start Date";Date)
        {
        }
        field(15;"Recalled By";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Emp.Get("Recalled By") then
                  begin
                  Name:=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";
                  //Name:=Emp."First Name"+' '  +Emp."Middle Name"+' '  + Emp."Last Name";
                   DimensionsValue.Reset;
                   DimensionsValue.SetRange(DimensionsValue."Dimension Code",'DEPARTMENT');
                   DimensionsValue.SetRange(DimensionsValue.Code,Emp."Global Dimension 2 Code");
                   if DimensionsValue.Find('-') then
                     "Head Of Department":=DimensionsValue.Name;

                  end;
            end;
        }
        field(16;Name;Text[50])
        {
            Editable = false;
        }
        field(17;"Reason for Recall";Text[130])
        {
        }
        field(18;"Head Of Department";Text[100])
        {

            trigger OnValidate()
            begin
                    //  DimensionsValue.GET('DEPARTMENT',"Head Of Department");
                    //  "Department Name":=DimensionsValue.Name;
            end;
        }
        field(20;"Recalled From";Date)
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                    GeneralOptions.Get;
                 if "Recalled From"<>0D then
                  d:= "Recalled From";

                  NotworkingDaysRecall:=0;

                FullDays := ROUND("No. of Off Days",1,'<');
                HalfDays := "No. of Off Days"-FullDays;



                 if ("No. of Off Days"<>0) and ("No. of Off Days">=1) then
                 begin
                //MESSAGE('NO OF DAYS=%1',"No. of Off Days");
                // IF "No. of Off Days"<>0 THEN
                 //BEGIN
                 repeat

                  if not  Codefactory.DetermineIfIsNonWorking(d) then
                  // BEGIN
                 NotworkingDaysRecall:=NotworkingDaysRecall+1;
                 // MESSAGE('Calendar Mngmt RecallDays=%1',NotworkingDaysRecall);
                 // END;

                 LeaveApplication.Reset;
                 if LeaveApplication.Get("Leave Application") then
                   LeaveCode:=LeaveApplication."Leave Code";

                 if LeaveTypes.Get(LeaveCode) then
                 begin
                 if LeaveTypes."Inclusive of Holidays" then
                 begin
                 BaseCalendar.Reset;
                 BaseCalendar.SetRange(BaseCalendar."Base Calendar Code",GeneralOptions."Base Calendar Code");
                 BaseCalendar.SetRange(BaseCalendar.Date,d);
                 BaseCalendar.SetRange(BaseCalendar.Nonworking,true);
                 BaseCalendar.SetRange(BaseCalendar."Recurring System",BaseCalendar."recurring system"::"Annual Recurring");
                  if BaseCalendar.Find('-') then begin
                   NotworkingDaysRecall:=NotworkingDaysRecall+1;
                  //MESSAGE('HOLIDAYS=%1',NotworkingDaysRecall);

                  // MESSAGE('Holiday =%1 Day of week %2',BaseCalendar.Date,BaseCalendar.Description);
                  end;

                 end;

                 if LeaveTypes."Inclusive of Saturday" then
                 begin
                 BaseCalender.Reset;
                 BaseCalender.SetRange(BaseCalender."Period Type",BaseCalender."period type"::Date);
                 BaseCalender.SetRange(BaseCalender."Period Start",d);
                 BaseCalender.SetRange(BaseCalender."Period No.",6);

                 if BaseCalender.Find('-') then begin
                   NotworkingDaysRecall:=NotworkingDaysRecall+1;
                 // MESSAGE('SATURDAYS=%1',NotworkingDaysRecall);
                                //   END;
                   // MESSAGE('SATURDAY =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                  end;
                  end;


                 if LeaveTypes."Inclusive of Sunday" then
                 begin
                 BaseCalender.Reset;
                 BaseCalender.SetRange(BaseCalender."Period Type",BaseCalender."period type"::Date);
                 BaseCalender.SetRange(BaseCalender."Period Start",d);
                 BaseCalender.SetRange(BaseCalender."Period No.",7);
                // BaseCalendar.SETRANGE(BaseCalendar.Nonworking,true);

                 if  BaseCalender.Find('-') then begin
                   NotworkingDaysRecall:=NotworkingDaysRecall+1;
                  // MESSAGE('SUNDAYS=%1',NotworkingDaysRecall);
                   //MESSAGE('Sunday =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                  end;
                  end;


                 if LeaveTypes."Off/Holidays Days Leave" then
                 ;
                 // MESSAGE('Off/Holidays Days Leave');

                 end;

                d:=CalcDate('1D',d);

                   //  MESSAGE('NotworkingDaysRecall=%1',NotworkingDaysRecall);
                  //  MESSAGE('d=%1',FORMAT(d));
                //NotworkingDaysRecall:=NotworkingDaysRecall+1;

                 until  NotworkingDaysRecall = FullDays;
                //  MESSAGE('NotworkingDaysRecall=%1',NotworkingDaysRecall);
                 // "No. of Off Days" :="No. of Off Days"-NotworkingDaysRecall;
                 // "No. of Off Days" :="No. of Off Days" + 1;
                  //  MESSAGE('No. of Off Days=%1',"No. of Off Days");
                 "Recalled To":=d-1;

                // END;
                // END;
                 end else
                 if ("No. of Off Days"<>0) and ("No. of Off Days"<1) then
                 begin
                   "Recalled To":="Recalled From";
                 end;



                   if "Recalled To"<>0D then
                  Validate("Recalled To");
            end;
        }
        field(21;"Recalled To";Date)
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                
                /*
                
                
                IF ("Recalled To"="Recalled From") THEN
                   "No. of Off Days":=1
                
                ELSE
                  BEGIN
                
                 GeneralOptions.GET;
                //IF  "Recalled To">"Recall Date" THEN
                //ERROR('Recall end date is greater than recall start date');
                 IF LeaveApplication.GET("Leave Application") THEN
                 BEGIN
                   NoOfDaysOff:=1;
                     "Leave Ending Date":=LeaveApplication."End Date";
                   IF LeaveApplication."End Date"<>0D THEN
                   BEGIN
                   NextDate:="Recalled From";
                   REPEAT
                   IF NOT CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code",NextDate,Description) THEN
                   NoOfDaysOff:=NoOfDaysOff+1;
                
                   NextDate:=CALCDATE('1D',NextDate);
                 //  UNTIL NextDate=LeaveApplication."End Date";
                     UNTIL NextDate="Recalled To"; //By Isaac
                   END;
                
                 END;
                  "No. of Off Days":=NoOfDaysOff;
                END;
                 */

            end;
        }
        field(22;"Department Name";Text[80])
        {
        }
        field(23;"Contract No.";Integer)
        {
        }
        field(24;"Directorate Code";Code[10])
        {
        }
        field(25;"Directorate Name";Text[80])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
        key(Key2;"Employee No","Maturity Date")
        {
            SumIndexFields = "No. of Off Days";
        }
        key(Key3;"Employee No","Contract No.")
        {
            SumIndexFields = "No. of Off Days";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Leave Recall Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Leave Recall Nos",xRec."No. Series",0D,"No.","No. Series");
        end;
        
        Date:=Today;
        "Recall Date":=Today;
        //commented by serem
        /*IF UserSetup.GET(USERID) THEN
        BEGIN
         "Employee No":=UserSetup."Employee No.";
         VALIDATE("Employee No");
        END;*/
        FindMaturityDate;
        "Maturity Date":=MaturityDate;
        "Fiscal Start Date":=FiscalStart;

    end;

    trigger OnModify()
    begin
          Message('You are modifying leave recall data for %1 are you sure you want to do this', "Employee Name");
    end;

    var
        Holidays: Record "Holidays_Off Days1";
        "Employee Leave": Record "Employee Leaves1";
        "Leave Types": Record "Leave Types1";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        FiscalStart: Date;
        MaturityDate: Date;
        Emp: Record Employee;
        LeaveApplication: Record "Employee Leave Application1";
        NextDate: Date;
        NoOfDaysOff: Decimal;
        CalendarMgmt: Codeunit "Calendar Management";
        GeneralOptions: Record "Company Information";
        Description: Text[30];
        BaseCalender: Record Date;
        NonWorkingDay: Boolean;
        NotworkingDaysRecall: Integer;
        LeaveTypes: Record "Leave Types1";
        BaseCalendar: Record "Base Calendar Change";
        d: Date;
        DimensionsValue: Record "Dimension Value";
        LeaveCode: Code[30];
        FullDays: Decimal;
        HalfDays: Decimal;
Codefactory: Codeunit "Code Factory";


    procedure FindMaturityDate()
    var
        AccPeriod: Record "Accounting Period";
    begin
        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date",0D,Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
        if AccPeriod.Find('+') then
        begin
        FiscalStart:=AccPeriod."Starting Date";
        MaturityDate:=CalcDate('1Y',AccPeriod."Starting Date")-1;
        end;
    end;
}

