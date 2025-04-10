
table 80010 "Corporate Strategic Plans"
{
    DrillDownPageID = "All CSPS";
    LookupPageID = "All CSPS";
    Caption = 'STAJ';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Corp Strategic Plan Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Primary Theme"; Code[50])
        {
        }
        field(4; "Strategy Framework"; Code[100])
        {
            TableRelation = "Strategy Framework";
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //"End Date":=CALCDATE("Duration (Years)","Start Date");
                "End Date" := CalcDate("Duration (Years)", "Start Date");
                "End Date" := CalcDate('-1D', "End Date");
            end;
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; "Duration (Years)"; DateFormula)
        {
        }
        field(8; "Vision Statement"; Text[255])
        {
        }
        field(9; "Mission Statement"; Text[255])
        {
        }
        field(10; "Implementation Status"; Option)
        {
            OptionCaption = 'Not Started,Ongoing,Closed';
            OptionMembers = "Not Started",Ongoing,Closed;
            trigger OnValidate()
            var
                CSP: Record "Corporate Strategic Plans";
            begin
                if "ImplementatioN Status" = "Implementation Status"::"Ongoing" then begin
                    CSP.Reset;
                    CSP.Setrange("Implementation Status", "Implementation Status");
                    CSP.Setfilter(Code, '<>%1', Rec.Code);
                    if CSP.FindFirst() then
                        Error('There can only be one corporate strategy under implementation at a time')
                end;
            end;
        }
        field(11; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13; "Created By"; Code[50])
        {
        }
        field(14; "Created Date"; Date)
        {
        }
        field(15; "Creation Time"; Time)
        {
        }
        field(16; "Reasons for Reopening"; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Strategy Framework")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("Corp Strategic Plan Nos");
            NoSeriesMgt.InitSeries(SPMSetup."Corp Strategic Plan Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;

        CoreV.Reset;
        CoreV.SetFilter(Code, '<>%1', '');
        if CoreV.Find('-') then begin
            repeat
                StrategyCoreV.Init;
                StrategyCoreV."Strategic Plan ID" := Code;
                StrategyCoreV."Core Value" := CoreV.Description;
                StrategyCoreV.Description := CoreV.Description;
                StrategyCoreV.Insert(true);
            until CoreV.Next = 0;
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Creation Time" := Time;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        StrategyCoreV: Record "Strategy Core Value";
        CoreV: Record "Core Values";
}

