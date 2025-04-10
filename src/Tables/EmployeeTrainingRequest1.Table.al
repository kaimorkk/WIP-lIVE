Table 52194029 "Employee Training Request1"
{
    DrillDownPageID = "Training Plan list";
    LookupPageID = "Training Plan list";

    fields
    {
        field(1;"Request No.";Code[20])
        {
        }
        field(2;"Request Date";Date)
        {
        }
        field(3;"Employee No";Code[10])
        {
            TableRelation = Employee;
        }
        field(4;"Employee Name";Text[80])
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
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
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
        field(11;"Training Insitution";Text[250])
        {
        }
        field(12;Venue;Text[250])
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
        field(18;Description;Text[250])
        {
        }
        field(19;"Planned Start Date";Date)
        {

            trigger OnValidate()
            begin
                 CalcFields(Budget,Actual,Commitment);
                 "Available Funds":=Budget-Actual-Commitment;


                AccPeriod.Reset;
                AccPeriod.SetRange(AccPeriod."Starting Date",0D,"Planned Start Date");
                AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
                if AccPeriod.Find('+') then
                FiscalStart:=AccPeriod."Starting Date";
                //MESSAGE('%1',FiscalStart);
                "Period End Date":=CalcDate('1Y',FiscalStart)-1;
            end;
        }
        field(20;"Planned End Date";Date)
        {

            trigger OnValidate()
            begin
                 CalcFields(Budget,Actual,Commitment);
                 "Available Funds":=Budget-Actual-Commitment;

                 "No. Of Days":=("Planned End Date"-"Planned Start Date")+1;
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
            TableRelation = Currency;
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

            trigger OnValidate()
            begin
                CalcFields(Budget,Actual);
                Variance:=Actual-Budget;
            end;
        }
        field(28;Commitment;Decimal)
        {
            // CalcFormula = sum("Commitment Register".Account where ("Committed Amount"=field("GL Account"),
            //                                                        User=field("Department Code")));
            // Editable = false;
            // FieldClass = FlowField;
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
        field(32;"Need Source";Option)
        {
            OptionCaption = 'Appraisal,Succesion,Training,Employee,Employee Skill Plan';
            OptionMembers = Appraisal,Succesion,Training,Employee,"Employee Skill Plan";
        }
        field(33;"Training Objective";Text[250])
        {
        }
        field(34;"User ID";Code[20])
        {
        }
        field(44;"Commisioner No";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                 DimVal.Reset;
                 DimVal.SetRange(DimVal.Code,"Commisioner No");
                 DimVal.SetRange(DimVal."Global Dimension No.",2);
                 if DimVal.Find('-') then
                 "Commissioner Name":=DimVal.Name;
            end;
        }
        field(45;"Commissioner Name";Text[30])
        {
        }
        field(46;Commissioner;Boolean)
        {
        }
        field(47;"Source of Funding";Option)
        {
            OptionCaption = 'CMA Funded,Partner Funded';
            OptionMembers = "CMA Funded","Partner Funded";
        }
        field(48;Variance;Decimal)
        {
        }
        field(49;"Group or Individual";Option)
        {
            OptionCaption = 'Individual,Group';
            OptionMembers = Individual,Group;
        }
        field(50;Sessions;Integer)
        {
        }
        field(51;Remarks;Text[250])
        {
        }
        field(52;"Local or Abroad";Option)
        {
            OptionCaption = 'Local,Abroad';
            OptionMembers = "Local",Abroad;
        }
        field(53;"Period End Date";Date)
        {
        }
        field(54;"No. of Approvals";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Table ID"=const(51511365),
                                                        "Document No."=field("Request No.")));
            FieldClass = FlowField;
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
          HumanResSetup.TestField(HumanResSetup."Training Request Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Training Request Nos",xRec."No. Series",0D,"Request No.","No. Series");
        "GL Account":=HumanResSetup."Account No (Training)";
        end;
         "Request Date":=Today;
        
         "User ID":=UserId;
         /*
          IF UserSetup.GET(USERID) THEN
          BEGIN
          "Employee No":=UserSetup."Employee No.";
           IF empl.GET(UserSetup."Employee No.") THEN
           "Employee Name":=empl."First Name"+ ' '+empl."Middle Name"+' '+empl."Last Name";
           "Department Code":=empl."Global Dimension 1 Code";
            Designation:=empl."Job Title";
          END;
         */
        if CompanyInfo.Get then
        "CBK Website Address":=CompanyInfo."CBK Web Address";
        
        if PurchSetup.Get then
        "Budget Name":=PurchSetup."Effective Procurement Plan";

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
        DimVal: Record "Dimension Value";
        AccPeriod: Record "Accounting Period";
        FiscalStart: Date;
}

