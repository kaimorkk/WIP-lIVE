Table 52193735 "Bench Mark1"
{

    fields
    {
        field(1;"Activity No";Code[20])
        {

            trigger OnValidate()
            begin
                if Status=Status::Open then begin

                   if "Activity No" = '' then begin
                  SalesSetup.Get;
                  SalesSetup.TestField("Bench Mark No.");
                  NoSeriesMgt.InitSeries(SalesSetup."Bench Mark No.",xRec."Activity No",0D,"Activity No","No. Series");
                  end;
                end;

                      "Selection Date":=Today;
                   AcctPeriod.Reset;
                   AcctPeriod.SetRange(AcctPeriod."Starting Date",0D,Today);
                   AcctPeriod.SetRange(AcctPeriod."New Fiscal Year",true);
                   if AcctPeriod.Find('+') then
                   begin
                     "Start Date":=AcctPeriod."Starting Date";
                     "End Date":=CalcDate('1Y',AcctPeriod."Starting Date")-1;
                  end;

                BenchMark.Reset;
                BenchMark.SetRange(BenchMark."Start Date","Start Date");
                if BenchMark.Find('+') then
                Error('You have already selected the Activity for the current year');
            end;
        }
        field(2;"Activity Description";Text[80])
        {
        }
        field(3;"Best Practice";Text[100])
        {
        }
        field(4;"Start Date";Date)
        {

            trigger OnValidate()
            begin
                    // "End Date":=CALCDATE('1Y',"Start Date")-1;
            end;
        }
        field(5;"End Date";Date)
        {
        }
        field(6;Responsibility;Text[30])
        {
        }
        field(7;Status;Option)
        {
            OptionCaption = '    ,Open,Vetting,Bench Marking,Clossed';
            OptionMembers = "    ",Open,Vetting,"Bench Marking",Clossed;
        }
        field(8;Department;Text[80])
        {
        }
        field(9;Vetted;Boolean)
        {
        }
        field(10;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(11;"Employee Id";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Employee.Get("Employee Id") then begin
                    "Employee Name":=Employee."First Name" +' '+Employee."Middle Name" + ' '+Employee."Last Name";
                     "User Email":=Employee."E-Mail";

                   Dimension.Get('DEPARTMENT', Employee."Global Dimension 1 Code");

                   Department:=Dimension.Name;
                                    end;
            end;
        }
        field(12;"Employee Name";Text[80])
        {
        }
        field(13;"User Email";Text[80])
        {
        }
        field(14;User;Code[10])
        {
        }
        field(15;"CS Email";Text[80])
        {
        }
        field(16;"Language Code(Default)";Code[10])
        {
        }
        field(17;Attachement;Option)
        {
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(18;"Bench Mark";Boolean)
        {
        }
        field(19;Recomend;Boolean)
        {
        }
        field(20;"Selection Date";Date)
        {
        }
        field(21;"Fiscal Year";Code[10])
        {
        }
        field(22;"Action";Text[30])
        {
        }
        field(23;"Schedule Date";Date)
        {
        }
        field(24;"Action Status";Option)
        {
            OptionMembers = Open,Clossed;
        }
        field(25;Remarks;Text[250])
        {
        }
        field(26;"Reason For Rejection";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Activity No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Status=Status::Open then begin

           if "Activity No" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("Bench Mark No.");
          NoSeriesMgt.InitSeries(SalesSetup."Bench Mark No.",xRec."Activity No",0D,"Activity No","No. Series");
          end;
        end;

          User:=UserId;
          if users.Get("Employee Id") then
          begin
          "Employee Id":=users."Employee No.";
           if users.Get("Employee Id") then
           "User Email":=Employee."E-Mail";
          end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        users: Record "User Setup";
        Dimension: Record "Dimension Value";
        AcctPeriod: Record "Accounting Period";
        BenchMark: Record "Bench Mark1";
}

