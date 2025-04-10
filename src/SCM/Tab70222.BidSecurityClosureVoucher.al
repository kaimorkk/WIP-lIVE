
table 70222 "Bid Security Closure Voucher"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {

            trigger OnValidate()
            begin


                if "Document No" <> '' then begin
                    if "Document Type" = "document type"::"Claim/Forfeiture" then begin
                        ProcurementSetup.TestField("Bid Security Claim Nos");
                        NoMgt.TestManual(ProcurementSetup."Bid Security Claim Nos");
                    end;
                    if "Document Type" = "document type"::"Released/Returned" then begin
                        ProcurementSetup.TestField("Bid Security Returned Nos");
                        NoMgt.TestManual(ProcurementSetup."Bid Security Returned Nos");
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Claim/Forfeiture,Released/Returned';
            OptionMembers = "Claim/Forfeiture","Released/Returned";
        }
        field(3; "Document Date"; Date)
        {
        }
        field(4; "IFS Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Tender Name"; Text[100])
        {
        }
        field(7; "Closed Securities Total Value"; Decimal)
        {
            Caption = 'Closed Securities Total Value (LCY)';
            Description = 'Closed Securities Total Value (LCY)';
            FieldClass = FlowField;
            //   CalcFormula='';
        }
        field(8; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(11; "Created Date"; Date)
        {
            Editable = false;
        }
        field(12; "Created Time"; Time)
        {
            Editable = false;
        }
        field(13; Posted; Boolean)
        {
        }
        field(14; "Posted By"; Code[30])
        {
        }
        field(15; "Posted Date"; Date)
        {
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
            ProcurementSetup.Get;
            if "Document Type" = "document type"::"Claim/Forfeiture" then begin
                ProcurementSetup.TestField("Bid Security Claim Nos");
                NoMgt.InitSeries(ProcurementSetup."Bid Security Claim Nos", xRec."No. Series", 0D, "Document No", "No. Series");
            end;
            if "Document Type" = "document type"::"Released/Returned" then begin
                ProcurementSetup.TestField("Bid Security Returned Nos");
                NoMgt.InitSeries(ProcurementSetup."Bid Security Returned Nos", xRec."No. Series", 0D, "Document No", "No. Series");
            end;

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

