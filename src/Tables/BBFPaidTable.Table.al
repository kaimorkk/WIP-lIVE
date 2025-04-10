Table 52193674 "BBF Paid Table"
{

    fields
    {
        field(1; "Entry No"; Code[50])
        {
        }
        field(2; "Member No"; Code[50])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if CUST.Get("Member No") then begin
                    "Staff No" := CUST."Staff No";
                    Name := CUST.Name;
                end;
            end;
        }
        field(3; "Staff No"; Code[50])
        {
        }
        field(4; Name; Text[60])
        {
        }
        field(5; "Amount Taken"; Decimal)
        {
        }
        field(6; "Amount Paid"; Decimal)
        {
        }
        field(7; Year; Date)
        {
        }
        field(8; "No. Series"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Entry No" = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Customer Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Reminder Nos.", xRec."No. Series", 0D, "Entry No", "No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        SalesOrderLine: Record "Sales Line";
        CustBankAcc: Record "Customer Bank Account";
        ShipToAddr: Record "Ship-to Address";
        PostCode: Record "Post Code";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        ShippingAgentService: Record "Shipping Agent Services";
        //ItemCrossReference: Record "Item Cross Reference";
        RMSetup: Record "Marketing Setup";
        SalesPrice: Record "Sales Price";
        SalesLineDisc: Record "Sales Line Discount";
        SalesPrepmtPct: Record "Sales Prepayment %";
        ServContract: Record "Service Contract Header";
        ServHeader: Record "Service Header";
        ServiceItem: Record "Service Item";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MoveEntries: Codeunit MoveEntries;
        UpdateContFromCust: Codeunit "CustCont-Update";
        DimMgt: Codeunit DimensionManagement;
        InsertFromContact: Boolean;
        // //Loans: Record Loans;
        GenSetUp: Record "General Set-Up";
        MinShares: Decimal;
        CUST: Record Customer;
}

