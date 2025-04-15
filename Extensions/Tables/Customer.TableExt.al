 
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 52193432 "Customer Ext" extends Customer
{
    fields
    {
        field(50000; "Account Type"; Enum CustomerAccountType)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //Prevent Changing once entries exist
                //TestNoEntriesExist(FIELDCAPTION("Account Type"));
            end;
        }
        field(50001; "Staff No."; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*  EmployeeRec.RESET;
                  EmployeeRec.GET("Staff No.");
                  "Job Title":= EmployeeRec."Job Title";
                  "Job Description":= EmployeeRec."Job Specification";
                  "Job Group":= EmployeeRec.Grade;
                  "Position code":= EmployeeRec."Position Code";
                  "Position Name":= EmployeeRec."Position Name";
                  */

            end;
        }
        field(50002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Global Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ////ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Global Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50005; "Job Title"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Job Group"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Job Description"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Job Group Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Position code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Position Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50011; "Imprest Balance Amount"; Decimal)
        {
            // CalcFormula = sum("Detailed Customer Ledg. Entry"."Amount (LCY)" where ("Customer No."=field("No."),
            //                                                                         "Currency Code"=field("Currency Filter"),
            //                                                                         "Document Type"=filter(Invoice)));
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));
            DataClassification = CustomerContent;
        }
        field(50065; fred; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50088; "PIN No"; Text[50])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50089; "Withholding Tax No"; Text[50])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50090; "Default VAT Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
            //TableRelation = Table1000050122;
        }
        field(50091; "Default Withholding Tax Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
            // TableRelation = Table1000050122;
        }
        field(50092; "Agent Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50093; "Debtor Type"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
            OptionMembers = " ",Normal,"Staff Advance","Car loan","Staff Medical","Car Running","Sundry Debtors",TLA,"Money Market",Property,Equity,Mortgage;
        }
        field(50094; "Institution Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
            // TableRelation = Institutions;

            trigger OnValidate()
            begin
                // Inst.Reset;
                // Inst.SetRange(Inst.Code, "Institution Code");
                // if Inst.Find('-') then begin
                //     "Institution Name" := Inst.Description;
                // end;
            end;
        }
        field(50095; "Institution Name"; Code[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50096; "LR No"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50097; "Property Particulars"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
            OptionMembers = "Lease Hold","Free Hold";
        }
        field(50098; Location; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50099; "Date Of Acquistion"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50100; "Leasehold Period"; DateFormula)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50101; "Real Estate Manager Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50102; "Real Estate Manager Telephone"; Text[50])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50103; "Name Of Beneficiary"; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50104; "Beneficiary Telephone"; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50105; "Beneficiary Address 1"; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50106; "Beneficiary Address 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50107; "Mortgage Type"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
            OptionMembers = Commercial,Staff;
        }
        field(50108; "Mortgage Term"; DateFormula)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50109; "Expected Repayment"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(50110; Stock; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'Investment Module';
        }
        field(56000; Type; Option)
        {
            Description = 'Person/Company';
            OptionCaption = 'Person,Company';
            OptionMembers = Person,Company;
            DataClassification = CustomerContent;
        }
        field(56001; "Customer Category"; Code[20])
        {
            Caption = 'Applicant Category';
            Description = 'Customer/Author/Publisher/Licensee';
            // TableRelation = "Applicant category setup";
            DataClassification = CustomerContent;
        }
        field(56002; "Customer Type"; Option)
        {
            Caption = 'Customer Type';
            Description = 'Customer/Applicant';
            OptionCaption = ' ,Trade,Student,Funder,Sponsor,Normal,Annuity,Institution,Property,IDD,Expert,Tenant';
            OptionMembers = " ",Trade,Student,Funder,Sponsor,Normal,Annuity,Institution,Property,IDD,Expert,Tenant;
            DataClassification = CustomerContent;
        }
        field(56003; "Company Reg No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(56004; "ID. No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(56005; "P.I.N"; Code[11])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*
                IF "P.I.N"<>'' THEN BEGIN
                StrPIN:=COPYSTR("P.I.N",1,11);
                
                IF STRLEN("P.I.N")<>11 THEN BEGIN
                ERROR('Invalid PIN number. Please enter the correct PIN number.');
                END;
                END;
                
                mystr:="P.I.N";
                  i := 1;
                  WHILE (mystr[i] IN ['0'..'9']) AND (i<= STRLEN(mystr)) DO
                    i := i+1;
                
                   j := 1;
                  WHILE (mystr[j] IN ['0'..'9']) AND (j<= STRLEN(mystr)) DO
                    j := j+1;
                
                
                      IF (i<>1) AND (i<>11) THEN
                  ERROR('P.I.N Must Start & End with character');
                      {IF j<>11 THEN
                  ERROR('P.I.N Must Start & End with character');}
                  */

            end;
        }
        field(56006; Title; Code[20])
        {
            TableRelation = Salutation.Code;
            DataClassification = CustomerContent;
        }
        field(56007; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved';
            OptionMembers = Open,Pending,Approved;
            DataClassification = CustomerContent;
        }
        field(69010; "Employee's Bank"; Code[100])
        {
            TableRelation = "Employee Bank AccountX";
            DataClassification = CustomerContent;
        }
        field(69016; "Bank Name"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69017; "Bank Branch Name"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69018; Imprests; Integer)
        {
            CalcFormula = count(Payments where("Document Type" = const(Imprest),
                                                "Account No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69019; Surrenders; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69020; "First Name"; Text[50])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(69021; "Middle Name"; Text[50])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(69022; "Last Name"; Text[50])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            end;
        }
        field(69023; "Physical Location"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(69024; "Funding Class"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Trade,Grant,Student,Others';
            OptionMembers = Trade,Grant,Student,Others;
        }
        field(85000; "Birth Certificate No."; Code[30])
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
        field(85004; "Training Institution"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
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
        field(85040; "Blocked Start Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(85041; "Blocked End Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(85042; CRM; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85043; "Brand Ambassador"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85044; "Other Names"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(85045; "Accreditation Status Code"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Evaluation Verdicts";

            // trigger OnValidate()
            // var
            //     AccreditationTypeSeries: Record "Evaluation Verdicts";
            // begin
            //     AccreditationTypeSeries.Reset;
            //     AccreditationTypeSeries.SetRange(Code, "Accreditation Status Code");
            //     if AccreditationTypeSeries.FindFirst then begin
            //         "Accreditation Status" := AccreditationTypeSeries.Description;
            //     end
            // end;
        }
        field(85046; "Accreditation Status"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(85047; "Accreditation Start Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(85048; "Accreditation End Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(85049; "Institution alterEmail"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(85050; CustomerTypeID; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(85051; "Service Type"; Text[250])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Billing Charge Table";
        }
        field(85052; Ooccupation; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(85053; "Law Firm Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(85054; "Marital Status"; enum "Marital Status")
        {
            DataClassification = CustomerContent;
        }
        field(85055; "Law Firm Email"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(85056; "Contact Person"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(85057; "Contact Person's Phone No."; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(85058; "Contact Person's Email Address"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(85059; "KRA PIN"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(85060; "Interpreter Needed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(8600; "Staff No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(86001; "Employer Code"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
      
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      SalesSetup.GET;
      SalesSetup.TESTFIELD("Customer Nos.");
      NoSeriesMgt.InitSeries(SalesSetup."Customer Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF "Invoice Disc. Code" = '' THEN
      "Invoice Disc. Code" := "No.";
    #9..18

    UpdateReferencedIds;
    SetLastModifiedDateTime;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF ("Funding Class"= "Funding Class"::Trade) THEN BEGIN
    #1..5
    END ELSE IF ("Funding Class"= "Funding Class"::Grant) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantsSetup.GET;
      GrantsSetup.TESTFIELD("Grantor Nos");
      NoSeriesMgt.InitSeries(GrantsSetup."Grantor Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END ELSE IF  ("Funding Class"= "Funding Class"::Student) THEN BEGIN
    IF "No." = '' THEN BEGIN
     { Investment.GET;
      Investment.TESTFIELD("Investment Nos");
      NoSeriesMgt.InitSeries(Investment."Investment Nos",xRec."No. Series",0D,"No.","No. Series");}
    END;
    END;

     IF "Customer Type" = "Customer Type"::Institution THEN BEGIN
     ExaminationSetup.GET;
      ExaminationSetup.TESTFIELD("Institution No.s");
      NoSeriesMgt.InitSeries(ExaminationSetup."Institution No.s",xRec."No. Series",0D,"No.","No. Series")
     END;
    #6..21
    */
    //end;


    //Unsupported feature: Code Insertion (VariableCollection) on "OnModify".

    //trigger (Variable: UserSetup)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;

    //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".


    var
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to update the student details,Consult the system administrator';

    var
        // GrantsSetup: Record "Grants Setup";
        // Inst: Record Institutions;
        // Investment: Record "Investment Setup";
        // ExaminationSetup: Record "Examination Setup";
}

