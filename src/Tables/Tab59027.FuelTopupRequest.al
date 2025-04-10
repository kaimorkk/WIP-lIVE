
table 59027 "Fuel Topup Request"
{
    DataClassification = CustomerContent;
    // DrillDownPageID = UnknownPage59077;
    // LookupPageID = UnknownPage59077;

    fields
    {
        field(1; No; Code[10])
        {
        }
        field(2; "Vendor No"; Code[30])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vendor.Get("Vendor No") then
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(3; "Vendor Name"; Text[100])
        {
        }
        field(4; "Request Date"; Date)
        {
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; "Requested by"; Code[30])
        {
        }
        field(8; Amount; Decimal)
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Cancelled,Rejected';
            OptionMembers = Open,Pending,Approved,Cancelled,Rejected;
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
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Card No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Card No", xRec."No. Series", 0D, No, "No. Series");
        end;
        "Request Date" := Today;
        "Requested by" := UserId;
    end;

    trigger OnModify()
    begin
        "Request Date" := Today;
        "Requested by" := UserId;
    end;

    var
        Vendor: Record Vendor;
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

