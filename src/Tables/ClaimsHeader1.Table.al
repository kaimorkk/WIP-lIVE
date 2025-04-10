Table 52193826 "Claims Header1"
{
    ////LookupPageID = UnknownPage60006;

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Claim type"; Code[20])
        {
        }
        field(3; "Claimant ID"; Code[10])
        {
            TableRelation = Customer."No.";
        }
        field(4; "Claimant Name"; Text[80])
        {
        }
        field(5; Amount; Decimal)
        {
            CalcFormula = sum("Claims line1".Amount where(Amount = field(Amount)));
            FieldClass = FlowField;
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval, Approved';
            OptionMembers = Open,"Pending Approval"," Approved";
        }
        field(7; UsrID; Code[20])
        {
        }
        field(8; "Posting date"; Date)
        {
        }
        field(9; "No. Series"; Code[20])
        {
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
            GLSetup.Get;
            GLSetup.TestField("Imprest Nos");
            NoSeriesMgt.InitSeries(GLSetup."Claim Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

