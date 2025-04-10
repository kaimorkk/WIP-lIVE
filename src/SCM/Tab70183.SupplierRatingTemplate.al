
table 70183 "Supplier Rating Template"
{
    Caption = 'Supplier Appraisal Template';
    LookupPageID = "Supplier Rating Template";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Supplier Appraisal Template No");
                    NoMgt.TestManual(ProcurementSetup."Supplier Appraisal Template No");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Template Type"; Option)
        {
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review,Prequalification Scoring';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review","Prequalification Scoring";
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; Blocked; Boolean)
        {
        }
        field(6; "Total Preliminary Checks Score"; Decimal)
        {
            Caption = 'Total Preliminary Checks Score %';
            Description = 'Total Preliminary Checks Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Total Technical Evaluation %"; Decimal)
        {
            Description = 'Total Technical Evaluation Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Total Financial Evaluation"; Decimal)
        {
            Caption = 'Total Financial Evaluation Score %';
            Description = 'Total Financial Evaluation Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(9; "Total Assigned Score/Weight %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(10; "Default YES Bid Rating Score %"; Decimal)
        {
            Description = 'Default YES Bid Rating Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "NO Bid Rating Response Value"; Code[30])
        {
            Description = 'Default NO Text that is suggested by the system for YES/NO Response values in the bid scoring criteria table. When an evaluator selects this value during the scoring process, the system shall assign the Default NO Rating Score %';
        }
        field(12; "Default NO Bid Rating Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(13; "1-POOR Option Text Bid Score %"; Decimal)
        {
            Description = 'Default Score % that shall be assigned when an evaluator selects the POOR Response value during bid scoring';
            MaxValue = 100;
            MinValue = 0;
        }
        field(14; "2-FAIR Option Text Bid Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(15; "3-GOOD Option Text Bid Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(16; "4-VERY GOOD  Text Bid Score %"; Decimal)
        {
            Caption = '4-VERY GOOD Option Text Bid Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(17; "5-EXCELLENT Text Bid Score %"; Decimal)
        {
            Caption = '5-EXCELLENT Option Text Bid Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(19; "No. Series"; Code[10])
        {
        }
        field(20; "Created By"; Code[50])
        {
        }
        field(21; "Created Date"; Date)
        {
        }
        field(22; "Created Time"; Time)
        {
        }
        field(23; Released; Boolean)
        {
        }
        field(24; "YES Bid Rating Response Value"; Code[30])
        {
            Description = 'Default YES Bid Rating Response Value';
        }
        field(25; "Max Bid Value Limit"; Decimal)
        {
            Description = 'Used by Criteria or Requirements of  Rating Type::Numbers. This is deemed as a the default upper limit that the system uses to assigne Score %';
        }
    }

    keys
    {
        key(Key1; "Code", "Template Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Supplier Appraisal Template No");
            NoMgt.InitSeries(ProcurementSetup."Supplier Appraisal Template No", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
        ProcurementSetup.Get;
        "Default YES Bid Rating Score %" := ProcurementSetup."Default YES Bid Rating Score %";
        "Default NO Bid Rating Score %" := ProcurementSetup."Default NO Bid Rating Score %";
        "YES Bid Rating Response Value" := ProcurementSetup."YES Bid Rating Response Value";
        "NO Bid Rating Response Value" := ProcurementSetup."NO Bid Rating Response Value";
        "Max Bid Value Limit" := ProcurementSetup."Infinite Bid Value Limit";
        "1-POOR Option Text Bid Score %" := ProcurementSetup."1-POOR Option Text Bid Score %";
        "2-FAIR Option Text Bid Score %" := ProcurementSetup."2-FAIR Option Text Bid Score %";
        "3-GOOD Option Text Bid Score %" := ProcurementSetup."3-GOOD Option Text Bid Score %";
        "4-VERY GOOD  Text Bid Score %" := ProcurementSetup."4-VERY GOOD  Text Bid Score %";
        "5-EXCELLENT Text Bid Score %" := ProcurementSetup."5-EXCELLENT Text Bid Score %";
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

