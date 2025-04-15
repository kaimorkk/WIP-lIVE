Page 52193646 "Member Statistics FactBox"
{
    Caption = 'Memberr Statistics - Bill-to Member';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field(MemberNo; "No.")
            {
                ApplicationArea = Basic;
                Caption = 'Member No.';

                trigger OnDrillDown()
                begin
                    ShowDetails;
                end;
            }
            field(BalanceLCY; "Balance (LCY)")
            {
                ApplicationArea = Basic;

                trigger OnDrillDown()
                var
                    DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
                    CustLedgEntry: Record "Cust. Ledger Entry";
                begin
                    DtldCustLedgEntry.SetRange("Customer No.", "No.");
                    Copyfilter("Global Dimension 1 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 1");
                    Copyfilter("Global Dimension 2 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 2");
                    Copyfilter("Currency Filter", DtldCustLedgEntry."Currency Code");
                    CustLedgEntry.DrillDownOnEntries(DtldCustLedgEntry);
                end;
            }
            group(Loans)
            {
                Caption = 'Loans';
                // field(OustandingBalance; "Oustanding Balance")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group(Products)
            {
                Caption = 'Service';
                Visible = false;
                field(OutstandingServOrdersLCY; "Outstanding Serv. Orders (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
            field("Total (LCY)"; GetTotalAmountLCY)
            {
                ApplicationArea = Basic;
                AutoFormatType = 1;
                Caption = 'Total (LCY)';
                Importance = Promoted;
                Style = Strong;
                StyleExpr = true;
            }
        }
    }

    actions
    {
    }

    var
        Text000: label 'Overdue Amounts (LCY) as of %1';


    procedure ShowDetails()
    begin
        // Page.Run(Page::"Member Card",Rec);
    end;
}

