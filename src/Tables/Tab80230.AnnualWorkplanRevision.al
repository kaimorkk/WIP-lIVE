
table 80230 "Annual Workplan Revision"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[30])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Workplan Revision No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Code[255])
        {
        }
        field(3; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;

            trigger OnValidate()
            begin
                CSP.Reset;
                CSP.SetRange(Code, "Strategy Plan ID");
                if CSP.FindSet then begin
                    "Strategy Framework" := CSP."Strategy Framework";
                end;
            end;
        }
        field(4; "Year Reporting Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));

            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Year Reporting Code") then begin
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
        field(7; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; "Unit of Measure"; Text[100])
        {
        }
        field(10; "Current AWP"; Boolean)
        {
        }
        field(38; "Strategy Framework"; Code[100])
        {
            TableRelation = "Strategy Framework";
        }
        field(39; "Annual Workplan"; Code[50])
        {
            TableRelation = "Annual Strategy Workplan".No;

            trigger OnValidate()
            begin
                AnnualStrategyWorkplan.Reset;
                AnnualStrategyWorkplan.SetRange(No, "Annual Workplan");
                if AnnualStrategyWorkplan.Find('-') then begin
                    Description := AnnualStrategyWorkplan.Description;
                    "Strategy Plan ID" := AnnualStrategyWorkplan."Strategy Plan ID";
                    Validate("Strategy Plan ID");
                    "Year Reporting Code" := AnnualStrategyWorkplan."Year Reporting Code";
                    Validate("Year Reporting Code");
                end;

            end;
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
            NoSeriesMgt.InitSeries(SPMSetup."Workplan Revision No", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AnnualReportingCodes: Record "Annual Reporting Codes";
        CSP: Record "Corporate Strategic Plans";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        WorkplanLinesRevision: Record "Workplan Lines Revision";
}

