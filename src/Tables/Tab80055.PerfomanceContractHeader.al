
table 80055 "Perfomance Contract Header"
{
    DrillDownPageID = "All Performance Contracts";
    LookupPageID = "All Performance Contracts";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[100])
        {

            trigger OnValidate()
            begin
                /*IF No <> xRec.No THEN BEGIN
                   SPMSetup.GET;
                    NoSeriesMgt.TestManual(SPMSetup."PWork Plans");
                    "No. Series" := '';
                END;*/


                if "Document Type" = "document type"::"Board/Executive PC" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."PWork Plans");
                        "No. Series" := '';
                    end;
                end;

                if "Document Type" = "document type"::"CEO/Corporate PC" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Corporate PC No. Series");
                        "No. Series" := '';
                    end;
                end;

                if "Document Type" = "document type"::"Functional/Operational PC" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Functional PC No. Series");
                        "No. Series" := '';
                    end;
                end;

                if "Document Type" = "document type"::"Individual Scorecard" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Individual Scorecard Nos");
                        "No. Series" := '';
                    end;
                end;

            end;
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Board/Executive PC,CEO/Corporate PC,Functional/Operational PC,Individual Scorecard,,Individual Scorecard PC';
            OptionMembers = "Board/Executive PC","CEO/Corporate PC","Functional/Operational PC","Individual Scorecard","Individual Scorecard PC";
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Document Date"; Date)
        {
        }
        field(5; "Objective Setting Due Date"; Date)
        {
        }
        field(6; "Strategy Plan ID"; Code[100])
        {
            TableRelation = "Corporate Strategic Plans".Code;

            trigger OnValidate()
            begin
                CSP.Reset;
                CSP.SetRange(Code, "Strategy Plan ID");
                if CSP.FindSet then begin
                    "Strategy Framework" := CSP."Strategy Framework";
                    "Mission Statement" := CSP."Mission Statement";
                    "Vision Statement" := CSP."Vision Statement";
                end;
            end;
        }
        field(7; "Annual Reporting Code"; Code[100])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
            Editable = true;

            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Annual Reporting Code") then begin
                    "Start Date" := AnnualReportingCodes."Reporting Start Date";
                    "End Date" := AnnualReportingCodes."Reporting End Date";
                end;
            end;
        }
        field(8; "Start Date"; Date)
        {
        }
        field(9; "End Date"; Date)
        {
        }
        field(10; "Responsible Employee No."; Code[100])
        {
            TableRelation = Employee."No." where(Status = filter(Active));
            // Editable = false;
            trigger OnValidate()
            var
                SuperVisorEmp: Record Employee;
                USetup: Record "User Setup";
            begin
                if Emp.Get("Responsible Employee No.") then begin
                    "Employee Name" := Emp.FullName;
                    "Admin Unit" := Emp."Global Dimension 2 Code";
                    if ("Admin Unit" <> '') then
                        "Admin Unit Name" := getAdminUnitName("Admin Unit");


                    // if USetup.Get(Emp.Supervisor) then
                    //     Validate("Supervisors Employee No.", USetup."Employee No.");



                    Position := Emp."Current Position ID";
                    //"Acting Job ID":=Emp."Acting Job ID";
                    // EVALUATE(TextPosition,Emp."Job Title");
                    //Designation:=TextPositionmp.
                    // Emp.CalcFields("Job Title");
                    Designation := Emp."Job Title";
                    Directorate := Emp."Directorate Code";
                    //MESSAGE(Emp."Job Title");
                    HOD := Emp.HOD;
                    Validate(Directorate);
                    // Validate("Admin Unit");



                end;
            end;
        }
        field(11; Designation; Code[100])
        {
        }
        field(12; Grade; Code[100])
        {
        }
        field(13; "Employee Name"; Code[255])
        {
        }
        field(74; "Responsibility Center"; Code[100])
        {
            TableRelation = "Responsibility Center".Code
            where("Operating Unit Type" = filter(Directorate | "Department/Center" | "Court Stations" | Office));

            trigger OnValidate()
            begin
                if ResponsibityC.Get("Responsibility Center") then begin
                    "Responsibility Center Name" := ResponsibityC.Name;
                end;
            end;
        }

        field(14; "Admin unit"; Code[100])
        {
            Editable = false;
        }
        field(15; "Responsibility Center Name"; Code[255])
        {
        }
        field(73; "Admin Unit Name"; Text[50])
        {
            Editable = false;
        }
        field(16; "Evaluation Type"; Option)
        {
            OptionCaption = 'Standard Appraisal/Supervisor Score Only,Self-Appraisal with Supervisor Score,360-Degree/Group Appraisal';
            OptionMembers = "Standard Appraisal/Supervisor Score Only","Self-Appraisal with Supervisor Score","360-Degree/Group Appraisal";
        }
        field(17; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Rejected';
            OptionMembers = Open,Released,"Pending Approval",Rejected;
        }
        field(18; "Blocked?"; Boolean)
        {
        }
        field(19; "Created By"; Text[100])
        {
        }
        field(20; "Created On"; Date)
        {
        }
        field(21; "Last Evaluation Date"; Date)
        {
        }
        field(22; "No. Series"; Code[10])
        {
        }
        field(23; "Goal Template ID"; Code[50])
        {
            TableRelation = "Goal Template";
        }
        field(24; "Annual Workplan"; Code[50])
        {
            TableRelation = "Annual Strategy Workplan".No;

            trigger OnValidate()
            begin
                if AnnualStrategyWorkplan.Get("Annual Workplan") then begin
                    "Strategy Plan ID" := AnnualStrategyWorkplan."Strategy Plan ID";
                    "Annual Reporting Code" := AnnualStrategyWorkplan."Year Reporting Code";
                    Validate("Annual Reporting Code");
                end;
            end;
        }
        field(25; "CEO WorkPlan"; Code[50])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("CEO/Corporate PC"),
                                                                   "Approval Status" = const(Released));

            trigger OnValidate()
            begin
                if PerfomanceContractHeader.Get("Annual Workplan") then begin
                    "Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
                    "Annual Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
                    Validate("Annual Reporting Code");
                end;
            end;
        }
        field(26; "Functional WorkPlan"; Code[50])
        {
            Caption = 'Annual WorkPlan';
            TableRelation = "Annual Strategy Workplan" where("Approval Status" = const(Released));
            // TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Functional/Operational PC"),
            //                                                      "Approval Status" = const(Released));
            trigger OnValidate()
            var
                AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
            begin
                if AnnualStrategyWorkplan.Get("Functional WorkPlan") then begin
                    "Strategy Plan ID" := AnnualStrategyWorkplan."Strategy Plan ID";
                    "Annual Workplan" := AnnualStrategyWorkplan.No; // PerfomanceContractHeader."Annual Workplan";
                                                                    //"Annual Reporting Code" := AnnualStrategyWorkplan."Annual Reporting Code";
                                                                    // Validate("Annual Reporting Code");
                end;
                /*  if PerfomanceContractHeader.Get("Functional WorkPlan") then begin
                         "Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
                         "Annual Workplan" := PerfomanceContractHeader."Annual Workplan";
                         "Annual Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
                         Validate("Annual Reporting Code");
                     end; */
            end;
        }
        field(27; Status; Option)
        {
            Caption = 'Status';
            Editable = true;
            OptionCaption = ' ,Signed,Canceled';
            OptionMembers = " ",Signed,Canceled;

            trigger OnValidate()
            var
                ServLedgEntry: Record "Service Ledger Entry";
                ConfirmManagement: Codeunit "Confirm Management";
                AnyServItemInOtherContract: Boolean;
            begin

            end;
        }
        field(28; "Change Status"; Option)
        {
            Caption = 'Change Status';
            Editable = false;
            OptionCaption = 'Open,Locked';
            OptionMembers = Open,Locked;
        }
        field(29; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(30; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(31; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(32; Directorate; Code[30])
        {
            Caption = 'Implementing Unit';
            Editable = false;
            TableRelation = "Responsibility Center".Code where
            ("Operating Unit Type" = filter(Directorate | "Department/Center" | "Court Stations" | Office));

            trigger OnValidate()
            begin
                if ResponsibityC.Get(Directorate) then begin
                    "Directorate Name" := ResponsibityC.Name;
                end;
            end;
        }
        field(33; "Directorate Name"; Code[100])
        {
            Caption = 'Implementing Unit Name';
        }
        field(34; Position; Code[50])
        {
        }
        field(35; "Total Assigned Weight(%)"; Decimal)
        {
            CalcFormula = sum("PC Objective"."Assigned Weight (%)" where("Workplan No." = field(No)));
            FieldClass = FlowField;
        }
        field(36; "Secondary Assigned Weight(%)"; Decimal)
        {
            CalcFormula = sum("Secondary PC Objective"."Assigned Weight (%)" where("Workplan No." = field(No)));
            FieldClass = FlowField;
        }
        field(37; "JD Assigned Weight(%)"; Decimal)
        {
            CalcFormula = sum("PC Job Description"."Assigned Weight (%)" where("Workplan No." = field(No)));
            FieldClass = FlowField;
        }
        field(38; "Strategy Framework"; Code[100])
        {
            TableRelation = "Strategy Framework";
        }
        field(39; "Vision Statement"; Text[255])
        {
        }
        field(40; "Mission Statement"; Text[255])
        {
        }
        field(41; "Score Card Type"; Option)
        {
            OptionCaption = ' ,Directors,Departmental,Staff';
            OptionMembers = " ",Directors,Departmental,Staff;
        }
        field(42; "Directors PC ID"; Code[20])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"),
                                                                   "Score Card Type" = filter(Departmental | Directors),
                                                                   "Approval Status" = const(Released));

            trigger OnValidate()
            begin
                PerfomanceContractHeader.Reset;
                PerfomanceContractHeader.SetRange(No, "Directors PC ID");
                if PerfomanceContractHeader.FindSet then begin
                    "Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
                    "Annual Workplan" := PerfomanceContractHeader."Annual Workplan";
                    "Annual Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
                    "Start Date" := PerfomanceContractHeader."Start Date";
                    "End Date" := PerfomanceContractHeader."End Date";
                    "Functional WorkPlan" := PerfomanceContractHeader."Functional WorkPlan";
                end;
            end;
        }
        field(43; "Department/Center PC ID"; Code[20])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"),
                                                                   "Score Card Type" = const(Directors));

            trigger OnValidate()
            begin
                PerfomanceContractHeader.Reset;
                PerfomanceContractHeader.SetRange(No, "Department/Center PC ID");
                if PerfomanceContractHeader.FindSet then begin
                    "Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
                    "Annual Workplan" := PerfomanceContractHeader."Annual Workplan";
                    "Start Date" := PerfomanceContractHeader."Start Date";
                    "End Date" := PerfomanceContractHeader."End Date";
                    "Annual Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
                    "Functional WorkPlan" := PerfomanceContractHeader."Functional WorkPlan";
                    "Directors PC ID" := PerfomanceContractHeader."Directors PC ID";
                    "Functional WorkPlan" := PerfomanceContractHeader."Functional WorkPlan";
                    InsertStrategyCoreValue();
                end;
            end;
        }
        field(44; "Activity Type"; Option)
        {
            OptionMembers = " ",Board,CSP;
        }
        field(45; HOD; Boolean)
        {
        }
        field(46; "Acting Job ID"; Code[30])
        {
        }
        field(47; Current; Boolean)
        {
        }
        field(48; "Target Type"; Option)
        {
            OptionMembers = " ",Director,"Deputy Director","Assistant Director","Head of Section","Individual Targets";
            trigger OnValidate()
            begin
                //   ValidateTargetType();
            end;
        }
        field(50; "Approved By"; Code[50])
        {
            Editable = false;
        }
        field(51; "Date Approved"; DateTime)
        {
            Editable = false;
        }
        field(52; "Signed By"; Code[50])
        {
            Editable = false;
        }
        field(53; "Date Signed"; DateTime)
        {
            Editable = false;
        }

        field(64; "Planning Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Supplementary';
            OptionMembers = Original,Supplementary;
        }
        field(65; "Document Stage"; Option)
        {
            OptionMembers = " ","Mid-Year Review","Completed Mid-Year Review","Sent To Supervisor","Returned To Employee","Returned to Supervisor",Evaluation;
        }
        field(66; "Supervisors Employee No."; Code[20])
        {
            Editable = false;
            trigger OnValidate()
            var
                TheEmp: Record Employee;
            begin
                if TheEmp.Get("Supervisors Employee No.") then begin
                    "Supervisors Employee Name." := TheEmp.FullName;
                end;
            end;
        }
        field(68; "Populate Activities From"; Option)
        {
            OptionMembers = " ",PMMU,"Job Description";
        }
        field(69; "Target Setting Commitee"; Code[20])
        {
            TableRelation = "Commitee Appointment Voucher" where("Document Type" = const(PMMU));
        }
        field(70; "Evaluation Commitee"; Code[20])
        {
            TableRelation = "Commitee Appointment Voucher" where("Document Type" = const(PMMU));

        }
        field(71; "PMMU/PAS Stage"; Option)
        {
            //DataClassification = ToBeClassified;
            OptionMembers = ,"Target Setting",Evaluation;
            OptionCaption = ' ,Target Setting,Evaluation';
        }
        field(67; "Supervisors Employee Name."; Text[100])
        {
            Editable = false;
        }
        field(72; "Document is At Supervision"; Boolean)
        {
            Editable = false;
        }


    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; Directorate, "Responsible Employee No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; No, "Responsible Employee No.", "Employee Name", Designation)
        {
        }
        fieldgroup(Brick; No, "Responsible Employee No.", "Employee Name", Designation)
        {
        }
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::"Board/Executive PC" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("PWork Plans");
                NoSeriesMgt.InitSeries(SPMSetup."PWork Plans", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"CEO/Corporate PC" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("PWork Plans");
                NoSeriesMgt.InitSeries(SPMSetup."Corporate PC No. Series", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Functional/Operational PC" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("PWork Plans");
                NoSeriesMgt.InitSeries(SPMSetup."Functional PC No. Series", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Individual Scorecard" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("PWork Plans");
                NoSeriesMgt.InitSeries(SPMSetup."Individual Scorecard Nos", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        "Created By" := UserId;
        "Created On" := Today;

        UserSetup.Get(UserId);
        UserSetup.TestField("Employee No.");

        Emp.Reset();
        Emp.SetRange("No.", UserSetup."Employee No.");
        if Emp.FindFirst() then;

        if Rec."Score Card Type" = Rec."Score Card Type"::Directors then
            if (not Emp.HOD) and (not Emp."Head of Station") then
                Error('Kindly note that only the Head of Department or Head of Station is allowed to raise a new record!');

        Validate("Responsible Employee No.", UserSetup."Employee No.");

        if "Document Type" = Rec."Document Type"::"Individual Scorecard" then begin
            CorporateStrategicPlans.Reset();
            CorporateStrategicPlans.SetFilter("Start Date", '<=%1', Today);
            CorporateStrategicPlans.SetFilter("End Date", '>=%1', Today);
            Validate("Strategy Plan ID", CorporateStrategicPlans.Code);
        end;

        UpdateWorkPlan();

        InsertStrategyCoreValue();

    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        ResponsibityC: Record "Responsibility Center";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        CSP: Record "Corporate Strategic Plans";
        TextPosition: Code[10];
        CorporateStrategicPlans: Record "Corporate Strategic Plans";

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        /*OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");*/


        //IF "No." <> '' THEN
        //  MODIFY;

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        /*OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet2(
            "Dimension Set ID",STRSUBSTNO('%1 %2',"Document Type","No."),
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");*/


        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin

        // Update all lines with changed dimensions.

        /*IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT CONFIRM(Text051) THEN
          EXIT;
        
        PurchLine.RESET;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE(PurchLine.No,"No.");
        PurchLine.LOCKTABLE;
        IF PurchLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF PurchLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              PurchLine."Dimension Set ID" := NewDimSetID;
              DimMgt.UpdateGlobalDimFromDimSetID(
                PurchLine."Dimension Set ID",PurchLine."Shortcut Dimension 1 Code",PurchLine."Shortcut Dimension 2 Code");
              PurchLine.MODIFY;
            END;
          UNTIL PurchLine.NEXT = 0;*/

    end;

    local procedure UpdateWorkPlan()
    var
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        AnnualReportingCodes: Record "Annual Reporting Codes";
    begin
        AnnualReportingCodes.Reset();
        AnnualReportingCodes.SetRange("Current Year", true);
        AnnualReportingCodes.FindLast();

        AnnualStrategyWorkplan.Reset();
        // AnnualStrategyWorkplan.SetRange(Department, Emp.Department);
        AnnualStrategyWorkplan.SetRange("Year Reporting Code", AnnualReportingCodes.Code);
        Validate("Functional WorkPlan", AnnualStrategyWorkplan.No);
        Validate("Annual Reporting Code", AnnualReportingCodes.Code);
    end;

    procedure InsertStrategyCoreValue()
    var
        StrategyCoreVal: Record "Strategy Core Value";
        PASCoreValues: Record "PAS Core Values";
        i: Integer;
    begin
        PASCoreValues.reset;
        PASCoreValues.SetRange("Performance Contract Header", Rec.No);
        if PASCoreValues.FindFirst then
            PASCoreValues.DeleteAll;

        StrategyCoreVal.Reset;
        StrategyCoreVal.SetRange(StrategyCoreVal."Strategic Plan ID", "Strategy Plan ID");
        if StrategyCoreVal.FindSet then
            repeat
                i += 10000;
                PASCoreValues.Init;
                PASCoreValues."Line No." := i;
                PASCoreValues."Performance Contract Header" := Rec.No;
                PASCoreValues."Strategic Plan ID" := "Strategy Plan ID";
                PASCoreValues."Core Value" := StrategyCoreVal."Core Value";
                PASCoreValues.Description := StrategyCoreVal.Description;
                PASCoreValues.Target := StrategyCoreVal.Target;
                PASCoreValues.Weight := StrategyCoreVal.Weight;
                PASCoreValues.Insert();
            Until StrategyCoreVal.Next = 0;

    end;


    procedure PurchLinesExist(): Boolean
    begin
        /*PurchLine.RESET;
         //PurchLine.SETRANGE("Document Type","Document Type");
         PurchLine.SETRANGE(PurchLine.No,"No.");
         EXIT(PurchLine.FINDFIRST);*/

    end;

    procedure ValidateTargetType()
    var
        UserSetup: Record "User Setup";
        RespCtr: Record "Responsibility Center";
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        Emp: Record Employee;
        ErrorSupervisor: Label 'Your supervisor has not set activities for the period %1';
    begin
        if Rec."Target Type" <> Rec."Target Type"::Director then begin

            UserSetup.Reset();
            UserSetup.SetRange("User ID", UserId);
            UserSetup.FindFirst();
            UserSetup.TestField("Employee No.");

            /*RespCtr.Reset();
            RespCtr.SetRange("Current Head", UserSetup."Employee No.");
            RespCtr.SetRange("Target Type", "Target Type");
            RespCtr.FindFirst();*/

            AnnualReportingCodes.Reset();
            AnnualReportingCodes.SetRange("Current Year", true);
            AnnualReportingCodes.FindLast();

            Emp.Reset();
            Emp.SetRange("No.", UserSetup."Employee No.");
            if Emp.FindFirst() then;

            // Emp.TestField(Supervisor);

            UserSetup.Reset();
            // UserSetup.SetRange("User ID", Emp.Supervisor);
            UserSetup.FindFirst();
            UserSetup.TestField("Employee No.");

            "Supervisors Employee No." := UserSetup."Employee No.";


            // " ",Director,"Deputy Director","Assistant Director","Head of Section","Individual Targets";

            PerfomanceContrHdr.Reset();
            PerfomanceContrHdr.SetRange("Responsible Employee No.", UserSetup."Employee No.");
            PerfomanceContrHdr.SetRange("Annual Reporting Code", AnnualReportingCodes.Code);
            case "Target Type" of
                Rec."Target Type"::"Deputy Director":
                    PerfomanceContrHdr.SetRange("Target Type", Rec."Target Type"::Director);
                Rec."Target Type"::"Assistant Director":
                    PerfomanceContrHdr.SetRange("Target Type", Rec."Target Type"::"Deputy Director");
                Rec."Target Type"::"Head of Section":
                    PerfomanceContrHdr.SetRange("Target Type", Rec."Target Type"::"Assistant Director");
                Rec."Target Type"::"Individual Targets":
                    PerfomanceContrHdr.SetRange("Target Type", Rec."Target Type"::"Head of Section");
            end;
            PerfomanceContrHdr.SetRange("Document Type", PerfomanceContrHdr."Document Type"::"Individual Scorecard");
            PerfomanceContrHdr.SetFilter("Score Card Type", '%1|%2', PerfomanceContrHdr."Score Card Type"::Departmental,
            PerfomanceContrHdr."Score Card Type"::Directors);
            PerfomanceContrHdr.SetRange("Approval Status", PerfomanceContrHdr."Approval Status"::Released);
            if PerfomanceContrHdr.FindFirst() then
                Validate("Directors PC ID", PerfomanceContrHdr."Directors PC ID")
            else
                Error(ErrorSupervisor, "Annual Reporting Code");
        end;


    end;

    procedure SetForMidYearReview()
    begin
        if not IsSuperVisor() then
            Error('You are not the supervisor of the responsible employee! Only the supervisor is allowed to update the document stage!');

        if not Confirm('Sure to mark the document as mid-year review? This will enable editing!', false) then exit;
        Rec."Document Stage" := Rec."Document Stage"::"Mid-Year Review";
        Rec.Modify();
        Message('Document stage marked as %1!', Rec."Document Stage");
    end;

    procedure MarkMidYearReviewAsCompleted()
    begin
        if not IsSuperVisor() then
            Error('You are not the supervisor of the responsible employee! Only the supervisor is allowed to update the document stage!');

        if not Confirm('Sure to mark the document as completed mid-year review? This will disable editing!', false) then exit;
        Rec."Document Stage" := Rec."Document Stage"::"Completed Mid-Year Review";
        Rec.Modify();
        Message('Document stage marked as %1!', Rec."Document Stage");
    end;

    procedure ReturnToEmployee()
    begin
        if not IsSuperVisor() then
            Error('You are not the supervisor of the responsible employee! Only the supervisor is allowed to update the document stage!');

        if not Confirm('Sure to return the document to the employee!', false) then exit;
        Rec."Document Stage" := Rec."Document Stage"::"Returned To Employee";
        Rec.Modify();
        Message('Document stage marked as %1!', Rec."Document Stage");
    end;

    procedure SetToEvaluation()
    begin
        if not IsSuperVisor() then
            Error('You are not the supervisor of the responsible employee! Only the supervisor is allowed to update the document stage!');

        if not Confirm('Sure to set the document to Evaluation!', false) then exit;
        Rec."Document Stage" := Rec."Document Stage"::Evaluation;
        Rec.Modify();
        Message('Document stage marked as %1!', Rec."Document Stage");
    end;

    procedure UpdateEmployeeActions(TheAction: Integer)
    begin
        Rec.TestField("Created By", UserId);
        Rec."Document Stage" := TheAction;
        if not Confirm('Sure to set the document stage to, %1!', false, Rec."Document Stage") then exit;
        if "Document Stage" = Rec."Document Stage"::"Sent To Supervisor" then
            Rec."Document is At Supervision" := true;
        Rec.Modify();
        Message('Document stage marked as %1!', Rec."Document Stage");
    end;


    procedure IsSuperVisor() Supervisor: Boolean
    var
        Emp: Record Employee;
    begin
        if Emp.Get("Responsible Employee No.") then begin
            // Supervisor := Emp.Supervisor = UserId;
        end;
    end;

    procedure ValidatePerformanceTargets()
    var
        PerformanceTargets: Record "Performance Targets";
    begin
        PerformanceTargets.Reset;
        PerformanceTargets.SetRange("Contract No.", Rec.No);
        if PerformanceTargets.FindSet then begin
            repeat
                PerformanceTargets.TestField(Activity);
                PerformanceTargets.TestField("PAS Activity");
                PerformanceTargets.TestField(Target);
                PerformanceTargets.TestField("Performance Indicator");
                PerformanceTargets.TestField(Weight);
            until PerformanceTargets.Next = 0;
        end else
            Error('No performance targets have been set for this document!');
    end;

    procedure ValidateCoreValues()
    var
        PASCoreValues: Record "PAS Core Values";
    begin
        PASCoreValues.Reset;
        PASCoreValues.SetRange("Performance Contract Header", Rec.No);
        if PASCoreValues.FindSet then begin
            repeat
                PASCoreValues.TestField("Core Value");
                PASCoreValues.TestField(Weight);
            until PASCoreValues.Next = 0;
        end else
            Error('No core values have been set for this document!');

    end;

    procedure getAdminUnitName(adminUnit: Code[20]): Text;
    var
        DimensionValue: Record "Dimension Value";
    begin
        DimensionValue.reset();
        DimensionValue.setRange(Code, adminUnit);
        if DimensionValue.FindFirst() then
            exit(DimensionValue.name);
    end;


}

