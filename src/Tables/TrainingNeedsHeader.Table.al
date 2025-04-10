Table 52194004 "Training Needs Header"
{

    fields
    {
        field(1;"Request No.";Code[20])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;Department;Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2),
                                                          Directorate=field(Directorate));

            trigger OnValidate()
            begin
                //  "Department Name":=DimensionValue.Name;
            end;
        }
        field(4;Period;Code[20])
        {
            TableRelation = "Appraisal Periods1";
        }
        field(5;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(7;Directorate;Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //DimensionValue.RESET;
                //IF DimensionValue.GET('DIRECTORATE',Directorate) THEN
                //  "Directorate Name":=DimensionValue.Name;
            end;
        }
        field(8;"Directorate Name";Text[50])
        {
        }
        field(9;"Department Name";Text[50])
        {
        }
        field(10;"Period End Date";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Request No." = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Training Needs Request Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Training Needs Request Nos",xRec."No. Series",0D,"Request No.","No. Series");
        //  NoSeriesMgt.InitSeries(HumanResSetup."Training Request Nos",xRec."No. Series",0D,"Request No.","No. Series");
        end;


        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date",0D,Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
        if AccPeriod.Find('+') then
        FiscalStart:=AccPeriod."Starting Date";
        //MESSAGE('%1',FiscalStart);
        "Period End Date":=CalcDate('1Y',FiscalStart)-1;


          if UserSetup.Get(UserId) then
          begin
           if empl.Get(UserSetup."Employee No.") then
           Department:=empl."Global Dimension 2 Code";

           DimensionValue.Reset;
           if DimensionValue.Get('DEPARTMENT',Department) then
             "Department Name":=DimensionValue.Name;

           Directorate:=empl."Global Dimension 1 Code";
            //DimVal.RESET;
            DimensionValue.Reset;
            if DimensionValue.Get('DIRECTORATE',Directorate) then
             "Directorate Name":=DimensionValue.Name;
         end;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimensionValue: Record "Dimension Value";
        AccPeriod: Record "Accounting Period";
        FiscalStart: Date;
        UserSetup: Record "User Setup";
        empl: Record Employee;
        DimVal: Record "Dimension Value";
}

