Table 52194030 "Employee Training Needs Table"
{
    DrillDownPageID = "Training Needs HOD";
    LookupPageID = "Training Needs HOD";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = false;
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Start Date";Date)
        {
        }
        field(4;"End Date";Date)
        {
        }
        field(5;"Duration Units";Option)
        {
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6;Duration;Decimal)
        {
        }
        field(7;"Cost Of Training";Decimal)
        {

            trigger OnValidate()
            begin
                if Posted then begin
                if Duration <> xRec.Duration then begin
                Message('%1','You cannot change the costs after posting');
                Duration := xRec.Duration;
                end
                end
            end;
        }
        field(8;Location;Text[100])
        {
        }
        field(9;Qualification;Code[30])
        {
            NotBlank = true;
            TableRelation = Qualification.Code;
        }
        field(10;"Re-Assessment Date";Date)
        {
        }
        field(11;Source;Code[50])
        {
            NotBlank = true;
            TableRelation = "Training Source1".Source;
        }
        field(12;"Need Source";Option)
        {
            OptionCaption = ' ,Succesion,Training,Employee,Employee Skill Plan';
            OptionMembers = " ",Succesion,Training,Employee,"Employee Skill Plan";

            trigger OnValidate()
            begin
                 TrainingNeed:='';
                
                if "Need Source"="need source"::Succesion then
                // BEGIN
                 DevelopmentNeed.Reset;
                 DevelopmentNeed.SetRange(DevelopmentNeed."Employee No.","Employee No");
                 DevelopmentNeed.SetRange(DevelopmentNeed."Appraisal Period","Appraisal Period");
                 if DevelopmentNeed.Find('-') then
                 /* REPEAT
                  TrainingNeed:=TrainingNeed+DevelopmentNeed."Development Need";
                 UNTIL DevelopmentNeed.NEXT=0;
                  Description:=TrainingNeed;
                 END ELSE
                  */
                
                  Message('development need=%1',DevelopmentNeed."Development Need");
                
                   Description:=DevelopmentNeed."Development Need";

            end;
        }
        field(13;Provider;Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(14;Post;Boolean)
        {
        }
        field(15;Posted;Boolean)
        {
            Editable = true;
        }
        field(16;"Department Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(17;"Employee No";Code[20])
        {
            TableRelation = Employee where ("Global Dimension 1 Code"=field(Directorate),
                                            "Global Dimension 2 Code"=field("Department Code"));

            trigger OnValidate()
            begin
                Employee.Reset;
                if Employee.Get("Employee No") then
                 "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            end;
        }
        field(18;"Employee Name";Text[50])
        {
        }
        field(19;"Appraisal Period";Code[20])
        {
        }
        field(20;"Proposed Training";Text[250])
        {
        }
        field(21;Directorate;Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                /*
                DimensionValue.RESET;
                IF DimensionValue.GET('DIRECTORATE',Directorate) THEN
                  "Directorate Name":=DimensionValue.Name;
                */

            end;
        }
        field(22;Status;Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(23;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(24;"HOD/Individual";Option)
        {
            OptionCaption = 'HOD,Individual';
            OptionMembers = HOD,Individual;
        }
        field(25;"Duration(Date)";Date)
        {
        }
        field(26;Select;Boolean)
        {
        }
        field(27;"Directorate Name";Text[50])
        {
        }
        field(28;"Department Name";Text[50])
        {
        }
        field(29;"Header No.";Code[20])
        {
        }
        field(30;"Period End Date";Date)
        {
        }
        field(31;"No. of Approvals";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Table ID"=const(51511367),
                                                        "Document No."=field(Code)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code",Directorate,"Department Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Description,"Employee No","Employee Name")
        {
        }
    }

    trigger OnDelete()
    begin
        if Status<>Status::Open then
        Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin

        if Code = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Employee Training Need Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Employee Training Need Nos",xRec."No. Series",0D,Code,"No. Series");
        end;


        UserSetup.Reset;
        UserSetup.SetRange(UserSetup."User ID",UserId);
        if UserSetup.Find('-') then
        begin
         "Employee No":=UserSetup."Employee No.";
           Employee.Reset;
           if Employee.Get(UserSetup."Employee No.") then
           begin
            "Employee Name":=Employee."First Name"+Employee."Middle Name"+Employee."Last Name";
            Directorate:=Employee."Global Dimension 1 Code";
             DimensionValue.Reset;
             if DimensionValue.Get('DIRECTORATE',Directorate) then
              "Directorate Name":=DimensionValue.Name;

            "Department Code":=Employee."Global Dimension 2 Code";
              DimensionValue.Reset;
              if DimensionValue.Get('DEPARTMENT',"Department Code") then
               "Department Name":=DimensionValue.Name;


           end;
        end;


        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date",0D,Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
        if AccPeriod.Find('+') then
        FiscalStart:=AccPeriod."Starting Date";
        //MESSAGE('%1',FiscalStart);
        "Period End Date":=CalcDate('1Y',FiscalStart)-1;
    end;

    trigger OnModify()
    begin
        if Status<>Status::Open then
        Error('You cannot modify a document that is already approved or pending approval');
    end;

    var
        Employee: Record Employee;
        OK: Boolean;
        AppraisalLines: Record "Appraisal Lines1";
        TrainingNeed: Text[250];
        DevelopmentNeed: Record "Appraisal Development Needs";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimensionValue: Record "Dimension Value";
        AccPeriod: Record "Accounting Period";
        FiscalStart: Date;
        UserSetup: Record "User Setup";
}

