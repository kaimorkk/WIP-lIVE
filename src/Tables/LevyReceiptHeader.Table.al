Table 52193992 "Levy Receipt Header"
{
    DrillDownPageID = "Levy Receipt Header List";
    LookupPageID = "Levy Receipt Header List";

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Licensee No."; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if SchemeRec.Get("Licensee No.") then begin
                    "Licensee Name" := SchemeRec.Name;
                end;
            end;
        }
        field(3; "Licensee Name"; Text[50])
        {
        }
        field(4; Amount; Decimal)
        {
            CalcFormula = sum("Levy Receipt Lines".Amount where("Registration No." = field(No)));
            FieldClass = FlowField;
        }
        field(5; "Payment Mode"; Code[20])
        {
            TableRelation = "Payment Method";
        }
        field(6; "Cheque Drawer"; Text[50])
        {
        }
        field(7; "Receipt Date"; Date)
        {
        }
        field(8; "Cheque Date"; Date)
        {
        }
        field(9; "Cheque Name"; Text[50])
        {
        }
        field(10; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(11; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12; "Paid in By"; Text[20])
        {
        }
        field(13; "External Document No."; Code[20])
        {
        }
        field(14; Posted; Boolean)
        {
        }
        field(15; "Cheque No."; Code[20])
        {
        }
        field(16; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(18; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(19; "Posted Date"; Date)
        {
        }
        field(20; "Posted Time"; Time)
        {
        }
        field(21; "Posted By"; Code[20])
        {
        }
        field(22; "Amount (LCY)"; Decimal)
        {
        }
        field(23; Cashier; Code[20])
        {
        }
        field(24; Type; Option)
        {
            OptionCaption = 'Normal,Batch';
            OptionMembers = Normal,Batch;
        }
        field(25; "No Printed"; Integer)
        {
        }
        field(26; "Receipt Type"; Option)
        {
            OptionCaption = 'Levy,Penalty,Fees';
            OptionMembers = Levy,Penalty,Fees;
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
            LevySetup.Get;

            LevySetup.TestField(LevySetup."Levy Nos");
            NoSeriesMgt.InitSeries(LevySetup."Levy Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        SchemeRec: Record Customer;
        LevySetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

