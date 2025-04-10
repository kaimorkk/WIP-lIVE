Table 52194034 "Receipts Header1"
{
    DrillDownPageID = "Receipts List Page";
    LookupPageID = "Receipts List Page";

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                GLSetup.Get;
                if "No." <> xRec."No." then begin
                    NoSeriesMgt.TestManual(GLSetup."Receipt No");
                end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Pay Mode"; Code[20])
        {
            TableRelation = "Payment Method".Code;
        }
        field(4; "Cheque No"; Code[20])
        {
        }
        field(5; "Cheque Date"; Date)
        {
        }
        field(6; "Total Amount"; Decimal)
        {
            // CalcFormula = sum("Receipt Lines1".Amount where("Receipt No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Amount(LCY)"; Decimal)
        {
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(9; "Received From"; Text[70])
        {
        }
        field(10; "On Behalf Of"; Text[70])
        {
        }
        field(11; Cashier; Code[70])
        {
        }
        field(12; Posted; Boolean)
        {
            Editable = false;
        }
        field(13; "Posted Date"; Date)
        {
        }
        field(14; "Posted Time"; Time)
        {
        }
        field(15; "Posted By"; Code[70])
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
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,,,Closed;
        }
        field(21; Amount; Decimal)
        {
        }
        field(22; Banked; Boolean)
        {
        }
        field(23; "Procurement Method"; Option)
        {
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI;
        }
        field(24; "Procurement Request"; Code[30])
        {
            TableRelation = if ("Procurement Method" = const(Direct)) "Procurement Request1" where("Process Type" = const(Direct))
            else if ("Procurement Method" = const(RFP)) "Procurement Request1" where("Process Type" = const(RFP))
            else if ("Procurement Method" = const(RFQ)) "Procurement Request1" where("Process Type" = const(RFQ))
            else if ("Procurement Method" = const(Tender)) "Procurement Request1" where("Process Type" = const(Tender))
            else if ("Procurement Method" = const("Low Value")) "Procurement Request1" where("Process Type" = const("Low Value"))
            else if ("Procurement Method" = const("Specially Permitted")) "Procurement Request1" where("Process Type" = const("Specially Permitted"))
            else if ("Procurement Method" = const(EOI)) "Procurement Request1" where("Process Type" = const(EOI));
        }
        field(25; "Employer Code"; Code[20])
        {
        }
        field(26; "Unallocated Receipt"; Boolean)
        {
        }
        field(27; "Ext. Document No."; Code[20])
        {
        }
        field(28; Remarks; Text[100])
        {
        }
        field(29; Type; Enum "Receipt Types")
        {
            DataClassification = CustomerContent;
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
        fieldgroup(DropDown; "No.", "Received From", "On Behalf Of")
        {
        }
    }

    trigger OnDelete()
    begin
        if Posted then
            Error('The the transaction is posted');
    end;

    trigger OnInsert()
    begin
        GLSetup.Get;
        if "No." = '' then begin
            // case Type of
            //     Type::Licensing:
            //         begin
            //             GLSetup.TestField("Receipt No");
            //             NoSeriesMgt.InitSeries(GLSetup."Receipt No", xRec."No. Series", 0D, "No.", "No. Series");
            //         end;
            //     Type::"Tender Alert":
            //         begin
            //             GLSetup.TestField("Receipt No");
            //             NoSeriesMgt.InitSeries(GLSetup."Receipt No", xRec."No. Series", 0D, "No.", "No. Series");
            //         end;
            // end;
            GLSetup.TestField("Receipt No");
            NoSeriesMgt.InitSeries(GLSetup."Receipt No", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        Cashier := UserId;
        Date := Today;
    end;

    trigger OnModify()
    begin
        if Posted then
            Error('The the transaction is posted');
    end;

    trigger OnRename()
    begin
        if Posted then
            Error('The the transaction is posted');
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        Receiptline: Record "Receipt Lines1";
}

