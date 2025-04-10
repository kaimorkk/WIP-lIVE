
table 95134 "Risk Incident Log"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Incident ID"; Code[50])
        {
            Caption = 'No.';
        }
        field(2; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (CEO),Functional (Department),Project';
            OptionMembers = " ",Corporate,"Functional (CEO)","Functional (Department)",Project;
        }
        field(3; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = "Risk Management Plan"."Document No" where("Document Type" = field("Risk Register Type"));
        }
        field(4; "Risk ID"; Integer)
        {
            TableRelation = "Risk Management Plan Line"."Risk ID" where("Document No" = field("Risk Management Plan ID"));

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then
                    "Risk Incident Category" := RiskManagementPlanLine."Risk Category";
                "Risk Description" := RiskManagementPlanLine."Risk Title";
            end;
        }
        field(5; "Risk Incident Category"; Code[20])
        {
            TableRelation = "Risk Management Plan Line"."Risk Category" where("Document Type" = field("Risk Register Type"));
        }
        field(6; "Incident Description"; Text[250])
        {
        }
        field(7; "Severity Level"; Code[20])
        {
            TableRelation = "Incident Severity Level".Code;
        }
        field(8; "Occurrence Type"; Option)
        {
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(9; "Incident Date"; Date)
        {
        }
        field(10; "Incident Start Time"; Time)
        {
        }
        field(11; "Incident End Time"; Time)
        {
        }
        field(12; "Incident Location Details"; Text[250])
        {
        }
        field(13; "Primary Trigger ID"; Integer)
        {
            TableRelation = "Risk Category Trigger"."Trigger ID" where("Risk Category ID" = field("Risk Incident Category"));

            trigger OnValidate()
            begin
                RiskCategoryTrigger.Reset;
                RiskCategoryTrigger.SetRange("Trigger ID", "Primary Trigger ID");
                if RiskCategoryTrigger.FindSet then
                    "Root Cause Summary" := RiskCategoryTrigger.Description;
            end;
        }
        field(14; "Root Cause Summary"; Text[250])
        {
        }
        field(15; "Category of Person Reporting"; Option)
        {
            Caption = 'Source of Information';
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(16; "Reported By (Name)"; Text[100])
        {
        }
        field(17; "Incident Class"; Option)
        {
            OptionCaption = ' ,Health/Safety/Environment Incident,Other';
            OptionMembers = " ","Health/Safety/Environment Incident",Other;
        }
        field(18; "HSE Management Plan ID"; Code[20])
        {
            // TableRelation = "HSE Plan"."Plan ID";
        }
        field(19; "Hazard ID"; Integer)
        {
        }
        field(20; "Actual Financial Impact (LCY)"; Decimal)
        {
        }
        field(21; "Actual Schedule Delay(Days)"; Integer)
        {
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(22; "Actual No. Injured Persons"; Integer)
        {
        }
        field(23; "Actual No. of Fatalities"; Integer)
        {
        }
        field(24; "No. of Parties Involved"; Integer)
        {
        }
        field(25; "No. of Corrective Actions"; Integer)
        {
        }
        field(26; "No. of Preventive Actions"; Integer)
        {
        }
        field(27; "Police Report Reference No."; Code[20])
        {
        }
        field(28; "Police Report Date"; Date)
        {
        }
        field(29; "Police Station"; Text[100])
        {
        }
        field(30; "Reporting Officer"; Text[100])
        {
        }
        field(31; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(32; "Work Execution Plan ID"; Code[20])
        {
            Description = 'Not Applicate at KEMRI';
        }
        field(33; "Corporate Strategic Plan ID"; Code[20])
        {
            // TableRelation = "Corporate Strategic Plans".Code;
        }
        field(34; "Year Code"; Code[20])
        {
            // TableRelation = "Financial Year Code".Code;
        }
        field(35; "Directorate ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                "Operating Unit Type" = filter(Directorate));
        }
        field(36; "Department ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                "Operating Unit Type" = filter("Department/Center" | "Court Stations" | Office | Directorate));
        }
        field(37; "Region ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                "Operating Unit Type" = filter(Region));
        }
        field(38; "Dimension Set ID"; Integer)
        {
        }
        field(39; Status; Option)
        {
            Editable = false;
            InitValue = Open;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(40; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(41; "Created Date Time"; DateTime)
        {
            Editable = false;
        }
        field(42; Posted; Boolean)
        {
            Editable = true;
        }
        field(43; "Posting Date"; Date)
        {
            Editable = false;
        }
        field(44; "No. Series"; Code[10])
        {
        }
        field(45; "Risk Description"; Text[250])
        {
        }
        field(46; "Incident Time"; Time)
        {
        }
        field(47; "Escalate to Officer No"; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Escalate to Officer No");
                if Employee.FindSet then
                    "Ecalate to Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                Email := Employee."Company E-Mail";
            end;
        }
        field(48; "Ecalate to Officer Name"; Text[250])
        {
        }
        field(49; Email; Text[100])
        {
        }
        field(50; DocumentCreator; Code[30])
        {
            TableRelation = Employee."No." where(Status = const(Active));
        }
        field(51; "Escalated?"; Boolean)
        {
        }
        field(52; Response; Text[2048])
        {
        }
        field(53; "Employee No"; Code[10])
        {
            TableRelation = if ("Category of Person Reporting" = const("Internal Employee")) Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                    "Reported By (Name)" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(54; "Document Status"; Option)
        {
            Editable = true;
            OptionCaption = 'Draft,Submitted,Escalated,Closed';
            OptionMembers = Draft,Submitted,Escalated,Closed;
        }
        field(55; "Document Type"; Option)
        {
            OptionCaption = 'Risk Incident Report,Risk Incident Follow-up,Implementation Status';
            OptionMembers = "Risk Incident Report","Risk Incident Follow-up","Implementation Status";
        }
        field(56; "Risk Incident No."; Code[30])
        {
            TableRelation = "Risk Incident Log"."Incident ID" where("Document Type" = const("Risk Incident Report"),
                                                                     "Document Status" = filter(<> Submitted | Draft));

            trigger OnValidate()
            begin

                if "Document Type" = "document type"::"Implementation Status" then begin
                    RiskIncidentLog.Reset;
                    RiskIncidentLog.SetRange("Incident ID", "Risk Incident No.");
                    if RiskIncidentLog.FindSet then begin
                        "Risk Register Type" := RiskIncidentLog."Risk Register Type";
                        "Risk Management Plan ID" := RiskIncidentLog."Risk Management Plan ID";
                        "Risk ID" := RiskIncidentLog."Risk ID";
                        "Risk Description" := RiskIncidentLog."Risk Description";
                        "Risk Incident Category" := RiskIncidentLog."Risk Incident Category";
                        "Incident Description" := RiskIncidentLog."Incident Description";
                        "Severity Level" := RiskIncidentLog."Severity Level";
                        "Occurrence Type" := RiskIncidentLog."Occurrence Type";
                        "Incident Date" := RiskIncidentLog."Incident Date";
                        "Incident Time" := RiskIncidentLog."Incident Time";
                        "Incident Location Details" := RiskIncidentLog."Incident Location Details";
                        "Primary Trigger ID" := RiskIncidentLog."Primary Trigger ID";
                        "Category of Person Reporting" := RiskIncidentLog."Category of Person Reporting";
                        "Employee No" := RiskIncidentLog."Employee No";
                        "Reported By (Name)" := RiskIncidentLog."Reported By (Name)";
                        "Directorate ID" := RiskIncidentLog."Directorate ID";
                        "Escalate to Officer No" := RiskIncidentLog."Escalate to Officer No";
                        Email := RiskIncidentLog.Email;
                    end;
                end;







                if "Document Type" = "document type"::"Risk Incident Follow-up" then begin
                    RiskIncidentLog.Reset;
                    RiskIncidentLog.SetRange("Incident ID", "Risk Incident No.");
                    if RiskIncidentLog.FindSet then begin
                        "Risk Register Type" := RiskIncidentLog."Risk Register Type";
                        "Risk Management Plan ID" := RiskIncidentLog."Risk Management Plan ID";
                        "Risk ID" := RiskIncidentLog."Risk ID";
                        "Risk Description" := RiskIncidentLog."Risk Description";
                        "Risk Incident Category" := RiskIncidentLog."Risk Incident Category";
                        "Incident Description" := RiskIncidentLog."Incident Description";
                        "Severity Level" := RiskIncidentLog."Severity Level";
                        "Occurrence Type" := RiskIncidentLog."Occurrence Type";
                        "Incident Date" := RiskIncidentLog."Incident Date";
                        "Incident Time" := RiskIncidentLog."Incident Time";
                        "Incident Location Details" := RiskIncidentLog."Incident Location Details";
                        "Primary Trigger ID" := RiskIncidentLog."Primary Trigger ID";
                        "Category of Person Reporting" := RiskIncidentLog."Category of Person Reporting";
                        "Employee No" := RiskIncidentLog."Employee No";
                        "Reported By (Name)" := RiskIncidentLog."Reported By (Name)";
                        "Directorate ID" := RiskIncidentLog."Directorate ID";
                    end;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Incident ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin


        // if "Document Type" = "document type"::"Risk Incident Report" then begin
        //     if "Incident ID" = '' then begin
        //         HealthSafetySetup.Get;
        //         HealthSafetySetup.TestField("Risk Incident Report Nos.");
        //         NoSeriesManagement.InitSeries(HealthSafetySetup."Risk Incident Report Nos.", xRec."No. Series", Today, "Incident ID", "No. Series");
        //     end;
        // end;


        // if "Document Type" = "document type"::"Implementation Status" then begin
        //     if "Incident ID" = '' then begin
        //         HealthSafetySetup.Get;
        //         HealthSafetySetup.TestField("Implementation Status Nos.");
        //         NoSeriesManagement.InitSeries(HealthSafetySetup."Implementation Status Nos.", xRec."No. Series", Today, "Incident ID", "No. Series");
        //     end;
        // end;


        // if "Document Type" = "document type"::"Risk Incident Follow-up" then begin
        //     if "Incident ID" = '' then begin
        //         HealthSafetySetup.Get;
        //         HealthSafetySetup.TestField("Risk Incident Follow-up Nos.");
        //         NoSeriesManagement.InitSeries(HealthSafetySetup."Risk Incident Follow-up Nos.", xRec."No. Series", Today, "Incident ID", "No. Series");
        //     end;
        // end;
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date Time" := CreateDatetime(Today, Time);
    end;

    var
        // HealthSafetySetup: Record "Health & Safety Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskCategoryTrigger: Record "Risk Category Trigger";
        Employee: Record Employee;
        RiskIncidentLog: Record "Risk Incident Log";
}

