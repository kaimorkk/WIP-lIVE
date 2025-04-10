TableExtension 52193434 tableextension52193434 extends Vendor
{
    fields
    {
        field(50000; "Vendor Type"; Option)
        {
            OptionMembers = "  ",Medical,Law,"Professional Bodies";
        }
        field(50001; "KBA Code"; Code[10])
        {
            TableRelation = "Employee Bank AccountX1".Code;
        }
        field(50002; "KBA Branch Code"; Code[10])
        {
            TableRelation = "Employee Bank AccountX1"."Bank Branch No.";
        }
        field(50003; "Withholding Tax Code"; Code[10])
        {
            TableRelation = "Tarriff Codes1";
        }
        field(50004; "PIN No."; Code[80])
        {
        }
        field(50005; "Working Hours"; Code[10])
        {
        }
        field(50006; Prequalification; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where("Vendor No" = field("No.")));
            FieldClass = FlowField;
        }
        // field(50007; "Supplier Type"; Code[20])
        // {
        //     TableRelation = "Supplier Types";
        // }
        field(50008; "Secondary Contact No."; Code[20])
        {
            Caption = 'Secondary Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                ContBusRel.SetCurrentkey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                ContBusRel.SetRange("No.", "No.");
                if ContBusRel.FindFirst then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if "Secondary Contact No." <> '' then
                    if Cont.Get("Secondary Contact No.") then;
                if Page.RunModal(0, Cont) = Action::LookupOK then
                    Validate("Secondary Contact No.", Cont."No.");
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin

                /*Secondary Contact" := '';
                IF "Secondary Contact No." <> '' THEN BEGIN
                  Cont.GET("Secondary Contact No.");
                
                  ContBusRel.SETCURRENTKEY("Link to Table","No.");
                  ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Vendor);
                  ContBusRel.SETRANGE("No.","No.");
                  ContBusRel.FINDFIRST;
                
                  IF Cont."Company No." <> ContBusRel."Contact No." THEN
                    ERROR(Text004,Cont."No.",Cont.Name,"No.",Name);
                
                  IF Cont.Type = Cont.Type::Person THEN
                    "Secondary Contact" := Cont.Name
                END;
                      */

            end;
        }
        field(50009; "Secondary Contact"; Text[50])
        {
            Caption = 'Secondary Contact';

            trigger OnValidate()
            begin
                // if RMSetup.Get then
                //     if RMSetup."Bus. Rel. Code for Vendors" <> '' then
                //         if (xRec."Secondary Contact" = '') and (xRec."Secondary Contact No." = '') then begin
                //             Modify;
                //             UpdateContFromVend.OnModify(Rec);
                //             UpdateContFromVend.InsertNewContactPerson(Rec, false);
                //             Modify(true);
                //         end
            end;
        }
        field(50010; "Maximum Order Amount"; Decimal)
        {
        }
        field(50011; "Minimum Order Amount"; Decimal)
        {
        }
        field(50012; "Supplier Registration No."; Code[20])
        {
        }
        field(50013; "Registration Date"; Date)
        {
        }
        field(50014; "Registration Expiry Date"; Date)
        {
        }
        field(50015; "Maximum Order Quantity"; Decimal)
        {
        }
        field(50016; "Minimum Order Quantity"; Decimal)
        {
        }
        field(53000; "PIN No"; Code[20])
        {
        }
        field(53001; "VAT No"; Code[20])
        {
        }
        field(53077; "Status 2"; Option)
        {
            OptionMembers = Active,Frozen,Closed,Archived,New,Dormant;

            trigger OnValidate()
            begin
                if (Status = Status::" ") or (Status = Status::Archived) then
                    Blocked := Blocked::" "
                else
                    Blocked := Blocked::All
            end;
        }
        field(53078; "Account Type 2"; Code[30])
        {
            TableRelation = "Account Types";
        }
        field(55019; "Debtor Type"; Option)
        {
            OptionMembers = ,"Vendor Account","FOSA Account","Micro Account";
        }
        field(55035; "Marked For Closure"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(55068; "Group Account"; Boolean)
        {
        }
        field(55069; "Group Balance"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Group Code" = field("No.")));
            FieldClass = FlowField;
        }
        field(55070; "Group Loan Balance"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Transaction Type" = filter("Deposit Contribution" | "Share Contribution" | Withdrawal | "Loan Repayment"),
                                                                         "Group Code" = field("No."),
                                                                         "Posting Date" = field(upperlimit("Date Filter"))));
            FieldClass = FlowField;
        }
        field(55071; "MF-FOSA Account"; Code[20])
        {
        }
        field(55072; "Total No. of Clients"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(55073; "Address for Group Meetings"; Text[30])
        {
        }
        field(55074; "Meeting Days"; Text[30])
        {
        }
        field(55075; "Meeting Venue"; Text[30])
        {
        }
        field(55076; "No. of Female Clients"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(55077; "No. of Male Clients"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(55078; "Group Chair Name"; Text[30])
        {
            Editable = true;
        }
        field(55079; "Group Sec. Name"; Text[30])
        {
            Editable = true;
        }
        field(55080; "Group Treasurer Name"; Text[30])
        {
            Editable = true;
        }
        field(55081; "Group Code"; Code[20])
        {
        }
        field(55082; "Repayments Made"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Transaction Type" = filter("Share Contribution" | Withdrawal),
                                                                         "Group Code" = field("No."),
                                                                         "Posting Date" = field(upperlimit("Date Filter"))));
            FieldClass = FlowField;
        }
        field(55083; "Amount Disbursed"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Transaction Type" = filter("Deposit Contribution"),
                                                                         "Group Code" = field("No."),
                                                                         "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(55084; "Interest Due"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Transaction Type" = filter("Loan Repayment"),
                                                                         "Group Code" = field("No."),
                                                                         "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(68000; "Creditor Type"; Option)
        {
            OptionMembers = " ",Account;
        }
        field(68001; "Staff No"; Code[20])
        {
        }
        field(68002; "ID No."; Code[50])
        {
        }
        field(68003; "Last Maintenance Date"; Date)
        {
        }
        field(68004; "Activate Sweeping Arrangement"; Boolean)
        {
        }
        field(68005; "Sweeping Balance"; Decimal)
        {
        }
        field(68006; "Sweep To Account"; Code[30])
        {
            TableRelation = Vendor;
        }
        field(68007; "Fixed Deposit Status"; Option)
        {
            OptionCaption = ' ,Active,Matured,Closed,Not Matured';
            OptionMembers = " ",Active,Matured,Closed,"Not Matured";
        }
        field(68008; "Call Deposit"; Boolean)
        {

            trigger OnValidate()
            begin
                /*IF AccountTypes.GET("Account Type") THEN BEGIN
                IF AccountTypes."Fixed Deposit" = TRUE THEN
                ERROR('Call deposit only applicable for Fixed Deposits.');
                END;*/

            end;
        }
        field(68009; "Mobile Phone No"; Code[50])
        {

            trigger OnValidate()
            begin

                /*Vend.RESET;
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
        field(68010; "Marital Status"; Code[30])
        {
            TableRelation = Vendor;
        }
        field(68012; "BOSA Account No"; Code[20])
        {
            TableRelation = Customer;
        }
        field(68013; Signature; Blob)
        {
        }
        field(68014; "Passport No."; Code[50])
        {
        }
        field(68015; "Company Code"; Code[20])
        {
            //TableRelation = Employer."No.";
        }
        field(68016; Status; Option)
        {
            OptionCaption = ' ,Active,Frozen,Closed,Archived,New,Dormant,Deceased';
            OptionMembers = " ",Active,Frozen,Closed,Archived,New,Dormant,Deceased;

            trigger OnValidate()
            begin
                if (Status = Status::Active) or (Status = Status::New) then
                    Blocked := Blocked::" "
                else
                    Blocked := Blocked::All

                //"Resons for Status Change":='1';
            end;
        }
        field(68017; "Account Type"; Code[20])
        {
            TableRelation = "Account Types".Code;

            trigger OnValidate()
            begin
                /*IF AccountTypes.GET("Account Type") THEN BEGIN
                AccountTypes.TESTFIELD(AccountTypes."Posting Group");
                "Account Type Name":=AccountTypes.Description;
                "Vendor Posting Group":=AccountTypes."Posting Group";
                "Call Deposit" := FALSE;
                END;*/

            end;
        }
        field(68018; "Account Category"; Option)
        {
            OptionCaption = 'Single,Joint,Corporate,Group,Branch';
            OptionMembers = Single,Joint,Corporate,Group,Branch;
        }
        field(68019; "FD Marked for Closure"; Boolean)
        {
        }
        field(68020; "Last Withdrawal Date"; Date)
        {
        }
        field(68021; "Last Overdraft Date"; Date)
        {
        }
        field(68022; "Last Min. Balance Date"; Date)
        {
        }
        field(68023; "Last Deposit Date"; Date)
        {
        }
        field(68024; "Last Transaction Posting Date"; Date)
        {
        }
        field(68025; "Date Closed"; Date)
        {
        }
        field(68026; "Uncleared Cheques"; Decimal)
        {
            CalcFormula = sum(Transactions.Amount where("Account No" = field("No."),
                                                         Posted = const(true),
                                                         "Cheque Processed" = const(false),
                                                         Type = filter("Cheque Deposit")));
            FieldClass = FlowField;
        }
        field(68027; "Expected Maturity Date"; Date)
        {

            trigger OnValidate()
            begin
                "FD Maturity Date" := "Expected Maturity Date";
            end;
        }
        field(68028; "ATM Transactions"; Decimal)
        {
            // CalcFormula = sum("ATM Transactions".Amount where("Account No" = field("No."),
            //                                                    Posted = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68029; "Date of Birth"; Date)
        {
        }
        field(68030; "Last Transaction Date"; Date)
        {
            AutoFormatType = 1;
            CalcFormula = max("Detailed Vendor Ledg. Entry"."Posting Date" where("Vendor No." = field("No.")));
            Caption = 'Last Transaction Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(68032; "E-Mail (Personal)"; Text[50])
        {
        }
        field(68033; Section; Code[20])
        {
            //TableRelation = Table51507298.Field1 where (Field3=field("Company Code"));
        }
        field(68034; Card; Code[50])
        {
        }
        field(68035; "Home Address"; Text[50])
        {
        }
        field(68036; Location; Text[50])
        {
        }
        field(68037; "Sub-Location"; Text[50])
        {
        }
        field(68038; District; Text[50])
        {
        }
        field(68039; "Resons for Status Change"; Text[200])
        {
        }
        field(68040; "Closure Notice Date"; Date)
        {
        }
        field(68041; "Fixed Deposit Type"; Code[20])
        {
            TableRelation = "Fixed Deposit Type".Code;

            trigger OnValidate()
            begin
                /*TESTFIELD("Registration Date");
                IF FDType.GET("Fixed Deposit Type") THEN
                "FD Maturity Date":=CALCDATE(FDType.Duration,"Registration Date");  */

            end;
        }
        field(68042; "Interest Earned"; Decimal)
        {
            CalcFormula = sum("Interest Buffer"."Interest Amount" where("Account No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68043; "Untransfered Interest"; Decimal)
        {
            CalcFormula = sum("Interest Buffer"."Interest Amount" where("Account No" = field("No."),
                                                                         Transferred = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(68044; "FD Maturity Date"; Date)
        {
        }
        field(68045; "Savings Account No."; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(68046; "Old Account No."; Code[20])
        {
        }
        field(68047; "Salary Processing"; Boolean)
        {
        }
        field(68048; "Amount to Transfer"; Decimal)
        {

            trigger OnValidate()
            begin
                /*CALCFIELDS(Balance);
                
                IF "Amount to Transfer" > Balance THEN
                ERROR('Amount cannot be more than the balance.');  */

            end;
        }
        field(68049; Proffesion; Text[50])
        {
        }
        field(68050; "Signing Instructions"; Text[250])
        {
        }
        field(68051; Hide; Boolean)
        {
        }
        field(68052; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(68053; "Minimum Balance"; Decimal)
        {
            CalcFormula = sum("Account Types"."Minimum Balance" where(Code = field("Account Type")));
            FieldClass = FlowField;
        }
        field(68054; "Excempt Transaction Charges"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(68055; "Withdr. Notice Effective Date"; Date)
        {
        }
        field(68056; "Withdr. Notice Date Placed"; Date)
        {
        }
        field(68057; "Amount To Withdraw"; Decimal)
        {
        }
        field(68058; "Factory Code/Activity"; Code[20])
        {
        }
        field(68059; "Society Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(0));
        }
        field(68060; "Bosa Application No"; Code[20])
        {
        }
        field(68061; "Bosa Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Released,Active,Non-Active,Suspended,Deceased,Withdrawan,Retired,Termination,Family Member,Rejected,,,BOSA';
            OptionMembers = Open,"Pending Approval",Approved,Released,Active,"Non-Active",Suspended,Deceased,Withdrawan,Retired,Termination,"Family Member",Rejected,,,BOSA;
        }
        field(68062; "Fosa Application No."; Code[20])
        {
            //TableRelation = "Fosa Accounts Applications";
        }
        field(68063; Title; Code[20])
        {
        }
        field(68064; "Last Name"; Text[50])
        {
        }
        field(68065; "Other Names"; Text[50])
        {
        }
        field(68066; "Fosa Application"; Code[20])
        {
        }
        field(68067; "Account Type Name"; Text[50])
        {
        }
        field(68068; "Account Charges"; Decimal)
        {
        }
        field(68069; Term; Code[20])
        {
            TableRelation = "FD Terms";

            trigger OnValidate()
            begin
                /*IF Terms.GET(Term) THEN BEGIN
                Rate:=Terms."Interest Rate";
                
                //Period:=TermRec.Term;
                "Expected Maturity Date":=CALCDATE(Terms.Term,"Registration Date");
                "FD Maturity Date":="Expected Maturity Date";
                END;     */

            end;
        }
        field(68070; Rate; Decimal)
        {
        }
        field(68071; "Product Type"; Option)
        {
            OptionCaption = ' ,Personal,Business';
            OptionMembers = " ",Personal,Business;
        }
        field(68072; Entity; Option)
        {
            Editable = false;
            OptionCaption = ' ,Sole Proprietor,Corporate,Partnership,Group,Trust,Company';
            OptionMembers = " ","Sole Proprietor",Corporate,Partnership,Group,Trust,Company;
        }
        field(68073; "Overdraft Limit"; Decimal)
        {
        }
        field(68074; "Overdraft Status"; Option)
        {
            OptionCaption = ' ,Serviced,Not Serviced,Improved,Expired';
            OptionMembers = " ",Serviced,"Not Serviced",Improved,Expired;
        }
        field(68075; "Frozen Amount"; Decimal)
        {
        }
        field(68076; "Class Code"; Code[20])
        {
            TableRelation = "Class Code";
        }
        field(68077; "Untranfered Interest"; Decimal)
        {
            Editable = false;
        }
        field(68078; "Date Renewed"; Date)
        {
        }
        field(68079; "Neg. Interest Rate"; Decimal)
        {
        }
        field(68080; "Last Interest Date"; Date)
        {
            CalcFormula = max("Interest Buffer"."Interest Date" where("Account No" = field("No.")));
            FieldClass = FlowField;
        }
        field(68081; "Default Share Capital Charged"; Boolean)
        {
        }
        field(68082; "Service Fee Date"; Date)
        {
            CalcFormula = max("Interest Buffer"."Interest Date" where("Account No" = field("No.")));
            FieldClass = FlowField;
        }
        field(68083; "Overdraft Limit Date"; Date)
        {
        }
        field(68084; "Reason for Blacklist"; Text[50])
        {
        }
        field(68085; "Vendor Ctaegory"; Option)
        {
            OptionCaption = ' ,Citizen,Pwd,Women,Youth';
            OptionMembers = " ",Citizen,Pwd,Women,Youth;
        }
        field(70076; "Building/House No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70077; Floor; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70078; "Plot No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70079; Street; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70091; "Current Trade Licence No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70092; "Trade Licence Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70093; Registered; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Yes,No';
            OptionMembers = Yes,No;
        }
        field(70072; "Dealer Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Manufacturer,Distributor,Partner,Reseller,Other';
            OptionMembers = Manufacturer,Distributor,Partner,Reseller,Other;
        }
        field(70073; "Max Value of Business"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70074; "Nature of Business"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70070; "Nominal Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70071; "Issued Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70050; "Business Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(50163; "Tax Compliance"; Code[250])
        {
            caption = 'Tax Compliance Certificate No.';
        }
        field(70053; Debarred; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70054; "Debarment Voucher No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Debarment Voucher"."Document No";
        }
        field(70055; "Debarment Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50166; "Supplier Category"; Text[200])
        {
            DataClassification = ToBeClassified;
            caption = 'Procurement Category';
            TableRelation = "Procurement Category".Code;
        }
        field(60003; "PIN Number"; Code[20])
        {
        }
        field(70006; "Special Groups Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Target Groups".Code;
        }
        field(70068; "Vendor Group"; Option)
        {
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = 'General,Special';
            OptionMembers = General,Special;
        }
        field(70069; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = 'Local,Foreign';
            OptionMembers = "Local",Foreign;
        }
        field(70067; "Current Vendor Class"; Code[20])
        {
            CalcFormula = lookup("Vendor Classification"."Vendor Category" where(Blocked = filter(false)));
            Description = 'Lookup field mapped to the Vendor Classification Table (For most recent entries that are Open i.e. Blocked=False';
            FieldClass = FlowField;
        }
        field(70051; "Country of Incorporation"; Code[10])
        {
            Caption = 'Country/Region Code';
            Description = 'Country of Incorporation/Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                //   PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation;
            end;
        }
        field(70052; "Country of Tax Registration"; Code[10])
        {
            Caption = 'Country/Region Code';
            Description = 'Country of Tax Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                //    PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation;
            end;
        }
        field(70060; "Ownership Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sole Ownership.Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership.Partnership","Registered Company";
        }
        field(70061; "Registration/Incorporation No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70062; "Reg/Incorporation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70082; "Vision Statement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70083; "Mission Statement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70084; "Total Number of Employees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70085; "Registrn Submitted onPortal"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70086; "Industry Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Industry Group".Code;
        }
        field(70087; "Website Url"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70088; "Company Size"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Company Size Code".Code;
        }
        field(50167; "Special Category"; Text[200])
        {
            DataClassification = ToBeClassified;
            caption = 'Vendor Category.';
            TableRelation = "Special Vendor Category";
        }
        field(50160; Category; Code[200])
        {
        }
    }



    var
        UpdateContFromVend: Codeunit "VendCont-Update";
}

