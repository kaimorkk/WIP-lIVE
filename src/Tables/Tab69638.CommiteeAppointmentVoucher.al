
table 69638 "Commitee Appointment Voucher"
{
    DrillDownPageID = "Commitee Appointment Vouchers";
    LookupPageID = "Commitee Appointment Vouchers";

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination,PMMU,PAS';
            OptionMembers = Appointment,Termination,PMMU,PAS;
        }
        field(3; "Committee Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Committee Type";

            trigger OnValidate()
            begin
                CommitteeType.Reset;
                CommitteeType.SetRange(Code, "Committee Type ID");
                if CommitteeType.FindFirst then begin
                    if "Document Type" = "document type"::Appointment then begin
                        Description := Format("document type"::Appointment) + ' ' + 'of' + ' ' + CommitteeType.Description;
                        "Appointing Authority" := CommitteeType."Title of Appointing Officer";
                    end;
                    if "Document Type" = "document type"::Termination then begin
                        Description := Format("document type"::Termination) + ' ' + 'of' + ' ' + CommitteeType.Description;
                        "Appointing Authority" := CommitteeType."Title of Appointing Officer";
                    end
                end
            end;
        }
        field(4; "Original Appointment No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher" where("Document Type" = filter(Appointment));
        }
        field(5; "Termination Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal Staff Exit,Tenure Expiry,Other';
            OptionMembers = " ","Normal Staff Exit","Tenure Expiry",Other;
        }
        field(6; "Termination Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Appointment Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Tenure End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Appointing Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Raised By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Staff ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(14; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Region; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(16; "Branch/Centre"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(18; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(19; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(20; "Required No. of Members"; Integer)
        {
            Caption = 'Minimimum Required No. of Members';
            DataClassification = ToBeClassified;
        }
        field(21; "Appointed Members"; Integer)
        {
            Caption = 'Actual No. of Appointed Members';
            DataClassification = ToBeClassified;
        }
        field(22; "Terminated Members"; Integer)
        {
            Caption = 'Actual No. of Terminated Members';
            DataClassification = ToBeClassified;
        }
        field(23; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header"."Document No." where("Document Type" = const("Job Vacancy"));
        }
        field(25; "Terms of Reference"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(26; Venue; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Additional Brief"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(28; Noassigned; integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Candidate Interview Line" where("Assigned Panel ID" = field("Document No."), "Vacancy ID" = field("Vacancy ID")));

        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::Appointment then begin
            if "Document No." = '' then begin
                HumanResourcesSetup.Get;
                HumanResourcesSetup.TestField("Committee Terminate Nos.");
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Committee Terminate Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::Termination then begin
            if "Document No." = '' then begin
                HumanResourcesSetup.Get;
                HumanResourcesSetup.TestField("Committee Terminate Nos.");
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Committee Terminate Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        end;
        "Document Date" := Today;
        "Raised By" := UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            "Staff ID" := UserSetup."Employee No.";
            Name := UserSetup."Employee Name";
            // Department := UserSetup."Responsibility Center";
            // Region := UserSetup."Region Code";
            "Appointing Authority" := 'CHIEF EXECUTIVE OFFICER';
            "Appointment Effective Date" := Today;

        end;
    end;

    var
        CommitteeType: Record "Committee Type";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
}

