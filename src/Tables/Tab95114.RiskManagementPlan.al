
table 95114 "Risk Management Plan"
{
    DrillDownPageID = "StrategicRisk Management Plans";
    LookupPageID = "StrategicRisk Management Plans";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[50])
        {
        }
        field(3; "Document Date"; Date)
        {
        }
        field(4; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Planning Start Date" := ObjJob."Starting Date";
                    "Planning End Date" := ObjJob."Ending Date";
                    "Project Name" := ObjJob.Description;
                end;
            end;
        }
        field(5; "Work Execution Plan ID"; Code[20])
        {
        }
        field(6; "Corporate Strategic Plan ID"; Code[20])
        {
            // TableRelation = "Corporate Strategic Plans".Code where("Implementation Status" = filter(Ongoing));

            trigger OnValidate()
            begin
                if RiskMngtFramework.Get then begin
                    "Risk Likelihood Rate Scale ID" := RiskMngtFramework."Default Risk LR Scale ID";
                    "Risk Impact Rating Scale ID" := RiskMngtFramework."Default Risk Impact R. Scale";
                    "Overall Risk Rating Scale ID" := RiskMngtFramework."Default Overall RR Scale ID";
                    "Risk Appetite Rating Scale ID" := RiskMngtFramework."Default Risk AR Scale ID";
                end;
            end;
        }
        field(7; "Year Code"; Code[20])
        {
            // TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                // IF ("Document Type"="Document Type"::Corporate) OR ("Document Type"="Document Type"::"Functional (Department)") OR ("Document Type"="Document Type"::"Functional (Directorate)")
                //  OR ("Document Type"="Document Type"::"Functional (Region)") THEN BEGIN
                // ObjFundYearCode.Reset;
                // ObjFundYearCode.SetRange(ObjFundYearCode.Code, "Year Code");
                // if ObjFundYearCode.FindSet then begin
                //     "Planning Start Date" := ObjFundYearCode."Starting Date";
                //     "Planning End Date" := ObjFundYearCode."Ending Date";
                // end;
                //  END;
                if UserSetup.Get(UserId) then begin
                    if Employee.Get(UserSetup."Employee No.") then begin
                        Employee.CalcFields(Employee."Department Name");
                        Description := 'Audit ' + Employee."Department Name" + ' Risk Register - ' + Format("Year Code");
                    end;
                end;
            end;
        }
        field(8; "Directorate ID"; Code[20])
        {
            TableRelation = if ("Document Type" = filter("Functional (Directorate)")) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                                                                        "Blocked?" = filter(false));
        }
        field(9; "Department ID"; Code[20])
        {
            TableRelation = if ("Document Type" = filter("Functional (Department)")) "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                                                                       "Blocked?" = filter(false));
        }
        field(10; "Region ID"; Code[20])
        {
            TableRelation = if ("Document Type" = filter("Functional (Region)")) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                                                                   "Blocked?" = filter(false));
        }
        field(11; Description; Text[440])
        {
        }
        field(12; "Primary Mission"; Text[440])
        {
        }
        field(13; "Responsible Officer No."; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Responsible Officer No.");
                if Employee.FindSet then
                    "Responsible Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(14; "Risk Likelihood Rate Scale ID"; Code[20])
        {
            Description = 'Risk Likelihood RatingScale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Likelihood Rating"),
                                                                         Blocked = filter(false));
        }
        field(15; "Risk Impact Rating Scale ID"; Code[20])
        {
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Impact Rating"),
                                                                         Blocked = filter(false));
        }
        field(16; "Overall Risk Rating Scale ID"; Code[20])
        {
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Overall Risk Rating"),
                                                                         Blocked = filter(false));
        }
        field(17; "Risk Appetite Rating Scale ID"; Code[20])
        {
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Risk Appetite Rating"),
                                                                         Blocked = filter(false));
        }
        field(18; "Project Name"; Text[250])
        {
            Editable = false;
        }
        field(19; "Planning Start Date"; Date)
        {
            Editable = false;
        }
        field(20; "Planning End Date"; Date)
        {
            Editable = false;
        }
        field(21; Blocked; Boolean)
        {
        }
        field(22; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(23; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(24; "Created Date Time"; DateTime)
        {
            Editable = false;
        }
        field(25; "No. of Neg. Risks (Threats)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Impact Type" = filter(Negative)));
            Description = 'No. of Negative Risks (Threats)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "No. of Positiv Risks (Opports)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Impact Type" = filter(Positive)));
            Description = 'No. of Positive Risks (Opportunities)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "No. of Risks (Red)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Heat Zone" = filter(Red)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "No. of Risks (Yellow)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Heat Zone" = filter(Yellow)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "No. of Risks (Green)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Heat Zone" = filter(Green)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "No. of Risk Incidents"; Integer)
        {
            FieldClass = Normal;
        }
        field(31; "Est. Financial Impact (LCY)"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(32; "Estimate Delay Impact (Days)"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(33; "Actual Financial Impact (LCY)"; Decimal)
        {
            Description = 'Risk Incident Ledger Entry.Actual Financial Impact (LCY)';
        }
        field(34; "Actual Schedule Delay(Days)"; Integer)
        {
            Description = 'Risk Incident Ledger Entry.Actual Schedule Delay/Service Disruption (Days)';
        }
        field(35; "Actual No. Injured Persons"; Integer)
        {
            Description = 'Risk Incident Ledger Entry.Actual No. Injured Person';
        }
        field(36; "Actual No. of Fatalities"; Integer)
        {
            Description = 'Risk Incident Ledger Entry.Actual No. of Fatalities';
        }
        field(37; "No. of New Risk Vouchers"; Integer)
        {
            CalcFormula = count("Risk M&E Header" where("Risk Management Plan ID" = field("Document No"),
                                                         "Document Type" = filter("New Risk Voucher")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "No. of Risk Status Reports"; Integer)
        {
            CalcFormula = count("Risk M&E Header" where("Risk Management Plan ID" = field("Document No"),
                                                         "Document Type" = filter("Risk Status Report")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No. Series"; Code[20])
        {
        }
        field(40; "CO -  Principal Investigator"; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(41; "Consolidated Risk Mgt Plan No"; Code[20])
        {
            TableRelation = if ("Document Type" = filter(<> Corporate)) "Risk Management Plan"."Document No" where("Document Type" = filter(Corporate));
        }
        field(42; "Responsible Officer Name"; Text[100])
        {
        }
        field(43; "Detailed Introduction"; Text[400])
        {
        }
        field(44; "Detailed Naration"; Text[400])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date Time" := CreateDatetime(Today, Time);
        Status := Status::Open;

        if "Document Type" = "document type"::Corporate then begin
            if "Document No" = '' then begin
                RiskManagementFramework.Get;
                RiskManagementFramework.TestField("Corporate Risk Mgt Plan Nos.");
                NoSeriesManagement.InitSeries(RiskManagementFramework."Corporate Risk Mgt Plan Nos.", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Functional (Department)" then begin
            if "Document No" = '' then begin
                RiskManagementFramework.Get;
                RiskManagementFramework.TestField("Departmenta Risk Mgt Plan Nos.");
                NoSeriesManagement.InitSeries(RiskManagementFramework."Departmenta Risk Mgt Plan Nos.", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;
        if "Document Type" = "document type"::"Functional (Directorate)" then begin
            if "Document No" = '' then begin
                RiskManagementFramework.Get;
                RiskManagementFramework.TestField("Directorate Risk Mgt Plan Nos.");
                NoSeriesManagement.InitSeries(RiskManagementFramework."Directorate Risk Mgt Plan Nos.", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"Functional (Region)" then begin
            if "Document No" = '' then begin
                RiskManagementFramework.Get;
                RiskManagementFramework.TestField("Regional Risk Mgt Plan Nos.");
                NoSeriesManagement.InitSeries(RiskManagementFramework."Regional Risk Mgt Plan Nos.", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;


        if "Document Type" = "document type"::Project then begin
            if "Document No" = '' then begin
                RiskManagementFramework.Get;
                RiskManagementFramework.TestField("Project Risk Mgt Plan Nos.");
                NoSeriesManagement.InitSeries(RiskManagementFramework."Project Risk Mgt Plan Nos.", xRec."No. Series", Today, "Document No", "No. Series");
            end;
        end;
        if RiskMngtFramework.Get then begin
            "Risk Likelihood Rate Scale ID" := RiskMngtFramework."Default Risk LR Scale ID";
            "Risk Impact Rating Scale ID" := RiskMngtFramework."Default Risk Impact R. Scale";
            "Overall Risk Rating Scale ID" := RiskMngtFramework."Default Overall RR Scale ID";
            "Risk Appetite Rating Scale ID" := RiskMngtFramework."Default Risk AR Scale ID";
        end;
        if UserSetup.Get(UserId) then begin
            if Employee.Get(UserSetup."Employee No.") then begin
                Employee.CalcFields(Employee."Department Name");
                Description := 'Audit ' + Employee."Department Name" + ' Risk Register - ' + Format("Year Code");
            end;
        end;
    end;

    var
        ObjJob: Record Job;
        // ObjFundYearCode: Record "Financial Year Code";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";
        RiskMngtFramework: Record "Risk Management Framework";
        Employee: Record Employee;
        UserSetup: Record "User Setup";
}

