
table 69124 "Job Advert Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Requisition No."; Code[30])
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(5; "Document Date"; DateTime)
        {
        }
        field(6; "Created By"; Code[30])
        {
        }
        field(7; Published; Boolean)
        {
        }
        field(8; "No. Series"; Code[30])
        {
        }
        field(9; "Applications End Time"; Time)
        {
        }
        field(10; "Applications End Date"; Date)
        {
        }
        field(11; "Applications Start Date"; Date)
        {
        }
        field(12; "Company Profile"; Text[300])
        {
        }
        field(13; Provider; Code[20])
        {
        }
        field(33; Test; Code[10])
        {
        }
        field(46; "test 2"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Job Advert Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Job Advert Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Document Date" := CurrentDatetime;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

