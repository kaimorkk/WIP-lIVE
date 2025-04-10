TableExtension 52193451 tableextension52193451 extends "Gen. Journal Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Posting Group"(Field 23)".


        //Unsupported feature: Property Modification (Editable) on ""Posting Group"(Field 23)".


        //Unsupported feature: Property Modification (Data type) on ""Business Unit Code"(Field 50)".


        //Unsupported feature: Property Insertion (Numeric) on ""Creditor No."(Field 170)".


        //Unsupported feature: Property Modification (Data type) on ""Message to Recipient"(Field 289)".


        //Unsupported feature: Code Modification on ""Account Type"(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Account Type" IN ["Account Type"::Customer,"Account Type"::Vendor,"Account Type"::"Fixed Asset",
                               "Account Type"::"IC Partner"]) AND
           ("Bal. Account Type" IN ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor,"Bal. Account Type"::"Fixed Asset",
        #4..6
            Text000,
            FIELDCAPTION("Account Type"),FIELDCAPTION("Bal. Account Type"));
        VALIDATE("Account No.",'');
        VALIDATE(Description,'');
        VALIDATE("IC Partner G/L Acc. No.",'');
        IF "Account Type" IN ["Account Type"::Customer,"Account Type"::Vendor,"Account Type"::"Bank Account"] THEN BEGIN
          VALIDATE("Gen. Posting Type","Gen. Posting Type"::" ");
        #14..42
          END;
        IF "Account Type" <> "Account Type"::Customer THEN
          VALIDATE("Credit Card No.",'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..9
        #11..45
        */
        //end;


        //Unsupported feature: Code Modification on "Amount(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetCurrency;
        IF "Currency Code" = '' THEN
          "Amount (LCY)" := Amount
        #4..25
        IF Amount <> xRec.Amount THEN BEGIN
          IF ("Applies-to Doc. No." <> '') OR ("Applies-to ID" <> '') THEN
            SetApplyToAmount;
          IF (xRec.Amount <> 0) OR (xRec."Applies-to Doc. No." <> '') OR (xRec."Applies-to ID" <> '') THEN
            PaymentToleranceMgt.PmtTolGenJnl(Rec);
        END;

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine;
          UpdatePricesFromJobJnlLine;
        END
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..28
          PaymentToleranceMgt.PmtTolGenJnl(Rec);
        #31..36
        */
        //end;


        //Unsupported feature: Code Modification on ""Salespers./Purch. Code"(Field 26).OnValidate".

        //trigger /Purch()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateSalesPersonPurchaserCode(Rec);

        CreateDim(
          DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code",
          DimMgt.TypeToTableID1("Account Type"),"Account No.",
          DimMgt.TypeToTableID1("Bal. Account Type"),"Bal. Account No.",
          DATABASE::Job,"Job No.",
          DATABASE::Campaign,"Campaign No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #3..8
        */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to Doc. No."(Field 36).OnLookup".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        xRec.Amount := Amount;
        xRec."Currency Code" := "Currency Code";
        xRec."Posting Date" := "Posting Date";
        #4..11
          AccType::Vendor:
            LookUpAppliesToDocVend(AccNo);
        END;
        SetJournalLineFieldsFromApplication;

        IF xRec.Amount <> 0 THEN
          IF NOT PaymentToleranceMgt.PmtTolGenJnl(Rec) THEN
            EXIT;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..14

        IF Amount <> 0 THEN
          IF NOT PaymentToleranceMgt.PmtTolGenJnl(Rec) THEN
            EXIT;
        */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to Doc. No."(Field 36).OnValidate".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Applies-to Doc. No." <> xRec."Applies-to Doc. No." THEN
          ClearCustVendApplnEntry;

        IF ("Applies-to Doc. No." = '') AND (xRec."Applies-to Doc. No." <> '') THEN BEGIN
          PaymentToleranceMgt.DelPmtTolApllnDocNo(Rec,xRec."Applies-to Doc. No.");

        #7..62
        SetJournalLineFieldsFromApplication;

        GetCreditCard;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #4..65
        */
        //end;


        //Unsupported feature: Code Modification on ""VAT Amount"(Field 44).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlBatch.GET("Journal Template Name","Journal Batch Name");
        GenJnlBatch.TESTFIELD("Allow VAT Difference",TRUE);
        IF NOT ("VAT Calculation Type" IN
        #4..40
        "VAT Base Amount (LCY)" := "Amount (LCY)" - "VAT Amount (LCY)";

        UpdateSalesPurchLCY;

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine;
          UpdatePricesFromJobJnlLine;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..43
        */
        //end;


        //Unsupported feature: Code Modification on ""IC Partner G/L Acc. No."(Field 116).OnValidate".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Journal Template Name" <> '' THEN
          IF "IC Partner G/L Acc. No." <> '' THEN BEGIN
            GetTemplate;
            GenJnlTemplate.TESTFIELD(Type,GenJnlTemplate.Type::Intercompany);
            IF ICGLAccount.GET("IC Partner G/L Acc. No.") THEN
              ICGLAccount.TESTFIELD(Blocked,FALSE);
          END
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "IC Partner G/L Acc. No." <> '' THEN BEGIN
          GetTemplate;
          GenJnlTemplate.TESTFIELD(Type,GenJnlTemplate.Type::Intercompany);
          IF ICGLAccount.GET("IC Partner G/L Acc. No.") THEN
            ICGLAccount.TESTFIELD(Blocked,FALSE);
        END
        */
        //end;

        //Unsupported feature: Deletion on ""Recipient Bank Account"(Field 288).OnValidate".

        field(50001; "Pay Mode"; Code[20])
        {
            //TableRelation = Table50006;
        }
        field(50002; "Cheque Date"; Date)
        {
        }
        field(50003; Remarks; Text[50])
        {
        }
        field(50004; "Asset No"; Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(50005; "ED Code"; Code[20])
        {
        }
        field(50006; "Commissioner Code"; Code[20])
        {
        }
        field(50007; "Commissioner Name"; Text[50])
        {
        }
        field(50009; "Meeting ID"; Code[20])
        {
        }
        field(50010; "Meeting Description"; Text[50])
        {
        }
        field(50011; "Starting Date"; Date)
        {
        }
        field(50012; "Ending Date"; Date)
        {
        }
        field(50013; "Budget Name"; Code[20])
        {
            TableRelation = "G/L Budget Name";
        }
        field(50014; "Transaction Typex"; Option)
        {
            OptionCaption = 'Normal,Budget';
            OptionMembers = Normal,Budget;
        }
        field(50016; "Licensee No."; Code[20])
        {
        }
        field(50017; "Payment Type"; Option)
        {
            OptionMembers = " ",Levy,Penalty,Registration;
        }
        field(50018; "Employee Code"; Code[30])
        {
            TableRelation = Employee;
        }
        field(50019; "No."; Code[20])
        {
        }
        field(50020; "Received From"; Code[40])
        {
        }
        field(50021; "On Behalf Of"; Text[70])
        {
        }
        field(53002; "Description 2"; Text[100])
        {
            Description = 'To show more narration on the transations';
        }
        field(53005; Commission; Decimal)
        {
        }
        field(53006; Supplies; Decimal)
        {
        }
        field(53007; Others; Decimal)
        {
        }
        field(53008; Total; Decimal)
        {
        }
        field(53009; Penalty; Decimal)
        {
        }
        field(53010; "Entry Date"; Date)
        {
        }
        field(53011; "Credit Officer"; Code[10])
        {
            Enabled = false;
        }
        field(53012; Supervisor; Code[10])
        {
        }
        field(53013; "Source of Fund"; Code[10])
        {
        }
        field(53015; "Loan No"; Code[60])
        {
            // TableRelation = if ("Account Type" = const(Customer)) Loans."Loan No." where("Member No." = field("Account No."),
            // Status = filter(Approved));
        }
        field(53016; "Instalment Period"; Integer)
        {
        }
        field(53017; "Debtors Type"; Option)
        {
            OptionCaption = ' ,Staff,Client,Others';
            OptionMembers = " ",Staff,Client,Others;
        }
        field(53018; "Bal. Debtors Type"; Option)
        {
            OptionCaption = ' ,Staff,Client,Others';
            OptionMembers = " ",Staff,Client,Others;
        }
        field(53019; Type; Option)
        {
            OptionCaption = ' ,Registration,PassBook,Loan Insurance,Loan Application Fee';
            OptionMembers = " ",Registration,PassBook,"Loan Insurance","Loan Application Fee";
        }
        field(53020; "Customer No"; Code[20])
        {
            TableRelation = Customer."No." where("Debtors Type" = const(Client));
        }
        field(53021; "Customer Posting Group"; Code[20])
        {
        }
        field(53022; "Item No"; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(53023; "Quantity Sold"; Integer)
        {
        }
        field(53024; "Retail Price"; Decimal)
        {
        }
        field(53025; "Share %"; Decimal)
        {
        }
        field(53026; "External Account Name"; Text[80])
        {
        }
        field(53027; Payee; Text[80])
        {
        }
        field(53028; "Document Ref. No"; Code[30])
        {
        }
        field(53029; "Source Account Staff No"; Code[20])
        {
        }
        field(53030; "Value Entry No."; Integer)
        {
            Caption = 'Value Entry No.';
            Editable = false;
            TableRelation = "Value Entry";
        }
        field(61000; "User ID"; Code[20])
        {
        }
        field(61001; "Cheque No"; Code[20])
        {
        }
        field(61003; "Cheque Type"; Code[20])
        {
            TableRelation = "FA Ledger Entry";
        }
        field(61004; "Mode Of Payment"; Option)
        {
            OptionCaption = ' ,Cash,Bank Slip,Cheque,Bank Transfer,Bankers Cheque';
            OptionMembers = " ",Cash,"Bank Slip",Cheque,"Bank Transfer","Bankers Cheque";
        }
        field(61005; "Account Name"; Text[50])
        {
        }
        field(61006; Status; Option)
        {
            OptionCaption = 'Open,Pending,Verified,Approved,Canceled';
            OptionMembers = Open,Pending,Verified,Approved,Canceled;

            trigger OnValidate()
            begin
                /*PVApp.RESET;
                PVApp.SETRANGE(PVApp."User ID",USERID);
                PVApp.SETRANGE(PVApp.Status,Status);
                
                IF PVApp.FIND('-') = FALSE THEN
                ERROR('You do not have permission for this level of approval.');
                
                
                
                IF CONFIRM('Are you sure you would like to change status of the following document?',FALSE) = FALSE THEN BEGIN
                Status:=xRec.Status;
                EXIT
                END;
                
                IF Status = Status::Verified THEN BEGIN
                "Approved By":=USERID;
                "Approval Date":=TODAY;
                END;
                
                
                IF Status = Status::Verified THEN BEGIN
                CGenJnl.RESET;
                CGenJnl.SETRANGE(CGenJnl."Journal Template Name","Journal Template Name");
                CGenJnl.SETRANGE(CGenJnl."Journal Batch Name","Journal Batch Name");
                CGenJnl.SETRANGE(CGenJnl."Document No.","Document No.");
                CGenJnl.SETRANGE(CGenJnl.Status,CGenJnl.Status::Verified);
                IF CGenJnl.FIND('-') THEN
                MESSAGE('Payment Voucher has already been approved.');
                END;
                
                
                //Transfer to journals
                
                IF Status = Status::Verified THEN BEGIN
                "Approved By":=USERID;
                "Approval Date":=TODAY;
                GenJnlLine.RESET;
                GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'General');
                GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'PostPV');
                IF GenJnlLine.FIND('+') THEN BEGIN
                LineNo:=GenJnlLine."Line No."+10000;
                END
                ELSE BEGIN
                LineNo:=10000;
                END;
                
                
                
                CGenJnl.RESET;
                CGenJnl.SETRANGE(CGenJnl."Journal Template Name","Journal Template Name");
                CGenJnl.SETRANGE(CGenJnl."Journal Batch Name","Journal Batch Name");
                CGenJnl.SETRANGE(CGenJnl."Document No.","Document No.");
                IF CGenJnl.FIND('-') THEN BEGIN
                REPEAT
                
                IF CGenJnl."Mode Of Payment"=CGenJnl."Mode Of Payment"::Cheque THEN BEGIN
                //CHEQUE
                
                LineNo:=LineNo+10000;
                
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":='General';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":='PostPV';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Account Type":=CGenJnl."Account Type";
                GenJnlLine.VALIDATE(GenJnlLine."Account Type");
                GenJnlLine."Account No.":=CGenJnl."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                //GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Computer Check";
                GenJnlLine."Posting Date":=CGenJnl."Posting Date";
                GenJnlLine.VALIDATE(GenJnlLine."Posting Date");
                GenJnlLine."Document No.":=CGenJnl."Document No.";
                GenJnlLine."External Document No.":=CGenJnl."External Document No.";
                GenJnlLine."Currency Code":=CGenJnl."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                IF CGenJnl."Currency Code" <> '' THEN
                GenJnlLine."Currency Factor":=CGenJnl."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                GenJnlLine.Amount:=CGenJnl.Amount-CGenJnl."Withholding Tax";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":=CGenJnl."Bal. Account Type";
                GenJnlLine."Bal. Account No.":=CGenJnl."Bal. Account No.";
                GenJnlLine.Description:=CGenJnl.Description;
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code":=CGenJnl."Shortcut Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=CGenJnl."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Applies-to Doc. Type":=CGenJnl."Applies-to Doc. Type";
                GenJnlLine."Applies-to Doc. No.":=CGenJnl."Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID":=CGenJnl."Applies-to ID";
                GenJnlLine."Received By":=CGenJnl."Received By";
                GenJnlLine.Status:=CGenJnl.Status::Verified;
                GenJnlLine."Mode Of Payment":=CGenJnl."Mode Of Payment";
                GenJnlLine.Charge:=CGenJnl.Charge;
                IF GenJnlLine.Amount<>0 THEN
                GenJnlLine.INSERT;
                
                END ELSE IF CGenJnl."Mode Of Payment"=CGenJnl."Mode Of Payment"::"Bank Transfer" THEN BEGIN
                //Bank transfer
                LineNo:=LineNo+10000;
                
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":='General';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":='PostPV';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Account Type":="Account Type";
                GenJnlLine.VALIDATE(GenJnlLine."Account Type");
                GenJnlLine."Account No.":=CGenJnl."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                //GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Manual Check";
                GenJnlLine."Posting Date":=CGenJnl."Posting Date";
                GenJnlLine.VALIDATE(GenJnlLine."Posting Date");
                GenJnlLine."Document No.":=CGenJnl."Document No.";
                GenJnlLine."External Document No.":=CGenJnl."External Document No.";
                GenJnlLine."Currency Code":=CGenJnl."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                IF GenJnlLine."Currency Code" <> '' THEN
                GenJnlLine."Currency Factor":=CGenJnl."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                GenJnlLine.Amount:=CGenJnl.Amount-CGenJnl."Withholding Tax";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":=CGenJnl."Bal. Account Type";
                GenJnlLine."Bal. Account No.":=CGenJnl."Bal. Account No.";
                GenJnlLine.Description:=CGenJnl.Description;
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code":=CGenJnl."Shortcut Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=CGenJnl."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Applies-to Doc. Type":=CGenJnl."Applies-to Doc. Type";
                GenJnlLine."Applies-to Doc. No.":=CGenJnl."Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID":=CGenJnl."Applies-to ID";
                GenJnlLine."Received By":=CGenJnl."Received By";
                GenJnlLine.Status:=CGenJnl.Status::Verified;
                GenJnlLine."Mode Of Payment":=CGenJnl."Mode Of Payment";
                GenJnlLine.Charge:=CGenJnl.Charge;
                IF GenJnlLine.Amount<>0 THEN
                GenJnlLine.INSERT;
                
                END ELSE BEGIN
                //Cash
                LineNo:=LineNo+10000;
                
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":='General';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":='PostPV';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Account Type":=CGenJnl."Account Type";
                GenJnlLine.VALIDATE(GenJnlLine."Account Type");
                GenJnlLine."Account No.":=CGenJnl."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=CGenJnl."Posting Date";
                GenJnlLine.VALIDATE(GenJnlLine."Posting Date");
                GenJnlLine."Document No.":=CGenJnl."Document No.";
                GenJnlLine."External Document No.":=CGenJnl."External Document No.";
                GenJnlLine."Currency Code":=CGenJnl."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                IF GenJnlLine."Currency Code" <> '' THEN
                GenJnlLine."Currency Factor":=CGenJnl."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                GenJnlLine.Amount:=CGenJnl.Amount-CGenJnl."Withholding Tax";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":=CGenJnl."Bal. Account Type";
                GenJnlLine."Bal. Account No.":=CGenJnl."Bal. Account No.";
                GenJnlLine.Description:=CGenJnl.Description;
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code":=CGenJnl."Shortcut Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=CGenJnl."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Applies-to Doc. Type":=CGenJnl."Applies-to Doc. Type";
                GenJnlLine."Applies-to Doc. No.":=CGenJnl."Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID":=CGenJnl."Applies-to ID";
                GenJnlLine."Received By":=CGenJnl."Received By";
                GenJnlLine.Status:=CGenJnl.Status::Verified;
                GenJnlLine."Mode Of Payment":=CGenJnl."Mode Of Payment";
                GenJnlLine.Charge:=CGenJnl.Charge;
                IF GenJnlLine.Amount<>0 THEN
                GenJnlLine.INSERT;
                
                END;
                
                UNTIL CGenJnl.NEXT = 0;
                END;
                
                IF "Withholding Tax" > 0 THEN BEGIN
                LineNo:=LineNo+10000;
                
                SalesSetUp.GET();
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":='General';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":='PostPV';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Account Type":="Account Type";
                GenJnlLine.VALIDATE(GenJnlLine."Account Type");
                GenJnlLine."Account No.":="Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":="Posting Date";
                GenJnlLine.VALIDATE(GenJnlLine."Posting Date");
                GenJnlLine."Document No.":="Document No.";
                GenJnlLine."External Document No.":="External Document No.";
                GenJnlLine."Currency Code":="Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                IF GenJnlLine."Currency Code" <> '' THEN
                GenJnlLine."Currency Factor":="Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                GenJnlLine.Amount:="Withholding Tax";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":="Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No.":=SalesSetUp."Withholding Tax Account";
                GenJnlLine.Description:=Description;
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code":=GenJnlLine."Shortcut Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=GenJnlLine."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Applies-to Doc. Type":="Applies-to Doc. Type";
                GenJnlLine."Applies-to Doc. No.":="Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID":="Applies-to ID";
                GenJnlLine."Received By":="Received By";
                GenJnlLine.Status:=CGenJnl.Status::Verified;
                GenJnlLine."Mode Of Payment":=CGenJnl."Mode Of Payment";
                GenJnlLine.Charge:=Charge;
                IF GenJnlLine.Amount<>0 THEN
                GenJnlLine.INSERT;
                
                END;
                
                IF "VAT Value Amount" > 0 THEN BEGIN
                LineNo:=LineNo+10000;
                
                SalesSetUp.GET();
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":='General';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":='PostPV';
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Account Type":="Account Type";
                GenJnlLine.VALIDATE(GenJnlLine."Account Type");
                GenJnlLine."Account No.":="Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":="Posting Date";
                GenJnlLine.VALIDATE(GenJnlLine."Posting Date");
                GenJnlLine."Document No.":="Document No.";
                GenJnlLine."External Document No.":="External Document No.";
                GenJnlLine."Currency Code":="Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                IF GenJnlLine."Currency Code" <> '' THEN
                GenJnlLine."Currency Factor":="Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                GenJnlLine.Amount:="VAT Value Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":="Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No.":=SalesSetUp."VAT Account";
                GenJnlLine.Description:=Description;
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code":=GenJnlLine."Shortcut Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=GenJnlLine."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Applies-to Doc. Type":="Applies-to Doc. Type";
                GenJnlLine."Applies-to Doc. No.":="Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID":="Applies-to ID";
                GenJnlLine."Received By":="Received By";
                GenJnlLine.Status:=CGenJnl.Status::Verified;
                GenJnlLine."Mode Of Payment":=CGenJnl."Mode Of Payment";
                GenJnlLine.Charge:=Charge;
                IF GenJnlLine.Amount<>0 THEN
                GenJnlLine.INSERT;
                
                END;
                MESSAGE('Document trafered successfully to the approved payment journal for cheque printing.');
                
                END;
                
                
                MESSAGE('Document successfully approved.');
                */

            end;
        }
        field(61007; "Posting Group Filter"; Code[30])
        {
            Caption = 'Posting Group Filter';
            Editable = true;
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else if ("Account Type" = const("Fixed Asset")) "FA Posting Group";
        }
        field(61008; "Entry Type"; Option)
        {
            OptionCaption = ' ,Receipt,PV';
            OptionMembers = " ",Receipt,PV;
        }
        field(61009; "Proforma Invoice"; Code[20])
        {
            TableRelation = "Sales Header"."No." where("Document Type" = const(Quote),
                                                        "Sell-to Customer No." = field("Account No."));
        }
        field(61010; "Received By"; Text[80])
        {
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(61011; "Approved By"; Code[30])
        {
        }
        field(61012; "Approval Date"; Date)
        {
        }
        field(61013; "Calculate Witholding Tax"; Boolean)
        {

            trigger OnValidate()
            begin
                /*//PKK
                "Withholding Tax":=0;
                IF "Calculate Witholding Tax" = TRUE THEN BEGIN
                IF SalesSetUp.GET() THEN BEGIN
                SalesSetUp.TESTFIELD(SalesSetUp."Withholding Tax %");
                SalesSetUp.TESTFIELD(SalesSetUp."Withholding Tax Account");
                "Withholding Tax":=ABS(Amount)*(SalesSetUp."Withholding Tax %"/100);
                END;
                END;
                //PKK
                */

            end;
        }
        field(61014; "Withholding Tax"; Decimal)
        {
        }
        field(68000; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution,Cash Deposit';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution","Cash Deposit";
        }
        field(68002; "Loan Product Type Code"; Code[20])
        {
        }
        field(68003; Interest; Decimal)
        {
        }
        field(68004; Principal; Decimal)
        {
        }
        field(68005; "Group Code"; Code[20])
        {
        }
        field(69006; Charge; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                /*IF Res.GET(Charge) THEN
                Description:=Res.Name;
                */

            end;
        }
        field(69007; "Calculate VAT"; Boolean)
        {

            trigger OnValidate()
            begin
                //PKK
                /*"VAT Value Amount":=0;
                IF "Calculate VAT" = TRUE THEN BEGIN
                IF SalesSetUp.GET() THEN BEGIN
                SalesSetUp.TESTFIELD(SalesSetUp."VAT %");
                SalesSetUp.TESTFIELD(SalesSetUp."VAT Account");
                "VAT Value Amount":=ABS(Amount)*(SalesSetUp."VAT %"/100);
                END;
                END;
                //PKK
                 */

            end;
        }
        field(69008; "VAT Value Amount"; Decimal)
        {
        }
        field(69009; Bank; Text[30])
        {
        }
        field(69010; Branch; Text[40])
        {
        }
        field(69011; Posted; Boolean)
        {
        }
        field(69012; "Invoice to Post"; Code[20])
        {
        }
        field(69013; "Allow Modify"; Boolean)
        {
        }
        field(69014; "Sacco Transaction Type"; Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;
        }
    }


    //Unsupported feature: Code Modification on "SetUpNewLine(PROCEDURE 9)".

    //procedure SetUpNewLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlTemplate.GET("Journal Template Name");
    GenJnlBatch.GET("Journal Template Name","Journal Batch Name");
    GenJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
    #4..9
         (Balance - LastGenJnlLine."Balance (LCY)" = 0) AND
         NOT LastGenJnlLine.EmptyLine
      THEN
        IncrementDocumentNo;
    END ELSE BEGIN
      "Posting Date" := WORKDATE;
      "Document Date" := WORKDATE;
    #17..32
      "Account Type" := "Account Type"::"G/L Account";
    VALIDATE("Bal. Account No.",GenJnlBatch."Bal. Account No.");
    Description := '';
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
        "Document No." := INCSTR("Document No.");
    #14..35
    */
    //end;


    //Unsupported feature: Code Modification on "RenumberDocumentNo(PROCEDURE 68)".

    //procedure RenumberDocumentNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD("Check Printed",FALSE);

    GenJnlBatch.GET("Journal Template Name","Journal Batch Name");
    IF GenJnlBatch."No. Series" = '' THEN
      EXIT;
    #6..27
    RenumberDocNoOnLines(DocNo,GenJnlLine2);

    GET("Journal Template Name","Journal Batch Name","Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #3..30
    */
    //end;


    //Unsupported feature: Code Modification on "RenumberDocNoOnLines(PROCEDURE 69)".

    //procedure RenumberDocNoOnLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FirstDocNo := DocNo;
    WITH GenJnlLine2 DO BEGIN
      SETCURRENTKEY("Journal Template Name","Journal Batch Name","Document No.");
    #4..8
        REPEAT
          IF "Document No." = FirstDocNo THEN
            EXIT;
          IF NOT First AND (("Document No." <> PrevDocNo) OR ("Bal. Account No." <> '')) AND NOT LastGenJnlLine.EmptyLine THEN
            DocNo := INCSTR(DocNo);
          PrevDocNo := "Document No.";
          IF "Document No." <> '' THEN BEGIN
            IF "Applies-to ID" = "Document No." THEN
              RenumberAppliesToID(GenJnlLine2,"Document No.",DocNo);
            RenumberAppliesToDocNo(GenJnlLine2,"Document No.",DocNo);
          END;
          GenJnlLine3.GET("Journal Template Name","Journal Batch Name","Line No.");
          GenJnlLine3."Document No." := DocNo;
          GenJnlLine3.MODIFY;
          First := FALSE;
          LastGenJnlLine := GenJnlLine2
        UNTIL NEXT = 0
      END
    END
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
          IF NOT First AND ("Document No." <> PrevDocNo) AND NOT LastGenJnlLine.EmptyLine THEN
            DocNo := INCSTR(DocNo);
          PrevDocNo := "Document No.";
          IF ("Applies-to ID" <> '') AND ("Applies-to ID" = "Document No.") THEN
            RenumberAppliesToID(GenJnlLine2,"Document No.",DocNo);
          RenumberAppliesToDocNo(GenJnlLine2,"Document No.",DocNo);
    #20..27
    */
    //end;


    //Unsupported feature: Code Modification on "GetCurrency(PROCEDURE 3)".

    //procedure GetCurrency();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Additional-Currency Posting" =
       "Additional-Currency Posting"::"Additional-Currency Amount Only"
    THEN BEGIN
    #4..8

    IF CurrencyCode = '' THEN BEGIN
      CLEAR(Currency);
      Currency.InitRoundingPrecision;
    END ELSE
      IF CurrencyCode <> Currency.Code THEN BEGIN
        Currency.GET(CurrencyCode);
        Currency.TESTFIELD("Amount Rounding Precision");
      END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
      Currency.InitRoundingPrecision
    #13..17
    */
    //end;


    //Unsupported feature: Code Modification on "ClearCustVendApplnEntry(PROCEDURE 11)".

    //procedure ClearCustVendApplnEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetAccTypeAndNo(Rec,AccType,AccNo);
    CASE AccType OF
      AccType::Customer:
        IF xRec."Applies-to ID" <> '' THEN BEGIN
          IF FindFirstCustLedgEntryWithAppliesToID(AccNo,xRec."Applies-to ID") THEN BEGIN
            ClearCustApplnEntryFields;
            CustEntrySetApplID.SetApplId(CustLedgEntry,TempCustLedgEntry,'');
          END
        END ELSE
          IF xRec."Applies-to Doc. No." <> '' THEN
            IF FindFirstCustLedgEntryWithAppliesToDocNo(AccNo,xRec."Applies-to Doc. No.") THEN BEGIN
              ClearCustApplnEntryFields;
              CustEntryEdit.RUN(CustLedgEntry);
            END;
      AccType::Vendor:
        IF xRec."Applies-to ID" <> '' THEN BEGIN
          IF FindFirstVendLedgEntryWithAppliesToID(AccNo,xRec."Applies-to ID") THEN BEGIN
            ClearVendApplnEntryFields;
            VendEntrySetApplID.SetApplId(VendLedgEntry,TempVendLedgEntry,'');
          END
        END ELSE
          IF xRec."Applies-to Doc. No." <> '' THEN
            IF FindFirstVendLedgEntryWithAppliesToDocNo(AccNo,xRec."Applies-to Doc. No.") THEN BEGIN
              ClearVendApplnEntryFields;
              VendEntryEdit.RUN(VendLedgEntry);
            END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        IF "Applies-to ID" <> '' THEN BEGIN
          IF FindFirstCustLedgEntryWithAppliesToID(AccNo) THEN BEGIN
    #6..9
          IF "Applies-to Doc. No." <> '' THEN
            IF FindFirstCustLedgEntryWithAppliesToDocNo(AccNo) THEN BEGIN
    #12..15
        IF "Applies-to ID" <> '' THEN BEGIN
          IF FindFirstVendLedgEntryWithAppliesToID(AccNo) THEN BEGIN
    #18..21
          IF "Applies-to Doc. No." <> '' THEN
            IF FindFirstVendLedgEntryWithAppliesToDocNo(AccNo) THEN BEGIN
    #24..27
    */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocCust(PROCEDURE 35)".

    //procedure LookUpAppliesToDocCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CLEAR(CustLedgEntry);
    CustLedgEntry.SETCURRENTKEY("Customer No.",Open,Positive,"Due Date");
    IF AccNo <> '' THEN
    #4..38
        ELSE
          VALIDATE("Account No.",AccNo);
      END;
      SetAmountWithCustLedgEntry;
      "Applies-to Doc. Type" := CustLedgEntry."Document Type";
      "Applies-to Doc. No." := CustLedgEntry."Document No.";
      "Applies-to ID" := '';
    END;
    GetCreditCard;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..41
      IF "Currency Code" <> CustLedgEntry."Currency Code" THEN
        IF Amount = 0 THEN BEGIN
          FromCurrencyCode := GetShowCurrencyCode("Currency Code");
          ToCurrencyCode := GetShowCurrencyCode(CustLedgEntry."Currency Code");
          IF NOT
             CONFIRM(
               Text003,TRUE,FIELDCAPTION("Currency Code"),TABLECAPTION,FromCurrencyCode,ToCurrencyCode)
          THEN
            ERROR(Text005);
          VALIDATE("Currency Code",CustLedgEntry."Currency Code");
        END ELSE
          GenJnlApply.CheckAgainstApplnCurrency(
            "Currency Code",CustLedgEntry."Currency Code",
            GenJnlLine."Account Type"::Customer,TRUE);
      IF Amount = 0 THEN BEGIN
        CustLedgEntry.CALCFIELDS("Remaining Amount");
        IF CustLedgEntry."Amount to Apply" <> 0 THEN BEGIN
          IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(Rec,CustLedgEntry,0,FALSE) THEN BEGIN
            IF ABS(CustLedgEntry."Amount to Apply") >=
               ABS(CustLedgEntry."Remaining Amount" - CustLedgEntry."Remaining Pmt. Disc. Possible")
            THEN
              Amount := -(CustLedgEntry."Remaining Amount" -
                          CustLedgEntry."Remaining Pmt. Disc. Possible")
            ELSE
              Amount := -CustLedgEntry."Amount to Apply";
          END ELSE
            Amount := -CustLedgEntry."Amount to Apply";
        END ELSE BEGIN
          IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(Rec,CustLedgEntry,0,FALSE) THEN
            Amount := -(CustLedgEntry."Remaining Amount" - CustLedgEntry."Remaining Pmt. Disc. Possible")
          ELSE
            Amount := -CustLedgEntry."Remaining Amount";
        END;
        IF "Bal. Account Type" IN ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor] THEN
          Amount := -Amount;
        VALIDATE(Amount);
      END;
    #43..47
    */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocVend(PROCEDURE 36)".

    //procedure LookUpAppliesToDocVend();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CLEAR(VendLedgEntry);
    VendLedgEntry.SETCURRENTKEY("Vendor No.",Open,Positive,"Due Date");
    IF AccNo <> '' THEN
    #4..43
        ELSE
          VALIDATE("Account No.",AccNo);
      END;
      SetAmountWithVendLedgEntry;
      "Applies-to Doc. Type" := VendLedgEntry."Document Type";
      "Applies-to Doc. No." := VendLedgEntry."Document No.";
      "Applies-to ID" := '';
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..46
      IF "Currency Code" <> VendLedgEntry."Currency Code" THEN
        IF Amount = 0 THEN BEGIN
          FromCurrencyCode := GetShowCurrencyCode("Currency Code");
          ToCurrencyCode := GetShowCurrencyCode(VendLedgEntry."Currency Code");
          IF NOT
             CONFIRM(
               Text003,TRUE,FIELDCAPTION("Currency Code"),TABLECAPTION,FromCurrencyCode,ToCurrencyCode)
          THEN
            ERROR(Text005);
          VALIDATE("Currency Code",VendLedgEntry."Currency Code");
        END ELSE
          GenJnlApply.CheckAgainstApplnCurrency(
            "Currency Code",VendLedgEntry."Currency Code",GenJnlLine."Account Type"::Vendor,TRUE);
      IF Amount = 0 THEN BEGIN
        VendLedgEntry.CALCFIELDS("Remaining Amount");
        IF VendLedgEntry."Amount to Apply" <> 0 THEN BEGIN
          IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(Rec,VendLedgEntry,0,FALSE) THEN BEGIN
            IF ABS(VendLedgEntry."Amount to Apply") >=
               ABS(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible")
            THEN
              Amount := -(VendLedgEntry."Remaining Amount" -
                          VendLedgEntry."Remaining Pmt. Disc. Possible")
            ELSE
              Amount := -VendLedgEntry."Amount to Apply";
          END ELSE
            Amount := -VendLedgEntry."Amount to Apply";
        END ELSE BEGIN
          IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(Rec,VendLedgEntry,0,FALSE) THEN
            Amount := -(VendLedgEntry."Remaining Amount" -
                        VendLedgEntry."Remaining Pmt. Disc. Possible")
          ELSE
            Amount := -VendLedgEntry."Remaining Amount";
        END;
        IF "Bal. Account Type" IN
           ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor]
        THEN
          Amount := -Amount;
        VALIDATE(Amount);
      END;
    #48..51
    */
    //end;


    //Unsupported feature: Code Modification on "GetVendLedgerEntry(PROCEDURE 37)".

    //procedure GetVendLedgerEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ("Account Type" = "Account Type"::Vendor) AND ("Account No." = '') AND
       ("Applies-to Doc. No." <> '') AND (Amount = 0)
    THEN BEGIN
    #4..10
      VendLedgEntry.CALCFIELDS("Remaining Amount");

      IF "Posting Date" <= VendLedgEntry."Pmt. Discount Date" THEN
        Amount := -(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible")
      ELSE
        Amount := -VendLedgEntry."Remaining Amount";

    #18..43
      END ELSE
        VALIDATE(Amount);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
        Amount := -(CustLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible")
    #15..46
    */
    //end;


    //Unsupported feature: Code Modification on "SetJournalLineFieldsFromApplication(PROCEDURE 51)".

    //procedure SetJournalLineFieldsFromApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Exported to Payment File" := FALSE;
    GetAccTypeAndNo(Rec,AccType,AccNo);
    CASE AccType OF
      AccType::Customer:
        IF "Applies-to ID" <> '' THEN BEGIN
          IF FindFirstCustLedgEntryWithAppliesToID(AccNo,"Applies-to ID") THEN BEGIN
            CustLedgEntry.SETRANGE("Exported to Payment File",TRUE);
            "Exported to Payment File" := CustLedgEntry.FINDFIRST;
          END
        END ELSE
          IF "Applies-to Doc. No." <> '' THEN
            IF FindFirstCustLedgEntryWithAppliesToDocNo(AccNo,"Applies-to Doc. No.") THEN BEGIN
              "Exported to Payment File" := CustLedgEntry."Exported to Payment File";
              "Applies-to Ext. Doc. No." := CustLedgEntry."External Document No.";
            END;
      AccType::Vendor:
        IF "Applies-to ID" <> '' THEN BEGIN
          IF FindFirstVendLedgEntryWithAppliesToID(AccNo,"Applies-to ID") THEN BEGIN
            VendLedgEntry.SETRANGE("Exported to Payment File",TRUE);
            "Exported to Payment File" := VendLedgEntry.FINDFIRST;
          END
        END ELSE
          IF "Applies-to Doc. No." <> '' THEN
            IF FindFirstVendLedgEntryWithAppliesToDocNo(AccNo,"Applies-to Doc. No.") THEN BEGIN
              "Exported to Payment File" := VendLedgEntry."Exported to Payment File";
              "Applies-to Ext. Doc. No." := VendLedgEntry."External Document No.";
            END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
          IF FindFirstCustLedgEntryWithAppliesToID(AccNo) THEN BEGIN
    #7..11
            IF FindFirstCustLedgEntryWithAppliesToDocNo(AccNo) THEN BEGIN
    #13..17
          IF FindFirstVendLedgEntryWithAppliesToID(AccNo) THEN BEGIN
    #19..23
            IF FindFirstVendLedgEntryWithAppliesToDocNo(AccNo) THEN BEGIN
    #25..28
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstCustLedgEntryWithAppliesToID(PROCEDURE 54)".

    //procedure FindFirstCustLedgEntryWithAppliesToID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustLedgEntry.RESET;
    CustLedgEntry.SETCURRENTKEY("Customer No.","Applies-to ID",Open);
    CustLedgEntry.SETRANGE("Customer No.",AccNo);
    CustLedgEntry.SETRANGE("Applies-to ID",AppliesToID);
    CustLedgEntry.SETRANGE(Open,TRUE);
    EXIT(CustLedgEntry.FINDFIRST)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    CustLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
    CustLedgEntry.SETRANGE(Open,TRUE);
    EXIT(CustLedgEntry.FINDFIRST)
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstCustLedgEntryWithAppliesToDocNo(PROCEDURE 55)".

    //procedure FindFirstCustLedgEntryWithAppliesToDocNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustLedgEntry.RESET;
    CustLedgEntry.SETCURRENTKEY("Document No.");
    CustLedgEntry.SETRANGE("Document No.",AppliestoDocNo);
    CustLedgEntry.SETRANGE("Document Type","Applies-to Doc. Type");
    CustLedgEntry.SETRANGE("Customer No.",AccNo);
    CustLedgEntry.SETRANGE(Open,TRUE);
    EXIT(CustLedgEntry.FINDFIRST)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CustLedgEntry.RESET;
    CustLedgEntry.SETCURRENTKEY("Document No.");
    CustLedgEntry.SETRANGE("Document No.","Applies-to Doc. No.");
    #4..7
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstVendLedgEntryWithAppliesToID(PROCEDURE 58)".

    //procedure FindFirstVendLedgEntryWithAppliesToID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendLedgEntry.RESET;
    VendLedgEntry.SETCURRENTKEY("Vendor No.","Applies-to ID",Open);
    VendLedgEntry.SETRANGE("Vendor No.",AccNo);
    VendLedgEntry.SETRANGE("Applies-to ID",AppliesToID);
    VendLedgEntry.SETRANGE(Open,TRUE);
    EXIT(VendLedgEntry.FINDFIRST)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
    VendLedgEntry.SETRANGE(Open,TRUE);
    EXIT(VendLedgEntry.FINDFIRST)
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstVendLedgEntryWithAppliesToDocNo(PROCEDURE 59)".

    //procedure FindFirstVendLedgEntryWithAppliesToDocNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendLedgEntry.RESET;
    VendLedgEntry.SETCURRENTKEY("Document No.");
    VendLedgEntry.SETRANGE("Document No.",AppliestoDocNo);
    VendLedgEntry.SETRANGE("Document Type","Applies-to Doc. Type");
    VendLedgEntry.SETRANGE("Vendor No.",AccNo);
    VendLedgEntry.SETRANGE(Open,TRUE);
    EXIT(VendLedgEntry.FINDFIRST)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    VendLedgEntry.RESET;
    VendLedgEntry.SETCURRENTKEY("Document No.");
    VendLedgEntry.SETRANGE("Document No.","Applies-to Doc. No.");
    #4..7
    */
    //end;


    //Unsupported feature: Code Modification on "CleanLine(PROCEDURE 66)".

    //procedure CleanLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateLineBalance;
    UpdateSource;
    CreateDim(
    #4..12
      "Tax Area Code" := '';
      "Tax Liable" := FALSE;
      "Tax Group Code" := '';
      "Bill-to/Pay-to No." := '';
      "Ship-to/Order Address Code" := '';
      "Sell-to/Buy-from No." := '';
      UpdateCountryCodeAndVATRegNo('');
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "ExportPaymentFile(PROCEDURE 81)".

    //procedure ExportPaymentFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT FINDSET THEN
      ERROR(NothingToExportErr);
    SETRANGE("Journal Template Name","Journal Template Name");
    SETRANGE("Journal Batch Name","Journal Batch Name");
    TESTFIELD("Check Printed",FALSE);

    GenJnlBatch.GET("Journal Template Name","Journal Batch Name");
    GenJnlBatch.TESTFIELD("Bal. Account Type",GenJnlBatch."Bal. Account Type"::"Bank Account");
    #9..16
      CODEUNIT.RUN(BankAcc.GetPaymentExportCodeunitID,Rec)
    ELSE
      CODEUNIT.RUN(CODEUNIT::"Exp. Launcher Gen. Jnl.",Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    #6..19
    */
    //end;


    //Unsupported feature: Code Modification on "SetFiltersOnCreditTransferEntry(PROCEDURE 86)".

    //procedure SetFiltersOnCreditTransferEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CreditTransferEntry.RESET;
    FoundCorrespondingLedgerEntry := FALSE;
    CASE "Account Type" OF
      "Account Type"::Vendor:
        BEGIN
          CreditTransferEntry.SETRANGE("Account Type",CreditTransferEntry."Account Type"::Vendor);
          IF "Applies-to Doc. No." <> '' THEN BEGIN
            VendorLedgerEntry.SETRANGE("Document Type","Applies-to Doc. Type");
            VendorLedgerEntry.SETRANGE("Document No.","Applies-to Doc. No.");
            IF VendorLedgerEntry.FINDFIRST THEN BEGIN
              CreditTransferEntry.SETRANGE("Applies-to Entry No.",VendorLedgerEntry."Entry No.");
              FoundCorrespondingLedgerEntry := TRUE;
            END;
          END;
        END;
      "Account Type"::Customer:
        BEGIN
          CreditTransferEntry.SETRANGE("Account Type",CreditTransferEntry."Account Type"::Customer);
          IF "Applies-to Doc. No." <> '' THEN BEGIN
            CustLedgerEntry.SETRANGE("Document Type","Applies-to Doc. Type");
            CustLedgerEntry.SETRANGE("Document No.","Applies-to Doc. No.");
            IF CustLedgerEntry.FINDFIRST THEN BEGIN
              CreditTransferEntry.SETRANGE("Applies-to Entry No.",CustLedgerEntry."Entry No.");
              FoundCorrespondingLedgerEntry := TRUE;
            END;
          END;
        END;
    END;
    CreditTransferEntry.SETRANGE("Account No.","Account No.");
    IF NOT FoundCorrespondingLedgerEntry THEN
      CreditTransferEntry.SETRANGE("Applies-to Entry No.",0);
    GeneralLedgerSetup.GET;
    CreditTransferEntry.SETFILTER(
      "Currency Code",'''%1''|''%2''',"Currency Code",GeneralLedgerSetup.GetCurrencyCode("Currency Code"));
    CreditTransferEntry.SETRANGE(Canceled,FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CreditTransferEntry.RESET;
    CASE "Account Type" OF
      "Account Type"::Vendor:
        CreditTransferEntry.SETRANGE("Account Type",CreditTransferEntry."Account Type"::Vendor);
      "Account Type"::Customer:
        CreditTransferEntry.SETRANGE("Account Type",CreditTransferEntry."Account Type"::Customer);
    END;
    CreditTransferEntry.SETRANGE("Account No.","Account No.");
    CreditTransferEntry.SETRANGE("Applies-to Entry No.","Source Line No.");
    CreditTransferEntry.SETRANGE("Currency Code","Currency Code");
    CreditTransferEntry.SETRANGE(Canceled,FALSE);
    */
    //end;

    //Unsupported feature: Deletion (ParameterCollection) on "FindFirstCustLedgEntryWithAppliesToID(PROCEDURE 54).AppliesToID(Parameter 1001)".


    //Unsupported feature: Deletion (ParameterCollection) on "FindFirstCustLedgEntryWithAppliesToDocNo(PROCEDURE 55).AppliestoDocNo(Parameter 1001)".


    //Unsupported feature: Deletion (ParameterCollection) on "FindFirstVendLedgEntryWithAppliesToID(PROCEDURE 58).AppliesToID(Parameter 1001)".


    //Unsupported feature: Deletion (ParameterCollection) on "FindFirstVendLedgEntryWithAppliesToDocNo(PROCEDURE 59).AppliestoDocNo(Parameter 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "SetFiltersOnCreditTransferEntry(PROCEDURE 86).GeneralLedgerSetup(Variable 1004)".


    //Unsupported feature: Deletion (VariableCollection) on "SetFiltersOnCreditTransferEntry(PROCEDURE 86).CustLedgerEntry(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "SetFiltersOnCreditTransferEntry(PROCEDURE 86).VendorLedgerEntry(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "SetFiltersOnCreditTransferEntry(PROCEDURE 86).FoundCorrespondingLedgerEntry(Variable 1003)".
    procedure ClearGenJnlLines(TemplateNmae: Code[50]; BatchName: Code[50])
    var
        GenJnlLine: Record "Gen. Journal Line";
    begin
        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", TemplateNmae);
        GenJnlLine.SetRange("Journal Batch Name", BatchName);
        GenJnlLine.DeleteAll();
    end;
}

