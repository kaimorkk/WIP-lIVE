table 50110 "Expense Requisition"
{
    Caption = 'Expense Requisition';
    DataClassification = ToBeClassified;
    LookupPageId = "Expense Requisitions";
    DrillDownPageId = "Expense Requisitions";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = Const(1));
            trigger OnValidate()
            var
                myInt: Integer;
                Dimension: Record "Dimension Value";
            begin
                Dimension.reset;
                Dimension.SetRange(Dimension.Code, rec."Global Dimension 1 Code");
                if Dimension.FindFirst() then
                    "Geo Graphical Name" := Dimension.name;

            end;
        }
        field(4; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = Const(2));
            //, code = field("Holders Admin Unit")
            trigger OnValidate()
            var
                WorkplanMgt: Codeunit "Workplan Management";
                UserSetUp: Record "User Setup";
            begin
                if Rec."Global Dimension 2 Code" <> xRec."Global Dimension 2 Code" then begin
                    Clear(Workplan);
                    Clear("Activity Code");
                    Clear("Resource Req. No.");
                    Clear("Activity Description");
                    Clear("Admin Unit Name");
                end;
                DimVal.Reset();
                DimVal.SetRange("Global Dimension No.", 2);
                DimVal.SetRange(Code, "Global Dimension 2 Code");
                if DimVal.FindFirst() then
                    "Admin Unit Name" := DimVal.Name;
                if UserSetUp.Get("Created By") then begin
                    UserSetUp.TestField("Global Dimension 1 Code");
                    UserSetUp.TestField("Shortcut Dimension 2 Code");

                    "Global Dimension 1 Code" := UserSetUp."Global Dimension 1 Code";
                    rec."Location Code" := UserSetUp."Global Dimension 1 Code";
                    "Holders Admin Unit" := rec."Global Dimension 2 Code";
                    // "Global Dimension 2 Code" := UserSetUp."Shortcut Dimension 2 Code";

                end;

                if "Corporate Strategy" = '' then
                    "Corporate Strategy" := WorkplanMgt.GetCurrentCorporateStrategy();
                if "Reporting Period" = '' then begin
                    "Reporting Period" := WorkplanMgt.GetCurrentStrategyImplementationYear("Corporate Strategy");
                    Validate("Reporting Period");
                end;

                Workplan := WorkplanMgt.GetCurrentWorkplan("Corporate Strategy", "Reporting Period", "Global Dimension 1 Code", "Global Dimension 2 Code");
                Validate(Workplan);

                // "Created By" := UserId;
                // "Date Created" := CurrentDateTime;
            end;
        }
        field(5; "Approval Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Released,Reject,Archived;
            OptionCaption = 'Open,Pending Approval,Approved,Reject,Archived';
            Editable = false;
        }
        field(9; "Status"; Option)
        {
            OptionMembers = New,"Pending Commitment","Committed","Fully Utilized","Recalled";
            Editable = false;
            trigger OnValidate()
            var
                ExpenseReqLines: Record "Expense Requisition Line";
                ExpenseReqAlloc: Record "Expense Req. Allocation";
            begin
                case
                    Status of
                    Status::"Pending Commitment":
                        begin
                            ExpenseReqLines.Reset;
                            ExpenseReqLines.Setrange("Document No.", "No.");
                            if ExpenseReqLines.FindSet() then begin
                                ExpenseReqLines.ModifyAll(Status, ExpenseReqLines.Status::"Pending Commitment", true)
                            end;
                            ExpenseReqLines.Reset;
                            ExpenseReqAlloc.Setrange("Document No.", "No.");
                            if ExpenseReqAlloc.FindSet() then begin
                                ExpenseReqAlloc.ModifyAll(Status, ExpenseReqAlloc.Status::"Pending Commitment", true)
                            end;
                        end;
                    Status::"Recalled":
                        begin
                            ExpenseReqLines.Reset;
                            ExpenseReqLines.Setrange("Document No.", "No.");
                            ExpenseReqLines.SetRange(Status, ExpenseReqLines.Status::Committed);
                            if ExpenseReqLines.FindSet() then begin
                                ExpenseReqLines.ModifyAll(Status, ExpenseReqLines.Status::Recalled, true)
                            end;

                            ExpenseReqLines.Reset;
                            ExpenseReqAlloc.Setrange("Document No.", "No.");
                            ExpenseReqAlloc.SetRange(Status, ExpenseReqAlloc.Status::Committed);
                            if ExpenseReqAlloc.FindSet() then begin
                                ExpenseReqAlloc.ModifyAll(Status, ExpenseReqAlloc.Status::Recalled, true)
                            end;
                        end;
                    Status::Committed:
                        begin
                            ExpenseReqLines.Reset;
                            ExpenseReqLines.Setrange("Document No.", "No.");
                            if ExpenseReqLines.FindSet() then begin
                                ExpenseReqLines.ModifyAll(Status, ExpenseReqLines.Status::Committed, true)
                            end;
                            ExpenseReqLines.Reset;
                            ExpenseReqAlloc.Setrange("Document No.", "No.");
                            if ExpenseReqAlloc.FindSet() then begin
                                ExpenseReqAlloc.ModifyAll(Status, ExpenseReqAlloc.Status::Committed, true)
                            end;
                        end;
                end;
            end;
        }
        field(10; "Committed By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup"."User Id";
        }
        field(11; "Date Committed"; Datetime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Recalled By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup"."User Id";
        }
        field(13; "Date Recalled"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "No. Series"; Code[20])
        {
            Dataclassification = ToBeClassified;
        }
        field(15; "Corporate Strategy"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'STAJ Blueprint';
            TableRelation = "Corporate Strategic Plans".Code;
            Editable = false;
            trigger OnValidate()
            begin
            end;
        }
        field(16; "Reporting Period"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Corporate Strategy"));
            trigger OnValidate()
            var
                CSPYears: Record "CSP Planned Years";
            begin
                if CSPYears.Get("Corporate Strategy", "Reporting Period") then begin
                    if CSPYears."Budget Code" = '' then
                        Error('Budget Code CSP Planned years must have a value');
                    CSPYears.Testfield("Budget Code");
                    "Budget Code" := CSPYears."Budget Code";
                end;
            end;
        }
        field(17; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "G/L Budget Name";
        }
        field(18; Date; Date)
        {
            DataClassification = ToBeClassified;
            //Validate Dates
            trigger OnValidate()
            var
                Budget: Record "G/L Budget Name";
            begin
                TestField("Budget Code");
                Budget.Get("Budget Code");
                Budget.Testfield("Start Date");
                Budget.Testfield("End Date");
                if (Date < Budget."Start Date") or (Date > Budget."End Date") then
                    Error('The date should be within budget period, from %1 to %2', Budget."Start Date", Budget."End Date");
            end;
        }
        field(19; "Workplan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No where(Archived = Const(false), Consolidated = Const(true), "Strategy Plan ID" = field("Corporate Strategy"), "Year Reporting Code" = field("Reporting Period"), "Global Dimension 1 Code" = field("Global Dimension 1 Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"), "Planning Budget Type" = filter(<> Original));
            trigger OnValidate()
            var
                WorkplanRec: Record "Annual Strategy Workplan";
            begin
                if WorkplanRec.Get(Rec.Workplan) then
                    "Resource Req. No." := WorkplanRec."Resource Req. No";
            end;
        }
        field(20; "Requires Imprest"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if (XRec."Requires Imprest") and (not Rec."Requires Imprest") then
                    ClearLines(0);
            end;
        }
        field(21; "Requires Direct Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if (XRec."Requires Direct Payment") and (not Rec."Requires Direct Payment") then
                    ClearLines(1);
            end;
        }
        field(22; "Activity Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Workplan Activity".Code where("Strategic Plan ID" = field("Resource Req. No."));
            trigger OnValidate()
            var
                WorkplanActivity: Record "Workplan Activity";
                ExpenseReqLines: Record "Expense Requisition Line";
            begin
                if ("Activity Code" <> XRec."Activity Code") and (XRec."Activity Code" <> '') then begin
                    if GuiAllowed then begin
                        if Confirm('You have changed the activity code from %1 to %2. This will lead to deletion of already populated lines. Do you wish to proceed?', false, Xrec."Activity Code", "Activity Code") then begin
                            WorkplanActivity.Reset();
                            WorkplanActivity.SetRange("Strategic Plan ID", rec."Resource Req. No.");
                            WorkplanActivity.SetRange(Code, rec."Activity Code");
                            if WorkplanActivity.FindFirst() then
                                "Activity Description" := WorkplanActivity.Descriptions;

                            //Delete Requisition Lines
                            ExpenseReqLines.Reset;
                            ExpenseReqLines.Setrange("Document No.", "No.");
                            if ExpenseReqLines.FindSet() then
                                ExpenseReqLines.DeleteAll(true);
                        end else
                            Error('');
                    end;
                end else begin
                    WorkplanActivity.Reset();
                    WorkplanActivity.SetRange("Strategic Plan ID", rec."Resource Req. No.");
                    WorkplanActivity.SetRange(Code, rec."Activity Code");
                    if WorkplanActivity.FindFirst() then
                        "Activity Description" := WorkplanActivity.Descriptions;
                end;
            end;
        }
        field(23; "Resource Req. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Activity Description"; Text[1048])
        {
            DataClassification = ToBeClassified;
            Caption = 'Workplan Activity';
            Editable = false;
        }
        field(25; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Justifications"; Text[2048])
        {
        }
        field(28; "Imprest Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "No Of Days"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                //ImpMemo: Record "Imprest Memo";
            begin
                //"End Date" := ImpMemo.DetermineImprestReturnDate("Start Date", "No Of Days")
            end;
        }
        field(32; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Subject"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Objective"; Blob)
        {
            SubType = Memo;
        }
        field(35; "Holders Admin Unit"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = Const(2));
        }
        field(36; "Admin Unit Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Imprest Type"; Option)
        {
            OptionMembers = " ","Safari Imprest","Standing Imprest","Special Imprest";
        }
        field(38; "Requires PRN"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Requires PRN" <> xRec."Requires PRN" then begin
                    ClearLines(2);
                end;
            end;
        }
        field(39; "PRN Type"; Option)
        {
            OptionCaption = 'Standard,Project Works';
            OptionMembers = Standard,"Project Works";
        }
        field(40; "Location Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(41; "Requisition Product Group"; Option)
        {
            OptionCaption = 'Goods,Services,Works,...';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(42; "Procurement Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated), "Approval Status" = filter(Released));
        }
        field(43; "PP Plan Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan Lines"."Planning Category" where("Procurement Plan ID" = field("Procurement Plan ID"));
        }
        field(44; "PRN Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(45; "PRN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        Field(46; "From project Design"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Design Control No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Planning Header";
        }
        field(48; "Project user request No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Planning Header";
        }
        field(49; "Geo Graphical Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Requisition Type"; Enum "Requisition Type")
        {
            DataClassification = ToBeClassified;
            //OptionMembers = Normal,PRN;
        }
        field(51; "Direct Payment Type"; Option)
        {
            OptionMembers = "Non Staff Claim","Staff Claim","Contract Payment";
            trigger OnValidate()
            begin
                if "Direct Payment Type" <> XRec."Direct Payment Type" then
                    ClearLines(4);
            end;
        }
        field(52; "Staff Claim Created"; Boolean)
        {
            Editable = false;
        }
        field(53; "Purch Inv. Created"; Boolean)
        {
            Editable = false;
        }
        field(54; "Created INV No"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Contract No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"), "Contract Status" = const(signed), Status = filter(Released | Open));
            trigger OnValidate()
            var
                PurchaseHeader: Record "Purchase Header";
            begin
                if PurchaseHeader.get(PurchaseHeader."Document Type"::"Blanket Order", "Contract No") then begin
                    Description := PurchaseHeader."Contract Description";
                    "Contract No" := PurchaseHeader."No.";
                    "Contract Start Date" := PurchaseHeader."Contract Start Date";
                    "Contract End Date" := PurchaseHeader."Contract End Date";
                    "Award tender Sum" := PurchaseHeader."Award Tender Sum Inc Taxes";
                    PurchaseHeader.CalcFields(Amount);
                    "Amount Paid" := PurchaseHeader.Amount;
                end;
            end;
        }
        field(56; "Contract Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Contract End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Award tender Sum"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Amount Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Contract Payment"; Boolean)
 
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Reason To Recall"; Text[250])
        {
        DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key2; Status)
        {
        }
    }
    trigger OnInsert()
    var
        WorkplanMgt: Codeunit "Workplan Management";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMSetUp: Record "SPM General Setup";
        UserSetUp: Record "User Setup";
    begin
        if "No." = '' then begin
            SPMSetUp.Get();
            SPMSetUp.TestField("Exp. Requisition Nos");
            NoSeriesMgt.InitSeries(SPMSetUp."Exp. Requisition Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if UserSetUp.Get(UserId) then begin
            UserSetUp.TestField("Global Dimension 1 Code");
            UserSetUp.TestField("Shortcut Dimension 2 Code");

            "Global Dimension 1 Code" := UserSetUp."Global Dimension 1 Code";
            rec."Location Code" := UserSetUp."Global Dimension 1 Code";
            "Holders Admin Unit" := UserSetUp."Shortcut Dimension 2 Code";
            "Global Dimension 2 Code" := UserSetUp."Shortcut Dimension 2 Code";

        end;

        if "Corporate Strategy" = '' then
            "Corporate Strategy" := WorkplanMgt.GetCurrentCorporateStrategy();
        if "Reporting Period" = '' then begin
            "Reporting Period" := WorkplanMgt.GetCurrentStrategyImplementationYear("Corporate Strategy");
            Validate("Reporting Period");
        end;

        Workplan := WorkplanMgt.GetCurrentWorkplan("Corporate Strategy", "Reporting Period", "Global Dimension 1 Code", "Global Dimension 2 Code");
        Validate(Workplan);

        "Created By" := UserId;
        "Date Created" := CurrentDateTime;
    end;

    trigger OnDelete()
    var
        myInt: Integer;
    begin
        Error('You are not allowed to delete documents');
    end;

    var
        DimVal: Record "Dimension Value";

    procedure UpdateDirectPaymenstOrImprestLines()
    var
        ExpenseReqLines: Record "Expense Requisition Line";
    begin
        ExpenseReqLines.Reset();
        ExpenseReqLines.SetRange("Document No.", "No.");
        if ExpenseReqLines.FindSet() then begin
            ExpenseReqLines.ModifyAll("Requires Direct Payment", Rec."Requires Direct Payment", true);
            ExpenseReqLines.ModifyAll("Requires Imprest", Rec."Requires Imprest", true);
            ExpenseReqLines.ModifyAll("Requires PRN", Rec."Requires PRN", true);
            ExpenseReqLines.ModifyAll("Direct Payment Type", Rec."Direct Payment Type");
        end;
    end;

    procedure ClearLines(Options: Option Imprest,"Direct Payments",PRN,All,"Staff Claim")
    var
        ExpReqAllocation: Record "Expense Req. Allocation";
        LinesFound: Boolean;
    begin
        case
            Options of
            Options::Imprest, Options::"Direct Payments", Options::PRN, Options::"Staff Claim":
                begin
                    ExpReqAllocation.Reset();
                    ExpReqAllocation.SetRange(Type, Options);
                    ExpReqAllocation.SetRange("Document No.", "No.");
                    LinesFound := ExpReqAllocation.Count > 0;

                    if (CurrentClientType in [ClientType::Windows, ClientType::Web]) and LinesFound then begin
                        if Confirm('You have made changes which impact the lines. Are you sure to proceed?All lines associated with %1 will be deleted. Continue?', false, Options) then begin
                            ExpReqAllocation.Reset();
                            ExpReqAllocation.SetRange(Type, Options);
                            ExpReqAllocation.SetRange("Document No.", "No.");
                            ExpReqAllocation.DeleteAll();
                        end;
                    end else begin
                        ExpReqAllocation.Reset();
                        ExpReqAllocation.SetRange(Type, Options);
                        ExpReqAllocation.SetRange("Document No.", "No.");
                        ExpReqAllocation.DeleteAll();
                    end;
                end;
            Options::All:
                begin
                    ExpReqAllocation.Reset();
                    ExpReqAllocation.Setrange("Document No.", "No.");
                    ExpReqAllocation.DeleteAll();
                end;
        end;
    end;

    procedure ValidateLines()
    var
        ExpReqLines: Record "Expense Requisition Line";
    begin
        ExpReqLines.Reset;
        ExpReqLines.Setrange("Document No.", "No.");
        if ExpReqLines.FindSet() then begin
            ExpReqLines.ModifyAll(Error, false, true);
            ExpReqLines.ModifyAll("Error Message", '', true);
        end;
        Commit();

        //Check Allocated Amount
        ExpReqLines.Reset;
        ExpReqLines.Setrange("Document No.", "No.");
        ExpReqLines.SetAutoCalcFields("Total Allocation");
        if ExpReqLines.FindSet() then begin
            repeat
                if ExpReqLines."Total Allocation" > ExpReqLines."Total Amount" then begin
                    ExpReqLines.Error := true;
                    ExpReqLines."Error Message" := StrSubstNo('Total Allocation of %1 is more than the total amount of %2', ExpReqLines."Total Allocation", ExpReqLines."Total Amount");
                    ExpReqLines.Modify();
                end;
            until ExpReqLines.Next() = 0;
        end;

        //Check fields
        ExpReqLines.Reset();
        ExpReqLines.SetRange("Document No.", "No.");
        ExpReqLines.SetRange(Error, false);
        if ExpReqLines.FindSet() then begin
            repeat
                if ExpReqLines."G/L Account" = '' then begin
                    ExpReqLines.Error := true;
                    ExpReqLines."Error Message" := 'Missing G/L Account No.';
                    ExpReqLines.Modify();
                end else
                    if ExpReqLines."Total Amount" = 0 then begin
                        ExpReqLines.Error := true;
                        ExpReqLines."Error Message" := 'Amount Cannot be zero';
                        ExpReqLines.Modify();
                    end;
            until ExpReqLines.Next() = 0;
        end;

        //Check Budget
        ExpReqLines.Reset();
        ExpReqLines.SetRange("Document No.", "No.");
        ExpReqLines.SetRange(Error, false);
        if ExpReqLines.FindSet() then begin
            repeat
                if ExpReqLines."Total Amount" > ExpReqLines."Budget Balance" then begin
                    ExpReqLines.Error := true;
                    ExpReqLines."Error Message" := StrSubstNo('Requested amount of %1 exceeds the available budget of %2', ExpReqLines."Total Amount", ExpReqLines."Budget Balance");
                    ExpReqLines.Modify();
                end;
            until ExpReqLines.Next() = 0;
        end;
        Commit();

        //Throw the errors
        ExpReqLines.Reset();
        ExpReqLines.SetRange("Document No.", "No.");
        ExpReqLines.SetRange(Error, true);
        IF ExpReqLines.FindSet() then
            Error('There are errors on the lines, please correct before proceeding!');
    end;


    procedure GetFirstLineDimensions(var DimensionCodes: array[8] of Code[20])
    var
        ExpReqLine: Record "Expense Requisition Line";
    begin
        Clear(DimensionCodes);
        ExpReqLine.Reset();
        ExpReqLine.SetCurrentKey("Line No.");
        ExpReqLine.SetRange("Document No.", "No.");
        if ExpReqLine.FindFirst() then begin
            DimensionCodes[1] := ExpReqLine."Global Dimension 1 Code";
            DimensionCodes[2] := ExpReqLine."Global Dimension 2 Code";
            DimensionCodes[3] := ExpReqLine."Shortcut Dimension 3 Code";
            DimensionCodes[4] := ExpReqLine."Shortcut Dimension 4 Code";
            DimensionCodes[5] := ExpReqLine."Shortcut Dimension 5 Code";
            DimensionCodes[6] := ExpReqLine."Shortcut Dimension 6 Code";
            DimensionCodes[7] := ExpReqLine."Shortcut Dimension 7 Code";
            DimensionCodes[8] := ExpReqLine."Shortcut Dimension 8 Code";
        end;
    end;

    procedure CheckExsiting(Creator: Code[50])
    var
        CashMgt: Record "Cash Management Setup";
        ExpenRE: Record "Expense Requisition";
    begin
        CashMgt.GET();
        ExpenRE.RESET;
        ExpenRE.SETRANGE(ExpenRE."Created By", Creator);
        ExpenRE.SETRANGE(Status, ExpenRE.Status::New);
        IF ExpenRE.FINDFIRST THEN BEGIN
            IF ExpenRE.COUNT > CashMgt."No of Open docs" THEN BEGIN
                ERROR('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');
            END;
        END;
    end;

    procedure validateNonStaff()
    var
        EXRLines: Record "Expense Requisition Line";
        EXRAllocation: Record "Expense Req. Allocation";

    begin
        if (Rec."Direct Payment Type" = Rec."Direct Payment Type"::"Non Staff Claim") and ("Requires Direct Payment" = true) then begin
            EXRLines.Reset();
            EXRLines.SetRange("Document No.", Rec."No.");
            if EXRLines.FindSet() then
                repeat
                    EXRAllocation.reset();
                    EXRAllocation.setRange("Document No.", EXRLines."Document No.");
                    EXRAllocation.SetRange("Source Line No.", EXRLines."Line No.");
                    if (EXRAllocation.FindFirst()) then begin
                        if (EXRAllocation."Supplier Invoice No." = '') then Error('Supplier Invoice Number Cannot be Empty');
                        if (EXRAllocation."Supplier Invoice Date" = 0D) then Error('Supplier Invoice Date Cannot be Empty');
                    end;



                until EXRLines.Next() = 0;
        end;




    end;
}
