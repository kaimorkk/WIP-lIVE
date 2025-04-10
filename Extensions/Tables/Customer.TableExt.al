TableExtension 52193432 tableextension52193432 extends Customer
{

    //Unsupported feature: Property Modification (Permissions) on "Customer(Table 18)".

    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Salesperson Code"(Field 29)".


        //Unsupported feature: Deletion on ""Salesperson Code"(Field 29).OnValidate".


        //Unsupported feature: Deletion on "Blocked(Field 39).OnValidate".


        //Unsupported feature: Code Modification on ""IC Partner Code"(Field 119).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF xRec."IC Partner Code" <> "IC Partner Code" THEN BEGIN
          IF NOT CustLedgEntry.SETCURRENTKEY("Customer No.",Open) THEN
            CustLedgEntry.SETCURRENTKEY("Customer No.");
          CustLedgEntry.SETRANGE("Customer No.","No.");
          CustLedgEntry.SETRANGE(Open,TRUE);
          IF CustLedgEntry.FINDLAST THEN
            ERROR(Text012,FIELDCAPTION("IC Partner Code"),TABLECAPTION);

          CustLedgEntry.RESET;
          CustLedgEntry.SETCURRENTKEY("Customer No.","Posting Date");
          CustLedgEntry.SETRANGE("Customer No.","No.");
          AccountingPeriod.SETRANGE(Closed,FALSE);
          IF AccountingPeriod.FINDFIRST THEN BEGIN
            CustLedgEntry.SETFILTER("Posting Date",'>=%1',AccountingPeriod."Starting Date");
            IF CustLedgEntry.FINDFIRST THEN
              IF NOT CONFIRM(Text011,FALSE,TABLECAPTION) THEN
                "IC Partner Code" := xRec."IC Partner Code";
          END;
        END;

        IF "IC Partner Code" <> '' THEN BEGIN
        #22..29
          ICPartner."Customer No." := '';
          ICPartner.MODIFY;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF xRec."IC Partner Code" <> "IC Partner Code" THEN BEGIN
        #10..12
          IF AccountingPeriod.FINDFIRST THEN
            CustLedgEntry.SETFILTER("Posting Date",'>=%1',AccountingPeriod."Starting Date");
          IF CustLedgEntry.FINDFIRST THEN
            IF NOT CONFIRM(Text011,FALSE,TABLECAPTION) THEN
              "IC Partner Code" := xRec."IC Partner Code";

          CustLedgEntry.RESET;
        #2..7
        #19..32
        */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Privacy Blocked"(Field 150)".



        //Unsupported feature: Code Modification on ""Primary Contact No."(Field 5049).OnLookup".

        //trigger "(Field 5049)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ContBusRel.SETCURRENTKEY("Link to Table","No.");
        ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
        ContBusRel.SETRANGE("No.","No.");
        #4..7

        IF "Primary Contact No." <> '' THEN
          IF Cont.GET("Primary Contact No.") THEN ;
        IF PAGE.RUNMODAL(0,Cont) = ACTION::LookupOK THEN BEGIN
          TempCust.COPY(Rec);
          FIND;
          TRANSFERFIELDS(TempCust,FALSE);
          VALIDATE("Primary Contact No.",Cont."No.");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..10
        IF PAGE.RUNMODAL(0,Cont) = ACTION::LookupOK THEN
          VALIDATE("Primary Contact No.",Cont."No.");
        */
        //end;
        field(50001; "KBA Code"; Code[10])
        {
        }
        field(50002; "KBA Branch Code"; Code[10])
        {
        }
        field(50003; "Withholding Tax Code"; Code[10])
        {
        }
        field(50004; "PIN No."; Code[20])
        {
        }
        field(50005; DateOfIncorporation; Date)
        {
        }
        field(50006; CountyID; Integer)
        {
        }
        field(50007; UserIDx; Integer)
        {
        }
        field(50008; EndOfFinancialYear; Date)
        {
        }
        field(50009; RegistrationDate; Date)
        {
        }
        field(50010; CertificateNo; Code[50])
        {

            trigger OnValidate()
            begin
                // CustRec.Reset;
                // CustRec.SetRange(CustRec.CertificateNo, CertificateNo);
                // if CustRec.Find('-') then
                //     Error('The Certificate Number already exists in the system');
            end;
        }
        field(50018; "Phone No1."; Text[50])
        {
        }
        field(50019; IndustryID; Integer)
        {
        }
        field(50022; "Mobile 1"; Text[50])
        {
        }
        field(50024; Deregistered; Boolean)
        {
        }
        field(50025; CustomerTypeID; Integer)
        {
        }
        field(50026; RegestryReferenceNumber; Code[100])
        {
        }
        field(53051; "RefNo."; Code[10])
        {
        }
        field(68000; "Customer Type"; Option)
        {
            OptionCaption = ' ,Member,Debtor,FOSA,MICRO,Defaulters,Imprest,Licensing,Tender Alert';
            OptionMembers = " ",Member,Debtor,FOSA,MICRO,Defaulters,Imprest,Licensing,"Tender Alert";
        }
        field(68001; "Registration Date"; Date)
        {
        }
        field(68002; "Current Loan"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("No."),
                                                                                 "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = field("Currency Filter"),
                                                                                 "Transaction Type" = const("Deposit Contribution"),
                                                                                 "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68003; "Current Shares"; Decimal)
        {
            CalcFormula = - sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                          "Initial Entry Global Dim. 2" = filter('SHARE CAPITAL'),
                                                                          "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68004; "Total Repayments"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("No."),
                                                                                 "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = field("Currency Filter"),
                                                                                 "Transaction Type" = const("Share Contribution"),
                                                                                 "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68005; "Principal Balance"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = filter(Loan | "Loan Repayment")));
            FieldClass = FlowField;
        }
        field(68006; "Principal Repayment"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = filter("Loan Repayment")));
            FieldClass = FlowField;
        }
        field(68008; "Debtors Type"; Option)
        {
            OptionCaption = ' ,Staff,Client,Others';
            OptionMembers = " ",Staff,Client,Others;
        }
        field(68011; "Oustanding Balance"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = filter(Loan | "Loan Repayment")));
            FieldClass = FlowField;
        }
        field(68012; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Released,,Rejected,Active,"Non-Active",Suspended,Deceased,Withdrawan,Retired,Termination,"Family Member",,,BOSA;

            trigger OnValidate()
            begin
                Advice := true;
            end;
        }
        field(68013; "FOSA Account"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(68015; "Old Account No."; Code[20])
        {
        }
        field(68016; "Loan Product Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            //TableRelation = "Loan Product Types";
        }
        field(68017; "Employer Code"; Code[50])
        {

            trigger OnValidate()
            begin
                // if "Employer Code" = '' then begin
                //     "Employer Name" := '';
                //     "Department Code" := '';
                //     "Department Name" := '';
                // end;

                // if EmployerRecord.Get("Employer Code") then begin
                //     "Employer Name" := EmployerRecord.Name;

                //     if "Department Code" <> '' then begin
                //         DeptRec.Reset;
                //         DeptRec.SetRange(DeptRec."Employer Code", "Employer Code");
                //         if not DeptRec.Find then begin
                //             "Department Code" := '';
                //             "Department Name" := '';
                //         end;
                //     end;

                // end;
            end;
        }
        field(68018; "Date of Birth"; Date)
        {

            trigger OnValidate()
            begin
                // Validating the Date of Birth
                if "Date of Birth" <> 0D then begin
                    // if GenSetUp.Get(0) then begin
                    //     if CalcDate(GenSetUp."Min. Member Age", "Date of Birth") > Today then
                    //         Error('Applicant is below the mininmum membership age of %1', GenSetUp."Min. Member Age");
                    // end;
                end;
            end;
        }
        field(68019; "E-Mail (Personal)"; Text[50])
        {
        }
        field(68020; "Department Code"; Code[50])
        {
            TableRelation = Departments."No." where("Employer Code" = field("Employer Code"));

            trigger OnValidate()
            begin
                // if "Department Code" = '' then
                //     "Department Name" := '';

                // DeptRec.Reset;
                // DeptRec.SetRange(DeptRec."No.", "Department Code");
                // if DeptRec.Find('-') then
                //     "Department Name" := DeptRec.Name;
            end;
        }
        field(68021; "Home Address"; Text[50])
        {
        }
        field(68022; Location; Text[50])
        {
        }
        field(68023; "Sub-Location"; Text[50])
        {
        }
        field(68024; District; Text[50])
        {
        }
        field(68025; "Resons for Status Change"; Text[150])
        {
        }
        field(68026; "Staff No"; Code[20])
        {
        }
        field(68027; "ID No."; Code[50])
        {

            trigger OnValidate()
            begin
                // Validating the ID Number
                if "ID No." <> '' then begin
                    // Cust.Reset;
                    // Cust.SetRange(Cust."ID No.", "ID No.");
                    // Cust.SetRange(Cust."Customer Type", Cust."customer type"::Member);
                    // if Cust.Find('-') then begin
                    //     if Cust."No." <> "No." then
                    //         Error('ID No. already exists');
                    // end;
                end;
            end;
        }
        field(68028; "Mobile Phone No"; Code[50])
        {

            trigger OnValidate()
            begin
                /*
                Vend.RESET;
                Vend.SETRANGE(Vend."Staff No","Staff No");
                IF Vend.FIND('-') THEN
                Vend.MODIFYALL(Vend."Mobile Phone No","Mobile Phone No");
                
                Cust.RESET;
                Cust.SETRANGE(Cust."Staff No","Staff No");
                IF Cust.FIND('-') THEN
                Cust.MODIFYALL(Cust."Mobile Phone No","Mobile Phone No");
                
                     */

            end;
        }
        field(68029; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Divorced,Separated,Widower,Widow;
        }
        field(68030; Signature; Blob)
        {
        }
        field(68031; "Passport No."; Code[50])
        {
        }
        field(68032; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(68033; "Withdrawal Date"; Date)
        {

            trigger OnValidate()
            begin
                // "Payment Date" := CalcDate('60D', "Withdrawal Date");
            end;
        }
        field(68034; "Withdrawal Fee"; Decimal)
        {
            CalcFormula = - sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                          "Transaction Type" = const(Loan),
                                                                          "Posting Date" = field(upperlimit("Date Filter"))));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68035; "Status - Withdrawal App."; Option)
        {
            OptionCaption = ' ,Application,Being Processed,Approved,Rejected,Canceled';
            OptionMembers = " ",Application,"Being Processed",Approved,Rejected,Canceled;

            trigger OnValidate()
            begin
                //"Approval Date":=TODAY;

                if "Status - Withdrawal App." = "status - withdrawal app."::Approved then begin
                    CalcFields("Oustanding Balance");
                    if "Oustanding Balance" > 0 then
                        Error('Member has oustanding loan balances. Please makes sure they are cleared to facilitate approval.');
                end;
            end;
        }
        field(68036; "Application Date"; Date)
        {
        }
        field(68037; "Investment Contribution"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = filter(Investment)));
            FieldClass = FlowField;
        }
        field(68038; "Investment Max Limit."; Decimal)
        {
        }
        field(68039; "Current Investment Total"; Decimal)
        {
            CalcFormula = - sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                          "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68040; "Document No. Filter"; Code[20])
        {
        }
        field(68041; "Shares Retained"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = const("Registration Fee")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68043; "Registration Fee"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = const("Registration Fee")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68044; "Registration Fee Paid"; Boolean)
        {
            Editable = false;
        }
        field(68045; "Society Code"; Code[20])
        {
            CaptionClass = '1,1,0';
        }
        field(68046; "Insurance Fund"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = filter("BBF Contribution"),
                                                                         "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68047; "Monthly Contribution"; Decimal)
        {

            trigger OnLookup()
            begin
                if "Customer Type" = "customer type"::Member then
                    Page.RunModal(51507607, Rec)
                else
                    Page.RunModal(22, Rec);
            end;

            trigger OnValidate()
            begin
                //Check Min Contractual Shares
                if "Monthly Contribution" <> 0 then begin
                    // "Dividend Amount" := (("Deposit Contribution" * GenSetUp."Dividend (%)") * 0.01);
                    // GenSetUp.Get(0);

                    // Loans.Reset;
                    // Loans.SetRange(Loans."Member No.", "No.");
                    // if Loans.Find('-') then begin
                    //     repeat
                    //         Loans.CalcFields(Loans."Outstanding Balance");
                    //         if (Loans."Outstanding Balance" > 0) then begin
                    //             if MinShares < ((Loans."Approved Amount" * GenSetUp."Contactual Shares (%)") * 0.01) then
                    //                 MinShares := (Loans."Approved Amount" * GenSetUp."Contactual Shares (%)") * 0.01;
                    //         end;
                    //     until Loans.Next = 0;
                    // end;

                    // if MinShares < GenSetUp."Min. Contribution" then
                    //     MinShares := GenSetUp."Min. Contribution";

                    // if "Monthly Contribution" < MinShares then
                    //     Error('Monthly contribution cannot be less than the contractual shares i.e. %1', MinShares);

                end;

                Advice := true;
                //Check Min Contractual Shares

                "Previous Share Contribution" := xRec."Monthly Contribution";
            end;
        }
        field(68048; "Investment B/F"; Decimal)
        {
        }
        field(68049; "Dividend Amount"; Decimal)
        {
        }
        field(68050; "Name of Chief"; Text[50])
        {
        }
        field(68051; "Office Telephone No."; Code[50])
        {
        }
        field(68052; "Extension No."; Code[30])
        {
        }
        field(68053; "Insurance Contribution"; Decimal)
        {

            trigger OnValidate()
            begin
                Advice := true;
            end;
        }
        field(68054; Advice; Boolean)
        {
        }
        field(68055; Province; Code[50])
        {
        }
        field(68056; "Previous Share Contribution"; Decimal)
        {
        }
        field(68057; "Un-allocated Funds"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = const("BBF Contribution"),
                                                                         "Posting Date" = field("Date Filter"),
                                                                         "Document No." = field("Document No. Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68058; "Refund Request Amount"; Decimal)
        {
            CalcFormula = sum(Refunds.Amount where("Member No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68059; "Refund Issued"; Boolean)
        {
            Editable = false;
        }
        field(68060; "Batch No."; Code[20])
        {

            trigger OnValidate()
            begin
                "Refund Issued" := false;
            end;
        }
        field(68061; "Current Status"; Option)
        {
            OptionMembers = Approved,Rejected;
        }
        field(68062; "Cheque No."; Code[20])
        {
        }
        field(68063; "Cheque Date"; Date)
        {
        }
        field(68064; "Accrued Interest"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = filter("Loan Repayment" | Withdrawal),
                                                                         "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68065; "Defaulted Loans Recovered"; Boolean)
        {
        }
        field(68066; "Withdrawal Posted"; Boolean)
        {
        }
        field(68067; "Old Shares Account"; Code[20])
        {
        }
        field(68068; "Old ABF Account"; Code[20])
        {
        }
        field(68069; "Group Code"; Code[20])
        {
        }
        field(68070; "Mode Of Dividend Payment"; Option)
        {
            OptionMembers = FOSA,Capitalize;
        }
        field(68071; "Loans Guaranteed"; Integer)
        {
            // CalcFormula = count("Loan Guarantors" where("Member No" = field("No."),
            // Substituted = filter(false),
            //                                              "Guarantee Approved" = filter(true)));
            FieldClass = FlowField;
        }
        field(68072; "Shares Guaranteed"; Decimal)
        {
            //CalcFormula = sum("Loan Guarantors"."Amount Guaranteed" where("Member No" = field("No.")));
            FieldClass = FlowField;
        }
        field(68073; "Deposit Contribution"; Decimal)
        {
            CalcFormula = - sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                          "Posting Date" = field("Date Filter"),
                                                                          "Sacco Transaction Type" = filter(Contribution)));
            Caption = '<Deposit Contribution>';
            Editable = false;
            FieldClass = FlowField;
        }
        field(68074; "IESA Savings"; Decimal)
        {
            FieldClass = Normal;
        }
        field(68075; "IESA Savings Interest"; Decimal)
        {
        }
        field(68076; "Staff Type"; Option)
        {
            OptionCaption = '  ,CMC,Staff';
            OptionMembers = "  ",CMC,Staff;
        }
        field(68077; "Holiday Savings"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Transaction Type" = const(Investment),
                                                                         "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(68078; "Office Purchase"; Decimal)
        {
            FieldClass = Normal;
        }
        field(68079; "Company Code"; Code[10])
        {
        }
        field(68080; "Qualifying Shares"; Decimal)
        {
            CalcFormula = sum("Dividends Progression"."Qualifying Shares" where("Member No" = field("No.")));
            FieldClass = FlowField;
        }
        field(68083; "Bank Code"; Code[20])
        {
            TableRelation = "Customer Bank Account".Code;

            trigger OnValidate()
            begin
                if "Bank Code" = '' then
                    "Bank Name" := '';
                if CustBank.Get("Bank Code") then begin
                    "Department Name" := CustBank.Name;
                end;
            end;
        }
        field(68084; "Bank Name"; Text[50])
        {
        }
        field(68085; "Account No."; Code[60])
        {
        }
        field(68086; Division; Text[60])
        {
        }
        field(68087; "Sacco Number"; Code[10])
        {
        }
        field(68088; Designation; Text[50])
        {
        }
        field(68089; "Payment Date"; Date)
        {
        }
        field(68090; "Interest On InvestMents"; Decimal)
        {
        }
        field(68091; "Taxable Amount On Div"; Decimal)
        {
        }
        field(68092; "Taxable Amount On Invest"; Decimal)
        {
        }
        field(68093; "Outstanding Loan Guarantee"; Decimal)
        {
            //CalcFormula = sum("Loan Guarantors"."Amount Guaranteed" where("Member No" = field("No.")));
            FieldClass = FlowField;
        }
        field(68097; "Next Of Kin Numbers"; Decimal)
        {
            // CalcFormula = sum("Next of Kin BOSA"."%Allocation" where("Member No" = field("No.")));
            FieldClass = FlowField;
        }
        field(68098; "Invest Contribution"; Decimal)
        {
        }
        field(68099; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,MemberApplication';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",MemberApplication;
        }
        field(68100; "Initial Monthly Contribution"; Decimal)
        {
        }
        field(68101; "Current Monthly Contribution"; Decimal)
        {
        }
        field(68102; "LoanNo filter"; Code[20])
        {
        }
        field(68103; "Oustanding Registration Fees"; Decimal)
        {
        }
        field(68104; "Company Name"; Text[30])
        {
        }
        field(68105; "Date of Employment"; Date)
        {

            trigger OnValidate()
            begin
                if "Date of Employment" > Today then
                    Error(Text017);
            end;
        }
        field(68106; "Total Deductions"; Decimal)
        {

            trigger OnValidate()
            begin
                //**********Income
                Validate("Basic pay");
                "Net Income" := ("Basic pay" + "Other Allowances") - "Total Deductions";
            end;
        }
        field(68107; "House Allowance"; Decimal)
        {
        }
        field(68108; "Other Allowances"; Decimal)
        {

            trigger OnValidate()
            begin
                //**********Income
                "Net Income" := ("Basic pay" + "Other Allowances") - "Total Deductions";
            end;
        }
        field(68109; "Cleared Effects"; Decimal)
        {
        }
        field(68110; "Net Income"; Decimal)
        {
        }
        field(68111; Title; Code[30])
        {
            TableRelation = Titles.Code;
        }
        field(68112; Station; Text[50])
        {
        }
        field(68113; "Terms Of Service"; Code[50])
        {
            TableRelation = "Terms of Service";
        }
        field(68114; "Last Name"; Text[50])
        {

            trigger OnValidate()
            begin
                Name := "Last Name" + ' ' + "Other Names";
            end;
        }
        field(68115; "Other Names"; Text[50])
        {

            trigger OnValidate()
            begin
                //Name:="Last Name" + "Other Names";
                Name := "Last Name" + ' ' + "Other Names";
            end;
        }
        field(68116; "Membership Application No."; Code[20])
        {
        }
        field(68117; "Employer Name"; Text[50])
        {
        }
        field(68118; "Basic pay"; Decimal)
        {
        }
        field(68119; "Department Name"; Text[20])
        {
        }
        field(68120; "Class Code"; Code[30])
        {
            TableRelation = "Class Code";
        }
        field(68121; "Type Code"; Code[30])
        {
        }
        field(68122; "Member Status"; Option)
        {
            OptionCaption = ' ,Active,Dormant,Terminated,Deceased';
            OptionMembers = " ",Active,Dormant,Terminated,Deceased;
        }
        field(68123; "Member Qty"; Integer)
        {
            FieldClass = Normal;
        }
        field(68124; "Member Act. Qty"; Integer)
        {
        }
        field(68125; "Member Arc. Qty"; Integer)
        {
        }
        field(68126; "User ID"; Code[50])
        {
        }
        field(68127; "Member Type"; Option)
        {
            OptionCaption = ' ,Individual,Normal,Group';
            OptionMembers = " ",Individual,Normal,Group;
        }
        field(68128; "Currect File Location"; Text[50])
        {
        }
        field(68129; "Term of Service Description"; Text[30])
        {
        }
        field(68130; "Number of Members"; Integer)
        {
            CalcFormula = count("Group Members" where("Record No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68131; "Customer Ref No"; Code[30])
        {
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF DOPaymentCreditCard.FINDFIRST THEN
      DOPaymentCreditCard.DeleteByCustomer(Rec);

    #4..50
    ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
    ItemCrossReference.DELETEALL;

    IF NOT SocialListeningSearchTopic.ISEMPTY THEN BEGIN
      SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Customer,"No.");
      SocialListeningSearchTopic.DELETEALL;
    END;

    SalesOrderLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
    SalesOrderLine.SETRANGE("Bill-to Customer No.","No.");
    IF SalesOrderLine.FINDFIRST THEN
      ERROR(
    #63..118
    VATRegistrationLogMgt.DeleteCustomerLog(Rec);

    DimMgt.DeleteDefaultDim(DATABASE::Customer,"No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..53
    SalesOrderLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
    SalesOrderLine.SETFILTER(
      "Document Type",'%1|%2',
      SalesOrderLine."Document Type"::Order,
      SalesOrderLine."Document Type"::"Return Order");
    #60..121
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    IF (Name <> xRec.Name) OR
    #4..23
    THEN BEGIN
      MODIFY;
      UpdateContFromCust.OnModify(Rec);
      IF NOT FIND THEN BEGIN
        RESET;
        IF FIND THEN;
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..26
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "CheckBlockedCustOnDocs(PROCEDURE 5)".

    //procedure CheckBlockedCustOnDocs();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH Cust2 DO BEGIN
      IF "Privacy Blocked" THEN
        CustPrivacyBlockedErrorMessage(Cust2,Transaction);

      IF ((Blocked = Blocked::All) OR
          ((Blocked = Blocked::Invoice) AND (DocType IN [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"])) OR
          ((Blocked = Blocked::Ship) AND (DocType IN [DocType::Quote,DocType::Order,DocType::"Blanket Order"]) AND
    #8..10
      THEN
        CustBlockedErrorMessage(Cust2,Transaction);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WITH Cust2 DO BEGIN
    #5..13
    */
    //end;


    //Unsupported feature: Code Modification on "CheckBlockedCustOnJnls(PROCEDURE 7)".

    //procedure CheckBlockedCustOnJnls();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH Cust2 DO BEGIN
      IF "Privacy Blocked" THEN
        CustPrivacyBlockedErrorMessage(Cust2,Transaction);

      IF (Blocked = Blocked::All) OR
         ((Blocked = Blocked::Invoice) AND (DocType IN [DocType::Invoice,DocType::" "]))
      THEN
        CustBlockedErrorMessage(Cust2,Transaction)
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WITH Cust2 DO BEGIN
    #5..9
    */
    //end;


    //Unsupported feature: Code Modification on "GetTotalAmountLCYCommon(PROCEDURE 17)".

    //procedure GetTotalAmountLCYCommon();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesOutstandingAmountFromShipment := SalesLine.OutstandingInvoiceAmountFromShipment("No.");
    ServOutstandingAmountFromShipment := ServiceLine.OutstandingInvoiceAmountFromShipment("No.");
    InvoicedPrepmtAmountLCY := GetInvoicedPrepmtAmountLCY;
    RetRcdNotInvAmountLCY := GetReturnRcdNotInvAmountLCY;

    EXIT("Balance (LCY)" + "Outstanding Orders (LCY)" + "Shipped Not Invoiced (LCY)" + "Outstanding Invoices (LCY)" +
      "Outstanding Serv. Orders (LCY)" + "Serv Shipped Not Invoiced(LCY)" + "Outstanding Serv.Invoices(LCY)" -
      SalesOutstandingAmountFromShipment - ServOutstandingAmountFromShipment - InvoicedPrepmtAmountLCY - RetRcdNotInvAmountLCY);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    #5..7
      SalesOutstandingAmountFromShipment - ServOutstandingAmountFromShipment - InvoicedPrepmtAmountLCY);
    */
    //end;


    //Unsupported feature: Code Modification on "GetLegalEntityType(PROCEDURE 6)".

    //procedure GetLegalEntityType();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    EXIT(FORMAT("Partner Type"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {EXIT(FORMAT("Tax Identification Type")); }
    */
    //end;


    //Unsupported feature: Code Modification on "GetLegalEntityTypeLbl(PROCEDURE 26)".

    //procedure GetLegalEntityTypeLbl();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    EXIT(FIELDCAPTION("Partner Type"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {EXIT(FIELDCAPTION("Tax Identification Type")); }
    */
    //end;


    //Unsupported feature: Code Modification on "SetStyle(PROCEDURE 12)".

    //procedure SetStyle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CalcAvailableCredit < 0 THEN
      EXIT('Unfavorable');
    EXIT('');
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF CalcAvailableCredit < 0 THEN
      EXIT('Unfavorable');
    EXIT('');    }
    */
    //end;


    //Unsupported feature: Code Modification on "GetDefaultBankAcc(PROCEDURE 25)".

    //procedure GetDefaultBankAcc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Preferred Bank Account" <> '' THEN
      CustomerBankAccount.GET("No.","Preferred Bank Account")
    ELSE BEGIN
      CustomerBankAccount.SETRANGE("Customer No.","No.");
      IF NOT CustomerBankAccount.FINDFIRST THEN
        CLEAR(CustomerBankAccount);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF "Preferred Bank Account" <> '' THEN
    #2..7
    }
    */
    //end;


    //Unsupported feature: Code Modification on "HasValidDDMandate(PROCEDURE 23)".

    //procedure HasValidDDMandate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    EXIT(SEPADirectDebitMandate.GetDefaultMandate("No.",Date) <> '');
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {EXIT(SEPADirectDebitMandate.GetDefaultMandate("No.",Date) <> ''); }
    */
    //end;


    //Unsupported feature: Code Modification on "GetInvoicedPrepmtAmountLCY(PROCEDURE 18)".

    //procedure GetInvoicedPrepmtAmountLCY();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
    SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
    SalesLine.SETRANGE("Bill-to Customer No.","No.");
    SalesLine.CALCSUMS("Prepmt. Amount Inv. (LCY)","Prepmt. VAT Amount Inv. (LCY)");
    EXIT(SalesLine."Prepmt. Amount Inv. (LCY)" + SalesLine."Prepmt. VAT Amount Inv. (LCY)");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {SalesLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
    #2..4
    EXIT(SalesLine."Prepmt. Amount Inv. (LCY)" + SalesLine."Prepmt. VAT Amount Inv. (LCY)");    }
    */
    //end;


    //Unsupported feature: Code Modification on "CalcCreditLimitLCYExpendedPct(PROCEDURE 19)".

    //procedure CalcCreditLimitLCYExpendedPct();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Credit Limit (LCY)" = 0 THEN
      EXIT(0);

    IF "Balance (LCY)" / "Credit Limit (LCY)" < 0 THEN
    #5..7
      EXIT(10000);

    EXIT(ROUND("Balance (LCY)" / "Credit Limit (LCY)" * 10000,1));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF "Credit Limit (LCY)" = 0 THEN
    #2..10
                                                                          }
    */
    //end;


    //Unsupported feature: Code Modification on "CreateAndShowNewInvoice(PROCEDURE 21)".

    //procedure CreateAndShowNewInvoice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
    SalesHeader.SETRANGE("Sell-to Customer No.","No.");
    SalesHeader.INSERT(TRUE);
    COMMIT;
    PAGE.RUNMODAL(PAGE::"Mini Sales Invoice",SalesHeader)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
    #2..5
                                                          }
    */
    //end;


    //Unsupported feature: Code Modification on "CreateAndShowNewCreditMemo(PROCEDURE 22)".

    //procedure CreateAndShowNewCreditMemo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";
    SalesHeader.SETRANGE("Sell-to Customer No.","No.");
    SalesHeader.INSERT(TRUE);
    COMMIT;
    PAGE.RUNMODAL(PAGE::"Mini Sales Credit Memo",SalesHeader)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";
    #2..4
    PAGE.RUNMODAL(PAGE::"Mini Sales Credit Memo",SalesHeader)    }
    */
    //end;


    //Unsupported feature: Code Modification on "CreateAndShowNewQuote(PROCEDURE 24)".

    //procedure CreateAndShowNewQuote();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
    SalesHeader.SETRANGE("Sell-to Customer No.","No.");
    SalesHeader.INSERT(TRUE);
    COMMIT;
    PAGE.RUNMODAL(PAGE::"Mini Sales Quote",SalesHeader)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
    #2..4
    PAGE.RUNMODAL(PAGE::"Mini Sales Quote",SalesHeader)    }
    */
    //end;


    //Unsupported feature: Code Modification on "UpdatePaymentTolerance(PROCEDURE 20)".

    //procedure UpdatePaymentTolerance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Block Payment Tolerance" THEN BEGIN
      IF UseDialog THEN
        IF NOT CONFIRM(RemovePaymentRoleranceQst,FALSE) THEN
          EXIT;
    #5..8
          EXIT;
      PaymentToleranceMgt.CalcTolCustLedgEntry(Rec);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF "Block Payment Tolerance" THEN BEGIN
    #2..11
     }
    */
    //end;

    procedure ValidateRFCNo(Length: Integer)
    begin
        /*IF STRLEN("RFC No.") <> Length THEN
          ERROR(Text10000,"RFC No.");   */

    end;

    //Unsupported feature: Deletion (VariableCollection) on "GetTotalAmountLCYCommon(PROCEDURE 17).RetRcdNotInvAmountLCY(Variable 1006)".



    //Unsupported feature: Property Modification (Id) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : 1000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : 1055;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.;ESM=No puede borrar %1 %2 porque hay al menos una venta pendiente %3 para este cliente.;FRC=Vous ne pouvez pas supprimer %1 %2 car il existe encore au moins une %3 vente ouverte pour ce client.;ENC=You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text002(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : 1054;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Do you wish to create a contact for %1 %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Do you wish to create a contact for %1 %2?;ESM=¿Confirma que desea crear un contacto para %1 %2?;FRC=Souhaitez-vous créer un contact pour %1 %2?;ENC=Do you wish to create a contact for %1 %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "SalesSetup(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesSetup : 1002;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesSetup : 1050;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CommentLine(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //CommentLine : 1004;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CommentLine : 1049;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "SalesOrderLine(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesOrderLine : 1005;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesOrderLine : 1048;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CustBankAcc(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //CustBankAcc : 1006;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustBankAcc : 1047;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ShipToAddr(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShipToAddr : 1007;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShipToAddr : 1046;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "PostCode(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //PostCode : 1008;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostCode : 1045;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "GenBusPostingGrp(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //GenBusPostingGrp : 1009;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenBusPostingGrp : 1044;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ShippingAgentService(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShippingAgentService : 1010;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShippingAgentService : 1043;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ItemCrossReference(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //ItemCrossReference : 1016;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemCrossReference : 1042;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "RMSetup(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //RMSetup : 1018;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RMSetup : 1041;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "SalesPrice(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesPrice : 1021;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesPrice : 1040;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "SalesLineDisc(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesLineDisc : 1022;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesLineDisc : 1039;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "SalesPrepmtPct(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesPrepmtPct : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesPrepmtPct : 1038;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ServContract(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //ServContract : 1026;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServContract : 1034;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ServHeader(Variable 1034)".

    //var
    //>>>> ORIGINAL VALUE:
    //ServHeader : 1034;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServHeader : 1027;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ServiceItem(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //ServiceItem : 1027;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServiceItem : 1026;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "PaymentToleranceMgt(Variable 1038)".

    //var
    //>>>> ORIGINAL VALUE:
    //PaymentToleranceMgt : 1038;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PaymentToleranceMgt : 1022;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "NoSeriesMgt(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoSeriesMgt : 1011;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoSeriesMgt : 1021;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "MoveEntries(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //MoveEntries : 1012;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MoveEntries : 1018;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "UpdateContFromCust(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateContFromCust : 1013;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateContFromCust : 1016;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "DimMgt(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimMgt : 1014;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimMgt : 1015;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "InsertFromContact(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //InsertFromContact : 1015;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InsertFromContact : 1014;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text003(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : 1020;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : 1053;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Contact %1 %2 is not related to customer %3 %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Contact %1 %2 is not related to customer %3 %4.;ESM=Contacto %1 %2 no está relacionado con cliente %3 %4.;FRC=Le contact %1 %2 n'est pas associé au client %3 %4.;ENC=Contact %1 %2 is not related to customer %3 %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text004(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : 1023;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : 1052;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=post;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=post;ESM=registrar;FRC=reporter;ENC=post;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text005(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : 1024;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : 1051;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=create;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=create;ESM=crear;FRC=créer;ENC=create;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text006(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : 1025;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : 1037;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You cannot %1 this type of document when Customer %2 is blocked with type %3;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You cannot %1 this type of document when Customer %2 is blocked with type %3;ESM=No puede %1 este tipo de documento cuando el cliente %2 está bloqueado por el tipo %3;FRC=Vous ne pouvez pas %1 ce type de document lorsque le client %2 est bloqué avec le type %3;ENC=You cannot %1 this type of document when Customer %2 is blocked with type %3;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text007(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : 1028;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : 1036;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You cannot delete %1 %2 because there is at least one not cancelled Service Contract for this customer.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You cannot delete %1 %2 because there is at least one not canceled Service Contract for this customer.;ESM=No puede borrar %1 %2 porque hay al menos un Contrato de Servicio no cancelado para este cliente.;FRC=Vous ne pouvez pas supprimer %1 %2 puisqu'au moins un contrat de services n'est pas annulé pour ce client.;ENC=You cannot delete %1 %2 because there is at least one not cancelled Service Contract for this customer.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text008(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : 1029;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : 1035;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?;ESM=Eliminar el %1 %2 hará que se elimine el %3 de los Prods. servicio asociados. ¿Desea continuar?;FRC=La suppression de %1 %2 entraînera la suppression de %3 pour les articles de service connexes. Désirez-vous continuer?;ENC=Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text009(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : 1030;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : 1033;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=Cannot delete customer.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=Cannot delete customer.;ESM=No se puede eliminar el cliente.;FRC=Impossible de supprimer le client.;ENC=Cannot delete customer.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text010(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : 1031;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : 1032;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.;ESM=%1 %2 se asignó a %3 %4.\No es posible seleccionar de nuevo %1 para más de un %3. Introduzca otro código.;FRC=Le code %1 %2 a été affecté à %3 %4.\Le même code %1 ne peut pas être entré dans plus d'un %3. Entrez un autre code.;ENC=The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text011(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : 1033;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : 1031;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?;ESM=El control de transacciones de IC puede ser difícil si cambia el campo Código socio IC porque este %1 contiene movimientos contables de un ejercicio que aún no está cerrado.\ ¿Todavía quiere cambiar el campo Código socio IC?;FRC=Le rapprochement de transactions IC peut être difficile si vous modifiez le code de partenaire IC car %1 a des entrées de grand livre dans un exercice financier encore ouvert.\ Souhaitez-vous quand même modifier le code de partenaire IC?;ENC=Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text012(Variable 1032)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : 1032;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : 1030;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1032)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.;ESM=No puede cambiar el contenido del campo %1. %2 contiene al menos un movimiento contable abierto.;FRC=Vous ne pouvez pas changer le contenu du champ %1, car ce %2 contient une ou plusieurs écritures de journal ouvertes.;ENC=You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text013(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : 1035;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : 1029;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=You cannot delete %1 %2 because there is at least one outstanding Service %3 for this customer.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=You cannot delete %1 %2 because there is at least one outstanding Service %3 for this customer.;ESM=No puede eliminar %1 %2 porque hay al menos un servicio pendiente %3 para este cliente.;FRC=Vous ne pouvez pas supprimer %1 %2 car il existe encore au moins une %3 service en suspens pour ce client.;ENC=You cannot delete %1 %2 because there is at least one outstanding Service %3 for this customer.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text014(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : 1017;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : 1028;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESM=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;FRC=Avant de pouvoir utiliser Online Map, vous devez compléter la fenêtre Configuration Online Map.\Consultez la section Configuration d'Online Map dans l'Aide.;ENC=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "Text015(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : 1036;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : 1025;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=You cannot delete %1 %2 because there is at least one %3 associated to this customer.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=You cannot delete %1 %2 because there is at least one %3 associated to this customer.;ESM=No puede borrar %1 %2 porque existe al menos un %3 asociado a este cliente.;FRC=Vous ne pouvez pas supprimer %1 %2 car au moins un/une %3 est associé(e) à ce client.;ENC=You cannot delete %1 %2 because there is at least one %3 for this customer.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "AllowPaymentToleranceQst(Variable 1037)".

    //var
    //>>>> ORIGINAL VALUE:
    //AllowPaymentToleranceQst : 1037;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AllowPaymentToleranceQst : 1019;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AllowPaymentToleranceQst(Variable 1037)".

    //var
    //>>>> ORIGINAL VALUE:
    //AllowPaymentToleranceQst : ENU=Do you want to allow payment tolerance for entries that are currently open?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AllowPaymentToleranceQst : ENU=Do you want to allow payment tolerance for entries that are currently open?;ESM=¿Desea permitir la tolerancia de pago para movimientos pendientes?;FRC=Souhaitez-vous autoriser les écarts de règlement pour les écritures actuellement ouvertes ?;ENC=Do you want to allow payment tolerance for entries that are currently open?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "RemovePaymentRoleranceQst(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //RemovePaymentRoleranceQst : 1019;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RemovePaymentRoleranceQst : 1017;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RemovePaymentRoleranceQst(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //RemovePaymentRoleranceQst : ENU=Do you want to remove payment tolerance from entries that are currently open?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RemovePaymentRoleranceQst : ENU=Do you want to remove payment tolerance from entries that are currently open?;ESM=¿Confirma que desea eliminar la tolerancia pago de los movimientos actualmente pendientes?;FRC=Souhaitez-vous supprimer les écarts de règlement pour les écritures actuellement ouvertes ?;ENC=Do you want to remove payment tolerance from entries that are currently open?;
    //Variable type has not been exported.

    var
        Text10000: label '%1 is not a valid RFC No.';
        Text10001: label '%1 is not a valid CURP No.';
        Text10002: label 'The RFC number %1 is used by another company.';

    var
        Text016: label 'The Member Cannot be deleted when the status is Released';
        Text017: label 'Employment date cannot be in the future';

    var
        //Loans: Record Loans;
        GenSetUp: Record "General Set-Up";
        MinShares: Decimal;
        CustBank: Record "Customer Bank Account";
        Cust: Record Customer;
        EmployerRecord: Record "Bank Account";
        DeptRec: Record Departments;
        UserSertup: Record "User Setup";
        BosaSetup: Record "Bosa Setup";
        ImpSetup: Record CMSetup;
        CustRec: Record Customer;
        MFSetup: Record "Micro Finance Setup";
}

