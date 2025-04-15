 
    #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 52193434 "tableextension50008" extends Vendor
{
    fields
    {
        modify("VAT Registration No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                Vendorrec: record Vendor;
            begin
                "PIN Number" := "VAT Registration No.";
                if "VAT Registration No." = '' then
                    exit;

                Vendorrec.Reset();
                Vendorrec.SetRange("VAT Registration No.", rec."VAT Registration No.");
                if Vendorrec.FindFirst() then
                    Error('You cannot share  pin Number with Vendor No. %1', Vendorrec."No.");
                if StrLen("VAT Registration No.") <> 11 then Error('P.I.N Number length must be 11 characters');

            end;
        }

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Search Name"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on "Address(Field 5)".


        //Unsupported feature: Property Modification (Data type) on ""Address 2"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on "City(Field 7)".


        //Unsupported feature: Property Modification (Data type) on "Contact(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 9)".


        //Unsupported feature: Property Modification (Data type) on ""Pay-to Vendor No."(Field 45)".


        //Unsupported feature: Property Modification (Data type) on ""Payment Method Code"(Field 47)".


        //Unsupported feature: Code Modification on "Name(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
         NameBreakdown;
        */
        //end;
        field(50000; "Vendor Type"; Option)
        {
            OptionCaption = 'Trade,Director,Insurance,Fleet,Person,Staff';
            OptionMembers = Trade,Director,Insurance,Fleet,Person,Staff;
        }
        field(50001; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = filter(Deduction),
                                                                    "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "PIN Number"; Code[20])
        {
            trigger OnValidate()
            var
                myInt: Integer;
                Vendorrec: record Vendor;
                // KRAIntegration: Codeunit "KRA Integration";
                // KRALog: Record "KRA Integration Log";
            begin
                if "PIN Number" = '' then begin
                    "PIN Status" := '';
                    exit;
                end;
                Vendorrec.Reset();
                Vendorrec.SetRange("PIN Number", rec."PIN Number");
                Vendorrec.SetFilter("No.", '<>%1', rec."No.");
                if Vendorrec.FindFirst() then
                    Error('You cannot share  pin Number with Vendor No. %1', Vendorrec."No.");
               
                // else
                //     Error(KRALog."Status Message");
                "VAT Registration No." := "PIN Number";
            end;
        }
        field(50004; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(50007; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(50008; "Pays tax"; Boolean)
        {
        }
        field(50009; "Non Cash Benefit"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                         // if StrLen("PIN Number") <> 11 then Error('P.I.N Number length must be 11 characters');
                // KRAIntegration.PINValidation("ID BRN", "Taxpayer Type".AsInteger(), KRALog);
                // if KRALog.Success then begin
                //     if Rec."PIN Number" <> KRALog.PIN then
                //         Error('The information provided does not match our records. Please check and try again. If the problem persists, please contact the relevant registration bodies.');
                //     "Validated Name" := KRALog."Business Name";
                //     if Name = '' then
                //         Name := KRALog."Business Name";
                //     "PIN Status" := KRALog."Status Message";
                // end                                            "Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(true)));
            FieldClass = FlowField;
        }
        field(50010; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50050; Vendorname; Code[50])
        {
        }
        field(50145; "Vendor Credit Limit(LCY)"; Decimal)
        {
        }
        field(50146; "Requisition Default Vendor"; Boolean)
        {
        }
        field(50147; "Vendor Retention Account"; Code[20])
        {
            TableRelation = Vendor."No." where(Retention = const(true));
        }
        field(50148; Retention; Boolean)
        {
        }
        field(50149; Tel; Code[20])
        {
        }
        field(50150; Email; Text[200])
        {
        }
        field(50151; "Bank Account Number"; Code[200])
        {
        }
        field(50152; "Bank Branch"; Code[200])
        {
             TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Vendor's Bank"));
        }
        field(50153; "Vendor's Bank"; Code[200])
        {
            TableRelation = "Employee Bank AccountX";
        }
        field(50154; "Bank Name"; Text[200])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Vendor's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50155; "Bank Branch Name"; Text[200])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Vendor's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50156; "Status 1"; Option)
        {
            OptionCaption = ' ,Active,Inactive,Exited';
            OptionMembers = " ",Active,Inactive,Exited;
        }
        field(50157; "Appointment Date"; Date)
        {
        }
        field(50158; "Termination Date"; Date)
        {
        }
        field(50159; "Yagpo Cert. No."; Code[50])
        {
            Caption = 'AGPO Certificate No.';
        }
        field(50160; Category; Code[200])
        {
        }
        field(50161; "Incorporation Certificate No."; Code[200])
        {
            trigger OnValidate()
            var
                myInt: Integer;
                Vendorrec: record Vendor;
            begin
                Vendorrec.Reset();
                Vendorrec.SetRange("Incorporation Certificate No.", rec."Incorporation Certificate No.");
                if Vendorrec.FindFirst() then
                    Error('You cannot share Certificate Number with Vendor No. %1', Vendorrec."No.");
            end;
        }
        field(50162; Disability; Boolean)
        {
        }
        field(50163; "Tax Compliance"; Code[250])
        {
            caption = 'Tax Compliance Certificate No.';
            trigger OnValidate()
            var
                // KRAIntegration: Codeunit "KRA Integration";
                // KRALog: Record "KRA Integration Log";
                valid: Integer;
            begin
                // if "Tax Compliance" <> '' then begin
                //     KRAIntegration.TCCChecker("PIN Number", "Tax Compliance", KRALog);
                //     if not KRALog.Success then
                //         Error('The TCC number could not be entered because %1', KRALog."Status Message");
                //     "Tax Compliance Expiry Date" := KRALog."End Date";
                // end;

            end;
        }
        field(50164; "Certificate of Registration"; Code[200])
        {
        }
        field(50165; "Type of Work Done"; Text[250])
        {
        }
        field(50166; "Supplier Category"; Text[200])
        {
            DataClassification = ToBeClassified;
            caption = 'Procurement Category';
            TableRelation = "Procurement Category".Code;
        }
        field(50167; "Special Category"; Text[200])
        {
            DataClassification = ToBeClassified;
            caption = 'Vendor Category.';
            TableRelation = "Special Vendor Category";
        }
        field(50180; "Director Taxable Income"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where("Director No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    Taxable = const(true)));
            FieldClass = FlowField;
        }
        field(54004; Broker; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(54006; "Vendor Type1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Unit Trust,Broker,Agent';
            OptionMembers = ,"Unit Trust",Broker,Agent;
        }
        field(54007; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(54008; "Middle Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(54009; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "KBA Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX".Code;
        }
        field(70001; "KBA Branch Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";
        }
        field(70002; "Withholding Tax Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1";
        }
        field(70004; "Working Hours"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70005; Prequalification; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where("Vendor No" = field("No.")));
            FieldClass = FlowField;
        }
        field(70006; "Special Groups Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Target Groups".Code;
        }
        field(70007; "Secondary Contact No."; Code[50])
        {
            Caption = 'Secondary Contact No.';
            DataClassification = ToBeClassified;
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

                "Secondary Contact" := '';
                if "Secondary Contact No." <> '' then begin
                    Cont.Get("Secondary Contact No.");

                    ContBusRel.SetCurrentkey("Link to Table", "No.");
                    ContBusRel.SetRange("Link to Table", ContBusRel."link to table"::Vendor);
                    ContBusRel.SetRange("No.", "No.");
                    ContBusRel.FindFirst;

                    //    if Cont."Company No." <> ContBusRel."Contact No." then
                    //     Error(Text004, Cont."No.", Cont.Name, "No.", Name);

                    if Cont.Type = Cont.Type::Person then
                        "Secondary Contact" := Cont.Name
                end;
            end;
        }
        field(70008; "Secondary Contact"; Text[50])
        {
            Caption = 'Secondary Contact';
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // begin
            //     if RMSetup.Get then
            //         if RMSetup."Bus. Rel. Code for Vendors" <> '' then
            //             if (xRec."Secondary Contact" = '') and (xRec."Secondary Contact No." = '') then begin
            //                 Modify;
            //                 UpdateContFromVend.OnModify(Rec);
            //                 UpdateContFromVend.InsertNewContactPerson(Rec, false);
            //                 Modify(true);
            //             end
            // end;
        }
        field(70009; "Maximum Order Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70010; "Minimum Order Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70011; "Supplier Registration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70012; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Registration Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Maximum Order Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70015; "Minimum Order Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70016; ReviewerID; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70017; "Vendor Bank"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70018; "Bank Branch Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70019; "SWIFT Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70020; "IBAN Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70021; "Procurement status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Awarded;
        }
        field(70022; Paye; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Net Pay"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70050; "Business Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
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
        field(70060; "Ownership Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sole Ownership.Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership.Partnership","Registered Company";
        }
        field(70061; "Registration/Incorporation No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70062; "Reg/Incorporation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70063; "Operations Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70064; "Tax PIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(70065; "NSSF No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70066; "NHIF No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70067; "Current Vendor Class"; Code[20])
        {
            CalcFormula = lookup("Vendor Classification"."Vendor Category" where(Blocked = filter(false)));
            Description = 'Lookup field mapped to the Vendor Classification Table (For most recent entries that are Open i.e. Blocked=False';
            FieldClass = FlowField;
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
            OptionCaption = 'Local,Foreign,Government Entity,International Firm,International Firms (with Local Joint Venture),Individual Consultants,NGOs & Community Workers';
            OptionMembers = "Local",Foreign,"Government Entity","International Firm","International Firms with Joint","Individual Consultants",NGOs;
        }
        field(70070; "Nominal Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70071; "Issued Capital LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
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
        field(70075; "Fixed Line Tel No"; Code[30])
        {
            DataClassification = ToBeClassified;
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
        field(70080; "Authorized Signatory Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70081; "Signatory Designation"; Text[50])
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
            TableRelation = "Company Size Code".Code;
        }
        field(70089; Trainer; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70090; "KNTC Agent"; Boolean)
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
        field(70094; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,In Progress';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment","In Progress";
        }
        field(70095; "Advance Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '//Custom For Judiciary(Advance Payment Request)';
            TableRelation = Customer."No.";
        }
        field(70096; Garage; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70097; "Vendor Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70098; "Vendor Communication Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70099; "Business Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70100; "Shareholders Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70101; "Litigation Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70102; "Past Experience Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70103; "Audited Income Statement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70104; "Audit Balance Sheet"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70105; "Key Personel"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70106; "Send Payslip By E-mail?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70107; "Profile Complete"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70108; "No Contract"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70109; "HaveAgpo?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70110; "Contact No"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(70111; "Vendor OTP"; Text[10])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(70112; "AGPO Cert. Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70113; "Trade Permit No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70114; "CR12 Cert. No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70115; "Email 2"; Text[80])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(70116; "Tax Excempt Cert. No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70117; "Is AGPO"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70118; Verified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70119; Consolidated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70120; "Consolidation Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70121; "Contact Person Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70122; "Contact Person Phone"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70123; "Contact Person Name2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70124; "Contact Person Phone2"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70125; "Tax Compliance Expiry Date"; Date)
        {
        }
        field(70126; "Intl Business Reg. No."; Code[100])
        {
            Caption = 'International Business Reg. No.';
        }
        field(70127; "Intl Business Reg. Name"; Text[250])
        {
            Caption = 'International Business Reg. Name';
        }
        field(70128; "Intl Business Incop Date"; Date)
        {
            Caption = 'International Business Incorp. Date';
        }
        field(70129; "Country of Registration"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70130; "Tax Exempt Cert. No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70131; "Tax Exempt Expiry"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70134; "Taxpayer Type"; Enum "Taxpayer Type")
        {
            trigger OnValidate()
            begin
                if "PIN Number" <> '' then
                    Validate("PIN Number");
            end;
        }
        field(70135; "ID BRN"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "PIN Number" <> '' then
                    Validate("PIN Number");
            end;
        }
        field(70136; "PIN Status"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70137; "Validated Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
            field(70138; "Payroll Group"; Option)
        {
            CalcFormula = lookup("Employee Posting GroupX"."Payroll Group" where(Code = field("Posting Group")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(70139; "Posting Group"; Code[20])
        {
            Caption = 'Employee Category';
            NotBlank = true;
            TableRelation = "PR Employee Posting Groups";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                EmployeeBank: Record "PR Employee Posting Groups";
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(Code, "Posting Group");
                if EmployeeBank.FindSet() then begin
                    EmployeeBank.TestField("Retirement Age");
                    // Rec. := EmployeeBank."Employee Category Type";
                end;

            end;
        }

    }


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    //ApprovalsMgmt.OnRenameRecordInApprovalRequest(xRec.RECORDID,RECORDID);
    DimMgt.RenameDefaultDim(DATABASE::Vendor,xRec."No.","No.");
    SetLastModifiedDateTime;
    IF xRec."Invoice Disc. Code" = xRec."No." THEN
      "Invoice Disc. Code" := "No.";

    CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Vendor,"No.",xRec."No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ////ApprovalsMgmt.OnRenameRecordInApprovalRequest(xRec.RECORDID,RECORDID);
    #2..7
    */
    //end;

    local procedure NameBreakdown()
    var
        NamePart: array[30] of Text[100];
        TempName: Text[250];
        FirstName250: Text[250];
        i: Integer;
        NoOfParts: Integer;
    begin
        TempName := Name;
        while StrPos(TempName, ' ') > 0 do begin
            if StrPos(TempName, ' ') > 1 then begin
                i := i + 1;
                NamePart[i] := CopyStr(TempName, 1, StrPos(TempName, ' ') - 1);
            end;
            TempName := CopyStr(TempName, StrPos(TempName, ' ') + 1);
        end;
        i := i + 1;
        NamePart[i] := CopyStr(TempName, 1, MaxStrLen(NamePart[i]));
        NoOfParts := i;

        "First Name" := '';
        "Middle Name" := '';
        "Last Name" := '';
        for i := 1 to NoOfParts do
            if (i = NoOfParts) and (NoOfParts > 1) then
                "Last Name" := CopyStr(NamePart[i], 1, MaxStrLen("Last Name"))
            else
                if (i = NoOfParts - 1) and (NoOfParts > 2) then
                    "Middle Name" := CopyStr(NamePart[i], 1, MaxStrLen("Middle Name"))
                else begin
                    FirstName250 := DelChr("First Name" + ' ' + NamePart[i], '<', ' ');
                    "First Name" := CopyStr(FirstName250, 1, MaxStrLen("First Name"));
                end;
    end;

    procedure GetRetainedAmountBalance(VendorNo: Code[20]; DateFilter: Text) Balance: Decimal
    var
        DVendLedgerEntry: Record "Detailed Vendor Ledg. Entry";
    begin
        DVendLedgerEntry.Reset();
        DVendLedgerEntry.SetRange("Vendor No.", VendorNo);
        if DateFilter <> '' then
            DVendLedgerEntry.SetFilter("Posting Date", DateFilter);
        DVendLedgerEntry.SetRange("Entry Type2", DVendLedgerEntry."Entry Type2"::Retention);
        if DVendLedgerEntry.FindSet() then begin
            DVendLedgerEntry.CalcSums(Amount);
            Balance := -DVendLedgerEntry.Amount;
            exit(Balance);
        end;
    end;
}

