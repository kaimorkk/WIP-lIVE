Table 52193801 "Request Header1"
{
    DrillDownPageID = "Imprest Request Listing";
    LookupPageID = "Imprest Request Listing";

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Request Date"; Date)
        {
        }
        field(3; "Trip No"; Code[20])
        {
            TableRelation = "Transport Request1";

            trigger OnValidate()
            begin
                if TripRec.Get("Trip No") then begin
                    "Trip Start Date" := TripRec."Planned Departure date";
                    "Trip Expected End Date" := TripRec."Planned Return Date";
                    "No. of Days" := "Trip Expected End Date" - "Trip Start Date";
                    Country := TripRec.Country;
                    City := TripRec.City;
                end;
            end;
        }
        field(4; "Employee No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Employee No") then begin
                    // "Employee Name":=Customer.Name;
                    "Employee Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";
                    //"Customer A/C":= UsersRec."Customer A\C";
                    "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Empl."Global Dimension 2 Code";
                    "Job Group" := Empl."Salary Scale";
                end;


                // if Empl.Get("Employee No") then
                //BEGIN
                // "Customer A/C":= UsersRec."Customer A\C";
                //END;
                //IF Status<>Status::Open THEN
                //ERROR('You cannot change this document at this stage');
            end;
        }
        field(5; "Employee Name"; Text[50])
        {
            Editable = false;
        }
        field(6; "Trip Start Date"; Date)
        {
        }
        field(7; "Trip Expected End Date"; Date)
        {

            trigger OnValidate()
            begin
                "No. of Days" := "Trip Expected End Date" - "Trip Start Date";
            end;
        }
        field(8; "No. of Days"; Decimal)
        {
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(10; "No. Series"; Code[20])
        {
        }
        field(11; "Deadline for Imprest Return"; Date)
        {
            Editable = true;
        }
        field(12; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(13; Type; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher,Refund';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Purchase Requisition","Store Requisition",Imprest,"Claim-Accounting",Appointment,"Payment Voucher",Refund;
        }
        field(14; "User ID"; Code[50])
        {
        }
        field(15; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(16; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(17; "Transaction Type"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Transactions Type Finance";

            trigger OnValidate()
            begin
                //IF Status<>Status::Open THEN
                //ERROR('You cannot change this document at this stage');

                if EmpAccmap.Get("Employee No", "Transaction Type") then begin
                    "Customer A/C" := EmpAccmap."Customer A/c";
                end;
                if Customer.Get("Customer A/C") then begin
                    if Type = Type::Imprest then begin
                        // Customer.CALCFIELDS(Customer.Balance);
                        // IF Customer.Balance>0 THEN
                        //ERROR('You have a balance of KES %1 in your account and cannot proceed, account for the imprest first',Customer.Balance);
                    end;

                end;
            end;
        }
        field(18; "Customer A/C"; Code[20])
        {
            TableRelation = Customer;
        }
        field(19; "Imprest Amount"; Decimal)
        {
            CalcFormula = sum("Request Lines1".Amount where("Document No" = field("No.")));
            FieldClass = FlowField;
        }
        field(20; Balance; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("Customer A/C")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Country; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(22; City; Code[10])
        {
            TableRelation = "Post Code";
        }
        field(23; "Job Group"; Code[10])
        {
            Editable = false;
            TableRelation = "Salary Scales1";
        }
        field(24; "Imprest/Advance No"; Code[10])
        {
            TableRelation = "Request Header1" where(Type = const(Imprest),
                                                     "Employee No" = field("Employee No"),
                                                     Surrendered = const(false),
                                                     Status = const(Released));

            trigger OnValidate()
            begin
                //TestStatusOpen;

                RequestLineRec.Reset;
                RequestLineRec.SetRange("Document No", "No.");
                if RequestLineRec.Find('-') then  //(NOT RequestRec.Partial) AND (
                    RequestLineRec.DeleteAll;


                RequestRec.Reset;
                RequestRec.SetRange("No.", "Imprest/Advance No");
                if RequestRec.Find('-') then    //(NOT RequestRec.Partial) AND (
                 begin
                    //ERROR(RequestRec."Attached to PV No");
                    RequestRec.CalcFields("Accountable Expenses");
                    if RequestRec."Accountable Expenses" = 0 then
                        Error(Text000);
                    "Trip No" := RequestRec."Trip No";
                    "Trip Start Date" := RequestRec."Trip Start Date";
                    "Trip Expected End Date" := RequestRec."Trip Expected End Date";
                    "No. of Days" := RequestRec."No. of Days";
                    Country := TripRec.Country;
                    City := TripRec.City;
                    "Employee No" := RequestRec."Employee No";
                    "Employee Name" := RequestRec."Employee Name";
                    "Transaction Type" := RequestRec."Transaction Type";
                    "Global Dimension 1 Code" := RequestRec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := RequestRec."Global Dimension 2 Code";
                    "Customer A/C" := RequestRec."Customer A/C";
                    "Imprest Type" := RequestRec."Imprest Type";
                    "Purpose of Imprest" := RequestRec."Purpose of Imprest";
                    "Deadline for Imprest Return" := RequestRec."Deadline for Imprest Return";

                    RequestRec.CalcFields(RequestRec."Imprest Amount");
                    "Total Amount Requested" := RequestRec."Imprest Amount";




                    RequestLineRec.Reset;
                    RequestLineRec.SetRange(RequestLineRec."Document No", "Imprest/Advance No");
                    if RequestLineRec.Find('-') then begin
                        repeat
                            RequestRec.CalcFields(RequestRec."Imprest Amount");
                            RequestLineRecopy.TransferFields(RequestLineRec);
                            //RequestLineRecopy.Amount:=RequestRec."Imprest Amount";
                            RequestLineRecopy.Surrender := true;
                            if RequestLineRecopy."Account No" = '' then begin
                                RequestLineRecopy."Account No" := RequestLineRecopy."Account No";
                            end;

                            RequestLineRecopy."Document No" := "No.";
                            RequestLineRecopy.Validate(RequestLineRecopy."Actual Spent");
                            if not RequestLineRecopy.Get(RequestLineRecopy."Document No", RequestLineRecopy."Line No.") then
                                RequestLineRecopy.Insert;


                        until RequestLineRec.Next = 0;
                    end;
                    //==========================Brian Kibet==================
                    /*IF Payments.GET(RequestRec."Attached to PV No") THEN BEGIN
                      IF Payments.Posted=FALSE THEN
                        ERROR('Payment Voucher Number %1 has not been posted!',RequestRec."Attached to PV No");
                      "Applies-to Doc. No.":=RequestRec."Attached to PV No";
                    END;
                    IF RequestRec.Type=RequestRec.Type::PettyCash THEN BEGIN

                       "Applies-to Doc. No.":=RequestRec."No.";
                    END;
                    IF RequestRec.Training=TRUE THEN BEGIN
                       Training:=RequestRec.Training;
                       "Local Travel":=RequestRec."Local Travel";
                       "International Travel":=RequestRec."International Travel";
                       "Destination City":=RequestRec."Destination City";
                       "Destination Country":=RequestRec."Destination Country";
                    END;  */
                    //========================================================
                end;

            end;
        }
        field(25; Posted; Boolean)
        {
        }
        field(26; "Applies-to Doc. No."; Code[20])
        {
        }
        field(27; "Total Amount Requested"; Decimal)
        {
            CalcFormula = sum("Request Lines1"."Requested Amount" where("Document No" = field("No.")));
            FieldClass = FlowField;
        }
        field(28; "CBK Website Address"; Text[250])
        {
        }
        field(29; "No of Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(51511126),
                                                        "Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(33; Surrendered; Boolean)
        {
        }
        field(38; "Remaining Amount"; Decimal)
        {
            CalcFormula = sum("Request Lines1"."Remaining Amount" where("Document No" = field("No."),
                                                                         Surrender = const(true)));
            FieldClass = FlowField;
        }
        field(39; "Receipt Created"; Boolean)
        {
        }
        field(44; "Cheque No"; Code[20])
        {
        }
        field(53; "Actual Amount"; Decimal)
        {
            CalcFormula = sum("Request Lines1"."Actual Spent" where("Document No" = field("No."),
                                                                     Surrender = const(true)));
            FieldClass = FlowField;
        }
        field(54; "Imprest Type"; Option)
        {
            OptionCaption = 'Individual,Group';
            OptionMembers = Individual,Group;
        }
        field(55; "Pay Mode"; Code[30])
        {
            NotBlank = true;
            TableRelation = "Payment ModesPS";
        }
        field(56; "Accountable Expenses"; Integer)
        {
            CalcFormula = count("Request Lines1" where("Document No" = field("No."),
                                                        "Expense Type" = const("Accountable Expenses")));
            FieldClass = FlowField;
        }
        field(57; "Non Accountable Expenses"; Integer)
        {
            CalcFormula = count("Request Lines1" where("Document No" = field("No."),
                                                        "Expense Type" = const("Non-Accountable Expenses")));
            FieldClass = FlowField;
        }
        field(59; "Date Finance Received"; Date)
        {
        }
        field(60; "Activity Date"; Date)
        {
        }
        field(50019; "Language Code (Default)"; Code[10])
        {
        }
        field(50020; Attachement; Option)
        {
            OptionMembers = No,Yes;
        }
        field(50021; "External Application"; Option)
        {
            Description = 'Apply on behalf of external stakeholders';
            OptionMembers = No,Yes;
        }
        field(50022; "Employee/Commissioner"; Option)
        {
            OptionMembers = Commissioner,Employee;
        }
        field(50023; "Imprest Balance"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Debit Amount" where("Customer No." = field("Customer A/C"),
                                                                                 "Loan No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50024; "Claim accounting Balance"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("Customer A/C"),
                                                                         "Loan No" = field("Imprest/Advance No")));
            FieldClass = FlowField;
        }
        field(50025; Archived; Boolean)
        {
        }
        field(50026; Select; Boolean)
        {
        }
        field(50027; "Recover from Payroll"; Boolean)
        {
        }
        field(50028; "Transferred to Payroll"; Boolean)
        {
        }
        field(50029; "Request Type"; Option)
        {
            OptionCaption = ' ,Training,Transport,Imprest,Meal,Taxi';
            OptionMembers = " ",Training,Transport,Imprest,Meal,Taxi;
        }
        field(50030; "Request No"; Code[20])
        {
            TableRelation = if ("Request Type" = const(Training)) "Training Request1"
            else if ("Request Type" = const(Transport)) "Transport Request1"
            else if ("Request Type" = const(Imprest)) "Request Header1";
        }
        field(50031; "Issued Amount"; Decimal)
        {
        }
        field(50032; "Remaining Imprest Amount"; Decimal)
        {
        }
        field(50033; Partial; Boolean)
        {
        }
        field(50034; "Partial Imprests"; Code[20])
        {
            TableRelation = "Partial Imprest Issue"."Imprest No" where("Imprest No" = field("Imprest/Advance No"),
                                                                        Posted = filter(true));

            trigger OnValidate()
            begin
                PartialRec.Reset;
                PartialRec.SetRange("Imprest No", "Partial Imprests");
                PartialRec.SetRange("Select to Surrender", true);
                if PartialRec.Find('-') then begin
                    RequestRec.Reset;
                    RequestRec.SetRange("No.", "Partial Imprests");
                    if RequestRec.Find('-') then begin
                        RequestRec.CalcFields("Accountable Expenses");
                        if RequestRec."Accountable Expenses" = 0 then
                            Error(Text000);
                        "Trip No" := RequestRec."Trip No";
                        Country := TripRec.Country;
                        City := TripRec.City;
                        "Employee No" := RequestRec."Employee No";
                        "Employee Name" := RequestRec."Employee Name";
                        "Transaction Type" := RequestRec."Transaction Type";
                        "Global Dimension 1 Code" := RequestRec."Global Dimension 1 Code";
                        "Global Dimension 2 Code" := RequestRec."Global Dimension 2 Code";
                        "Customer A/C" := RequestRec."Customer A/C";
                        "Imprest Type" := RequestRec."Imprest Type";

                        RequestRec.CalcFields(RequestRec."Imprest Amount");

                        "Total Amount Requested" := RequestRec."Imprest Amount";
                        RequestLineRec.Reset;
                        RequestLineRec.SetRange(RequestLineRec."Document No", "Imprest/Advance No");
                        if RequestLineRec.Find('-') then
                            repeat
                                RequestLineRecopy.TransferFields(RequestLineRec);
                                RequestLineRecopy.Amount := PartialRec."Amount to Issue";
                                RequestLineRecopy."Document No" := "No.";
                                if not RequestLineRecopy.Get(RequestLineRecopy."Document No", RequestLineRecopy."Line No.") then
                                    RequestLineRecopy.Insert;

                            until RequestLineRec.Next = 0;

                    end;
                end;
            end;
        }
        field(50035; "PV Created"; Boolean)
        {
        }
        field(50036; Paid; Boolean)
        {
        }
        field(50037; "Purpose of Imprest"; Text[200])
        {
        }
        field(50038; Department; Text[100])
        {
        }
        field(50039; "Surrender No."; Code[20])
        {
            TableRelation = "Request Header1" where(Type = const("Claim-Accounting"),
                                                     "Employee No" = field("Employee No"),
                                                     Posted = const(true),
                                                     Status = const(Released));

            trigger OnValidate()
            var
                TripRec: Record Trip1;
                RequestRec: Record "Request Header1";
                RequestLineRec: Record "Request Lines1";
                RequestLineRecopy: Record "Request Lines1";
                Customer: Record Customer;
                Text000: label 'You cannot claim from a surrender that that doesn''t have a remaining amount.';
            begin
                //TestStatusOpen;
                // RequestLineRec.Reset;
                // RequestLineRec.SetRange(RequestLineRec."Document No", Rec."Surrender No.");
                // RequestLineRec.SetFilter("Remaining Amount", '<%1', 0);
                // if not RequestLineRec.FindSet then
                //     Error(Text000);

                RequestLineRec.Reset;
                RequestLineRec.SetRange("Document No", "No.");
                if RequestLineRec.Find('-') then  //(NOT RequestRec.Partial) AND (
                    RequestLineRec.DeleteAll;

                RequestRec.Reset;
                RequestRec.SetRange("No.", "Surrender No.");
                if RequestRec.Find('-') then    //(NOT RequestRec.Partial) AND (
                 begin
                    //ERROR(RequestRec."Attached to PV No");
                    RequestRec.CalcFields("Accountable Expenses");
                    if RequestRec."Accountable Expenses" = 0 then
                        Error(Text000);
                    "Trip No" := RequestRec."Trip No";
                    Country := TripRec.Country;
                    City := TripRec.City;
                    // "Employee No" := RequestRec."Employee No";
                    // "Employee Name" := RequestRec."Employee Name";
                    // "Transaction Type" := RequestRec."Transaction Type";
                    // "Global Dimension 1 Code" := RequestRec."Global Dimension 1 Code";
                    // "Global Dimension 2 Code" := RequestRec."Global Dimension 2 Code";
                    // "Customer A/C" := RequestRec."Customer A/C";
                    "Trip Start Date" := RequestRec."Trip Start Date";
                    "Trip Expected End Date" := RequestRec."Trip Expected End Date";
                    "No. of Days" := RequestRec."No. of Days";
                    "Imprest Type" := RequestRec."Imprest Type";
                    "Purpose of Imprest" := RequestRec."Purpose of Imprest";
                    "Deadline for Imprest Return" := RequestRec."Deadline for Imprest Return";

                    RequestRec.CalcFields(RequestRec."Imprest Amount");
                    "Total Amount Requested" := RequestRec."Imprest Amount";

                    RequestLineRec.Reset;
                    RequestLineRec.SetRange(RequestLineRec."Document No", Rec."Surrender No.");
                    if RequestLineRec.Find('-') then begin
                        repeat
                            RequestRec.CalcFields(RequestRec."Imprest Amount");
                            RequestLineRecopy.TransferFields(RequestLineRec);
                            //RequestLineRecopy.Amount:=RequestRec."Imprest Amount";
                            // RequestLineRecopy.Surrender := true;
                            if RequestLineRecopy."Account No" = '' then begin
                                RequestLineRecopy."Account No" := RequestLineRecopy."Account No";
                            end;

                            RequestLineRecopy."Document No" := "No.";
                            // RequestLineRecopy.Validate(RequestLineRecopy."Actual Spent");
                            RequestLineRecopy.Amount := Abs(RequestLineRec."Remaining Amount");
                            RequestLineRecopy."Requested Amount" := RequestLineRec.Amount;
                            RequestLineRecopy."Remaining Amount" := 0;
                            if not RequestLineRecopy.Get(RequestLineRecopy."Document No", RequestLineRecopy."Line No.") then
                                RequestLineRecopy.Insert;


                        until RequestLineRec.Next = 0;
                    end;
                end;

            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Employee No")
        {
        }
        key(Key3; "Employee Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Employee No", "Employee Name")
        {
        }
    }

    trigger OnDelete()
    var
        RequestLines: Record "Request Lines1";
    begin
        //ERROR('You are not allowed to delete a record');
        /*
        IF Status=Status::Released THEN
        ERROR('You are not allowed to delete a record at this stage');
             */

        RequestLines.Reset();
        RequestLines.SetRange("Document No", Rec."No.");
        if RequestLines.FindSet() then
            RequestLines.DeleteAll();
    end;

    trigger OnInsert()
    begin

        if Type = Type::Imprest then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."Imprest Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Imprest Nos.", xRec."No.", 0D, "No.", "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;

        if Type = Type::Refund then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."Imprest Accounting Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Imprest Accounting Nos.", xRec."No.", 0D, "No.", "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;

        if Type = Type::"Claim-Accounting" then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."Claim Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Claim Nos.", xRec."No.", 0D, "No.", "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;


        "Request Date" := Today;
        "User ID" := UserId;

        if UsersRec.Get(UserId) then begin
            if Customer.Get(UsersRec."Customer A\C") then begin
                //Customer A/C
                //"Employee No":=Customer."No.";
                //"Employee No":=Empl."No.";
                // "Employee Name" := Customer.Name;
                "Customer A/C" := Customer."No.";
                //"Employee Name":=Empl."First Name"+' '+Empl."Last Name";
                // "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                // "Global Dimension 2 Code" := Empl."Global Dimension 2 Code";
                // "Job Group" := Empl."Salary Scale";
                //"Procurement Plan":=PurchSetup."Effective Procurement Plan";
            end;
            if Empl.Get(UsersRec."Employee No.") then begin
                "Employee No" := Empl."No.";
                "Employee Name" := Empl.FullName;
                //"Customer A/C":=Customer."No.";
                //"Employee Name":=Empl."First Name"+' '+Empl."Last Name";
                "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                "Global Dimension 2 Code" := Empl."Global Dimension 2 Code";
                "Job Group" := Empl."Salary Scale";

            end;
        end;

        if CompanyInfo.Get then
            "CBK Website Address" := CompanyInfo."CBK Web Address";
    end;

    trigger OnModify()
    begin
        //IF Status=Status::Released THEN
        //ERROR('You cannot change this document at this stage');
        //MESSAGE('You cannot change this document at this stage');
    end;

    trigger OnRename()
    begin
        if Status <> Status::Released then
            Error('You cannot change this document at this stage');
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Empl: Record Employee;
        UsersRec: Record "User Setup";
        EmpAccmap: Record "Employee Account Mapping1";
        NonWorking: Boolean;
        CalendarMgmt: Codeunit "Calendar Management";
        BaseCalendar: Record "Base Calendar";
        Description: Text[30];
        NextWorkingDate: Date;
        NoOfWorkingDays: Integer;
        CounterDays: DateFormula;
        TripRec: Record Trip1;
        RequestRec: Record "Request Header1";
        RequestLineRec: Record "Request Lines1";
        RequestLineRecopy: Record "Request Lines1";
        Customer: Record Customer;
        JnlBatch: Record "Gen. Journal Batch";
        CompanyInfo: Record "Company Information";
        Text000: label 'You cannot surrender an imprest that doesn''t have accountable expenses';
        PartialRec: Record "Partial Imprest Issue";
        Payments: Record Payments;


    procedure CreatePV(var RequestHeader: Record "Request Header1")
    var
        ReqLines: Record "Request Lines1";
        PV: Record Payments;
        PVlines: Record "PV Lines1";
        GenJnline: Record "Gen. Journal Line";
        GLSetup: Record "General Ledger Setup";
        GenJnlineCopy: Record "Gen. Journal Line";
        LastImprestNo: Integer;
        LastClaimNo: Integer;
        GenJnlBatch: Record "Gen. Journal Batch";
        ReceiptHeader: Record "Receipts Header1";
        // ReceiptLine: Record "Receipt Lines1";
        Selection: Integer;
        Window: Dialog;
        PVPayee: Text[80];
        BankAccount: Code[20];
        PayMode: Code[20];
        ChequeNo: Code[20];
        ChequeDate: Date;
        GLEntry: Record "G/L Entry";
        Text000: label 'There is a remaining amount of %1 are you sure you want to create a receipt for this amount?';
        Text001: label 'Post and Create &Receipt,&Post';
        LineNo: Integer;
        ReqHead: Record "Request Header1";
        RequestHeader1: Record "Request Header1";
        TotalSurrendered: Decimal;
        PartialImprest: Record "Partial Imprest Issue";
    begin

        GLSetup.Get;
        RequestHeader.CalcFields(RequestHeader."Imprest Amount");

        if Type = Type::Imprest then begin

            //IF RequestHeader."Total Amount Requested">GLSetup."Cash Limit" THEN
            //BEGIN

            if RequestHeader.Posted <> true then begin

                PV.Init;
                PV."No." := '';
                PV.Date := Today;
                PV.Payee := RequestHeader."Employee Name";
                PV.Remarks := 'Imprest';
                // PV."PO/INV No" := RequestHeader."No.";
                PV."Paying Bank Account" := RequestHeader."Bank Account";//GLSetup."Default Bank Account";
                PV."Account Type" := PV."account type"::"Bank Account";
                PV."Account No." := RequestHeader."Bank Account";
                // PV."Global Dimension 1 Code" := RequestHeader."Global Dimension 1 Code";
                // PV.Validate("Global Dimension 1 Code");
                // PV."Global Dimension 2 Code" := RequestHeader."Global Dimension 2 Code";
                // PV.Validate("Global Dimension 2 Code");
                //PV."Account Name":=;
                PV.Insert(true);

                RequestHeader.CalcFields(RequestHeader."Imprest Amount");
                PVlines.Init;
                PVlines."PV No" := PV."No.";
                PVlines."Line No" := PVlines."Line No" + 10000;
                PVlines."Account Type" := PVlines."account type"::Customer;
                PVlines."Account No" := RequestHeader."Customer A/C";
                Customer.Reset;
                if Customer.Get(RequestHeader."Customer A/C") then
                    PVlines."Account Name" := Customer.Name;
                PVlines."Shortcut Dimension 1 Code" := RequestHeader."Global Dimension 1 Code";
                PVlines.Validate("Shortcut Dimension 1 Code");
                PVlines."Shortcut Dimension 2 Code" := RequestHeader."Global Dimension 2 Code";
                PVlines.Validate("Shortcut Dimension 2 Code");
                PVlines.Description := RequestHeader."Employee Name" + '-Imprest';
                PVlines.Amount := RequestHeader."Imprest Amount";
                PVlines."Loan No" := "No.";
                PVlines.Insert;


                RequestHeader.Posted := true;
                RequestHeader.Modify;

                Message('Payment Voucher %1 has been created for Imprest %2', PV."No.", RequestHeader."No.");
            end else
                Error('A Payment Voucher has already been created for Imprest %1', RequestHeader."No.");

            //END
            //ELSE
            //BEGIN
            /*
           IF RequestHeader.Posted <> TRUE THEN
           BEGIN

             PV.INIT;
             PV."No.":='';
             PV.Date:=TODAY;
             PV.Payee:=RequestHeader."Employee Name";
             PV.Remarks:='Imprest';
             PV."PO/INV No":=RequestHeader."No.";
             PV."Paying Bank Account":=RequestHeader."Bank Account";//GLSetup."Default Bank Account";
             PV."Account Type":=PV."Account Type"::"Bank Account";
             PV."Account No.":=RequestHeader."Bank Account";
            // PV."Account Name":=;
             PV.INSERT(TRUE);
             RequestHeader.CALCFIELDS(RequestHeader."Total Amount Requested");
             PVlines.INIT;
             PVlines."PV No":=PV."No.";
             PVlines."Line No":=PVlines."Line No"+10000;
             PVlines."Account Type":=PVlines."Account Type"::Customer;
             PVlines."Account No":=RequestHeader."Customer A/C";
             Customer.RESET;
             IF Customer.GET(RequestHeader."Customer A/C") THEN
             PVlines."Account Name":=Customer.Name;
             PVlines."Shortcut Dimension 1 Code":=RequestHeader."Global Dimension 1 Code";
             PVlines."Shortcut Dimension 2 Code":=RequestHeader."Global Dimension 2 Code";
             PVlines.Description:=RequestHeader."Employee Name"+'-Imprest';
             PVlines.Amount:=RequestHeader."Total Amount Requested";
             PVlines."Loan No":="No.";
             PVlines.INSERT;


             RequestHeader.Posted:=TRUE;
             RequestHeader.MODIFY;

             MESSAGE('Petty Cash Voucher %1 has been created for Imprest %2',PV."No.",RequestHeader."No.");
           END ELSE
            ERROR('A Petty Cash Voucher has already been created for Imprest %1',RequestHeader."No.");
             */
            //END
            /*
          //END
          //ELSE
          //BEGIN

           IF NOT GenJnlBatch.GET('GENERAL',RequestHeader."No.") THEN
           BEGIN
            GenJnlBatch.INIT;
            GenJnlBatch."Journal Template Name":='GENERAL';
            GenJnlBatch.Name:=RequestHeader."No.";
            GenJnlBatch.INSERT;
           END;

            GenJnlineCopy.RESET;
            GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Template Name",'GENERAL');
            GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Batch Name",RequestHeader."No.");
           IF GenJnlineCopy.FIND('+') THEN
            LastImprestNo:=GenJnlineCopy."Line No.";

            GenJnline."Journal Template Name":='GENERAL';
            GenJnline."Journal Batch Name":=RequestHeader."No.";
            GenJnline."Line No.":=LastImprestNo+10000;
            GenJnline."Account Type":=GenJnline."Account Type"::Customer;
            GenJnline."Account No.":=RequestHeader."Customer A/C";
            GenJnline."Posting Date":=RequestHeader."Request Date";
            GenJnline."Document No.":=RequestHeader."No.";
            GenJnline.Description:='Imprest-' +RequestHeader."Employee Name";
            GenJnline.Amount:=RequestHeader."Total Amount Requested";
            GenJnline."Bal. Account Type":=GenJnline."Bal. Account Type"::"Bank Account";
            GenJnline."Bal. Account No.":=GLSetup."Default Cash Account";
            GenJnline."Loan No":="No.";
            GenJnline.INSERT;

            GenJnline.RESET;
            GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
            GenJnline.SETRANGE(GenJnline."Journal Batch Name",RequestHeader."No.");
            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
            */
            //END;
        end;

        if Type = Type::"Claim-Accounting" then begin
            /*
            IF "Transaction Type"='' THEN
            BEGIN  //claim
            // IF RequestHeader."Total Amount Requested">GLSetup."Cash Limit" THEN
            // BEGIN


              PV.INIT;
              PV."No.":='';
              PV.Date:=TODAY;
              PV.Payee:=RequestHeader."Employee Name";
              PV.Remarks:='Claim';
              PV."PO/INV No":=RequestHeader."No.";
              PV."Paying Bank Account":=GLSetup."Default Bank Account";
              PV.INSERT(TRUE);
              RequestHeader.CALCFIELDS(RequestHeader."Total Amount Requested");
              ReqLines.RESET;
              ReqLines.SETRANGE(ReqLines."Document No",RequestHeader."No.");
              IF ReqLines.FIND('-') THEN
              REPEAT
               PVlines.INIT;
               PVlines."PV No":=PV."No.";
               PVlines."Line No":=PVlines."Line No"+10000;
               PVlines."Account Type":=PVlines."Account Type"::"G/L Account";
               PVlines."Account No.":=ReqLines."Account No";
               PVlines.Description:=RequestHeader."Employee Name"+'-'+'Claim';
               PVlines.Amount:=ReqLines."Requested Amount";
               PVlines.INSERT;
              UNTIL ReqLines.NEXT=0;


           //  END ELSE
           //  BEGIN //less than 10000
              IF NOT GenJnlBatch.GET('GENERAL',RequestHeader."No.") THEN
              BEGIN
               GenJnlBatch.INIT;
               GenJnlBatch."Journal Template Name":='GENERAL';
               GenJnlBatch.Name:=RequestHeader."No.";
               GenJnlBatch.INSERT;
              END;

               GenJnlineCopy.RESET;
               GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Template Name",'GENERAL');
               GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Batch Name",RequestHeader."No.");
               IF  GenJnlineCopy.FIND('+') THEN
                LastClaimNo:=GenJnlineCopy."Line No.";

                ReqLines.RESET;
                ReqLines.SETRANGE(ReqLines."Document No",RequestHeader."No.");
                IF ReqLines.FIND('-') THEN
                REPEAT
                 LastClaimNo:=LastClaimNo+10000;
                 GenJnline.INIT;
                 GenJnline."Journal Template Name":='GENERAL';
                 GenJnline."Journal Batch Name":=RequestHeader."No.";
                 GenJnline."Line No.":=LastClaimNo;
                 GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                 GenJnline."Account No.":=ReqLines."Account No";
                 GenJnline."Posting Date":=RequestHeader."Request Date";
                 GenJnline."Document No.":=RequestHeader."No.";
                 GenJnline.Description:=ReqLines.Description;
                 GenJnline.Amount:=ReqLines."Requested Amount";
                 GenJnline."Bal. Account Type":=GenJnline."Bal. Account Type"::"Bank Account";
                 GenJnline."Bal. Account No.":=GLSetup."Default Cash Account";
                IF GenJnline.Amount<>0 THEN
                 GenJnline.INSERT;

                UNTIL ReqLines.NEXT=0;

                 GenJnline.RESET;
                 GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                 GenJnline.SETRANGE(GenJnline."Journal Batch Name",RequestHeader."No.");
                 CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);

            // END;

            END ELSE
            BEGIN
             //Imprest accounting
             IF NOT GenJnlBatch.GET('GENERAL',RequestHeader."No.") THEN
             BEGIN
              GenJnlBatch.INIT;
              GenJnlBatch."Journal Template Name":='GENERAL';
              GenJnlBatch.Name:=RequestHeader."No.";
              GenJnlBatch.INSERT;
             END;

             GenJnlineCopy.RESET;
             GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Template Name",'GENERAL');
             GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Batch Name",RequestHeader."No.");
             IF  GenJnlineCopy.FIND('+') THEN
              LastClaimNo:=GenJnlineCopy."Line No.";

             ReqLines.RESET;
             ReqLines.SETRANGE(ReqLines."Document No",RequestHeader."No.");
             IF ReqLines.FIND('-') THEN
             REPEAT
              LastClaimNo:=LastClaimNo+10000;
              GenJnline.INIT;
              GenJnline."Journal Template Name":='GENERAL';
              GenJnline."Journal Batch Name":=RequestHeader."No.";
              GenJnline."Line No.":=LastClaimNo;
              GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
              GenJnline."Account No.":=ReqLines."Account No";
              GenJnline."Posting Date":=RequestHeader."Request Date";
              GenJnline."Document No.":=RequestHeader."No.";
              GenJnline.Description:=ReqLines.Description;
              GenJnline.Amount:=ReqLines."Requested Amount";
              IF GenJnline.Amount<>0 THEN
              GenJnline.INSERT;
             UNTIL ReqLines.NEXT=0;
              LastClaimNo:=LastClaimNo+10000;
              GenJnline.INIT;
              GenJnline."Journal Template Name":='GENERAL';
              GenJnline."Journal Batch Name":=RequestHeader."No.";
              GenJnline."Line No.":=LastClaimNo;
              GenJnline."Account Type":=GenJnline."Account Type"::Customer;
              GenJnline."Account No.":=RequestHeader."Customer A/C";
              GenJnline."Posting Date":=RequestHeader."Request Date";
              GenJnline."Document No.":=RequestHeader."No.";
              GenJnline.Description:=ReqLines.Description;
              GenJnline.Amount:=-"Total Amount Requested";
              GenJnline."Loan No":=RequestHeader."Imprest/Advance No";
              IF GenJnline.Amount<>0 THEN
              GenJnline.INSERT;

              GenJnline.RESET;
              GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
              GenJnline.SETRANGE(GenJnline."Journal Batch Name",RequestHeader."No.");
              CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);

            END;
           //*********
           */


            //Imprest Surrender RBA and SASRA

            if Confirm('Are you sure you want to post Imprest Surrender No. ' + RequestHeader."No." + '?', false) = true then begin
                //Check if amount surrendered is less than amount advanced
                RequestHeader.CalcFields("Remaining Amount", "Actual Amount");
                if RequestHeader."Remaining Amount" > 0 then
                    Selection := StrMenu(Text001, 1);
                if RequestHeader.Status <> RequestHeader.Status::Released then
                    Error('The Imprest Surrender No. ' + RequestHeader."No." + ' has not been fully approved');

                RequestHeader.TestField("Customer A/C");
                RequestHeader.TestField("Request Date");
                /*
                       IF PV.GET(RequestHeader."No.") THEN BEGIN
                          PV.TESTFIELD(Payee);
                          PVPayee:=PV.Payee;
                          PV.TESTFIELD("Paying Bank Account");
                          BankAccount:=PV."Paying Bank Account";
                          PV.TESTFIELD("Pay Mode");
                          PayMode:=PV."Pay Mode";
                          IF PV."Pay Mode"='CHEQUE' THEN BEGIN
                           PV.TESTFIELD("Cheque No");
                           ChequeNo:=PV."Cheque No";
                           PV.TESTFIELD("Cheque Date");
                           ChequeDate:=PV."Cheque Date";
                          END;
                       END;

                */
                //Check if the imprest Lines have been populated
                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Document No", RequestHeader."No.");
                ReqLines.SetRange(Surrender, true);
                if not ReqLines.FindLast then
                    Error('The Imprest Surrender Lines are empty');

                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Document No", RequestHeader."No.");
                ReqLines.SetRange(Surrender, true);
                ReqLines.CalcSums("Actual Spent");
                if ReqLines."Actual Spent" = 0 then
                    Error('Actual Spent Amount cannot be zero');

                if RequestHeader.Surrendered then
                    Error('Imprest %1 has been surrendered', RequestHeader."No.");

                GLSetup.Get;

                //CMSetup.GET();
                // Delete Lines Present on the General Journal Line
                GenJnline.Reset;
                GenJnline.SetRange(GenJnline."Journal Template Name", 'GENERAL');
                GenJnline.SetRange(GenJnline."Journal Batch Name", RequestHeader."No.");
                GenJnline.DeleteAll;

                GenJnlBatch.Init;
                //IF CMSetup.GET() THEN
                GenJnlBatch."Journal Template Name" := 'GENERAL';
                GenJnlBatch.Name := RequestHeader."No.";
                if not GenJnlBatch.Get(GenJnlBatch."Journal Template Name", GenJnlBatch.Name) then
                    GenJnlBatch.Insert;
                //Staff entries
                LineNo := 10000;
                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Document No", RequestHeader."No.");
                ReqLines.CalcSums("Actual Spent");
                GenJnline.Init;
                GenJnline."Journal Template Name" := 'GENERAL';
                GenJnline."Journal Batch Name" := RequestHeader."No.";
                GenJnline."Line No." := LineNo;
                GenJnline."Account Type" := GenJnline."account type"::Customer;
                GenJnline."Account No." := RequestHeader."Customer A/C";//RequestHeader."Account No.";
                GenJnline."Posting Date" := RequestHeader."Request Date";
                GenJnline."Document No." := RequestHeader."No.";
                //GenJnLine."External Document No.":=RequestHeader."Cheque No";
                GenJnline.Description := ReqLines.Description;//PVPayee;
                GenJnline.Amount := -RequestHeader."Actual Amount";
                GenJnline.Validate(Amount);
                GenJnline."Applies-to Doc. No." := RequestHeader."Applies-to Doc. No.";
                GenJnline."Shortcut Dimension 1 Code" := RequestHeader."Global Dimension 1 Code";
                GenJnline.Validate("Shortcut Dimension 1 Code");
                GenJnline."Shortcut Dimension 2 Code" := RequestHeader."Global Dimension 2 Code";
                GenJnline.Validate("Shortcut Dimension 2 Code");
                if GenJnline.Amount <> 0 then
                    GenJnline.Insert;

                //Create Receipt IF Chosen
                if Selection = 1 then begin
                    //Insert Header
                    RequestHeader.CalcFields("Remaining Amount");
                    if RequestHeader."Remaining Amount" > 0 then begin
                        if RequestHeader."Receipt Created" = false then begin

                            ReceiptHeader.Init;
                            ReceiptHeader."No." := NoSeriesMgt.GetNextNo(GLSetup."Receipt No", Today, true);
                            ReceiptHeader.Date := Today;//RequestHeader."Imprest Surrender Date";
                            ReceiptHeader."Received From" := PVPayee;
                            // ReceiptHeader."On Behalf Of":=;
                            ReceiptHeader."Global Dimension 1 Code" := RequestHeader."Global Dimension 1 Code";
                            ReceiptHeader."Global Dimension 2 Code" := RequestHeader."Global Dimension 2 Code";
                            if not ReceiptHeader.Get(ReceiptHeader."No.") then
                                ReceiptHeader.Insert;

                        end;
                    end;
                end;

                //Expenses
                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Document No", RequestHeader."No.");
                ReqLines.SetRange(Surrender, true);
                if ReqLines.Find('-') then begin
                    repeat
                        LineNo := LineNo + 10000;
                        GenJnline.Init;
                        GenJnline."Journal Template Name" := 'GENERAL';
                        GenJnline."Journal Batch Name" := RequestHeader."No.";
                        GenJnline."Line No." := LineNo;
                        GenJnline."Account Type" := ReqLines."Account Type";
                        if GenJnline."Account Type" = ReqLines."account type"::"Fixed Asset" then
                            GenJnline."FA Posting Type" := GenJnline."fa posting type"::"Acquisition Cost";
                        GenJnline."Account No." := ReqLines."Account No";
                        GenJnline.Validate("Account No.");
                        GenJnline."Posting Date" := RequestHeader."Request Date";
                        GenJnline."Document No." := RequestHeader."No.";
                        GenJnline.Description := ReqLines.Description;
                        GenJnline.Amount := ReqLines."Actual Spent";
                        GenJnline.Validate(Amount);
                        //Set these fields to blanks
                        GenJnline."Gen. Posting Type" := GenJnline."gen. posting type"::" ";
                        GenJnline.Validate("Gen. Posting Type");
                        GenJnline."Gen. Bus. Posting Group" := '';
                        GenJnline.Validate("Gen. Bus. Posting Group");
                        GenJnline."Gen. Prod. Posting Group" := '';
                        GenJnline.Validate("Gen. Prod. Posting Group");
                        GenJnline."VAT Bus. Posting Group" := '';
                        GenJnline.Validate("VAT Bus. Posting Group");
                        GenJnline."VAT Prod. Posting Group" := '';
                        GenJnline.Validate("VAT Prod. Posting Group");
                        //
                        GenJnline."Shortcut Dimension 1 Code" := RequestHeader."Global Dimension 1 Code";
                        GenJnline.Validate("Shortcut Dimension 1 Code");
                        GenJnline."Shortcut Dimension 2 Code" := RequestHeader."Global Dimension 2 Code";
                        GenJnline.Validate("Shortcut Dimension 2 Code");
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;

                        //Insert Receipt Lines
                        if Selection = 1 then begin
                            if ReqLines."Remaining Amount" > 0 then begin
                                if RequestHeader."Receipt Created" = false then begin

                                    // ReceiptLine.Init;
                                    // ReceiptLine."Receipt No." := RequestRec."No.";
                                    // ReceiptLine."Line No" := RequestLineRec."Line No.";
                                    // ReceiptLine."Account Type" := ReceiptLine."account type"::Customer;
                                    // ReceiptLine."Account No." := RequestHeader."Customer A/C";
                                    // if Customer.Get(RequestHeader."Customer A/C") then
                                    //     ReceiptLine."Account Name" := Customer.Name;
                                    // ReceiptLine.Description := ReqLines.Description;
                                    // ReceiptLine.Amount := ReqLines."Remaining Amount";
                                    // ReceiptLine."Net Amount" := ReqLines."Remaining Amount";
                                    // ReceiptLine."Global Dimension 1 Code" := RequestHeader."Global Dimension 1 Code";
                                    // ;
                                    // ReceiptLine."Global Dimension 2 Code" := RequestHeader."Global Dimension 2 Code";
                                    // ;
                                    // if not ReceiptLine.Get(ReceiptLine."Line No", ReceiptLine."Receipt No.") then
                                    //     ReceiptLine.Insert;

                                end;
                            end;
                        end;
                    until ReqLines.Next = 0;
                end;


                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnline);
                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Document No.", RequestHeader."No.");
                GLEntry.SetRange(GLEntry.Reversed, false);
                GLEntry.SetRange("Posting Date", RequestHeader."Request Date");
                if GLEntry.FindFirst then begin
                    /*ReqLines.RESET;
                    ReqLines.SETRANGE("Document No",RequestHeader."No.");
                    ReqLines.SETRANGE(Surrender,FALSE);
                    ReqLines.SETRANGE("Expense Type",ReqLines."Expense Type"::"Accountable Expenses");*/
                    //IF NOT ReqLines.FIND('-') THEN
                    RequestHeader.Posted := true;
                    RequestHeader.Surrendered := true;

                    // Mark Imprest as Surrendered
                    ReqHead.Reset;
                    ReqHead.SetRange("No.", "Imprest/Advance No");
                    ReqHead.SetRange(Type, ReqHead.Type::Imprest);
                    ReqHead.SetRange(Posted, true);
                    if ReqHead.Find('-') then begin

                        if not ReqHead.Partial then  //Mark Full Imprest Surrendered
                            ReqHead.Surrendered := true

                        else begin
                            RequestHeader1.Reset;
                            RequestHeader1.SetRange("Imprest/Advance No", "Imprest/Advance No");
                            RequestHeader1.SetRange(Type, RequestHeader1.Type::"Claim-Accounting");
                            RequestHeader1.SetRange(Posted, true);
                            if RequestHeader1.Find('-') then begin
                                repeat
                                    TotalSurrendered := TotalSurrendered + RequestHeader1."Actual Amount";
                                until RequestHeader1.Next = 0;
                            end;

                            if PartialImprest.Get("Partial Imprests", PartialImprest."Line No") then begin // Mark the Particular Partial Imprest Surrendered
                                PartialImprest.Surrendered := true;
                                PartialImprest.Modify;
                            end;

                            if ReqHead."Issued Amount" = TotalSurrendered then //Mark the Partial Imprest Surrendered(Header)
                                ReqHead.Surrendered := true;

                        end;


                        ReqHead.Modify;
                    end;



                    if Selection = 1 then
                        RequestHeader."Receipt Created" := true;
                    RequestHeader.Modify;

                    //Uncommit Entries made to the varoius expenses accounts
                    //UncommitImprest(RequestHeader);
                end;
            end;
        end; //Imprest

        if Type = Type::Refund then begin

            //IF RequestHeader."Total Amount Requested">GLSetup."Cash Limit" THEN
            //BEGIN


            PV.Init;
            PV."No." := '';
            PV.Date := Today;
            PV.Payee := RequestHeader."Employee Name";
            PV.Remarks := 'Refund';
            // PV."PO/INV No" := RequestHeader."No.";
            PV."Paying Bank Account" := GLSetup."Receipt Nos";
            PV.Insert(true);
            RequestHeader.CalcFields(RequestHeader."Imprest Amount");

            PVlines.Init;
            PVlines."PV No" := PV."No.";
            PVlines."Line No" := PVlines."Line No" + 10000;
            PVlines."Account Type" := PVlines."account type"::Customer;
            PVlines."Account No" := RequestHeader."Customer A/C";
            PVlines.Validate("Account No");
            PVlines.Description := RequestLineRec.Description;

            // PVlines.Amount := RequestHeader."Actual Amount" - RequestHeader."Imprest Amount";
            PVlines.Amount := RequestHeader."Imprest Amount";
            PVlines."Loan No" := "No.";
            PVlines.Insert;

            Message('Payment Voucher %1 has been created for the claim refund %2', PV."No.", RequestHeader."No.");
            //END
            //ELSE
            //BEGIN
            /*
            IF NOT GenJnlBatch.GET('GENERAL',RequestHeader."No.") THEN
            BEGIN
             GenJnlBatch.INIT;
             GenJnlBatch."Journal Template Name":='GENERAL';
             GenJnlBatch.Name:=RequestHeader."No.";
             GenJnlBatch.INSERT;
            END;

             GenJnlineCopy.RESET;
             GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Template Name",'GENERAL');
             GenJnlineCopy.SETRANGE(GenJnlineCopy."Journal Batch Name",RequestHeader."No.");
            IF GenJnlineCopy.FIND('+') THEN
             LastImprestNo:=GenJnlineCopy."Line No.";

             GenJnline."Journal Template Name":='GENERAL';
             GenJnline."Journal Batch Name":=RequestHeader."No.";
             GenJnline."Line No.":=LastImprestNo+10000;
             GenJnline."Account Type":=GenJnline."Account Type"::Customer;
             GenJnline."Account No.":=RequestHeader."Customer A/C";
             GenJnline."Posting Date":=RequestHeader."Request Date";
             GenJnline."Document No.":=RequestHeader."No.";
             GenJnline.Description:='Refund-' +RequestHeader."Employee Name";
             GenJnline.Amount:=RequestHeader."Actual Amount" - RequestHeader."Total Amount Requested";
             GenJnline."Bal. Account Type":=GenJnline."Bal. Account Type"::"Bank Account";
             GenJnline."Bal. Account No.":=GLSetup."Default Cash Account";
             GenJnline."Loan No":="No.";
             GenJnline.INSERT;

             GenJnline.RESET;
             GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
             GenJnline.SETRANGE(GenJnline."Journal Batch Name",RequestHeader."No.");
             CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
            */
            //END;
        end;

    end;
}

