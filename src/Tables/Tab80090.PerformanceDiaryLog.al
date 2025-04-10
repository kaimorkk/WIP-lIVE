Table 80090 "Performance Diary Log"
{
    DrillDownPageID = "Posted Performance Logs";
    LookupPageID = "Posted Performance Logs";

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."PLog Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Journal Batch"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Per Diary Journal Batch".Code;
        }
        field(3; "Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Names" := Employee.FullName;
                    "Directorate Code" := Employee."Directorate Code";
                    "Department Code" := Employee."Department Code";
                end;

                Description := 'Performance Log_' + "Employee No." + '_' + '(' + Format("Document Date") + ')';
            end;
        }
        field(4; "Incidence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Performance Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Positive Performance,Negative Performance';
            OptionMembers = "Positive Performance","Negative Performance";
        }
        field(6; "Diary Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Self-Log,Supervisor-Log';
            OptionMembers = "Self-Log","Supervisor-Log";
        }
        field(7; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Personal Scorecard ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Plog Type" = const(AWP)) "Perfomance Contract Header".No where("Responsible Employee No." = field("Employee No."),
                                                                                               "Score Card Type" = const(Staff),
                                                                                               "Blocked?" = const(false))
            else
            if ("Plog Type" = const(PC)) "Perfomance Contract Header".No where("Responsible Employee No." = field("Employee No."),
                                                                                                                                                                      "Score Card Type" = const(Departmental),
                                                                                                                                                                      "Blocked?" = const(false));

            trigger OnValidate()
            begin
                IndividualScorecard.Reset;
                IndividualScorecard.SetRange(No, "Personal Scorecard ID");
                //IndividualScorecard.SETRANGE("Document Type",IndividualScorecard."Document Type"::"Functional/Operational PC");
                IndividualScorecard.SetRange("Approval Status", IndividualScorecard."approval status"::Released);
                if IndividualScorecard.Find('-') then begin
                    "Goal ID" := IndividualScorecard."Goal Template ID";
                    "CSP ID" := IndividualScorecard."Strategy Plan ID";
                    "AWP ID" := IndividualScorecard."Annual Workplan";
                    "Functional PC" := IndividualScorecard."Functional WorkPlan";
                    "Directors PC ID" := IndividualScorecard."Directors PC ID";
                    "Department/Center PC ID" := IndividualScorecard."Department/Center PC ID";
                    "Year Reporting Code" := IndividualScorecard."Annual Reporting Code";
                    Validate("Year Reporting Code");

                end;

                FunctionalWorkplan.Reset;
                FunctionalWorkplan.SetRange(No, "Functional PC");
                FunctionalWorkplan.SetRange("Document Type", FunctionalWorkplan."document type"::"CEO/Corporate PC");
                FunctionalWorkplan.SetRange("Approval Status", FunctionalWorkplan."approval status"::Released);
                if FunctionalWorkplan.Find('-') then begin
                    "AWP ID" := FunctionalWorkplan."Annual Workplan";
                    Annual_Workplan := "AWP ID";
                end;


                CEOPC.Reset;
                CEOPC.SetRange("Annual Workplan", "AWP ID");
                CEOPC.SetRange("Document Type", CEOPC."document type"::"CEO/Corporate PC");
                CEOPC.SetRange("Blocked?", false);
                CEOPC.SetRange("Approval Status", CEOPC."approval status"::Released);
                CEOPC.SETRANGE("Planning Budget Type", CEOPC."Planning Budget Type"::Original);
                ;
                if CEOPC.Find('-') then begin
                    "CEO PC ID" := CEOPC.No;
                end;
                ;
                /*
                IF ("Reporting PC Type"="Reporting PC Type"::"Supplementary PC") THEN BEGIN
                CEOPC.RESET;
                  MESSAGE(' Annual_Workplan IS %1',"AWP ID");
                CEOPC.SETRANGE("Annual Workplan", "AWP ID");
                CEOPC.SETRANGE("Document Type",CEOPC."Document Type"::"CEO/Corporate Awp");
                CEOPC.SETRANGE("Planning Budget Type",CEOPC."Planning Budget Type"::Supplementary);
                //CEOPC.SETRANGE("Approval Status",CEOPC."Approval Status"::Released);
                IF CEOPC.FIND('-') THEN BEGIN
                  MESSAGE('CEOPC.No b; IS %1',CEOPC.No);
                  "CEO PC ID":=CEOPC.No;
                END;
                END;*/


                BoardPC.Reset;
                BoardPC.SetRange("Annual Workplan", Annual_Workplan);
                BoardPC.SetRange("Document Type", BoardPC."document type"::"Board/Executive PC");
                //BoardPC.SetRange("Planning Budget Type", BoardPC."planning budget type"::Original);
                BoardPC.SetRange("Approval Status", BoardPC."approval status"::Released);
                if BoardPC.Find('-') then begin
                    "Board PC ID" := BoardPC.No;
                end;

                BoardPC.Reset;
                BoardPC.SetRange("Annual Workplan", Annual_Workplan);
                BoardPC.SetRange("Document Type", BoardPC."document type"::"Board/Executive PC");
                //BoardPC.SetRange("Planning Budget Type", BoardPC."planning budget type"::Supplementary);
                BoardPC.SetRange("Approval Status", BoardPC."approval status"::Released);
                if BoardPC.Find('-') then begin
                    "Board PC ID" := BoardPC.No;
                end

            end;
        }
        field(9; "Goal ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Goal Template".Code;
        }
        field(10; "Objective ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective"."Objective ID";
        }
        field(11; "Disciplinary Case ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(13; "Department Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(2));
        }
        field(14; "Employee Names"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Description := 'Performance Log_' + "Employee No." + '_' + '(' + Format("Document Date") + ')';
            end;
        }
        field(16; "Region ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Activity Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Activity End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "CSP ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "AWP ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Board PC ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "CEO PC ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Functional PC"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "No. Series"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Released,Pending Approval,Rejected';
            OptionMembers = Open,Released,"Pending Approval",Rejected;
        }
        field(29; "Year Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));

            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Year Reporting Code") then begin
                    "Activity Start Date" := AnnualReportingCodes."Reporting Start Date";
                    "Activity End Date" := AnnualReportingCodes."Reporting End Date";
                end;
            end;
        }
        field(30; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Posted By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Posted On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Remaining Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Directors PC ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Functional/Operational PC"),
                                                                   "Score Card Type" = filter(Departmental | Directors),
                                                                   "Approval Status" = const(Released));
        }
        field(35; "Department/Center PC ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Functional/Operational PC"),
                                                                   "Score Card Type" = const(Departmental));
        }
        field(36; "Plog Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',PC,AWP';
            OptionMembers = ,PC,AWP;
        }
        field(37; "HOD Scorecard ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where("Responsible Employee No." = field("Employee No."),
                                                                   "Score Card Type" = const(Departmental));

            trigger OnValidate()
            begin
                IndividualScorecard.Reset;
                IndividualScorecard.SetRange(No, "HOD Scorecard ID");
                //IndividualScorecard.SETRANGE("Document Type",IndividualScorecard."Document Type"::"Functional/Operational PC");
                IndividualScorecard.SetRange("Approval Status", IndividualScorecard."approval status"::Released);
                if IndividualScorecard.FindFirst then
                    "Goal ID" := IndividualScorecard."Goal Template ID";
                "CSP ID" := IndividualScorecard."Strategy Plan ID";
                "Functional PC" := IndividualScorecard."Functional WorkPlan";
                "Year Reporting Code" := IndividualScorecard."Annual Reporting Code";
                "AWP ID" := IndividualScorecard."Annual Workplan";
                Annual_Workplan := IndividualScorecard."Annual Workplan";
                Validate("Year Reporting Code");

                Message('Test %1', "AWP ID");

                FunctionalWorkplan.Reset;
                FunctionalWorkplan.SetRange(No, IndividualScorecard."Functional WorkPlan");
                FunctionalWorkplan.SetRange("Document Type", FunctionalWorkplan."document type"::"CEO/Corporate PC");
                FunctionalWorkplan.SetRange("Approval Status", FunctionalWorkplan."approval status"::Released);
                if FunctionalWorkplan.Find('-') then
                    //"AWP ID":=FunctionalWorkplan."Annual Workplan";
                    // Annual_Workplan:="AWP ID";
                    CEOPC.Reset;
                CEOPC.SetRange("Annual Workplan", IndividualScorecard."Annual Workplan");
                CEOPC.SetRange("Document Type", CEOPC."document type"::"CEO/Corporate PC");
                CEOPC.SETRANGE("Planning Budget Type", CEOPC."Planning Budget Type"::Original);
                CEOPC.SetRange("Approval Status", CEOPC."approval status"::Released);
                if CEOPC.Find('-') then begin
                    Message('Test %1', CEOPC.No);
                    "CEO PC ID" := CEOPC.No;
                end;

                // IF ("Reporting PC Type"="Reporting PC Type"::"Original Signed PC") THEN BEGIN
                // CEOPC.RESET;
                // CEOPC.SETRANGE("Annual Workplan",FunctionalWorkplan."Annual Workplan");
                // CEOPC.SETRANGE("Document Type",CEOPC."Document Type"::"CEO/Corporate Awp");
                // CEOPC.SETRANGE("Planning Budget Type",CEOPC."Planning Budget Type"::Original);
                // //CEOPC.SETRANGE("Approval Status",CEOPC."Approval Status"::Released);
                // IF CEOPC.FIND('-') THEN BEGIN
                //  "CEO PC ID":=CEOPC.No;
                // END;
                // END;

                // IF ("Reporting PC Type"="Reporting PC Type"::"Supplementary PC") THEN BEGIN
                // CEOPC.RESET;
                //  MESSAGE(' Annual_Workplan IS %1',FunctionalWorkplan."Annual Workplan");
                // CEOPC.SETRANGE("Annual Workplan", FunctionalWorkplan."Annual Workplan");
                // CEOPC.SETRANGE("Document Type",CEOPC."Document Type"::"CEO/Corporate Awp");
                // CEOPC.SETRANGE("Planning Budget Type",CEOPC."Planning Budget Type"::Supplementary);
                // //CEOPC.SETRANGE("Approval Status",CEOPC."Approval Status"::Released);
                // IF CEOPC.FIND('-') THEN BEGIN
                //  MESSAGE('CEOPC.No b; IS %1',CEOPC.No);
                //  "CEO PC ID":=CEOPC.No;
                // END;
                // END;
            end;
        }
        field(38; Remarks; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Reporting PC Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original Signed PC,Supplementary PC';
            OptionMembers = "Original Signed PC","Supplementary PC";
        }
        field(65; "Reporting Quater Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quarterly Reporting Periods".Code where("Year Code" = field("Year Reporting Code"));
        }
        field(66; "Reporting Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Above Staff,Staff';
            OptionMembers = "Above Staff",Staff;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("PLog Nos");
            NoSeriesMgt.InitSeries(SPMSetup."PLog Nos", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
    end;

    var
        Employee: Record Employee;
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        IndividualScorecard: Record "Perfomance Contract Header";
        BoardPC: Record "Perfomance Contract Header";
        CEOPC: Record "Perfomance Contract Header";
        Annual_Workplan: Code[50];
        FunctionalWorkplan: Record "Perfomance Contract Header";
        AnnualReportingCodes: Record "Annual Reporting Codes";
}

