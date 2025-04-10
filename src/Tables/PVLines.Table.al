Table 52193529 "PV Lines"
{

    fields
    {
        field(1;"Apply to";Code[20])
        {

            trigger OnValidate()
            begin
                /*
                vendorLedEntry.RESET;
                vendorLedEntry.SETRANGE(vendorLedEntry."Document No.","Apply to");
                
                IF vendorLedEntry.FIND('-') THEN BEGIN
                vendorLedEntry.CALCFIELDS(vendorLedEntry."Original Amount",vendorLedEntry."Remaining Amount");
                PVline.SETRANGE(PVline."PV Line No","PV Line No");
                     IF PVline.FIND('-') THEN BEGIN
                        PVline."External Document No":=vendorLedEntry."External Document No.";
                        PVline.Description:=vendorLedEntry.Description;
                        PVline."Original amount":=-vendorLedEntry."Original Amount";
                        PVline."Remaining Amount":=-vendorLedEntry."Remaining Amount";
                        PVline."Posting Date":=vendorLedEntry."Posting Date";
                        PVline.MODIFY;
                    END;
                END;
                */

            end;
        }
        field(2;"External Document No";Code[20])
        {
            Editable = false;
        }
        field(3;Description;Text[30])
        {
            Editable = true;
        }
        field(4;"Original amount";Decimal)
        {
            Editable = false;
        }
        field(5;"Remaining Amount";Decimal)
        {
            Editable = true;
        }
        field(6;"Posting Date";Date)
        {
            Editable = false;
        }
        field(7;"PV No.";Code[20])
        {

            trigger OnValidate()
            begin
                
                PaymentV.Reset;
                PaymentV.SetRange(PaymentV.No,"PV No.");
                if PaymentV.Find('-') then begin
                  "Vendor No.":=PaymentV."Account No.";
                end;
                /*
                 vendledger.RESET;
                 vendledger.SETCURRENTKEY(vendledger."Vendor No.",Open,"Document No.");
                 vendledger.SETRANGE(vendledger."Vendor No.",vendorno);
                 vendledger.SETRANGE(Open,TRUE);
                
                 vendledger.CALCFIELDS(vendledger.Amount);
                IF PAGE.RUNMODAL(29,vendledger) = ACTION::LookupOK THEN BEGIN
                vendledger.CALCFIELDS(vendledger."Remaining Amount");
                END;
                */

            end;
        }
        field(8;"PV Line No";Code[20])
        {
        }
        field(9;"No Series";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(10;"PE Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                /*
                vendorLedEntry.RESET;
                vendorLedEntry.SETRANGE(vendorLedEntry."Document No.","Apply to");
                
                IF vendorLedEntry.FIND('-') THEN BEGIN
                vendorLedEntry.CALCFIELDS(vendorLedEntry."Original Amount",vendorLedEntry."Remaining Amount");
                PVline.SETRANGE(PVline."PV Line No","PV Line No");
                     IF PVline.FIND('-') THEN BEGIN
                        PVline."External Document No":=vendorLedEntry."External Document No.";
                        PVline.Description:=vendorLedEntry.Description;
                        PVline."Original amount":=-vendorLedEntry."Original Amount";
                        PVline."Remaining Amount":=-vendorLedEntry."Remaining Amount";
                        PVline.MODIFY;
                    END;
                END;
                */
                vendorLedEntry.Reset;
                vendorLedEntry.SetRange(vendorLedEntry."Document No.","Apply to");
                
                if vendorLedEntry.Find('-') then begin
                vendorLedEntry.CalcFields(vendorLedEntry."Original Amount",vendorLedEntry."Remaining Amount");
                //MESSAGE("PV Line No");
                       "External Document No":=vendorLedEntry."External Document No.";
                        Description:=vendorLedEntry.Description;
                        "Original amount":=-vendorLedEntry."Original Amount";
                        "Remaining Amount":=-vendorLedEntry."Remaining Amount";
                        if "PV Line No"<>'' then
                        Modify;
                end;

            end;
        }
        field(11;"Vendor No.";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"PV Line No","Vendor No.","PV No.")
        {
            Clustered = true;
        }
        key(Key2;"Vendor No.","PV No.")
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "PV Line No" = '' then begin
          GenSetup.Get;
          GenSetup.TestField(GenSetup."PV LIne Nos");
          NoseriesManagement.InitSeries(GenSetup."PV LIne Nos",xRec."No Series",0D,"PV Line No","No Series");
        end;
    end;

    var
        vendorLedEntry: Record "Vendor Ledger Entry";
        PV: Record "Payment Voucher";
        NoseriesManagement: Codeunit NoSeriesManagement;
        GenSetup: Record "General Ledger Setup";
        PVline: Record "PV Lines";
        PaymentV: Record "Payment Voucher";
        vendorno: Code[20];
        vendledger: Record "Vendor Ledger Entry";
}

