
table 69056 "HR Asset Transfer Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Document Date"; Date)
        {
        }
        field(5; "Issuing Admin/Asst"; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                hremployee.Reset;
                if hremployee.Get("Issuing Admin/Asst") then begin
                    "Issuing Admin/Asst Name" := hremployee."First Name" + ' ' + hremployee."Last Name";
                end else begin
                    "Issuing Admin/Asst Name" := '';
                end;
            end;
        }
        field(6; "Issuing Admin/Asst Name"; Text[50])
        {
        }
        field(7; "Document Type"; Option)
        {
            OptionCaption = 'Asset Transfer';
            OptionMembers = "Asset Transfer";
        }
        field(8; "Currency Code"; Code[10])
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Canceled;
        }
        field(11; Transfered; Boolean)
        {
        }
        field(12; "Date Transfered"; Date)
        {
        }
        field(13; "Transfered By"; Code[20])
        {
        }
        field(14; "Time Posted"; Time)
        {
        }
        field(15; "User ID"; Code[50])
        {
        }
        field(16; "Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center".Code;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HRSetUp.Get;
            HRSetUp.TestField("Asset Transfer Nos");
            NoSeriesMgt.InitSeries(HRSetUp."Asset Transfer Nos", xRec."No. Series", Today, "No.", "No. Series");
        end;
        "Document Date" := Today;
    end;

    var
        fasetup: Record "FA Setup";
        hremployee: Record Employee;
        fasset: Record "Fixed Asset";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimValue: Record "Dimension Value";
        HRSetUp: Record "Human Resources Setup";
}

