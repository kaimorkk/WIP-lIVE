TableExtension 52193572 tableextension52193572 extends "Approval Entry" 
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,MemberApplication,Contributions,LoanApplication,TopUpForm,EmployerForm,FosaAccountApplication,Standing Orders,Cheque Requisition,Teller Request,Imprest Requisitioning,Imprest,Imprest Surrender,Purchase Requisition,Store Requisition,Payment Voucher,Staff Claim,Petty Cash,Overdraft Request,Funeral Scheme,Product Application,Msacco,,Claim-Accounting,Appointment,Leave Application,Training Request,Transport Request,Recruitment Request,Telephone Request,Appraisal,Communication Requests,Legal Request,Visits to Utilities,Refund,Journal,Withdrawal';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 2)".

        }

        //Unsupported feature: Property Modification (Data type) on ""Document No."(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Salespers./Purch. Code"(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Currency Code"(Field 17)".

        modify("Approval Type")
        {
            OptionCaption = ' ,Sales Pers./Purchaser,Approver,Member Approver,Loan Approver';

            //Unsupported feature: Property Modification (OptionString) on ""Approval Type"(Field 18)".

        }

        //Unsupported feature: Deletion on ""Sender ID"(Field 6).OnLookup".


        //Unsupported feature: Property Deletion (TableRelation) on ""Sender ID"(Field 6)".


        //Unsupported feature: Property Deletion (TestTableRelation) on ""Sender ID"(Field 6)".


        //Unsupported feature: Deletion on ""Approver ID"(Field 8).OnLookup".


        //Unsupported feature: Property Deletion (TableRelation) on ""Approver ID"(Field 8)".


        //Unsupported feature: Property Deletion (TestTableRelation) on ""Approver ID"(Field 8)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Approver ID"(Field 8)".


        //Unsupported feature: Deletion on ""Last Modified By ID"(Field 12).OnLookup".


        //Unsupported feature: Property Deletion (TableRelation) on ""Last Modified By ID"(Field 12)".


        //Unsupported feature: Property Deletion (TestTableRelation) on ""Last Modified By ID"(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Last Modified By ID"(Field 12)".

        modify("Sender ID")
        {
            trigger OnAfterValidate()
            var
                hremp: Record employee;
            begin
                hremp.reset;
                hremp.SetRange(hremp."User ID", "Sender ID");
                if hremp.find('-') then
                    validate("Employee No.", hremp."No.");

            end;
        }
        modify("Table ID")
        {
            trigger OnAfterValidate()
            var
                PCA: record "prBasic pay PCA";
            begin
                if "Table ID" = 50763 then begin
                    PCA.Reset();
                    PCA.SetRange(PCA."Change Advice Serial No.", "Document No.");
                    if PCA.find('-') then
                        validate("Employee No.", PCA."Employee Code");

                end;
            end;
        }
        field(50032; "From Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50033; "To Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50034; "Original Approver ID"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50035; "Employee No."; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                hremp: Record employee;
            begin
                hremp.reset;
                hremp.SetRange(hremp."No.", "Employee No.");
                if hremp.find('-') then
                    "Employee Name" := hremp.FullName();

            end;
        }
        field(50036; "Employee Name"; Text[350])
        {
            DataClassification = CustomerContent;
        }
        field(50037; "Approval OTP"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50038; "Approval QR Code"; Media)
        {
            DataClassification = CustomerContent;
        }
        field(50039; "OTP Expiry"; DateTime)
        {
            DataClassification = CustomerContent;
        }

    }

    //Unsupported feature: Variable Insertion (Variable: Member) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: LoansApp) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: LoanTopUp) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: EmployerMemb) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: AccountApp) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Sto) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: CheqReq) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: TellReq) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: OverD) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Fun) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: RequisitionRec) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: PaymentRec) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: ApprovalEntry) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Bank) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Code Modification on "ShowDocument(PROCEDURE 1)".

    //procedure ShowDocument();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Table ID" OF
          DATABASE::"Sales Header":
            BEGIN
        #4..36
                  PAGE.RUN(PAGE::"Purchase Return Order",PurchHeader);
              END;
            END;
          ELSE
            EXIT;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..39


        //JKK Customizations For Sacco Approvals Member Appication and Loan Application
           DATABASE::Payments:
            BEGIN
             IF NOT PaymentRec.GET("Document No.") THEN
               EXIT;
              CASE
              "Document Type" OF
               "Document Type"::Order:
               BEGIN
               ApprovalEntry.RESET;
               ApprovalEntry.SETCURRENTKEY("Sequence No.");
               ApprovalEntry.SETRANGE(ApprovalEntry."Table ID",DATABASE::Payments);
               ApprovalEntry.SETRANGE(ApprovalEntry."Document Type","Document Type");
               ApprovalEntry.SETRANGE(ApprovalEntry."Document No.","Document No.");
               ApprovalEntry.SETRANGE(ApprovalEntry."Sequence No.","Sequence No.");

               IF ApprovalEntry.FINDFIRST THEN
               //IF ApprovalEntry."Sequence No."=3 THEN
               BEGIN
               PAGE.RUN(PAGE::"Payment Voucher Card",PaymentRec);
                PaymentRec.SETRANGE(PaymentRec.No,"Document No.");
                END;
               {ELSE BEGIN
               PaymentRec.SETRANGE(PaymentRec."No.","Document No.");
               REPORT.RUN(REPORT::"Payment Voucher",TRUE,TRUE,PaymentRec);
               END;}

               END;
               "Document Type"::Imprest:
               PAGE.RUN(PAGE::"Imprest Requisitioning111",PaymentRec);
               "Document Type"::"Imprest Surrender":
              // PAGE.RUN(PAGE::"Imprest Surrender",PaymentRec);
               //"Document Type"::"Petty Cash":
              BEGIN
              // PaymentRec.SETRANGE(PaymentRec."No.","Document No.");
               //PAGE.RUN(PAGE::"Petty Cash - Processing",PaymentRec);
               END;
               "Document Type"::"Imprest Requisitioning":
               PAGE.RUN(PAGE::"Imprest Requisitioning111",PaymentRec);
               END;
            END;


          DATABASE::"Member Applications":
           BEGIN
            IF NOT Member.GET("Document No.") THEN
           EXIT;
               Member.SETRANGE("No.","Document No.");
               PAGE.RUN(PAGE::"Membership Applications-Card",Member);
           END;



          DATABASE::"Bank Account":
           BEGIN
            IF NOT Bank.GET("Document No.") THEN
           EXIT;
               Bank.SETRANGE("No.","Document No.");
               PAGE.RUN(PAGE::"Employers Card",Member);
           END;



          DATABASE::"Fosa Accounts Applications":
           BEGIN
            IF NOT AccountApp.GET("Document No.") THEN
           EXIT;
               AccountApp.SETRANGE("No.","Document No.");
               PAGE.RUN(PAGE::"Fosa Acc Applic Card",AccountApp);
           END;


          DATABASE::Loans:
           BEGIN
            IF NOT LoansApp.GET("Document No.") THEN
           EXIT;
               LoansApp.SETRANGE("Loan No.","Document No.");
               PAGE.RUN(PAGE::"Loan Application Card - BOSA",LoansApp);
           END;


          DATABASE::"Standing Orders":
           BEGIN
            IF NOT Sto.GET("Document No.") THEN
           EXIT;
               Sto.SETRANGE("No.","Document No.");
               PAGE.RUN(PAGE::"Standing Orders",Sto);
           END;

          DATABASE::"Cheque Book- Leaf  Requisition":
           BEGIN
            IF NOT CheqReq.GET("Document No.") THEN
           EXIT;
               CheqReq.SETRANGE("Req No.","Document No.");
               PAGE.RUN(PAGE::"Cheque Requisition",CheqReq);
           END;


          DATABASE::"Teller Requisition":
           BEGIN
            IF NOT TellReq.GET("Document No.") THEN
           EXIT;
               TellReq.SETRANGE("Request No.","Document No.");
               PAGE.RUN(PAGE::"Teller Requisition",TellReq);
           END;

          DATABASE::Overdraft:
           BEGIN
            IF NOT OverD.GET("Document No.") THEN
           EXIT;
               OverD.SETRANGE(No,"Document No.");
               PAGE.RUN(PAGE::Overdraft,OverD);
           END;

          DATABASE::"Funeral Scheme":
           BEGIN
            IF NOT Fun.GET("Document No.") THEN
           EXIT;
               Fun.SETRANGE(No,"Document No.");
               PAGE.RUN(PAGE::"Funeral Scheme Card",Fun);
           END;




          DATABASE::"Requisition Header1":
          BEGIN
           IF NOT RequisitionRec.GET("Document No.") THEN
            EXIT;
             CASE "Document Type" OF
               "Document Type"::Order:
                PAGE.RUN(PAGE::"Store Requisition Header",RequisitionRec);


              END;
        END ;

          DATABASE::"Requisition Header1":
          BEGIN
           IF NOT RequisitionRec.GET("Document No.") THEN
            EXIT;
             CASE "Document Type" OF
               "Document Type"::Order:
                PAGE.RUN(PAGE::"Requisition Header",RequisitionRec);


              END;


          END;









         {DATABASE::Loans:
         PAGE.RUN(PAGE::"Member Loan Application",MemberLoan);
         DATABASE::"Loans Top up":
         PAGE.RUN(PAGE::"Loans Top up PAGE",LoanTopUp);
         DATABASE::Employer:
         PAGE.RUN(PAGE::"Employers Card",EmployerMemb);  }



          {DATABASE::"Member Applicants":
            BEGIN
              IF NOT Member.GET("Document Type","Document No.") THEN
                EXIT;
              CASE "Document Type" OF
                "Document Type"::MemberApplication:
                  PAGE.RUN(PAGE::"Membership Registration",Member);
              END;
            END;}

        //Loan
          {DATABASE::Loans:
            BEGIN
              IF NOT MemberLoan.GET("Document Type","Document No.") THEN
                EXIT;
              CASE "Document Type" OF
                "Document Type"::LoanApplication:
                  PAGE.RUN(PAGE::"Member Loan Application",MemberLoan);
              END;
            END; }
        //Customization Ends


          ELSE
            EXIT;

        END;
        */
    //end;
    
}

