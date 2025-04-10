
table 70212 "Tender Cancellation Voucher"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Document Date"; Date)
        {
        }
        field(3; "Invitation Notice No"; Code[30])
        {
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "Invitation Notice No");
                if IFS.FindSet then begin
                    "Tender No." := IFS."External Document No";
                    "Tender No." := IFS.Description;
                end;
            end;
        }
        field(4; "Tender No."; Code[80])
        {
            Editable = false;
        }
        field(5; "Tender Name"; Text[100])
        {
            Editable = false;
        }
        field(6; "Cancel Reason Code"; Code[50])
        {
            TableRelation = "Tender Cancel Reason Code".Code;
        }
        field(7; Description; Text[250])
        {
        }
        field(8; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; Posted; Boolean)
        {
            Editable = false;
        }
        field(10; "Created by"; Code[50])
        {
            Editable = false;
        }
        field(11; "Created Date/Time"; DateTime)
        {
            Editable = false;
        }
        field(12; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            Enabled = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField("Tender Cancellation Nos");
            NoSeriesMgt.InitSeries(PurchSetup."Tender Cancellation Nos", xRec."Document No", 0D, "Document No", "No. Series");

        end;


        "Created by" := UserId;
        "Created Date/Time" := CurrentDatetime;
    end;

    var
        IFS: Record "Standard Purchase Code";
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

