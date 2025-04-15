 
   #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
table 50011 "Imprest Memo"
{
    DrillDownPageID = "All Imprest Memos";
    LookupPageID = "All Imprest Memos";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin

                /*IF "No."<>xRec."No." THEN
                    NoSeriesMgt.TestManual(CashMgt."Imprest Memo Nos");*/
                if "Document Type" = "document type"::"Imprest Memo" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Memo Nos");
                end;

                if "Document Type" = "document type"::"Imprest Surr Memo" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Surr Memo Nos");

                end;

                if "Document Type" = "document type"::"Standing Imprest" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Standing Imprest Nos");
                end;
            end;
        }
        field(2; Date; Date)
        {
            Editable = false;
        }
        field(3; Project; Code[20])
        {
            TableRelation = Job;

            trigger OnValidate()
            begin
                if JobRec.Get(Project) then begin
                    JobRec.CalcFields("Project Budget", "Actual Project Costs",
                    "PO Commitments", "PRN Commitments", "Store Requisition Commitments", "Imprest Application Commitment");
                    "Project Description" := JobRec.Description;
                    "Project Budget" := JobRec."Project Budget";
                    "Actual Project Costs" := JobRec."Actual Project Costs";
                    "PO Commitments" := JobRec."PO Commitments";
                    "PRN Commitments" := JobRec."PRN Commitments";
                    "Store Requisition Commitments" := JobRec."Store Requisition Commitments";
                    "Imprest Application Commitment" := JobRec."Imprest Application Commitment";
                    "Total Budget Commitments" := "PO Commitments" + "PRN Commitments" + "Store Requisition Commitments" + "Imprest Application Commitment";
                    "Available Funds" := "Project Budget" - "Actual Project Costs" - "Total Budget Commitments";
                    //"Global Dimension 2 Code":=Project;
                    //VALIDATE("Global Dimension 2 Code");
                end;
            end;
        }
        field(4; "Project Description"; Text[250])
        {
        }
        field(5; Objective; Blob)
        {
        }
        field(6; "Terms of Reference"; Blob)
        {
            SubType = Memo;
        }
        field(7; Requestor; Code[50])
        {
            Editable = true;
            TableRelation = Resource where(Type = const(Person));

            trigger OnValidate()
            begin
                ResourceRec.Reset;
                ResourceRec.SetRange("No.", Requestor);
                if ResourceRec.Find('-') then begin
                    "Requestor Name" := ResourceRec.Name;
                end;

                Emp.Reset;
                Emp.SetRange("No.", Requestor);
                if Emp.Find('-') then begin
                    "Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
                    Validate("Global Dimension 1 Code");
                    "Global Dimension 2 Code" := Emp."Global Dimension 2 Code";
                    Validate("Global Dimension 2 Code");
                    HOD := Emp.HOD;
                    "Directorate Code" := Emp."Directorate Code";
                    "Department Code" := Emp."Department Code";
                    Division := Emp.Division;
                end;
            end;
        }
        field(8; "Requestor Name"; Text[50])
        {
            Editable = false;
        }
        field(9; "Total Subsistence Allowance"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where("Imprest Memo No." = field("No."),
                                                                   "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Total Casuals Cost"; Decimal)
        {
            CalcFormula = sum(Casuals.Amount where("Imprest Memo No." = field("No."),
                                                    "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Total Other Costs"; Decimal)
        {
            CalcFormula = sum("Other Costs"."Line Amount" where("Imprest Memo No." = field("No."),
                                                                 "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(13; Posted; Boolean)
        {
            Editable = true;
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2)
                                                         );
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(16; "Datetime Posted"; DateTime)
        {
        }
        field(17; "Posted By"; Code[50])
        {
            Editable = true;
            FieldClass = Normal;
        }
        field(18; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(19; "Currency Code"; Code[20])
        {
            Editable = true;
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then begin
                    getCurrency;
                    if ("Currency Code" <> xRec."Currency Code") or
                       (Date <> xRec.Date) or
                       (CurrFieldNo = FieldNo("Currency Code")) or
                      ("Currency Factor" = 0)
                    then
                        "Currency Factor" :=
                          CurrExchRate.ExchangeRate(Date, "Currency Code");
                end else
                    "Currency Factor" := 0;
                Validate("Currency Factor");

                //IF (("Currency Code" <> xRec."Currency Code") AND (Amount <> 0)) THEN
                //  PaymentToleranceMgt.PmtTolGenJnl(Rec);
                safTeam.Reset;
                //safTeam.SETRANGE(safTeam."Document Type","Document Type");
                safTeam.SetRange(safTeam."No.", "No.");
                if safTeam.FindFirst then begin
                    repeat
                        safTeam."Currency Code" := "Currency Code";
                        safTeam.Validate(safTeam."Currency Code");
                        safTeam.Validate(safTeam."Currency Factor");
                        safTeam.Modify;
                    until safTeam.Next = 0;
                end;
            end;
        }
        field(20; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(21; "Work Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Currency.Code;
        }
        field(22; "Project Task"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting));

            trigger OnValidate()
            begin
                if TaskRec.Get(Project, "Project Task") then;
                "Project Task Description" := TaskRec.Description;
            end;
        }
        field(23; "Project Task Description"; Text[250])
        {
        }
        field(24; "Project Maintenance Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Expected Maintenance Cost" where("Imprest Memo No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Project Lead Costs"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where("Imprest Memo No." = field("No."),
                                                                   Type = const(Machine)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Project Budget"; Decimal)
        {
            Caption = 'Total Project Budget';
            Editable = false;
            FieldClass = Normal;
        }
        field(27; "Total Fuel Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Expected Maintenance Cost" where("Imprest Memo No." = field("No."),
                                                                                   "Expense Type" = const(Fuel),
                                                                                   "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Total Maintenance Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Expected Maintenance Cost" where("Imprest Memo No." = field("No."),
                                                                                   "Expense Type" = const(Maintenance),
                                                                                   "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Actual Project Costs"; Decimal)
        {
            Editable = false;
        }
        field(94; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(100; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(101; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(102; "Imprest Memo Doc. No."; Code[20])
        {
            TableRelation = "Imprest Memo" where(Posted = const(true));

            trigger OnValidate()
            begin
                if ImprestMemo.Get("Imprest Memo Doc. No.") then;
                UpdateSurrender(Rec, ImprestMemo);
            end;
        }
        field(103; "Actual Subsistence Allowance"; Decimal)
        {
            CalcFormula = sum("Project Members"."Actual Spent" where("Imprest Memo No." = field("No."),
                                                                      "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(104; "Actual Casuals Cost"; Decimal)
        {
            CalcFormula = sum(Casuals."Actual Amount" where("Imprest Memo No." = field("No."),
                                                             "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(105; "Actual Other Costs"; Decimal)
        {
            CalcFormula = sum("Other Costs"."Actual Line Amount" where("Imprest Memo No." = field("No."),
                                                                        "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(106; "Actual Fuel Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Actual Maintanance Costs" where("Imprest Memo No." = field("No."),
                                                                                  "Expense Type" = const(Fuel),
                                                                                  "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(107; "Actual Maintenance Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Actual Maintanance Costs" where("Imprest Memo No." = field("No."),
                                                                                  "Expense Type" = const(Maintenance),
                                                                                  "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
            CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(1);
        }
        field(50015; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
            CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(2);
        }
        field(50016; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Division Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 4 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Destination Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 5 Code")));
            FieldClass = FlowField;
        }
        field(50020; "Vote Item"; Code[20])
        {
            CalcFormula = lookup("Project Members"."Vote Item" where("Imprest Memo No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "G/L Account"."No.";
        }
        field(50021; "Vote Amount"; Decimal)
        {
            // CalcFormula = lookup("Budget Commitment"."Budgeted Amount" where("Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            CalcFormula = average("Project Members"."Actual to Date" where("Imprest Memo No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50023; Commitments; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field(Job),
                                                                  "Job Task No" = field("Job  Task"),
                                                                  Type = const(Committed)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57001; "PO Commitments"; Decimal)
        {
            Caption = 'Purchase Order Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57002; "PRN Commitments"; Decimal)
        {
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57003; "Store Requisition Commitments"; Decimal)
        {
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57004; "Imprest Application Commitment"; Decimal)
        {
            Caption = 'Imprest Applications Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57005; "Total Budget Commitments"; Decimal)
        {
            Editable = false;
        }
        field(57006; "Available Funds"; Decimal)
        {
            CalcFormula = average("Project Members"."Available Funds" where("Imprest Memo No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57007; "User ID"; Code[50])
        {
            Caption = 'User ID';
            NotBlank = true;
            TableRelation = "User Setup"."User ID";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //   UserMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.ValidateUserID("User ID");
            end;
        }
        field(57008; "Document Type"; Option)
        {
            OptionCaption = 'Imprest Memo,Imprest Surr Memo,Standing Imprest,Special Imprest';
            OptionMembers = "Imprest Memo","Imprest Surr Memo","Standing Imprest","Special Imprest";
        }
        field(57009; "No. Printed"; Integer)
        {
        }
        field(57010; Surrendered; Boolean)
        {
        }
        field(57011; "Total memo costs"; Decimal)
        {
        }
        field(57012; "Approved No. days"; Integer)
        {
        }
        field(57013; "Reason to Reopen"; Text[100])
        {
        }
        field(57014; "Frequency of Reopen"; Integer)
        {
        }
        field(57015; "Reopened by"; Code[100])
        {
        }
        field(57016; "Reopened Date"; DateTime)
        {
        }
        field(57017; "Imprest Naration"; Text[100])
        {
            Caption = 'Destination Narations';
        }
        field(57018; "Imprest No."; Code[50])
        {
        }
        field(57019; Subject; Code[250])
        {
        }
        field(57020; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                /*
                IF "Start Date"=0D THEN BEGIN
                "Return Date":=0D;
                EXIT;
                END ELSE BEGIN
                  VALIDATE("No. of days");
                END;
                */

            end;
        }
        field(57021; "End Date"; Date)
        {
            Editable = false;
        }
        field(57022; "No. of days"; Decimal)
        {

            trigger OnValidate()
            begin
                //CALCULATE THE END DATE AND RETURN DATE
                if "No. of days" < 0 then
                    Error(Text008);
                begin
                    if ("No. of days" <> 0) and ("Start Date" <> 0D) then
                        "Return Date" := DetermineImprestReturnDate("Start Date", "No. of days");
                    "End Date" := DeterminethisImprestEndDate("Return Date");
                    //MODIFY;
                end;
                /*
                "Due Date":=CALCDATE('2WD',"Return Date");
                VarDate:="Due Date";
                Weekend:=DetermineIfIsNonWorking("Due Date");;
                
                IF Weekend = TRUE THEN
                BEGIN
                  REPEAT
                    VarDate:=CALCDATE('1D',VarDate);
                    Weekend:=DetermineIfIsNonWorking(VarDate);
                    "Due Date":=VarDate;
                
                  UNTIL Weekend= FALSE;
                END;*/

                //testing
                //"End Date" := CALCDATE("No. of days","Start Date");
                /*
                "Return Date":= CALCDATE('2WD',"End Date");
                HRSetup.GET;
                REPEAT
                NonWorking := CalendarMgt.CheckDateStatus(HRSetup."Base Calendar","Return Date",DateDscr);
                IF NonWorking THEN
                "Return Date"  := CALCDATE('-1D',"Return Date");
                UNTIL NOT NonWorking;
                */
                "Due Date" := CalcDate('2WD', "Return Date");
                HRSetup.Get;
                // repeat
                // NonWorking := CalendarMgt.CheckDateStatus(HRSetup."Base Calender Code","Due Date",DateDscr);
                // if NonWorking then
                // "Due Date"  := CalcDate('-1D',"Due Date");
                // until not NonWorking;


                //MESSAGE('"Return Date"%1 "Start Date"%2 "End Date"%3 "Due Date"%4',"Return Date","Start Date","End Date","Due Date");

            end;
        }
        field(57023; "Return Date"; Date)
        {
            Editable = false;
        }
        field(57024; "Due Date"; Date)
        {
            Editable = false;
        }
        field(69017; "Imprest Created"; Boolean)
        {
        }
        field(69018; Imprest; Integer)
        {
        }
        field(69019; "Converted By"; Code[100])
        {
        }
        field(69020; "Date converted"; Date)
        {
        }
        field(69021; "Time converted"; Time)
        {
        }
        field(69022; "Currency Factor"; Integer)
        {
        }
        field(69023; Job; Code[50])
        {
            TableRelation = Job;

            trigger OnValidate()
            begin
                if JobRec.Get(Job) then
                    "Job Name" := JobRec.Description;
            end;
        }
        field(69024; "Job  Task"; Code[50])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job  Task");
                if TaskRec.Find('-') then begin
                    // TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", Commitments);
                    // "Job Task Name" := TaskRec.Description;
                    // "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                    // "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" + TaskRec.Commitments);
                end;
            end;
        }
        field(69025; "Job Name"; Text[250])
        {
        }
        field(69026; "Job Task Name"; Text[250])
        {
        }
        field(69027; "Job Task Budget"; Decimal)
        {
        }
        field(69028; "Job Task Remaining Amount"; Decimal)
        {
        }
        field(69029; "Paying Bank Account"; Code[20])
        {
            // TableRelation = if ("Payment Type" = const("Payment Voucher")) "Bank Account" where(Type = const(Bank))
            // else
            // if ("Payment Type" = const(Imprest)) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            // else
            // if ("Payment Type" = const("Petty Cash")) "Bank Account" where(Type = filter("Petty Cash"))
            // else
            // if ("Payment Type" = const("Bank Transfer")) "Bank Account" where(Type = filter(Bank | "Petty Cash"));
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                if Bank.Get("Paying Bank Account") then begin
                    "Bank Name" := Bank.Name;


                end;
            end;
        }
        field(69030; "Payment Type"; Option)
        {
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender;
        }
        field(69031; Currency; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(69032; Cashier; Text[50])
        {
        }
        field(69033; "Cheque Type"; Option)
        {
            OptionMembers = " ","Computer Check","Manual Check";
        }
        field(69034; "Payment Narration"; Text[250])
        {
        }
        field(69035; "Bank Name"; Text[250])
        {
        }
        field(69036; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(69037; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Cheque No"<>'' THEN BEGIN
                PV.RESET;
                PV.SETRANGE(PV."Cheque No","Cheque No");
                IF PV.FIND('-') THEN BEGIN
                IF PV."No." <> "No." THEN
                   ERROR(Text002);
                END;
                END;
                */

            end;
        }
        field(69038; "Cheque Date"; Date)
        {
        }
        field(69039; "Responsibility Center"; Code[100])
        {
            TableRelation = "Responsibility Center";
        }
        field(69040; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(69041; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
            ObsoleteState = Removed;
            ObsoleteReason = 'Replaced with the Global Dimension 1 Code';

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(69042; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
            ObsoleteState = Removed;
            ObsoleteReason = 'Replaced with the Global Dimension 1 Code';

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(69043; From; Code[150])
        {
        }
        field(69044; Destination; Code[150])
        {
        }
        field(69045; "Time Out"; Time)
        {
        }
        field(69046; "Journey Route"; Code[150])
        {
        }
        field(69047; HOD; Boolean)
        {
            Editable = true;
        }
        field(70014; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Funding Source"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Funding Source");
            end;
        }
        field(70021; "Total Cost"; Decimal)
        {
        }
        field(70022; "DMS Document Type"; Option)
        {
            OptionCaption = 'Imprest Memo';
            OptionMembers = "Imprest Memo";
        }
        field(70023; "Refernce No"; Text[100])
        {

            trigger OnValidate()
            begin
                /*ImprestMemo.RESET;
                ImprestMemo.SETRANGE(ImprestMemo."Refernce No","Refernce No");
                IF ImprestMemo.FINDFIRST THEN
                  ERROR('The reference no %1 has already been used',"Refernce No");
                */
            end;
        }
        field(70024; "Local Travel"; Boolean)
        {

            trigger OnValidate()
            begin
                if "Local Travel" = true then begin
                    "International Travel" := false;
                    Modify;
                end;
            end;
        }
        field(70025; "International Travel"; Boolean)
        {

            trigger OnValidate()
            begin
                if "International Travel" = true then begin
                    "Local Travel" := false;
                    Modify;
                end;
            end;
        }
        field(70030; "Created From No"; Text[100])
        {
        }
        field(70031; "Mode of Transport Required"; Boolean)
        {
        }
        field(70032; "Number of Drivers"; Integer)
        {

            trigger OnValidate()
            begin
                FleetSetup.Get;
                FleetSetup.TestField("Default Fleet Driver");
                DefaultDriver := FleetSetup."Default Fleet Driver";
                ProjectMember1.Reset;
                ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", Rec."No.");
                ProjectMember1.SetRange(ProjectMember1."No.", DefaultDriver);
                if ProjectMember1.Find('-') then begin
                    ResourceRec.Get(ProjectMember1."No.");
                    if ResourceCost.Get(ResourceCost.Type::Resource, ProjectMember1."No.", ProjectMember1."Work Type") then
                        ProjectMember1.Entitlement := (ResourceCost."Direct Unit Cost" * ProjectMember1."Time Period" * "Number of Drivers")
                    else
                        ProjectMember1.Entitlement := (ProjectMember1."Direct Unit Cost" * ProjectMember1."Time Period" * "Number of Drivers");
                    ProjectMember1."Total Entitlement" := ProjectMember1.Entitlement;
                    ProjectMember1.Validate(Entitlement);

                    ProjectMember1.Modify(true);
                end;
            end;
        }
        field(70033; "Mode of Transport"; Option)
        {
            OptionCaption = ' ,Vehicle,Air,Train,Other';
            OptionMembers = " ",Vehicle,Air,Train,Other;

            trigger OnValidate()
            begin
                FleetSetup.Get;
                FleetSetup.TestField("Default Fleet Driver");
                DefaultDriver := FleetSetup."Default Fleet Driver";
                case "Mode of Transport" of
                    "mode of transport"::Vehicle:
                        begin
                            // "Number of Drivers" := 1;
                            ProjectMember1.Reset;
                            ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", Rec."No.");
                            if ProjectMember1.FindFirst then begin
                                ProjectMembers.Init;
                                ProjectMembers."Imprest Memo No." := Rec."No.";
                                ProjectMembers.Type := ProjectMembers.Type::Person;
                                ProjectMembers."No." := DefaultDriver;
                                ProjectMembers.Validate("No.");
                                ProjectMembers."Time Period" := ProjectMember1."Time Period";
                                ProjectMembers.Validate(ProjectMembers."Time Period");
                                ProjectMembers."Vote Item" := ProjectMember1."Vote Item";
                                ProjectMembers.Validate("Vote Item");
                                ProjectMembers."Type of Expense" := ProjectMember1."Type of Expense";
                                ProjectMembers.Validate("Type of Expense");
                                ProjectMembers."Work Type" := ProjectMember1."Work Type";
                                ProjectMembers.Validate("Work Type");
                                //  ProjectMembers.Job := ProjectMember1.Job;
                                // ProjectMembers.Validate(Job);
                                //  ProjectMembers."Job  Task" := ProjectMember1."Job  Task";
                                // ProjectMembers.VALIDATE(Job);

                                if ProjectMembers.Insert(true) then begin
                                    ProjectMembers.Validate("Time Period");
                                    // ProjectMembers.VALIDATE("Job  Task");
                                end;
                            end;
                        end;
                    else begin

                        ProjectMember1.Reset;
                        ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", Rec."No.");
                        ProjectMember1.SetRange(ProjectMember1."No.", DefaultDriver);
                        ProjectMember1.DeleteAll;
                        // "Number of Drivers" := 0;
                    end;
                end
            end;
        }
        field(70034; Archived; Boolean)
        {
        }
        field(70035; "Total Imprest Cost"; Decimal)
        {
        }
        field(70037; "Warrant Voucher Type"; Option)
        {
            OptionCaption = ' ,Create New Warrant,Append To Exist';
            OptionMembers = " ","Create New Warrant","Append To Exist";
        }
        field(70036; "Warrant No"; Code[30])
        {
            TableRelation = if ("Warrant Voucher Type" = const("Append To Exist")) Payments."No." where("Payment Type" = const("Warrant Voucher"),
                                                                                                       Posted = const(false));
        }
        field(70039; "Strategic Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(70040; "Reporting Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Strategic Plan"));
        }
        field(70041; "Workplan Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No where("Planning Budget Type" = const(Supplementary), "Budget Posted to G/L" = const(true), "Strategy Plan ID" = field("Strategic Plan"),
                            "Year Reporting Code" = field("Reporting Year Code"), "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                             "Global Dimension 2 Code" = field("Global Dimension 2 Code"));
            trigger OnValidate()
            var
                AWP: Record "Annual Strategy Workplan";
            begin
                if AWP.Get("Workplan Code") then
                    "Resource Req. No." := AWP."Resource Req. No";
            end;
        }
        field(70042; "Activity Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Workplan Activity".Code where("Strategic Plan ID" = field("Resource Req. No."));
        }
        field(70043; "Resource Req. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if (xRec."Resource Req. No." <> Rec."Resource Req. No.") and (xRec."Resource Req. No." <> '') then
                    Validate("Activity Code", '');
            end;
        }
        field(70044; "Expenditure Requisition Code"; Code[20])
        {
            TableRelation = "Expense Requisition"."No." where("Global Dimension 1 Code" = field("Global Dimension 1 Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                               "Corporate Strategy" = field("Strategic Plan"), "Reporting Period" = field("Reporting Year Code"), "Activity Code" = field("Activity Code"),
                                                               "Approval Status" = const(Released), Status = const(Committed));

            trigger OnValidate()
            var
                EXR: Record "Expense Requisition";
            begin
                //Populate the Team Members

            end;
        }
        field(70045; "Source RecordID"; RecordId)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Source RecordID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Project, "Project Description", Date, Requestor, "Requestor Name")
        {
        }
    }

    trigger OnDelete()
    begin
        Error(Text004);
    end;

    trigger OnModify()
    begin
        if (xrec.Status = xRec.Status::"Pending Approval") and (xRec.Status = Rec.Status) then
            Error('You cannot edit a document pending approval');
    end;

    trigger OnInsert()
    var
        WorkplanMgt: Codeunit "Workplan Management";
    begin
        CashMgt.Get();

        if "Document Type" = "document type"::"Imprest Memo" then begin
            //David to control Imprest application process
            if (CashMgt."Lock Imprest Application" = true) and (UserSetup."Accounts User" = false) then begin
                Error(Text005);
            end;

            if "Document Type" = "document type"::"Imprest Memo" then begin
                CustRec.Reset;
                CustRec.SetRange("No.", Requestor);
                if CustRec.Find('-') then begin
                    CustRec.CalcFields("Balance (LCY)", Balance);
                    if CustRec."Balance (LCY)" > 0 then
                        Error(Text007, CustRec."Balance (LCY)");
                end;

            end;

            CashMgt.TestField("Imprest Memo Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Memo Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Imprest Surr Memo" then begin
            CashMgt.TestField("Imprest Surr Memo Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Surr Memo Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Document Type" = "document type"::"Standing Imprest" then begin
            CashMgt.TestField("Standing Imprest Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Document Type" = "Document Type"::"Special Imprest" then begin
            CashMgt.TestField("Special Imprest Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Special Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Strategic Plan" = '' then
            "Strategic Plan" := WorkplanMgt.GetCurrentCorporateStrategy();

        if "Reporting Year Code" = '' then
            "Reporting Year Code" := WorkplanMgt.GetCurrentStrategyImplementationYear("Strategic Plan");
        //Get Plan 
        if "Workplan Code" = '' then begin
            if ("Global Dimension 1 Code" <> '') and ("Global Dimension 2 Code" <> '') and ("Strategic Plan" <> '') and ("Reporting Year Code" <> '') then
                "Workplan Code" := WorkplanMgt.GetCurrentWorkplan("Strategic Plan", "Reporting Year Code", "Global Dimension 1 Code", "Global Dimension 2 Code");
            Validate("Workplan Code");
        end;

        /*CashMgt.GET();
            CashMgt.TESTFIELD("Imprest Memo Nos");
            IF "No."='' THEN
            NoSeriesMgt.InitSeries(CashMgt."Imprest Memo Nos",xRec."No. Series",0D,"No.","No. Series");*/
        /*
           //Assign Customer Account
          IF UserSetup.GET(USERID) THEN BEGIN
             UserSetup.TESTFIELD(Picture);

           IF Customer.GET(UserSetup.Picture) THEN BEGIN
              "Account No.":=Customer."No.";
              "Account Name":=Customer.Name;
              Payee:=Customer.Name;
              END
              ELSE
              ERROR(Text001,UserSetup.Picture);
             END;
      */
        //Ushindi
        //Confirm if any open Memo exists and force reuse
        ImprestMemo.Reset;
        ImprestMemo.SetRange(ImprestMemo.Status, ImprestMemo.Status::Open);
        ImprestMemo.SetRange(ImprestMemo."User ID", UserId);
        ImprestMemo.SetRange(ImprestMemo."Document Type", "Document Type");
        ImprestMemo.SetFilter("No.", '<>%1', "No.");
        /*IF ImprestMemo.FIND('-') THEN
        IF "Document Type"="Document Type"::"Imprest Memo" THEN
        BEGIN
        ERROR(Text003,ImprestMemo."No.");
        END;
        */

        // Amos  --> Commented this to prevent Modifying requestor when an imprest is raised from the portal
        //Insert User ID and Resource No/Mapping
        // UserSetup.RESET;
        // IF NOT UserSetup.GET(USERID) THEN
        //     ERROR('%1 is not defined under the User Setup, Please check!', USERID);
        // IF UserSetup.GET(USERID) THEN BEGIN
        //     UserSetup.TESTFIELD(UserSetup."Resource No");
        //     UserSetup.TESTFIELD(UserSetup."Employee No.");
        //     //UserSetup.TESTFIELD(UserSetup."Imprest Account");
        //     //UserSetup.TESTFIELD(UserSetup."Employee Name");
        //     "User ID" := USERID;
        //     Requestor := UserSetup."Resource No";
        //     "Requestor Name" := UserSetup."Employee Name";
        // END;
        //Insert Today Date as default
        Date := Today;
        // for compatibility with the requests raised from Business central -- Amos
        UserSetup.Get(UserId);
        if UserSetup."Portal User" = false then begin
            "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";
            "User ID" := UserId;

        end;
        //Ushindi
        //added on 28/06/2019 to add HOD
        if Emp.Get(Requestor) then begin
            HOD := Emp.HOD;
            "Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := Emp."Global Dimension 2 Code";
            "Directorate Code" := Emp."Directorate Code";
            "Department Code" := Emp."Department Code";
            Division := Emp.Division;
        end;

        //Default CSP Codes

    end;

    local procedure RevalidateDimensions()
    var
        DimensionManagement: Codeunit DimensionManagement;
    begin
        if "Dimension Set ID" = 0 then begin
            DimensionManagement.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(3, "Shortcut Dimension 3 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(4, "Shortcut Dimension 4 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(5, "Shortcut Dimension 5 Code", "Dimension Set ID");
            Modify();
            Commit();
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Cash management setup does''nt exist';
        Text001: label 'Create an Imprest A/C for Employee No. %1 under the Employee Card \Please contact system Administrator';
        Text002: label 'Cheque No. already exists';
        JobRec: Record Job;
        ResourceCost: Record "Resource Cost";
        ResourceRec: Record Resource;
        TaskRec: Record "Job Task";
        UserSetup: Record "User Setup";
        ImprestMemo: Record "Imprest Memo";
        Text003: label 'Another Project Imprest Memo No %1 you created is still Open, Please check or reuse it!';
        Text004: label 'Deleting Imprest memo No. %1 Will create a gap in number series for Imprest memos which will Raise Audit Queries. ';
        Text005: label 'You are currently not allowed to Apply for Imprest, Kindly seek advice from Accounts and Finance office.';
        Text006: label 'Another Project Imprest Surrender Memo No %1 you created is still Open, Please check or reuse it!';
        CustRec: Record Customer;
        Text007: label 'You have an Outstanding Imprest Amounting to %1 that you need to clear before raising another imprest. Kindly clear with Finance.';
        varDaysApplied: Integer;
        ReturnDateLoop: Boolean;
        mWeekDay: Integer;
        mMinDays: Integer;
        HRSetup: Record "Human Resources Setup";
        BaseCalendarChange: Record "Base Calendar Change";
        Text008: label 'Days Applied For cannot be negative';
        Weekend: Boolean;
        VarDate: Date;
        test: Integer;
        TargetDate: Date;
        SourceDate: Date;
        CalendarMgt: Codeunit "Calendar Management";
        NonWorking: Boolean;
        DateDscr: Text[30];
        CurrencyCode: Code[10];
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        safTeam: Record "Project Members";
        others: Record "Other Costs";
        Bank: Record "Bank Account";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        DimMgt: Codeunit DimensionManagement;
        PurchLine: Record "Receipt Lines1";
        Emp: Record Employee;
        TextConf: label 'By selecting Vehicle, a driver will be added to the imprest memo for Budgeting Purpose\Do you wish to proceed with this selection?';
        ProjectMembers: Record "Project Members";
        ProjectMember1: Record "Project Members";
        FleetSetup: Record "Fleet Management Setup";
        DefaultDriver: Code[20];
        i: Integer;
        DimensionValue: Record "Dimension Value";

    local procedure InsertTOR()
    var
        Instr: InStream;
        TOR: BigText;
        Outstr: OutStream;
        TermsText: Text;
    begin
        TOR.AddText(TermsText);
        "Terms of Reference".CreateOutstream(Outstr);
        TOR.Write(Outstr);
        Insert;
    end;

    procedure ShowEditDimension(Editable: Boolean)
    var
        DimensionManagement: Codeunit DimensionManagement;
        DimensionCodes: array[8] of Code[20];
        NewDimensionSetId: Integer;
    begin
        RevalidateDimensions();
        if Editable then begin
            NewDimensionSetId := DimensionManagement.EditDimensionSet("Dimension Set ID", 'Dimensions');
            if NewDimensionSetId <> "Dimension Set ID" then begin
                DimensionManagement.GetShortcutDimensions(NewDimensionSetId, DimensionCodes);
                "Dimension Set ID" := NewDimensionSetId;
                "Global Dimension 1 Code" := DimensionCodes[1];
                "Global Dimension 2 Code" := DimensionCodes[2];
                "Shortcut Dimension 3 Code" := DimensionCodes[3];
                "Shortcut Dimension 4 Code" := DimensionCodes[4];
                "Shortcut Dimension 5 Code" := DimensionCodes[5];
                Rec.Modify();
            end;
        end else begin
            DimensionManagement.ShowDimensionSet("Dimension Set ID", 'Dimensions');
        end;
    end;


    local procedure UpdateSurrender(var CurrRec: Record "Imprest Memo"; ImpMemo: Record "Imprest Memo")
    var
        ProjectMembers: Record "Project Members";
        NewProjectMembers: Record "Project Members";
        Casuals: Record Casuals;
        NewCasuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        NewOtherCosts: Record "Other Costs";
        ExecPlan: Record "Execution Plan";
        NewExecPlan: Record "Execution Plan";
    begin
        CurrRec.TransferFields(ImpMemo, false);
        CurrRec."Document Type" := CurrRec."document type"::"Imprest Surr Memo";
        CurrRec."Imprest Memo Doc. No." := ImpMemo."No.";
        ImpMemo.CalcFields("Terms of Reference", Objective);
        CalcFields("Terms of Reference", Objective);
        CurrRec."Terms of Reference" := ImpMemo."Terms of Reference";
        CurrRec.Objective := ImpMemo.Objective;
        CurrRec.Status := CurrRec.Status::Open;
        CurrRec.Posted := false;
        CurrRec."Posted By" := '';
        CurrRec.Modify;

        NewProjectMembers.Reset;
        NewProjectMembers.SetRange("Imprest Memo No.", CurrRec."No.");
        NewProjectMembers.DeleteAll;

        ProjectMembers.Reset;
        ProjectMembers.SetRange("Imprest Memo No.", ImpMemo."No.");
        if ProjectMembers.Find('-') then
            repeat
                NewProjectMembers.Init;
                NewProjectMembers.TransferFields(ProjectMembers);
                NewProjectMembers."Imprest Memo No." := CurrRec."No.";
                NewProjectMembers.Posted := false;
                if not NewProjectMembers.Get(NewProjectMembers."Imprest Memo No.", NewProjectMembers."No.",
                  NewProjectMembers."Work Type") then
                    NewProjectMembers.Insert;
            until ProjectMembers.Next = 0;


        NewCasuals.Reset;
        NewCasuals.SetRange("Imprest Memo No.", CurrRec."No.");
        NewCasuals.DeleteAll;

        Casuals.Reset;
        Casuals.SetRange("Imprest Memo No.", ImpMemo."No.");
        if Casuals.Find('-') then
            repeat
                NewCasuals.Init;
                NewCasuals.TransferFields(Casuals);
                NewCasuals."Imprest Memo No." := CurrRec."No.";
                NewCasuals.Posted := false;
                if not NewCasuals.Get(NewCasuals."Imprest Memo No.", NewCasuals.Type, NewCasuals."Resource No.") then
                    NewCasuals.Insert;
            until Casuals.Next = 0;
        //

        //Loop Through the Miscelleneous Costs

        NewOtherCosts.Reset;
        NewOtherCosts.SetRange("Imprest Memo No.", CurrRec."No.");
        NewOtherCosts.DeleteAll;

        OtherCosts.Reset;
        OtherCosts.SetRange("Imprest Memo No.", ImpMemo."No.");
        if OtherCosts.Find('-') then
            repeat
                NewOtherCosts.TransferFields(OtherCosts);
                NewOtherCosts."Imprest Memo No." := CurrRec."No.";
                NewOtherCosts.Posted := false;
                if not NewOtherCosts.Get(NewOtherCosts."Imprest Memo No.", NewOtherCosts."Line No.") then
                    NewOtherCosts.Insert;
            until OtherCosts.Next = 0;
        //

        NewExecPlan.Reset;
        NewExecPlan.SetRange("Imprest Memo No.", CurrRec."No.");
        NewExecPlan.DeleteAll;

        ExecPlan.Reset;
        ExecPlan.SetRange("Imprest Memo No.", ImpMemo."No.");
        if ExecPlan.Find('-') then
            repeat
                NewExecPlan.Init;
                NewExecPlan.TransferFields(ExecPlan);
                NewExecPlan."Imprest Memo No." := CurrRec."No.";
                if not NewExecPlan.Get(NewExecPlan."Imprest Memo No.", NewExecPlan.Period) then
                    NewExecPlan.Insert;
            until ExecPlan.Next = 0;
    end;


    procedure DetermineImprestReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        /*REPEAT
         BEGIN
            fReturnDate := CALCDATE('1D', fReturnDate);
            varDaysApplied := varDaysApplied - 1;
          END;
          //MESSAGE('varDaysApplied,%1,%2',varDaysApplied,fReturnDate);
        UNTIL varDaysApplied = 0;
        
        //If Date to return is saturday add 2 days to returen on monday
         mWeekDay := DATE2DWY(fReturnDate, 1);
         IF mWeekDay=6 THEN
          fReturnDate := CALCDATE('+2D', fReturnDate)
         ELSE IF mWeekDay=7 THEN
          fReturnDate := CALCDATE('+1D', fReturnDate);
        
         EXIT(fReturnDate);
         */

        //Added by Morris

        fReturnDate := CalcDate(Format(fDays) + 'D', fBeginDate);

    end;


    procedure DeterminethisImprestEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin
        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calendar");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);
        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then
                Message('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
         */

    end;

    local procedure getCurrency()
    begin
        /*CurrencyCode :="Currency Code";
        IF CurrencyCode='' THEN
          BEGIN
            CLEAR(Currency);
            Currency.InitRoundingPrecision
           END ELSE
            IF CurrencyCode<>Currency.Code THEN BEGIN
              Currency.GET("Currency Code");
              Currency.TESTFIELD("Amount Rounding Precision");
              END;
              */

    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "No." <> '' then
            //MODIFY;

            if OldDimSetID <> "Dimension Set ID" then begin
                //MODIFY;
                if PurchLinesExist then
                    UpdateAllLineDim("Dimension Set ID", OldDimSetID);
            end;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
           "Global Dimension 1 Code", "Global Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            //MODIFY;
            if PurchLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
        ProjMembers: Record "Project Members";
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text051) then
            exit;

        ProjMembers.Reset();
        ProjMembers.SetRange("Imprest Memo No.", Rec."No.");
        if ProjMembers.FindSet() then begin
            NewDimSetID := DimMgt.GetDeltaDimSetID(ProjMembers."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
            if ProjMembers."Dimension Set ID" <> NewDimSetID then begin
                ProjMembers."Dimension Set ID" := NewDimSetID;
                DimMgt.UpdateGlobalDimFromDimSetID(
                  ProjMembers."Dimension Set ID", ProjMembers."Global Dimension 1 Code", ProjMembers."Global Dimension 2 Code");
                ProjMembers.Modify;
            end;
        end;

        /* PurchLine.Reset;
         //PurchLine.SETRANGE("Document Type","Document Type");
         PurchLine.SetRange("Receipt No.", "No.");
         PurchLine.LockTable;
         if PurchLine.FindSet() then
             repeat
                 NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                 if PurchLine."Dimension Set ID" <> NewDimSetID then begin
                     PurchLine."Dimension Set ID" := NewDimSetID;
                     DimMgt.UpdateGlobalDimFromDimSetID(
                       PurchLine."Dimension Set ID", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                     PurchLine.Modify;
                 end;
             until PurchLine.Next = 0;
             */
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateDimTableIDs(var ReceiptHeader: Record "Receipts Header1"; FieldNo: Integer; var TableID: array[10] of Integer; var No: array[10] of Code[20])
    begin
    end;

    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange("Receipt No.", "No.");
        exit(PurchLine.FindFirst);
    end;
}

