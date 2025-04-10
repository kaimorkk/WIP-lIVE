
table 69441 "Safe Work Permit Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = " ","Safe Work Permit Application","Safe Work Completion Report";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Document Date"; Date)
        {
            Editable = false;
        }
        field(4; "Safety Work Permit ID"; Code[20])
        {
            TableRelation = "Safe Work Permit Header"."Document No." where("Document Type" = filter("Safe Work Permit Application"),
                                                                            Status = filter(Released));

            trigger OnValidate()
            begin
                SafeWorkPermitHeader.Reset;
                SafeWorkPermitHeader.SetRange("Document No.", "Safety Work Permit ID");
                if SafeWorkPermitHeader.FindSet then
                    "HSE Plan Type" := SafeWorkPermitHeader."HSE Plan Type";
                "OSH Management Plan ID" := SafeWorkPermitHeader."OSH Management Plan ID";
                "Risk Management Plan ID" := SafeWorkPermitHeader."Risk Management Plan ID";
                "Permit Type" := SafeWorkPermitHeader."Permit Type";
                Validate("Permit Type");
                "Works Location Details" := SafeWorkPermitHeader."Works Location Details";
                "Planned End Date" := SafeWorkPermitHeader."Planned End Date";
                "Planned Start Date" := SafeWorkPermitHeader."Planned Start Date";
                "Project ID" := SafeWorkPermitHeader."Project ID";
                "Corporate Strategic Plan ID" := SafeWorkPermitHeader."Corporate Strategic Plan ID";
                "Lead Emergency Coordinator" := SafeWorkPermitHeader."Lead Emergency Coordinator";
                "Work Execution Plan ID" := SafeWorkPermitHeader."Work Execution Plan ID";
                "Year Code" := SafeWorkPermitHeader."Year Code";
                "Submitted By" := SafeWorkPermitHeader."Created By";
            end;
        }
        field(5; "HSE Plan Type"; Option)
        {
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(6; "OSH Management Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID" where("Plan Type" = field("HSE Plan Type"));

            trigger OnValidate()
            begin
                HSEPlan.Reset;
                HSEPlan.SetRange("Plan ID", "OSH Management Plan ID");
                if HSEPlan.FindSet then
                    "Risk Management Plan ID" := HSEPlan."Risk Management Plan ID";
            end;
        }
        field(7; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = "Risk Management Plan"."Document No";
        }
        field(8; "Permit Type"; Code[20])
        {
            TableRelation = "Safe Work Permit Type".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Safe Work Permit Application" then begin
                    SafeWorkPermitType.Reset;
                    SafeWorkPermitType.SetRange(Code, "Permit Type");
                    if SafeWorkPermitType.FindSet then
                        Description := SafeWorkPermitType.Description + ' Permit application';
                end;
                if "Document Type" = "document type"::"Safe Work Completion Report" then begin
                    SafeWorkPermitType.Reset;
                    SafeWorkPermitType.SetRange(Code, "Permit Type");
                    if SafeWorkPermitType.FindSet then
                        Description := SafeWorkPermitType.Description + ' Completion Report';
                end;
            end;
        }
        field(9; Description; Text[2048])
        {
        }
        field(10; "Works Location Details"; Text[2048])
        {
        }
        field(11; "Planned Start Date"; Date)
        {
        }
        field(12; "Planned End Date"; Date)
        {
        }
        field(13; "Submitted By"; Code[50])
        {
        }
        field(14; "Lead Emergency Coordinator"; Code[20])
        {
            TableRelation = Resource."No." where(Blocked = const(false),
                                                  Type = const(Person));
        }
        field(15; "Final Permit Verdict"; Option)
        {
            OptionCaption = ' ,Draft,Approved,Rejected,Completed';
            OptionMembers = " ",Draft,Approved,Rejected,Completed;
        }
        field(16; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.", "Project ID");
                if Job.FindSet then
                    "Planned End Date" := Job."Ending Date";
                "Planned Start Date" := Job."Starting Date";
            end;
        }
        field(17; "Work Execution Plan ID"; Code[20])
        {
            Description = 'RMS';
        }
        field(18; "Corporate Strategic Plan ID"; Code[20])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(19; "Year Code"; Code[20])
        {
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                FinancialYearCode.Reset;
                FinancialYearCode.SetRange(Code, "Year Code");
                if FinancialYearCode.FindSet then
                    "Planned End Date" := FinancialYearCode."Ending Date";
                "Planned Start Date" := FinancialYearCode."Starting Date";
            end;
        }
        field(20; "Directorate ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                "Blocked?" = filter(false));
        }
        field(21; "Department ID"; Code[20])
        {
            Caption = 'Division ID';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                "Blocked?" = filter(false),
                                                                "Direct Reports To" = field("Directorate ID"));
        }
        field(22; "Region ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region),
                                                                "Blocked?" = filter(false));
        }
        field(23; Status; Option)
        {
            Editable = false;
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(24; Posted; Boolean)
        {
            Editable = false;
        }
        field(25; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(26; "Created Date/Time"; DateTime)
        {
            Editable = false;
        }
        field(27; "Safe W. Permit Comp. Report ID"; Code[20])
        {
            Caption = 'Safety Work Completion Report ID';
            Description = 'Safety Work Completion Report ID';
            TableRelation = "Safe Work Permit Header"."Document No." where("Document Type" = filter("Safe Work Completion Report"),
                                                                            Status = filter(Released));
        }
        field(28; "Applicant Resource No."; Code[20])
        {
            TableRelation = Resource."No." where(Blocked = filter(false));
        }
        field(29; "No Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::"Safe Work Permit Application" then begin
            if "Document No." = '' then begin
                HealthSafetySetup.Get;
                HealthSafetySetup.TestField("Safe Work Permit Apps Nos.");
                NoSeriesManagement.InitSeries(HealthSafetySetup."Safe Work Permit Apps Nos.", xRec."No Series", 0D, "Document No.", "No Series");
            end;
        end;
        if "Document Type" = "document type"::"Safe Work Completion Report" then begin
            if "Document No." = '' then begin
                HealthSafetySetup.Get;
                HealthSafetySetup.TestField("Safe Work Compln Report Nos.");
                NoSeriesManagement.InitSeries(HealthSafetySetup."Safe Work Compln Report Nos.", xRec."No Series", 0D, "Document No.", "No Series");
            end;
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
        Status := Status::Open;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then
            Employee.Reset;
        Employee.SetRange("No.", UserSetup."Employee No.");
        if Employee.FindSet then begin
            // "Region ID" := UserSetup."Region Code";
            "Directorate ID" := Employee."Directorate Code";
            "Department ID" := Employee."Department Code";
        end;


        //No Series Generation
    end;

    var
        HealthSafetySetup: Record "Health & Safety Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HSEPlan: Record "HSE Plan";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        SafeWorkPermitType: Record "Safe Work Permit Type";
        FinancialYearCode: Record "Financial Year Code";
        Job: Record Job;
        SafeWorkPermitHeader: Record "Safe Work Permit Header";
        UserSetup1: Record "User Setup";
        Employee1: Record Employee;
}

