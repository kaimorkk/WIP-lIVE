
table 70154 "IFS Prebid Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("IFS Prebid Register");
                    NoMgt.TestManual(ProcurementSetup."IFS Prebid Register");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "IFS Code"; Code[30])
        {
            TableRelation = "Standard Purchase Code";

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "IFS Code");
                if IFS.FindSet then begin
                    Description := "IFS Code" + '_' + 'Prepid Meeting';
                    "Tender Description" := IFS."Tender Name";
                    "Pre-bid Purchaser Code" := IFS."Purchaser Code";
                    "Primary Region" := IFS."Requesting Region";
                    "Pre-bid Visit Date" := IFS."Mandatory Pre-bid Visit Date";
                    "Prebid Meeting Venue" := IFS."Prebid Meeting Address";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Tender Description"; Text[250])
        {
        }
        field(5; "Pre-bid Visit Date"; Date)
        {
        }
        field(6; "Pre-bid Visit Start Time"; Time)
        {
        }
        field(7; "Pre-bid Visit End Date"; Date)
        {
        }
        field(8; "Pre-bid Visit End Time"; Time)
        {
        }
        field(9; "Pre-bid Purchaser Code"; Code[30])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(10; "No. of Bidders"; Decimal)
        {
        }
        field(11; "No. of Prebid Attendees"; Decimal)
        {
        }
        field(12; "No. Series"; Code[10])
        {
        }
        field(13; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            Editable = false;
        }
        field(16; "Primary Region"; Code[30])
        {
        }
        field(17; "Tender External Document No"; Code[50])
        {
        }
        field(18; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(19; "Document Status"; Option)
        {
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(20; "Prebid Meeting Venue"; Code[50])
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
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("IFS Prebid Register");
            NoMgt.InitSeries(ProcurementSetup."IFS Prebid Register", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        IFS: Record "Standard Purchase Code";
}

