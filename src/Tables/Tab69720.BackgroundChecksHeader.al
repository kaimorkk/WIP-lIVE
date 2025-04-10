
table 69720 "Background Checks Header"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Panel Interview Report ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Candidate Interview Record" where("Application No." = field("Application No."));
        }
        field(4; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(5; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications" where("Vacancy Id" = field("Vacancy ID"));

            trigger OnValidate()
            var
                TXT001: label 'Background Checks for  ';
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.", "Application No.");
                if JobApplications.FindFirst then begin
                    "Candidate No." := JobApplications."Candidate No.";
                    "First Name" := JobApplications."First Name";
                    "Middle Name" := JobApplications."Middle Name";
                    "Last Name" := JobApplications."Last Name";
                    "Phone No." := JobApplications."Phone No.";
                    "Mobile Phone No." := JobApplications."Mobile Phone No.";
                    Email := JobApplications."E-Mail";
                    "Birth Date" := JobApplications."Birth Date";
                    "Tax Registration(PIN)" := JobApplications."PIN Registration";
                    Gender := JobApplications.Gender;
                    "Passport No." := JobApplications."Passport No.";
                    "ID Number" := JobApplications."ID Number";
                    Description := TXT001 + "Application No.";
                end
            end;
        }
        field(6; "Lead HR Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(7; Description; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Middle Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Mobile Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Email; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Birth Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; Gender; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Female,Male,Other';
            OptionMembers = Female,Male,Other;
        }
        field(17; "ID Number"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Passport No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Tax Registration(PIN)"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Active,Cancelled,Closed,,"Pending Appointment';
            OptionMembers = " ",Active,Cancelled,Closed,"Pending Appointment";
        }
        field(21; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
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
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Background Checks Nos.");
        if "Document No." = '' then
            NoSeriesMgt.InitSeries(HumanResourcesSetup."Background Checks Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        JobApplications: Record "Job Applications";
}

