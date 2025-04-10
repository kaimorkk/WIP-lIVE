Table 52193652 "RTGS Header"
{

    fields
    {
        field(1; No; Code[30])
        {

            trigger OnValidate()
            begin
                // FosaSetup.Get;
                // if No <> xRec.No then begin
                //     NoSeriesMgt.TestManual(FosaSetup."RTGS No");
                // end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "User ID"; Code[20])
        {
        }
        field(4; Remarks; Text[30])
        {
        }
        field(5; Posted; Boolean)
        {
        }
        field(6; "Statement No."; Code[20])
        {
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; Cashier; Code[30])
        {
            Editable = false;
        }
        field(9; "Total Amount"; Decimal)
        {
            CalcFormula = sum("RTGS Lines".Amount where(No = field(No)));
            FieldClass = FlowField;
        }
        field(10; "Date posted"; Date)
        {
        }
        field(11; "Time Posted"; Time)
        {
        }
        field(12; "Posted By"; Code[20])
        {
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

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FosaSetup: Record "Fosa Setup";
        Acc: Record Vendor;
}

