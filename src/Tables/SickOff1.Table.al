Table 52193957 "Sick Off1"
{
    DrillDownPageID = "Sick Off List";
    LookupPageID = "Sick Off List";

    fields
    {
        field(1;"Sick of No.";Code[20])
        {
        }
        field(2;"Sick off Date(From)";Date)
        {
        }
        field(3;"Employee No";Code[20])
        {
            TableRelation = Employee where (Status=filter(Active));

            trigger OnValidate()
            begin
                if empl.Get("Employee No") then
                "Employee Name":=empl."First Name"+' '+empl."Middle Name"+' '+empl."Last Name";
                
                  /* IF empl.GET(UserSetup."Employee No.") THEN
                   "Employee Name":=empl."First Name"+ ' '+empl."Middle Name"+' '+empl."Last Name";
                    "ID NO":=empl."ID Number";*/

            end;
        }
        field(4;"Employee Name";Text[50])
        {
        }
        field(5;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6;"Department Code";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(7;"Sick off entitlement";Decimal)
        {
        }
        field(8;"Days Taken";Decimal)
        {

            trigger OnValidate()
            begin
                if "Sick off entitlement" > 0 then begin
                empl.Reset;
                 empl.Get("Employee No");
                            Cumm:=0;
                  "Off days due":="Sick off entitlement"-Cumm;
                  // MESSAGE('cHECK THE FOLLOWING %1 %2 ',"Off days due","Days Taken");
                          empl.cumul:= empl.cumul+"Days Taken";
                          empl.Modify;
                        "Off days due":="Sick off entitlement"-empl.cumul;
                end else
                  "Off days due":=0;
            end;
        }
        field(9;Hospital;Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                  if VendorRec.Get(Hospital) then
                  "Hospital Name":=VendorRec.Name;
            end;
        }
        field(10;"Hospital Name";Text[50])
        {
        }
        field(11;"Off days due";Decimal)
        {
        }
        field(13;"Sick Off Date(To)";Date)
        {

            trigger OnValidate()
            begin
                if "Sick Off Date(To)"="Sick off Date(From)" then
                     "Days Taken":=1
                else begin

                  GeneralOptions.Get;
                  NoOfDaysOff:=1;
                  NextDate:="Sick off Date(From)";
                  repeat
                //   if not CalendarMgmt.CheckDateStatus('2013',NextDate,Description) then

                //    NoOfDaysOff:=NoOfDaysOff+1;
                //    NextDate:=CalcDate('1D',NextDate);

                 until NextDate="Sick Off Date(To)";
                   "Days Taken":=NoOfDaysOff;
                end;
            end;
        }
    }

    keys
    {
        key(Key1;"Employee No","Sick of No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Sick of No." = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Sick Of Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Sick Of Nos",xRec."No. Series",0D,"Sick of No.","No. Series");
          "Sick off entitlement":=90;
        end;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        empl: Record Employee;
        CountryRec: Record "Country/Region";
        CompanyInfo: Record "Company Information";
        VendorRec: Record Vendor;
        entitlement: Record "Sick Off1";
        "ent.": Decimal;
        EmpDays: Record "Sick Off1";
        Cumm: Decimal;
        GeneralOptions: Record "Company Information";
        NoOfDaysOff: Decimal;
        NextDate: Date;
        CalendarMgmt: Codeunit "Calendar Management";
        Description: Text[30];
}

