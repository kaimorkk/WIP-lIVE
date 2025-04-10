
table 80050 "Performance Management Plan"
{
    DrillDownPageID = "Performance Management Plans";
    LookupPageID = "Performance Management Plans";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[30])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."PM Plans Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Code[200])
        {
        }
        field(3; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(4; "Annual Reporting Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));

            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Annual Reporting Code") then begin
                    "Start Date" := AnnualReportingCodes."Reporting Start Date";
                    "End Date" := AnnualReportingCodes."Reporting End Date";
                end;
            end;
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; "HR Performance Template"; Code[200])
        {
            TableRelation = "Perfomance Evaluation Template".Code;
        }
        field(8; "Performance Contract  Template"; Code[200])
        {
        }
        field(9; "Executive Summary"; Text[200])
        {
        }
        field(10; Blocked; Boolean)
        {
        }
        field(11; "No. Series"; Code[10])
        {
        }
        field(12; "Evaluation Type"; Option)
        {
            OptionCaption = 'Standard Appraisal/Supervisor Score Only,Self-Appraisal with Supervisor Score,360-Degree/Group Appraisal';
            OptionMembers = "Standard Appraisal/Supervisor Score Only","Self-Appraisal with Supervisor Score","360-Degree/Group Appraisal";
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
            SPMSetup.TestField("Work Plan Nos");
            NoSeriesMgt.InitSeries(SPMSetup."PM Plans Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AnnualReportingCodes: Record "Annual Reporting Codes";
}

