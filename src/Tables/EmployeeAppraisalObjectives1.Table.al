Table 52193944 "Employee Appraisal Objectives1"
{
    DrillDownPageID = "Appraisal Objectives List";
    LookupPageID = "Appraisal Objectives List";

    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then
                "Job ID":=Employee.Position;
            end;
        }
        field(2;"Appraisal Category";Code[20])
        {
            TableRelation = "Appraisal Types1".Code;
        }
        field(3;"Appraisal Period";Code[20])
        {
            NotBlank = true;
            TableRelation = "Appraisal Periods1";

            trigger OnValidate()
            begin
                 EmpAppraisal.Reset;
                 EmpAppraisal.SetRange(EmpAppraisal."Employee No","Employee No");
                 EmpAppraisal.SetRange(EmpAppraisal."Appraisal Period","Appraisal Period");
                 if EmpAppraisal.Find('-') then
                 Error('You have already setup objectives for %1 on %2',EmpAppraisal."Appraisal Period",EmpAppraisal.Date);


                      AppraisalFormat.Reset;
                 // AppraisalFormat.SETRANGE(AppraisalFormat."Appraisal Code","Appraisal Category");
                 // AppraisalFormat.SETRANGE(AppraisalFormat."Appraisal Heading Type",AppraisalFormat."Appraisal Heading Type"::Objectives);
                  if AppraisalFormat.Find('-') then
                  repeat
                      AppraisalLines.Init;
                      AppraisalLines."Appraisal No":="Objective No";
                      AppraisalLines."Employee No":="Employee No";
                     // AppraisalLines."No.":=AppraisalFormat."Line No.";
                      AppraisalLines."Appraisal Type":="Appraisal Category";
                      AppraisalLines."Appraisal Period":="Appraisal Period";
                     // AppraisalLines.Objective:=;
                     // AppraisalLines.Measure:=;
                      AppraisalLines."Weighting(%)":=AppraisalFormat."Weighting(%)";
                      AppraisalLines.Description:=AppraisalFormat.Value;
                      AppraisalLines."Line No":=AppraisalLines."Line No"+1000;
                      AppraisalLines."Appraisal Heading Type":=AppraisalFormat."Appraisal Heading Type";
                      AppraisalLines."Strategic Perspective":=AppraisalFormat."Strategic Perspective";
                     // MESSAGE('PERSPECTIVE=%1',AppraisalFormat."Strategic Perspective");
                      AppraisalLines."Appraisal Header":=AppraisalFormat."Appraisal Header";
                      AppraisalLines.Bold:=AppraisalFormat.Bold;
                      if not AppraisalLines.Get(AppraisalLines."Appraisal No",AppraisalLines."Line No") then
                      AppraisalLines.Insert;


                  until AppraisalFormat.Next=0;
            end;
        }
        field(4;"No. Supervised (Directly)";Integer)
        {
        }
        field(5;"No. Supervised (In-Directly)";Integer)
        {
        }
        field(6;"Job ID";Code[20])
        {
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(7;"Agreement With Rating";Option)
        {
            OptionMembers = Entirely,Mostly,"To some extent","Not at all";
        }
        field(8;"General Comments";Text[250])
        {
        }
        field(9;Date;Date)
        {
        }
        field(10;Rating;Code[10])
        {
            TableRelation = "Appraisal Grades1";

            trigger OnValidate()
            begin
                  if AppraisalGrades.Get(Rating) then
                  "Rating Description":=AppraisalGrades.Description;
            end;
        }
        field(11;"Rating Description";Text[150])
        {
        }
        field(12;"Appraiser No";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Employee.Get("Appraiser No") then
                 "Appraisers Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            end;
        }
        field(13;"Appraisers Name";Text[50])
        {
        }
        field(14;"Appraisee ID";Code[30])
        {
        }
        field(15;"Appraiser ID";Code[30])
        {
        }
        field(16;"Appraisee Name";Text[50])
        {
        }
        field(17;"Job Group";Code[10])
        {
        }
        field(18;"Appraiser's Job Title";Text[100])
        {
        }
        field(19;"Appraisee's Job Title";Text[100])
        {
        }
        field(20;"Objective No";Code[20])
        {
        }
        field(21;"No. series";Code[10])
        {
        }
        field(27;Status;Option)
        {
            Editable = false;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(28;"Department Code";Code[20])
        {
        }
        field(29;"Directorate Code";Code[20])
        {
        }
        field(30;"Department Name";Text[50])
        {
        }
        field(31;"Directorate Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Objective No")
        {
        }
        key(Key2;"Employee No","Appraisal Category","Appraisal Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status<>Status::Open then
        Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin

        if "Objective No" = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Appraisal Objective Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Appraisal Objective Nos",xRec."No. series",0D,"Objective No","No. series");
        end;

         Date:=Today;

         ApraisalPeriods.Reset;
        // ApraisalPeriods.SETRANGE(ApraisalPeriods."End Date",0D,);
         if ApraisalPeriods.Find('-') then begin
         repeat
             if (ApraisalPeriods."Start Date"<=Date) and (ApraisalPeriods."End Date">=Date)then
               "Appraisal Period":=ApraisalPeriods.Period;

          until ApraisalPeriods.Next=0;
          end;



         if UserSetup.Get(UserId) then
         begin

           "Appraisee ID":=UserSetup."User ID";
           "Appraiser ID":=UserSetup."Immediate Supervisor";
           if Employee.Get(UserSetup."Employee No.") then
           begin
           "Employee No":=Employee."No.";
           "Appraisee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            "Job Group":=Employee."Salary Scale";
            "Job ID":=Employee.Position;
            "Appraisee's Job Title":=Employee."Job Title";
            "Department Code":=Employee."Global Dimension 2 Code";
            "Directorate Code":=Employee."Global Dimension 1 Code";


            DimensionValue.Reset;
            DimensionValue.SetRange(DimensionValue."Dimension Code",'DIRECTORATE');
            DimensionValue.SetRange(DimensionValue.Code,"Directorate Code");
            if DimensionValue.Find('-') then
             "Directorate Name":=DimensionValue.Name;


            DimensionValue.Reset;
            DimensionValue.SetRange(DimensionValue."Dimension Code",'DEPARTMENT');
            DimensionValue.SetRange(DimensionValue.Code,"Department Code");
            if DimensionValue.Find('-') then
             "Department Name":=DimensionValue.Name;

            AppraisalType.Reset;
            if AppraisalType.Find('-') then
            repeat
            if ((Employee."Salary Scale">=AppraisalType."Minimum Job Group") and (Employee."Salary Scale"<=AppraisalType."Maximum Job Group"
            )) then begin
           "Appraisal Category":=AppraisalType.Code;
           Validate("Appraisal Category");
            end;
            until AppraisalType.Next=0;

          end;

           if UserSetupSup.Get(UserSetup."Immediate Supervisor") then
           if Employee.Get(UserSetupSup."Employee No.") then
           begin
           "Appraiser No":=Employee."No.";
           "Appraisers Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
             "Appraiser's Job Title":=Employee."Job Title";
            end;

         end;

          // VALIDATE("Appraisal Period");
    end;

    trigger OnModify()
    begin
        if Status<>Status::Open then
        Error('You cannot modify a document that is already approved or pending approval');
    end;

    var
        Employee: Record Employee;
        AppraisalGrades: Record "Appraisal Grades1";
        AppraisalLines: Record "Appraisal Objectives Lines1";
        AppraisalFormat: Record "Appraisal Formats1";
        UserSetup: Record "User Setup";
        UserSetupSup: Record "User Setup";
        AppraisalType: Record "Appraisal Types1";
        CompanyJobs: Record "Company Jobsx1";
        HRsetup: Record "Human Resources Setup";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpAppraisal: Record "Employee Appraisal Objectives1";
        ApraisalPeriods: Record "Full Year Appraisal Periods";
        DimensionValue: Record "Dimension Value";
}

