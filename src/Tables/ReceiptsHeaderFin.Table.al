Table 52193636 "Receipts HeaderFin"
{
    //DrillDownPageID = UnknownPage51508021;
    //LookupPageID = UnknownPage51508021;

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                GLSetup.Get;
                if "No." <> xRec."No." then begin
                    NoSeriesMgt.TestManual(GLSetup."Receipt Nos");
                end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(4; "Cheque No"; Code[20])
        {
        }
        field(5; "Cheque Date"; Date)
        {
        }
        field(6; Amount; Decimal)
        {
            CalcFormula = sum("Receipt LinesFin".Amount where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }
        field(7; "Amount(LCY)"; Decimal)
        {
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account" where(Type = filter(Bank));
        }
        field(9; "Received From"; Text[70])
        {
        }
        field(10; "On Behalf Of"; Text[70])
        {
        }
        field(11; Cashier; Code[20])
        {
        }
        field(12; Posted; Boolean)
        {
        }
        field(13; "Posted Date"; Date)
        {
        }
        field(14; "Posted Time"; Time)
        {
        }
        field(15; "Posted By"; Code[20])
        {
        }
        field(16; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(18; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(19; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(20; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,,,Closed;
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
        GLSetup.Get;
        if "No." = '' then begin
            GLSetup.TestField("Receipt Nos");
            NoSeriesMgt.InitSeries(GLSetup."Receipt Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        Cashier := UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        Receipt: Record "Receipts HeaderFin";


    procedure PrintRecords(ShowRequestForm: Boolean)
    var
        ReportSelection: Record "Report Selections";
    begin
        with Receipt do begin
            Copy(Rec);
            ReportSelection.SetRange(Usage, ReportSelection.Usage::"P.Receipt");
            ReportSelection.SetFilter("Report ID", '<>0');
            ReportSelection.Find('-');
            repeat
                Report.RunModal(ReportSelection."Report ID", ShowRequestForm, false, Receipt);
            until ReportSelection.Next = 0;
        end;
    end;


    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Posted Date", "No.");
        NavigateForm.Run;
    end;
}

