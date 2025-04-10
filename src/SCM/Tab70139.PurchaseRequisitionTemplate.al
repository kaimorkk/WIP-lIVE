
table 70139 "Purchase Requisition Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Req Template No. Series");
                    NoMgt.TestManual(ProcurementSetup."Bid Req Template No. Series");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Template Type"; Option)
        {
            OptionCaption = 'Standard,BoQ';
            OptionMembers = Standard,BoQ;
        }
        field(6; "Effective Date"; Date)
        {
        }
        field(7; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(8; "Primary Region"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
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
        fieldgroup(DropDown; "Code", Description)
        {
        }
        fieldgroup(Brick; "Code", Description)
        {
        }
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Bid Req Template No. Series");
            NoMgt.InitSeries(ProcurementSetup."Bid Req Template No. Series", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

