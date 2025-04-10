
table 80092 "Performance Improvement Plan"
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::PIP then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Performance Improv Review Nos");
                        "No. Series" := '';
                    end;
                end;

                if "Document Type" = "document type"::"PIP Review" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Performance Improv Review Nos");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'PIP,PIP Review';
            OptionMembers = PIP,"PIP Review";
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Evaluation ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Original PIP"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Improvement Plan".No where("Document Type" = const(PIP));
        }
        field(6; Description; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "PIP Template ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PIP Template"."Template ID";
        }
        field(8; "PIP Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "PIP End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Employee Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Designation; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Grade; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Supervisor Staff No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Supervisor Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Personal Scorecard ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"));
        }
        field(17; "Strategy Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(18; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(19; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(20; "Annual Reporting Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(21; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(22; "Blocked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Last Review Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Performance Review Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Interim PIP Review,Final PIP Review';
            OptionMembers = "Interim PIP Review","Final PIP Review";
        }
        field(27; "Final PIP Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Positive Performance,Negative Performance';
            OptionMembers = "Positive Performance","Negative Performance";
        }
        field(28; "Final PIP Verdict Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PIP Verdict Code".Code;
        }
        field(29; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
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
        if "Document Type" = "document type"::PIP then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Performance Improv Review Nos");
                NoSeriesMgt.InitSeries(SPMSetup."Performance Improv Review Nos", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        if "Document Type" = "document type"::"PIP Review" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Performance Improv Review Nos");
                NoSeriesMgt.InitSeries(SPMSetup."Performance Improv Review Nos", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        ResponsibityC: Record "Responsibility Center";
}

