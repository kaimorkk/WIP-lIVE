TableExtension 52193650 tableextension52193650 extends Contact
{
    fields
    {
        modify("Company No.")
        {
            TableRelation = Contact."No." where(Type = const(Company));
        }

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          RMSetup.GET;
          NoSeriesMgt.TestManual(RMSetup."Contact Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          IF "Portal Request"=FALSE THEN BEGIN
        #2..4
          END ELSE BEGIN
            ProcSetup.GET;
          NoSeriesMgt.TestManual(ProcSetup."Request For Registration Nos");
          "No. Series" := '';

            END;
        END;
        */
        //end;
        field(11; "Application Type"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Acc Fee Schedules" where(Blocked = filter(false));

            trigger OnValidate()
            var
            // AccreditationType: Record "Accreditation Type Series";
            begin
                // AccreditationType.RESET;
                // AccreditationType.SETRANGE(Code,"Application Type");
                // IF AccreditationType.FINDFIRST THEN BEGIN
                // "Application Type Name":=AccreditationType.Description;
                //  AccFeeSchedules.RESET;
                //  AccFeeSchedules.SETRANGE(Service,AccreditationType.Code);
                //  IF AccFeeSchedules.FINDFIRST THEN BEGIN
                //    "Application Fee LCY":=AccFeeSchedules.Amount;
                //    "Application Fee":="Application Fee LCY"*1;
                //
                //    END;
                //
                // END
            end;
        }
        field(30; "Institution Type Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Institution Types";

            trigger OnValidate()
            begin
                InstitutionTypes.Reset;
                InstitutionTypes.SetRange(Code, "Institution Type Code");
                if InstitutionTypes.FindFirst then begin
                    "Institution Type" := InstitutionTypes.Description;
                end
            end;
        }
        field(31; "Institution Type"; Text[150])
        {
            DataClassification = CustomerContent;
        }
        field(153; contactName; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(88000; test; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(88001; password; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(88002; "KRA PIN"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(88003; "Tax Compliance Certificate No"; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(88004; "Director 1 Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(88005; "Director 2 Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(88006; "Director 3 Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(88007; Group; Code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Stakeholder Group".Code;
        }
        field(88008; "Sub-Group"; Code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Stakeholder Sub-Group".Code where("Stakeholder Group" = field(Group));
        }
        field(88009; "Parent Contact ID"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(88010; "Entity Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Organization,Individual';
            OptionMembers = Organization,Individual;
        }
        field(88011; UserVerified; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(88012; "ID Number"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(88013; "Portal Request"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(88014; "Applicant Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,E-Procurment,E-Recruitment,ESS';
            OptionMembers = " ","E-Procurment","E-Recruitment",ESS;
        }

        field(85000; "Course ID"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85001; Disabled; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85002; "NCPWD No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85003; "Kasneb Reference No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85004; "Training Institution Code"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85005; "Date of Birth"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(85006; Created; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85007; "Registration Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(85008; Gender; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Male,Female,Other;
        }
        field(85009; "Created By"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85010; "Created On"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(85011; "Assigned Registration No."; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85012; "Approval Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(85013; "Highest Academic QCode"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85014; "Highest Academic Qualification"; Text[50])
        {
            CalcFormula = lookup(Qualification.Description);
            FieldClass = FlowField;
        }
        field(85015; "Course Description"; Text[50])
        {
            CalcFormula = lookup(Qualification.Description);
            FieldClass = FlowField;
        }
        field(85016; "Reason for Rejection"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(85017; "Assigned Customer No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(85018; "Applicant Category"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Work Type";
        }
        field(85019; "Exam Transaction Type"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(85020; "Training Institution"; Text[50])
        {
            CalcFormula = lookup(Customer.Name);
            FieldClass = FlowField;
        }
        field(85021; Student; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = New,Existing;
        }
        field(85022; "Record Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Contact,Student,Job Applicant,Employee';
            OptionMembers = Contact,Student,"Job Applicant",Employee;
        }
        field(85023; Generated; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85024; "Employee No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee;
        }
    }


    procedure FnSendEmaiNotificationOnAccountActivation(Vendor: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        LincensinggSetup: Record "Procurement Setup";
    begin
        //Notifying Procurement Team on supplier Request


        CompInfo.GET;
        HRSetup.GET;
        PPayableSetup.GET;
        LincensinggSetup.GET;

        RequesterEmail := Vendor."E-Mail";
        RequesterName := Vendor.Name;

        Window.OPEN('Sending...');

        WindowisOpen := TRUE;


        Counter := Counter + 1;
        PortalUser.RESET;
        PortalUser.SETRANGE("User Name", Vendor."E-Mail");
        IF PortalUser.FINDSET THEN
            Password := PortalUser."Password Value";

        //Create message
        IF HRSetup."E-Mail" = '' THEN
            ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";

        IF LincensinggSetup."Default Proc Email Contact" = '' THEN
            ERROR('Please Contact the IT Admin to specify the SREQ E-mail address under Licensing Setup page!!');
        CustEmail := LincensinggSetup."Default Proc Email Contact";

        CompanyDetails := 'Dear Applicant,';
        SenderMessage := 'This is to notify you that an account has been created for you on the ' + CompInfo.Name + ' portal for e-Procurement student recruitment agencies' +
        ' with the following registration details:-</BR>';
        SupplierDetails := '1. Registration Request Reference No: ' + Vendor."No." + '</BR>' + '2. Company Name: ' + Vendor.Name + '</BR>' +
        '3. e-Mail: ' + Vendor."E-Mail" +
        '<BR>4. Mobile Telephone No: ' + Vendor."Phone No." + '</BR>';
        LoginDetails := CompInfo.Name + ' has also created your portal access account with the following login credentials:' +
        'User Name: ' + Vendor."E-Mail" + ' ' + 'Password: ' + Password + '.<BR>To access our portal and complete your registration, click on the ' +
        '<a href="' + CompInfo."Home Page" + '"><b>Link</b></a><BR>';
        ActivationDetails := '<BR><BR>Once you access our portal, you will be able to complete your supplier profile:</BR></BR>';

        ProcNote := 'Please contact Judiciary team(Telephone No: ' + HRSetup."Phone No." + ');(Email:' + LincensinggSetup."Default Proc Email Contact" + ')';

        IF CustEmail = '' THEN
            EXIT;

        //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        emailhdr := CompInfo.Name + ' Supplier Account Activation';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, TRUE);

        // //cu400.AddCC(RequesterEmail);

        // cu400.AppendBody(ProcNote);

        EmailMessage.Create(RequesterEmail, emailhdr,

       CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails + ProcNote, TRUE);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        SendingDate := TODAY;
        SendingTime := TIME;

        SLEEP(1000);
        Window.CLOSE;
    end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RMSetup.GET;

    IF "No." = '' THEN BEGIN
      RMSetup.TESTFIELD("Contact Nos.");
      NoSeriesMgt.InitSeries(RMSetup."Contact Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF NOT SkipDefaults THEN BEGIN
    #9..26

    TypeChange;
    SetLastDateTimeModified;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      IF "Portal Request"=FALSE THEN BEGIN
      RMSetup.TESTFIELD("Contact Nos.");
      NoSeriesMgt.InitSeries(RMSetup."Contact Nos.",xRec."No. Series",0D,"No.","No. Series");
      END;

      IF "Portal Request" = TRUE THEN BEGIN
        ProcSetup.GET;
        ProcSetup.TESTFIELD(ProcSetup."Request For Registration Nos");
       NoSeriesMgt.InitSeries(ProcSetup."Request For Registration Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
    #6..29
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: PortalUSer) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: RandomDigit) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: Procurement) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: entryno) (VariableCollection) on "CreateVendor(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "CreateVendor(PROCEDURE 7)".

    //procedure CreateVendor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckForExistingRelationships(ContBusRel."Link to Table"::Vendor);
    CheckIfPrivacyBlockedGeneric;
    TESTFIELD("Company No.");
    RMSetup.GET;
    RMSetup.TESTFIELD("Bus. Rel. Code for Vendors");

    CLEAR(Vend);
    Vend.SetInsertFromContact(TRUE);
    OnBeforeVendorInsert(Vend);
    Vend.INSERT(TRUE);
    Vend.SetInsertFromContact(FALSE);

    IF Type = Type::Company THEN
      ContComp := Rec
    ELSE
      ContComp.GET("Company No.");

    ContBusRel."Contact No." := ContComp."No.";
    ContBusRel."Business Relation Code" := RMSetup."Bus. Rel. Code for Vendors";
    ContBusRel."Link to Table" := ContBusRel."Link to Table"::Vendor;
    ContBusRel."No." := Vend."No.";
    ContBusRel.INSERT(TRUE);

    OnAfterVendorInsert(Vend,Rec);

    UpdateCustVendBank.UpdateVendor(ContComp,ContBusRel);

    IF OfficeMgt.IsAvailable THEN
      PAGE.RUN(PAGE::"Vendor Card",Vend)
    ELSE
      IF NOT HideValidationDialog THEN
        MESSAGE(RelatedRecordIsCreatedMsg,Vend.TABLECAPTION);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     CheckForExistingRelationships(ContBusRel."Link to Table"::Vendor);
     CheckIfPrivacyBlockedGeneric;
     TESTFIELD("Company No.");
     RMSetup.GET;
     RMSetup.TESTFIELD("Bus. Rel. Code for Vendors");
     ProcSetup.GET;
     CLEAR(Vend);
     Vend.SetInsertFromContact(TRUE);
     OnBeforeVendorInsert(Vend);
     //added by daudi
     Vend."Gen. Bus. Posting Group":=ProcSetup."Default General Product PG";
     Vend."Vendor Posting Group":=ProcSetup."Default Vendor PG";
     Vend.INSERT(TRUE);
     Vend.SetInsertFromContact(FALSE);

     IF Type = Type::Company THEN
      ContComp := Rec
     ELSE
      ContComp.GET("Company No.");

     ContBusRel."Contact No." := ContComp."No.";
     ContBusRel."Business Relation Code" := RMSetup."Bus. Rel. Code for Vendors";
     ContBusRel."Link to Table" := ContBusRel."Link to Table"::Vendor;
     ContBusRel."No." := Vend."No.";
     ContBusRel.INSERT(TRUE);

     OnAfterVendorInsert(Vend,Rec);

     UpdateCustVendBank.UpdateVendor(ContComp,ContBusRel);
    // Update Dynasoft Portal user
    PortalUSer.RESET;
    IF PortalUSer.FINDLAST THEN
      entryno:=PortalUSer."Entry No";
    PortalUSer.RESET;
    PortalUSer.SETRANGE("User Name","E-Mail");
    IF NOT PortalUSer.FINDSET THEN BEGIN
      PortalUSer.INIT;
      PortalUSer."Entry No":=entryno+1;
      PortalUSer."User Name":="E-Mail";
      PortalUSer."Full Name":=Name;
      PortalUSer."Authentication Email":="E-Mail";
      PortalUSer."Mobile Phone No.":="Phone No.";
      PortalUSer.State:=PortalUSer.State::Enabled;
      PortalUSer."Record Type":=PortalUSer."Record Type"::Vendor;
      PortalUSer."Record ID":=Vend."No.";

    RandomDigit := CREATEGUID;
    RandomDigit := DELCHR(RandomDigit,'=','{}-01');
    RandomDigit := COPYSTR(RandomDigit,1,8);
    //MESSAGE(RandomDigit);
      PortalUSer."Password Value":=RandomDigit;
      PortalUSer.INSERT;
     Procurement.FnSendEmaiNotificationOnSupplierAccountActivation(Rec);
      END;




     IF OfficeMgt.IsAvailable THEN
      PAGE.RUN(PAGE::"Vendor Card",Vend)
     ELSE
      IF NOT HideValidationDialog THEN
        MESSAGE(RelatedRecordIsCreatedMsg,Vend.TABLECAPTION);
    */
    //end;

    var
        ProcSetup: Record "Procurement Setup";
        InstitutionTypes: Record "Institution Types";


    procedure AddText(Text: Text[249]): Text[250]
    begin
        if Text <> '' then
            exit(Text + ' ');
    end;

}

