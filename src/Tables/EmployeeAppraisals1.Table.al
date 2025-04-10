Table 52193918 "Employee Appraisals1"
{
    DrillDownPageID = "Employee Appraisals List";
    LookupPageID = "Employee Appraisals List";

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
                  AppraisalFormat.Reset;
                  AppraisalFormat.SetRange(AppraisalFormat."Employee No","Employee No");
                  AppraisalFormat.SetRange(AppraisalFormat."Appraisal Period","Appraisal Period");
                  AppraisalFormat.SetRange(AppraisalFormat.Approved,true);
                  //AppraisalFormat.SETFILTER(AppraisalFormat."Appraisal Heading Type",'<>%1',AppraisalFormat."Appraisal Heading Type"::Objectives);
                  if AppraisalFormat.Find('-') then
                  repeat
                      AppraisalLines.Init;
                      AppraisalLines."Appraisal No":="Appraisal No";
                      AppraisalLines."Employee No":="Employee No";
                      AppraisalLines."Appraisal Category":="Appraisal Category";
                      AppraisalLines."Appraisal Period":="Appraisal Period";
                      AppraisalLines."Appraisal Year":="Appraisal Year";
                      AppraisalLines.Description:=AppraisalFormat.Description;
                      AppraisalLines.Measure:=AppraisalFormat.Measure;
                      AppraisalLines."Weighting(%)":=AppraisalFormat."Weighting(%)";
                      AppraisalLines."Line No":=AppraisalLines."Line No"+1000;
                      AppraisalLines."Appraisal Heading Type":=AppraisalFormat."Appraisal Heading Type";
                      AppraisalLines.Validate(AppraisalLines."Appraisal Heading Type");
                      AppraisalLines."Appraisal Header":=AppraisalFormat."Appraisal Header";
                      AppraisalLines."Strategic Perspective":=AppraisalFormat."Strategic Perspective";
                      AppraisalLines.Bold:=AppraisalFormat.Bold;
                      if not AppraisalLines.Get(AppraisalLines."Appraisal No",AppraisalLines."Line No") then
                      AppraisalLines.Insert;

                    ObjectiveMeasures.Reset;
                    ObjectiveMeasures.SetRange(ObjectiveMeasures."Appraisal No",AppraisalFormat."Appraisal No");
                    ObjectiveMeasures.SetRange(ObjectiveMeasures.ObjectiveID,AppraisalFormat."Line No");
                    if ObjectiveMeasures.Find('-') then
                     repeat
                       ObjectivePerformanceMeasures.Init;
                       ObjectivePerformanceMeasures.ObjectiveID:=AppraisalLines."Line No";
                       ObjectivePerformanceMeasures."Appraisal No":="Appraisal No";
                       ObjectivePerformanceMeasures."Measure Description":=ObjectiveMeasures."Measure Description";
                       ObjectivePerformanceMeasures."Weighting(%)":=ObjectiveMeasures."Weighting(%)";
                       ObjectivePerformanceMeasures.Insert;
                     until ObjectiveMeasures.Next=0;


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
            TableRelation = "Appraisal Grades1".Grade;

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
        field(20;"Appraisal No";Code[20])
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
        field(28;"Deapartment Code";Code[20])
        {
        }
        field(29;"Appraisal Type";Text[120])
        {
            TableRelation = "Appraisal Category1"."Appraissal Category";
        }
        field(30;"Wizard Step";Option)
        {
            OptionMembers = ,"1","2";
        }
        field(31;"TC Weighted Ratings";Decimal)
        {
            CalcFormula = sum("Appraisal Lines1"."Weighted Ratings(%)" where ("Appraisal No"=field("Appraisal No"),
                                                                              "Appraisal Heading Type"=const("Technical Competencies")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                 HumanResSetup.Get;
                 CalcFields("TC Weighted Ratings") ;
                 "TC Overall Score":=HumanResSetup."Technical Competence Overall %"*("TC Weighted Ratings"/100);
            end;
        }
        field(32;"BC Weighted Ratings";Decimal)
        {
            CalcFormula = sum("Appraisal Lines1"."Weighted Ratings(%)" where ("Appraisal No"=field("Appraisal No"),
                                                                              "Appraisal Heading Type"=const("Behavioural Competencies")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                 HumanResSetup.Get;
                 CalcFields("BC Weighted Ratings") ;
                 "BC Overall Score":=HumanResSetup."Behaviour Competence Overall %"*("BC Weighted Ratings"/100);
            end;
        }
        field(33;"TC Overall Score";Decimal)
        {
        }
        field(34;"BC Overall Score";Decimal)
        {
        }
        field(35;"Appraisal Year";Code[20])
        {
        }
        field(36;"Department Name";Text[50])
        {
        }
        field(37;"Directorate Code";Code[20])
        {
        }
        field(38;"Directorate Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Appraisal No")
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
        if "Appraisal No" = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Appraisal Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Appraisal Nos",xRec."No. series",0D,"Appraisal No","No. series");
        end;
        
         Date:=Today;
        /*
         ApraisalPeriods.RESET;
        // ApraisalPeriods.SETRANGE(ApraisalPeriods."End Date",0D,);
         IF ApraisalPeriods.FIND('-') THEN BEGIN
         REPEAT
             IF (ApraisalPeriods."Start Date"<=Date) AND (ApraisalPeriods."End Date">=Date)THEN
               "Appraisal Period":=ApraisalPeriods.Period;
          UNTIL ApraisalPeriods.NEXT=0;
          END;
        */
         ApraisalYears.Reset;
        // ApraisalPeriods.SETRANGE(ApraisalPeriods."End Date",0D,);
         if ApraisalYears.Find('-') then begin
         repeat
             if (ApraisalYears."Start Date"<=Date) and (ApraisalYears."End Date">=Date)then
               "Appraisal Year":=ApraisalYears.Period;
          until ApraisalYears.Next=0;
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
           "Appraisee's Job Title":=Employee."Job Title";
           "Deapartment Code":=Employee."Global Dimension 2 Code";
           "Directorate Code":=Employee."Global Dimension 1 Code";
        
        
            DimensionValue.Reset;
            DimensionValue.SetRange(DimensionValue."Dimension Code",'DIRECTORATE');
            DimensionValue.SetRange(DimensionValue.Code,"Directorate Code");
            if DimensionValue.Find('-') then
             "Directorate Name":=DimensionValue.Name;
        
        
            DimensionValue.Reset;
            DimensionValue.SetRange(DimensionValue."Dimension Code",'DEPARTMENT');
            DimensionValue.SetRange(DimensionValue.Code,"Deapartment Code");
            if DimensionValue.Find('-') then
             "Department Name":=DimensionValue.Name;
        
           end;
        
            AppraisalType.Reset;
            if AppraisalType.Find('-') then
            repeat
           // IF ((Employee."Salary Scale">=AppraisalType."Minimum Job Group") AND (Employee."Salary Scale"<=AppraisalType."Maximum Job Group"
           // )) THEN BEGIN
           "Appraisal Category":=AppraisalType.Code;
           Validate("Appraisal Category");
           // END;
            until AppraisalType.Next=0;
        
           if UserSetupSup.Get(UserSetup."Immediate Supervisor") then
           if Employee.Get(UserSetupSup."Employee No.") then
           begin
           "Appraiser No":=Employee."No.";
           "Appraisers Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
             "Appraiser's Job Title":=Employee."Job Title";
            end;
        
         end;
         /*
         EmpAppraisal.RESET;
         EmpAppraisal.SETRANGE(EmpAppraisal."Employee No","Employee No");
         EmpAppraisal.SETRANGE(EmpAppraisal."Appraisal Category","Appraisal Category");
         EmpAppraisal.SETRANGE(EmpAppraisal."Appraisal Period","Appraisal Period");
         EmpAppraisal.SETRANGE(EmpAppraisal."Appraisal Type","Appraisal Type");
         IF EmpAppraisal.FIND('-') THEN
         ERROR('You have already created %1 appraisal for %2',"Appraisal Type","Appraisal Period");
         */

    end;

    trigger OnModify()
    begin
         HumanResSetup.Get;
         CalcFields("TC Weighted Ratings") ;
         "TC Overall Score":=HumanResSetup."Technical Competence Overall %"*("TC Weighted Ratings"/100);


         HumanResSetup.Get;
         CalcFields("BC Weighted Ratings") ;
         "BC Overall Score":=HumanResSetup."Behaviour Competence Overall %"*("BC Weighted Ratings"/100);

        if Status<>Status::Open then
        Error('You cannot modify a document that is already approved or pending approval');
    end;

    var
        Employee: Record Employee;
        AppraisalGrades: Record "Appraisal Grades1";
        AppraisalLines: Record "Appraisal Lines1";
        AppraisalFormat: Record "Appraisal Objectives Lines1";
        UserSetup: Record "User Setup";
        UserSetupSup: Record "User Setup";
        AppraisalType: Record "Appraisal Types1";
        CompanyJobs: Record "Company Jobsx1";
        HRsetup: Record "Human Resources Setup";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpAppraisal: Record "Employee Appraisals1";
        ApraisalPeriods: Record "Appraisal Periods1";
        ApraisalYears: Record "Full Year Appraisal Periods";
        DimensionValue: Record "Dimension Value";
        ObjectiveMeasures: Record "Objectives Measures";
        ObjectivePerformanceMeasures: Record "Objective Performance Measures";


    procedure StartWizard2()
    var
        InteractionTmplSetup: Record "Interaction Template Setup";
        Campaign: Record Campaign;
    begin
        //InteractionTmplSetup.GET;
        //InteractionTmplSetup.TESTFIELD(InteractionTmplSetup."Outg. Calls");
        
        "Wizard Step" := "wizard step"::"1";
        /*
        IF Date = 0D THEN
          Date := TODAY;
        "Time of Interaction" := TIME;
        "Interaction Successful" := TRUE;
        "Dial Contact" := TRUE;
        
        IF Campaign.GET(GETFILTER("Campaign No.")) THEN
          "Campaign Description" := Campaign.Description;
        "Wizard Contact Name" := GetContactName;
         */
        Insert;
        //VALIDATE("Interaction Template Code",InteractionTmplSetup."Outg. Calls");
        //FORM.RUNMODAL(FORM::"Make Phone Call",Rec,"Contact Via");

    end;


    procedure PerformNextWizardStatus2()
    var
        InteractTmpl: Record "Interaction Template";
    begin
        "Wizard Step" := "Wizard Step" + 1;
    end;


    procedure PerformPrevWizardStatus2()
    begin
        "Wizard Step" := "Wizard Step" - 1;
    end;


    procedure PerformPostStep2()
    begin
        /*
        CASE "Wizard Step" OF
          "Wizard Step"::"2":
        
            IF "Dial Contact" THEN BEGIN
              IF TAPIManagement.Dial("Contact Via") THEN
                "Dial Contact" := FALSE;
            END ELSE
              ERROR(Text010);
        
        END;
         */

    end;


    procedure CheckStatus2()
    var
        InteractTmpl: Record "Interaction Template";
        Attachment: Record Attachment;
        SalutationFormula: Record "Salutation Formula";
    begin
        /*
        IF "Wizard Step" = "Wizard Step"::"1" THEN BEGIN
          IF "Dial Contact" AND ("Contact Via" = '') THEN
            ERROR(Text013);
          IF Date = 0D THEN
            ErrorMessage(FIELDCAPTION(Date));
          IF Description = '' THEN
            ErrorMessage(FIELDCAPTION(Description));
          IF "Salesperson Code" = '' THEN
            ErrorMessage(FIELDCAPTION("Salesperson Code"));
        END;
        */

    end;


    procedure FinishWizard2(): Boolean
    var
        SegManagement: Codeunit SegManagement;
        TempAttachment: Record Attachment temporary;
        SegLine: Record "Employee Appraisals1";
    begin
        //"Attempt Failed" := NOT "Interaction Successful";
        
        //SegManagement.LogInteraction(Rec,TempAttachment,InterLogEntryCommentLineTmp,FALSE,FALSE);
        /*
        IF SegLine.GET("Appraisal No") THEN BEGIN
          SegLine.LOCKTABLE;
        //  SegLine."Contact Via" := "Contact Via";
          SegLine."Wizard Step" := SegLine."Wizard Step"::" ";
          SegLine.MODIFY;
        END;
         */

    end;


    procedure StartWizard()
    var
        Opp: Record Opportunity;
    begin
        /*
         IF Campaign.GET("Campaign No.") THEN
          "Campaign Description" := Campaign.Description;
         IF Opp.GET("Opportunity No.") THEN
          "Opportunity Description" := Opp.Description;
          "Wizard Contact Name" := GetContactName;
        */
         "Wizard Step" := "wizard step"::"1";
        /*
         "Interaction Successful" := TRUE;
         VALIDATE(Date,WORKDATE);
         INSERT;
         FORM.RUNMODAL(FORM::"Create Interaction",Rec,"Interaction Template Code");
        */

    end;


    procedure PerformNextWizardStatus()
    begin

        case "Wizard Step" of
          "wizard step"::"1":
           // BEGIN
            //  InteractTmpl.GET("Interaction Template Code");
             // IF InteractTmpl."Wizard Action" <> InteractTmpl."Wizard Action"::" " THEN
                "Wizard Step" := "wizard step"::"1";
             // END
         // ELSE

        //IF "Wizard Step" = "Wizard Step"::"2" THEN
        end;

        //"Wizard Step" := "Wizard Step" + 1;
    end;


    procedure PerformPrevWizardStatus()
    begin
        case "Wizard Step" of
          "wizard step"::"1":
            "Wizard Step" := "wizard step"::"1";
          else
            "Wizard Step" := "Wizard Step" - 1;
        end;
    end;


    procedure CheckStatus()
    var
        InteractTmpl: Record "Interaction Template";
        Attachment: Record Attachment;
        SalutationFormula: Record "Salutation Formula";
    begin
        /*
        CASE "Wizard Step" OF
          "Wizard Step"::"1":
            BEGIN
              IF "Contact No." = '' THEN
                ERROR(Text006);
              IF "Interaction Template Code" = '' THEN
                ErrorMessage(FIELDCAPTION("Interaction Template Code"));
              IF"Salesperson Code" = '' THEN
                ErrorMessage(FIELDCAPTION("Salesperson Code"));
              IF Date = 0D THEN
                ErrorMessage(FIELDCAPTION(Date));
              IF Description = '' THEN
                ErrorMessage(FIELDCAPTION(Description));
        
              InteractTmpl.GET("Interaction Template Code");
              IF InteractTmpl."Wizard Action" = InteractTmpl."Wizard Action"::Open THEN
                IF "Attachment No." = 0 THEN
                  ErrorMessage(Attachment.TABLECAPTION);
        
              Cont.GET("Contact No.");
              SalutationFormula.GET(Cont."Salutation Code","Language Code",0);
              SalutationFormula.GET(Cont."Salutation Code","Language Code",1);
            END;
          "Wizard Step"::"2":;
          "Wizard Step"::"3":
            BEGIN
              IF AttachmentTemp.FIND('-') THEN
                AttachmentTemp.CALCFIELDS(Attachment);
              IF ("Correspondence Type" = "Correspondence Type"::"E-Mail") AND
                 ("Attachment No." = 0)
              THEN
                ERROR(Text008);
            END;
          "Wizard Step"::"4":;
        END;
           */

    end;


    procedure FinishWizard(IsFinish: Boolean;var AttachmentTmp: Record Attachment): Boolean
    var
        SegManagement: Codeunit SegManagement;
        send: Boolean;
        Flag: Boolean;
    begin
        /*
        Flag := FALSE;
        IF IsFinish THEN
          Flag := TRUE
        ELSE
          Flag := CONFIRM(Text007);
        
        IF Flag THEN BEGIN
          AttachmentTemp.COPY(AttachmentTmp);
          "Attempt Failed" := NOT "Interaction Successful";
          Subject := Description;
          ProcessPostponedAttachment;
          send := (IsFinish AND ("Correspondence Type" <> "Correspondence Type"::" "));
          SegManagement.LogInteraction(Rec,AttachmentTemp,InterLogEntryCommentLineTmp,send,NOT IsFinish)
        END;
        DELETE
         */

    end;


    procedure ErrorMessage(FieldName: Text[1024])
    begin
        //ERROR(Text005,FieldName);
    end;
}

