Table 52193644 "Teller Requisition"
{
    //DrillDownPageID = UnknownPage51508031;
    //LookupPageID = UnknownPage51508031;

    fields
    {
        field(1; "Request No."; Code[30])
        {

            trigger OnValidate()
            begin
                FosaSetup.Get;
                if "Request No." <> xRec."Request No." then begin
                    NoSeriesMgt.TestManual(FosaSetup."Teller Request Nos.");
                end;
            end;
        }
        field(2; "Request Date"; Date)
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; Cashier; Code[30])
        {
            Editable = false;
        }
        field(6; "No. Series"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(7; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released,Canceled,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Canceled,Rejected;
        }
        field(8; "Requested Ownered"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Request No." = '' then begin
            FosaSetup.Get;
            FosaSetup.TestField("Teller Request Nos.");
            NoSeriesMgt.InitSeries(FosaSetup."Teller Request Nos.", xRec."No. Series", 0D, "Request No.", "No. Series");
        end;

        Cashier := UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FosaSetup: Record "Fosa Setup";
}

