Table 52193985 "AIT Header"
{
    DrillDownPageID = "Training Evaluation List";
    LookupPageID = "Training Evaluation List";

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Assessment  Date";Date)
        {
        }
        field(3;"Employee No";Code[10])
        {
            TableRelation = Employee;
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
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(7;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(8;Designation;Text[100])
        {
        }
        field(9;Period;DateFormula)
        {
        }
        field(10;"No. Of Days";Decimal)
        {
        }
        field(11;"Training Insitution";Text[50])
        {
        }
        field(12;Venue;Text[30])
        {

            trigger OnValidate()
            begin
                 CalcFields(Budget,Actual,Commitment);
                 "Available Funds":=Budget-Actual-Commitment;
            end;
        }
        field(13;"Tuition Fee";Decimal)
        {

            trigger OnValidate()
            begin
                "Total Cost":="Tuition Fee"+"Per Diem"+"Air Ticket";
            end;
        }
        field(14;"Per Diem";Decimal)
        {

            trigger OnValidate()
            begin
                "Total Cost":="Tuition Fee"+"Per Diem"+"Air Ticket";
            end;
        }
        field(15;"Air Ticket";Decimal)
        {

            trigger OnValidate()
            begin
                "Total Cost":="Tuition Fee"+"Per Diem"+"Air Ticket";
            end;
        }
        field(16;"Total Cost";Decimal)
        {
        }
        field(17;"Course Title";Code[20])
        {
            NotBlank = true;
            TableRelation = "Training Needs1".Code;

            trigger OnValidate()
            begin
                if TrainingNeeds.Get("Course Title") then
                Description:=TrainingNeeds.Description;
            end;
        }
        field(18;Description;Text[150])
        {
        }
        field(19;"Planned Start Date";Date)
        {

            trigger OnValidate()
            begin
                 CalcFields(Budget,Actual,Commitment);
                 "Available Funds":=Budget-Actual-Commitment;
            end;
        }
        field(20;"Planned End Date";Date)
        {

            trigger OnValidate()
            begin
                 CalcFields(Budget,Actual,Commitment);
                 "Available Funds":=Budget-Actual-Commitment;
            end;
        }
        field(21;"Country Code";Code[10])
        {
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                 if CountryRec.Get("Country Code") then
                 begin
                 Currency:=CountryRec."Currency Label";
                 end;
            end;
        }
        field(22;"CBK Website Address";Text[250])
        {
        }
        field(23;"Exchange Rate";Decimal)
        {
            DecimalPlaces = 4:4;

            trigger OnValidate()
            begin
                "Total Cost (LCY)":="Exchange Rate" *"Total Cost";
                 CalcFields(Budget,Actual,Commitment);
                 "Available Funds":=Budget-Actual-Commitment;
            end;
        }
        field(24;"Total Cost (LCY)";Decimal)
        {
        }
        field(25;Currency;Code[10])
        {
        }
        field(26;Budget;Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where ("Budget Name"=field("Budget Name"),
                                                               "G/L Account No."=field("GL Account"),
                                                               "Global Dimension 1 Code"=field("Department Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27;Actual;Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where ("G/L Account No."=field("GL Account"),
                                                        "Global Dimension 1 Code"=field("Department Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28;Commitment;Decimal)
        {
            CalcFormula = sum("Commitment Register"."Committed Amount" where (Account=field("GL Account"),
                                                                   User=field("Department Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29;"GL Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(30;"Budget Name";Code[10])
        {
            Caption = 'Fiscal Year';
            TableRelation = "G/L Budget Name";
        }
        field(31;"Available Funds";Decimal)
        {
        }
        field(32;"Request No";Code[20])
        {
            TableRelation = "Training Request1" where (Status=const(Released));

            trigger OnValidate()
            begin
                if TrainingReq.Get("Request No") then
                begin
                 "Employee No":=TrainingReq."Employee No";
                 "Employee Name":=TrainingReq."Employee Name";
                 "Department Code":=TrainingReq."Department Code";
                 Designation:=TrainingReq.Designation;
                 "Training Insitution":=TrainingReq."Training Insitution";
                 Venue:=TrainingReq.Venue;
                 Description:=TrainingReq.Description;
                 "Planned Start Date":=TrainingReq."Planned Start Date";
                 "Planned End Date":=TrainingReq."Planned End Date";
                 "No. Of Days":=TrainingReq."No. Of Days";
                //AES SACCO V 2.0
                /*TrainingEvalTemplate.RESET;
                TrainingEvalTemplate.SETRANGE(TrainingEvalTemplate."AIT/Evaluation",TrainingEvalTemplate."AIT/Evaluation"::"1");
                IF TrainingEvalTemplate.FIND('-') THEN*/
                //AES SACCO V 2.0
                repeat
                TrainingEvalLines.Init;
                TrainingEvalLines."Evaluation No":="No.";
                TrainingEvalLines.Question:=TrainingEvalTemplate.Question;
                TrainingEvalLines."Line No":=TrainingEvalTemplate."Line No";
                TrainingEvalLines.Bold:=TrainingEvalTemplate.Bold;
                TrainingEvalLines."Answer Type":=TrainingEvalTemplate."Answer Type";
                if not TrainingEvalLines.Get(TrainingEvalLines."Line No",TrainingEvalLines."Evaluation No") then
                TrainingEvalLines.Insert
                
                
                until TrainingEvalTemplate.Next=0;
                
                
                end;

            end;
        }
        field(33;"User ID";Code[20])
        {
        }
        field(34;"Qualification Type";Option)
        {
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(35;"Qualification Code";Code[10])
        {
            TableRelation = Qualification.Code where ("Qualification Type"=field("Qualification Type"));
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Training Evaluation Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Training Evaluation Nos",xRec."No. Series",0D,"No.","No. Series");
        "GL Account":=HumanResSetup."Account No (Training)";
        end;
         "Assessment  Date":=Today;
         "User ID":=UserId;
          if UserSetup.Get(UserId) then
          begin
          "Employee No":=UserSetup."Employee No.";
           if empl.Get(UserSetup."Employee No.") then
           "Employee Name":=empl."First Name"+ ' '+empl."Middle Name"+' '+empl."Last Name";
           "Department Code":=empl."Global Dimension 1 Code";
            Designation:=empl."Job Title";
          end;
        
                 /*
        IF CompanyInfo.GET THEN
        "CBK Website Address":=CompanyInfo."CBK Web Address";
        
        IF PurchSetup.GET THEN
        "Budget Name":=PurchSetup."Effective Procurement Plan"; */

    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        empl: Record Employee;
        TrainingNeeds: Record "Training Needs1";
        CountryRec: Record "Country/Region";
        CompanyInfo: Record "Company Information";
        PurchSetup: Record "Purchases & Payables Setup";
        TrainingReq: Record "Training Request1";
        TrainingEvalTemplate: Record "Training Evaluation Template1";
        TrainingEvalLines: Record "Training Evaluation Lines1";
}

