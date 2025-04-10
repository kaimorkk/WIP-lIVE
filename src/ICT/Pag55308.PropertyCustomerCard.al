

page 55308 "Property Customer Card"
{
    Caption = 'Customer Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                    Visible = false;
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s intercompany partner code.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';

                    trigger OnDrillDown()
                    begin
                        Rec.OpenCustomerLedgerEntries(false);
                    end;
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies payments from the customer that are overdue per today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.OpenCustomerLedgerEntries(true);
                    end;
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.';

                    trigger OnValidate()
                    begin
                        StyleTxt := Rec.SetStyle;
                    end;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies which transactions with the customer that cannot be blocked, for example, because the customer is insolvent.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
                }
                field("Service Zone Code"; Rec."Service Zone Code")
                {
                    ApplicationArea = Service;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the service zone that is assigned to the customer.';
                }
                field("Document Sending Profile"; Rec."Document Sending Profile")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the preferred method of sending documents to this customer, so that you do not have to select a sending option every time that you post and send a document to the customer. Sales documents to this customer will be sent using the specified sending profile and will override the default document sending profile.';
                }
                field(TotalSales2; GetTotalSales)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Total Sales';
                    Style = Strong;
                    StyleExpr = true;
                    ToolTip = 'Specifies your total sales turnover with the customer in the current fiscal year. It is calculated from amounts excluding VAT on all completed and open invoices and credit memos.';
                }
                field(AdjCustProfit; AdjCustProfit)
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatType = 1;
                    Caption = 'Profit (LCY)';
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies how much profit you have made from the customer in the current fiscal year.';
                }
                field(AdjProfitPct; AdjProfitPct)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Profit %';
                    DecimalPlaces = 1 : 1;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies how much profit you have made from the customer in the current fiscal year, expressed as a percentage of the customer''s total sales.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies when the customer card was last modified.';
                }
            }
            group("Address & Contact")
            {
                Caption = 'Address & Contact';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the customer''s city.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    field(ShowMap; ShowMapLbl)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ShowCaption = false;
                        Style = StrongAccent;
                        StyleExpr = true;
                        ToolTip = 'Specifies the customer''s address on your preferred map website.';

                        trigger OnDrillDown()
                        begin
                            CurrPage.Update(true);
                            Rec.DisplayMap;
                        end;
                    }
                }
                group(ContactDetails)
                {
                    Caption = 'Contact';
                    field("Primary Contact No."; Rec."Primary Contact No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Primary Contact Code';
                        ToolTip = 'Specifies the primary contact number for the customer.';
                    }
                    field(ContactName; Rec.Contact)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Contact Name';
                        Editable = ContactEditable;
                        Importance = Promoted;
                        ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';

                        trigger OnValidate()
                        begin
                            ContactOnAfterValidate;
                        end;
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the customer''s telephone number.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        ExtendedDatatype = EMail;
                        Importance = Promoted;
                        ToolTip = 'Specifies the customer''s email address.';
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Advanced;
                        Importance = Additional;
                        ToolTip = 'Specifies the customer''s fax number.';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the customer''s home page address.';
                    }
                    field("Language Code"; Rec."Language Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the language to be used on printouts for this customer.';
                    }
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bill-to Customer';
                    Importance = Additional;
                    ToolTip = 'Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the customer''s VAT registration number for customers in EU countries/regions.';

                    trigger OnDrillDown()
                    var
                        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditCustomerVATReg(Rec);
                    end;
                }
                field(GLN; Rec.GLN)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer in connection with electronic document sending.';
                }
                field("Copy Sell-to Addr. to Qte From"; Rec."Copy Sell-to Addr. to Qte From")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies which customer address is inserted on sales quotes that you create for the customer.';
                }
                field("Invoice Copies"; Rec."Invoice Copies")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies how many copies of an invoice for the customer will be printed at a time.';
                }
                group(PostingDetails)
                {
                    Caption = 'Posting Details';
                    field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                    }
                    field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
                    }
                    field("Customer Posting Group"; Rec."Customer Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                    }
                }
                group(PricesandDiscounts)
                {
                    Caption = 'Prices and Discounts';
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the default currency for the customer.';
                    }
                    field("Customer Price Group"; Rec."Customer Price Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.';
                    }
                    field("Customer Disc. Group"; Rec."Customer Disc. Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.';
                    }
                    field("Allow Line Disc."; Rec."Allow Line Disc.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies if a sales line discount is calculated when a special sales price is offered according to setup in the Sales Prices window.';
                    }
                    field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        NotBlank = true;
                        ToolTip = 'Specifies a code for the invoice discount terms that you have defined for the customer.';
                    }
                    field("Prices Including VAT"; Rec."Prices Including VAT")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                    }
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ApplicationArea = Prepayments;
                    Importance = Additional;
                    ToolTip = 'Specifies a prepayment percentage that applies to all orders for this customer, regardless of the items or services on the order lines.';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies how to apply payments to entries for this customer.';
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies for direct debit collections if the customer that the payment is collected from is a person or a company.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check.';
                }
                field("Reminder Terms Code"; Rec."Reminder Terms Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTip = 'Specifies how reminders about late payments are handled for this customer.';
                }
                field("Fin. Charge Terms Code"; Rec."Fin. Charge Terms Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTip = 'Specifies finance charges are calculated for the customer.';
                }
                field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTip = 'Specifies a payment term that will be used to calculate cash flow for the customer.';
                }
                field("Print Statements"; Rec."Print Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to include this customer when you print the Statement report.';
                }
                field("Last Statement No."; Rec."Last Statement No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the last statement that was printed for this customer.';
                }
                field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that the customer is not allowed a payment tolerance.';
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s bank account that will be used by default when you process refunds to the customer and direct debit collections.';
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTip = 'Specifies from which location sales to this customer will be processed by default.';
                }
                field("Combine Shipments"; Rec."Combine Shipments")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies if several orders delivered to the customer can appear on the same sales invoice.';
                }
                field(Reserve; Rec.Reserve)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies whether items will never, automatically (Always), or optionally be reserved for this customer.';
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = Advanced;
                    Importance = Promoted;
                    ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
                }
                group("Shipment Method")
                {
                    Caption = 'Shipment Method';
                    field("Shipment Method Code"; Rec."Shipment Method Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Code';
                        Importance = Promoted;
                        ToolTip = 'Specifies which shipment method to use when you ship items to the customer.';
                    }
                    field("Shipping Agent Code"; Rec."Shipping Agent Code")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Agent';
                        Importance = Additional;
                        ToolTip = 'Specifies which shipping company is used when you ship items to the customer.';
                    }
                    field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Agent Service';
                        Importance = Additional;
                        ToolTip = 'Specifies the code for the shipping agent service to use for this customer.';
                    }
                }
                field("Shipping Time"; Rec."Shipping Time")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
                }
                field("Base Calendar Code"; Rec."Base Calendar Code")
                {
                    ApplicationArea = Advanced;
                    DrillDown = false;
                    ToolTip = 'Specifies a customizable calendar for shipment planning that holds the customer''s working days and holidays.';
                }
                // field("Customized Calendar"; CalendarMgmt.CustomizedCalendarExistText(CustomizedCalendar."source type"::Customer, "No.", '', "Base Calendar Code"))
                // {
                //     ApplicationArea = Advanced;
                //     Caption = 'Customized Calendar';
                //     Editable = false;
                //     ToolTip = 'Specifies that you have set up a customized version of a base calendar.';

                //     trigger OnDrillDown()
                //     begin
                //         CurrPage.SaveRecord;
                //         TestField("Base Calendar Code");
                //         CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."source type"::Customer, "No.", '', "Base Calendar Code");
                //     end;
                // }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                Editable = false;
                Visible = FoundationOnly;
                group(Balance)
                {
                    Caption = 'Balance';
                    field("Balance (LCY)2"; Rec."Balance (LCY)")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Money Owed - Current';
                        ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';

                        trigger OnDrillDown()
                        begin
                            Rec.OpenCustomerLedgerEntries(false);
                        end;
                    }
                    // field(GetMoneyOwedExpected; GetMoneyOwedExpected)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Money Owed - Expected';
                    //     Importance = Additional;
                    //     ToolTip = 'Specifies the payment amount that the customer will owe when ongoing sales invoices and credit memos are completed.';

                    //     trigger OnDrillDown()
                    //     begin
                    //         CustomerMgt.DrillDownMoneyOwedExpected("No.");
                    //     end;
                    // }
                    // field(TotalMoneyOwed; "Balance (LCY)" + GetMoneyOwedExpected)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Money Owed - Total';
                    //     Style = Strong;
                    //     StyleExpr = true;
                    //     ToolTip = 'Specifies the payment amount that the customer owes for completed sales plus sales that are still ongoing. The value is the sum of the values in the Money Owed - Current and Money Owed - Expected fields.';
                    // }
                    field(CreditLimit; Rec."Credit Limit (LCY)")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Credit Limit';
                        ToolTip = 'Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.';
                    }
                    field(CalcCreditLimitLCYExpendedPct; Rec.CalcCreditLimitLCYExpendedPct)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Usage Of Credit Limit';
                        ExtendedDatatype = Ratio;
                        Style = Attention;
                        StyleExpr = BalanceExhausted;
                        ToolTip = 'Specifies how much of the customer''s payment balance consists of credit.';
                    }
                }
                group(Control108)
                {
                    Caption = 'Payments';
                    field("Balance Due"; Rec.CalcOverdueBalance)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionClass = FORMAT(STRSUBSTNO(OverduePaymentsMsg, FORMAT(WORKDATE)));
                        ToolTip = 'Specifies the sum of outstanding payments from the customer.';

                        trigger OnDrillDown()
                        var
                            DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
                            CustLedgEntry: Record "Cust. Ledger Entry";
                        begin
                            DtldCustLedgEntry.SetFilter("Customer No.", Rec."No.");
                            Rec.Copyfilter("Global Dimension 1 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 1");
                            Rec.Copyfilter("Global Dimension 2 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 2");
                            Rec.Copyfilter("Currency Filter", DtldCustLedgEntry."Currency Code");
                            CustLedgEntry.DrillDownOnOverdueEntries(DtldCustLedgEntry);
                        end;
                    }
                    field("Payments (LCY)"; Rec."Payments (LCY)")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payments This Year';
                        ToolTip = 'Specifies the sum of payments received from the customer in the current fiscal year.';
                    }
                    field("CustomerMgt.AvgDaysToPay(""No."")"; CustomerMgt.AvgDaysToPay(Rec."No."))
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Average Collection Period (Days)';
                        DecimalPlaces = 0 : 1;
                        Importance = Additional;
                        ToolTip = 'Specifies how long the customer typically takes to pay invoices in the current fiscal year.';
                    }
                    field(DaysPaidPastDueDate; DaysPastDueDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Average Late Payments (Days)';
                        DecimalPlaces = 0 : 1;
                        Importance = Additional;
                        Style = Attention;
                        StyleExpr = AttentionToPaidDay;
                        ToolTip = 'Specifies the average number of days the customer is late with payments.';
                    }
                }
                group("Sales This Year")
                {
                    Caption = 'Sales This Year';
                    // field(GetAmountOnPostedInvoices; GetAmountOnPostedInvoices)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     CaptionClass = STRSUBSTNO(PostedInvoicesMsg, FORMAT(NoPostedInvoices));
                    //     ToolTip = 'Specifies your sales to the customer in the current fiscal year based on posted sales invoices. The figure in parenthesis Specifies the number of posted sales invoices.';

                    //     trigger OnDrillDown()
                    //     begin
                    //         CustomerMgt.DrillDownOnPostedInvoices("No.")
                    //     end;
                    // }
                    // field(GetAmountOnCrMemo; GetAmountOnCrMemo)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     CaptionClass = STRSUBSTNO(CreditMemosMsg, FORMAT(NoPostedCrMemos));
                    //     ToolTip = 'Specifies your expected refunds to the customer in the current fiscal year based on posted sales credit memos. The figure in parenthesis shows the number of posted sales credit memos.';

                    //     trigger OnDrillDown()
                    //     begin
                    //         CustomerMgt.DrillDownOnPostedCrMemo("No.")
                    //     end;
                    // }
                    // field(GetAmountOnOutstandingInvoices; GetAmountOnOutstandingInvoices)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     CaptionClass = STRSUBSTNO(OutstandingInvoicesMsg, FORMAT(NoOutstandingInvoices));
                    //     ToolTip = 'Specifies your expected sales to the customer in the current fiscal year based on ongoing sales invoices. The figure in parenthesis shows the number of ongoing sales invoices.';

                    //     trigger OnDrillDown()
                    //     begin
                    //         CustomerMgt.DrillDownOnUnpostedInvoices("No.")
                    //     end;
                    // }
                    // field(GetAmountOnOutstandingCrMemos; GetAmountOnOutstandingCrMemos)
                    // // {
                    //     ApplicationArea = Basic, Suite;
                    //     CaptionClass = STRSUBSTNO(OutstandingCrMemosMsg, FORMAT(NoOutstandingCrMemos));
                    //     ToolTip = 'Specifies your refunds to the customer in the current fiscal year based on ongoing sales credit memos. The figure in parenthesis shows the number of ongoing sales credit memos.';

                    //     trigger OnDrillDown()
                    //     begin
                    //         CustomerMgt.DrillDownOnUnpostedCrMemos("No.")
                    //     end;
                    // }
                    field(Totals; Totals)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Total Sales';
                        Style = Strong;
                        StyleExpr = true;
                        ToolTip = 'Specifies your total sales turnover with the customer in the current fiscal year. It is calculated from amounts excluding VAT on all completed and open invoices and credit memos.';
                    }
                    field(CustInvDiscAmountLCY; CustInvDiscAmountLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Invoice Discounts';
                        ToolTip = 'Specifies the total of all invoice discounts that you have granted to the customer in the current fiscal year.';
                    }
                }
                part(AgedAccReceivableChart; "Aged Acc. Receivable Chart")
                {
                    ApplicationArea = Advanced;
                    SubPageLink = "No." = field("No.");
                    Visible = ShowCharts;
                }
            }
            part(PriceAndLineDisc; "Sales Price and Line Discounts")
            {
                ApplicationArea = All;
                Caption = 'Special Prices & Discounts';
                Visible = FoundationOnly;
            }
        }
        area(factboxes)
        {
            part(Control149; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
                Visible = not IsOfficeAddin;
            }
            part(Control135; "Office Customer Details")
            {
                ApplicationArea = All;
                Caption = 'Details';
                SubPageLink = "No." = field("No.");
                Visible = IsOfficeAddin;
            }
            part(AgedAccReceivableChart2; "Aged Acc. Receivable Chart")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Visible = IsOfficeAddin;
            }
            part(Control39; "CRM Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Visible = CRMIsCoupledToRecord;
            }
            // part(Control35; "Social Listening FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Customer),
            //                   "Source No." = field("No.");
            //     Visible = SocialListeningVisible;
            // }
            // part(Control27; "Social Listening Setup FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Customer),
            //                   "Source No." = field("No.");
            //     UpdatePropagation = Both;
            //     Visible = SocialListeningSetupVisible;
            // }
            part(SalesHistSelltoFactBox; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
            }
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
            }
            part(Control1905532107; "Dimensions FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "Table ID" = const(18),
                              "No." = field("No.");
            }
            part(Control1907829707; "Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1902613707; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(18),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'View or set up the customer''s bank accounts. You can set up any number of bank accounts for each customer.';
                }
                action("Direct Debit Mandates")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Direct Debit Mandates';
                    Image = MakeAgreement;
                    RunObject = Page "SEPA Direct Debit Mandates";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'View the direct-debit mandates that reflect agreements with customers to collect invoice payments from their bank account.';
                }
                action(ShipToAddresses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ship-&to Addresses';
                    Image = ShipAddress;
                    RunObject = Page "Ship-to Address List";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'View or edit alternate shipping addresses where the customer wants items delivered if different from the regular address.';
                }
                action(Contact)
                {
                    AccessByPermission = TableData Contact = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&ontact';
                    Image = ContactPerson;
                    ToolTip = 'View or edit detailed information about the contact person at the customer.';

                    trigger OnAction()
                    begin
                        Rec.ShowContact;
                    end;
                }
                // action("Cross Re&ferences")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Cross Re&ferences';
                //     Image = Change;
                //     RunObject = Page "Cross References";
                //     RunPageLink = "Cross-Reference Type" = const(Customer),
                //                   "Cross-Reference Type No." = field("No.");
                //     RunPageView = sorting("Cross-Reference Type", "Cross-Reference Type No.");
                //     ToolTip = 'Set up the customer''s own identification of items that you sell to the customer. Cross-references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.';
                // }
                action("Co&mments")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Customer),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    begin
                        // //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action(CustomerReportSelections)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Document Layouts';
                    Image = Quote;
                    ToolTip = 'Set up a layout for different types of documents such as invoices, quotes, and credit memos.';

                    trigger OnAction()
                    var
                        CustomReportSelection: Record "Custom Report Selection";
                    begin
                        CustomReportSelection.SetRange("Source Type", Database::Customer);
                        CustomReportSelection.SetRange("Source No.", Rec."No.");
                        Page.RunModal(Page::"Customer Report Selections", CustomReportSelection);
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics 365 for Sales';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoAccount)
                {
                    ApplicationArea = Suite;
                    Caption = 'Account';
                    Image = CoupledCustomer;
                    ToolTip = 'Open the coupled Dynamics 365 for Sales account.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Image = Refresh;
                    ToolTip = 'Send or get updated data to or from Dynamics 365 for Sales.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(Rec.RecordId);
                    end;
                }
                action(UpdateStatisticsInCRM)
                {
                    ApplicationArea = Suite;
                    Caption = 'Update Account Statistics';
                    Enabled = CRMIsCoupledToRecord;
                    Image = UpdateXML;
                    ToolTip = 'Send customer statistics data to Dynamics 365 for Sales to update the Account Statistics FactBox.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.CreateOrUpdateCRMAccountStatistics(Rec);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Dynamics 365 for Sales record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dynamics 365 for Sales account.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dynamics 365 for Sales account.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    Caption = 'Synchronization Log';
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the customer table.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(Rec.RecordId);
                    end;
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
                action(Action76)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Statistics';
                    Image = Statistics;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Customer Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
                action("S&ales")
                {
                    ApplicationArea = Advanced;
                    Caption = 'S&ales';
                    Image = Sales;
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ToolTip = 'View a summary of customer ledger entries. You select the time interval in the View by field. The Period column on the left contains a series of dates that are determined by the time interval you have selected.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = Page "Customer Entry Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ToolTip = 'View entry statistics for the record.';
                }
                action("Statistics by C&urrencies")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Statistics by C&urrencies';
                    Image = Currencies;
                    RunObject = Page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter" = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                  "Date Filter" = field("Date Filter");
                    ToolTip = 'View statistics for customers that use multiple currencies.';
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;
                    ToolTip = 'View serial or lot numbers that are assigned to items.';

                    trigger OnAction()
                    var
                        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
                    begin
                        // //ItemTrackingDocMgt.ShowItemTrackingForMasterData(1, "No.", '', '', '', '', '');
                    end;
                }
                separator(Action140)
                {
                }
            }
            group("Prices and Discounts")
            {
                Caption = 'Prices and Discounts';
                action("Invoice &Discounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code = field("Invoice Disc. Code");
                    ToolTip = 'Set up different discounts that are applied to invoices for the customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.';
                }
                action(Prices)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    ToolTip = 'View or set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
                action("Line Discounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    ToolTip = 'View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                }
            }
            group(ActionGroup82)
            {
                Caption = 'S&ales';
                Image = Sales;
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Prepayments;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    ToolTip = 'View or edit the percentages of the price that can be paid as a prepayment. ';
                }
                action("Recurring Sales Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Recurring Sales Lines';
                    Ellipsis = true;
                    Image = CustomerCode;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'Set up recurring sales lines for the customer, such as a monthly replenishment order, that can quickly be inserted on a sales document for the customer.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Quotes)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                    ToolTip = 'View a list of ongoing sales quotes for the customer.';
                }
                action(Invoices)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Invoices';
                    Image = Invoice;
                    RunObject = Page "Sales Invoice List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                    ToolTip = 'View a list of ongoing sales invoices for the customer.';
                }
                action(Orders)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                    ToolTip = 'View a list of ongoing sales orders for the customer.';
                }
                action("Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                    ToolTip = 'Open the list of ongoing return orders.';
                }
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                    action("Issued &Reminders")
                    {
                        ApplicationArea = Advanced;
                        Caption = 'Issued &Reminders';
                        Image = OrderReminder;
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                        ToolTip = 'View the reminders that you have sent to the customer.';
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        ApplicationArea = Advanced;
                        Caption = 'Issued &Finance Charge Memos';
                        Image = FinChargeMemo;
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                        ToolTip = 'View the finance charge memos that you have sent to the customer.';
                    }
                }
                action("Blanket Orders")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Sales Orders";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                    ToolTip = 'Open the list of ongoing blanket orders.';
                }
                action("&Jobs")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Jobs';
                    Image = Job;
                    RunObject = Page "Job List";
                    RunPageLink = "Bill-to Customer No." = field("No.");
                    RunPageView = sorting("Bill-to Customer No.");
                    ToolTip = 'Open the list of ongoing jobs.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Service Orders")
                {
                    ApplicationArea = Service;
                    Caption = 'Service Orders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Customer No.");
                    ToolTip = 'Open the list of ongoing service orders.';
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Service;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    RunObject = Page "Customer Service Contracts";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code");
                    ToolTip = 'Open the list of ongoing service contracts.';
                }
                action("Service &Items")
                {
                    ApplicationArea = Service;
                    Caption = 'Service &Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code", "Item No.", "Serial No.");
                    ToolTip = 'View or edit the service items that are registered for the customer.';
                }
            }
        }
        area(creation)
        {
            action(NewBlanketSalesOrder)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Advanced;
                Caption = 'Blanket Sales Order';
                Image = BlanketOrder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Blanket Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a blanket sales order for the customer.';
            }
            action(NewSalesQuote)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Offer items or services to a customer.';
                Visible = not IsOfficeAddin;
            }
            action(NewSalesInvoice)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a sales invoice for the customer.';
                Visible = not IsOfficeAddin;
            }
            action(NewSalesOrder)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = Document;
                RunObject = Page "Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a sales order for the customer.';
                Visible = not IsOfficeAddin;
            }
            action(NewSalesCreditMemo)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Credit Memo';
                Image = CreditMemo;
                RunObject = Page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
                Visible = not IsOfficeAddin;
            }
            action(NewSalesQuoteAddin)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote';
                Image = NewSalesQuote;
                ToolTip = 'Offer items or services to a customer.';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    Rec.CreateAndShowNewQuote;
                end;
            }
            action(NewSalesInvoiceAddin)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                ToolTip = 'Create a sales invoice for the customer.';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    Rec.CreateAndShowNewInvoice;
                end;
            }
            action(NewSalesOrderAddin)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = Document;
                ToolTip = 'Create a sales order for the customer.';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    Rec.CreateAndShowNewOrder;
                end;
            }
            action(NewSalesCreditMemoAddin)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Credit Memo';
                Image = CreditMemo;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    Rec.CreateAndShowNewCreditMemo;
                end;
            }
            action(NewSalesReturnOrder)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Advanced;
                Caption = 'Sales Return Order';
                Image = ReturnOrder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Sales Return Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new sales return order for items or services.';
            }
            action(NewServiceQuote)
            {
                AccessByPermission = TableData "Service Header" = RIM;
                ApplicationArea = Service;
                Caption = 'Service Quote';
                Image = Quote;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Quote";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service quote for the customer.';
            }
            action(NewServiceInvoice)
            {
                AccessByPermission = TableData "Service Header" = RIM;
                ApplicationArea = Service;
                Caption = 'Service Invoice';
                Image = Invoice;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Invoice";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service invoice for the customer.';
            }
            action(NewServiceOrder)
            {
                AccessByPermission = TableData "Service Header" = RIM;
                ApplicationArea = Service;
                Caption = 'Service Order';
                Image = Document;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Order";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service order for the customer.';
            }
            action(NewServiceCreditMemo)
            {
                AccessByPermission = TableData "Service Header" = RIM;
                ApplicationArea = Service;
                Caption = 'Service Credit Memo';
                Image = CreditMemo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Credit Memo";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service credit memo for the customer.';
            }
            action(NewReminder)
            {
                AccessByPermission = TableData "Reminder Header" = RIM;
                ApplicationArea = Advanced;
                Caption = 'Reminder';
                Image = Reminder;
                RunObject = Page Reminder;
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new reminder for the customer.';
            }
            action(NewFinanceChargeMemo)
            {
                AccessByPermission = TableData "Finance Charge Memo Header" = RIM;
                ApplicationArea = Advanced;
                Caption = 'Finance Charge Memo';
                Image = FinChargeMemo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Finance Charge Memo";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new finance charge memo.';
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                Visible = OpenApprovalEntriesExistCurrUser;
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    //   //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                    //   //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = (not OpenApprovalEntriesExist) and EnabledApprovalWorkflowsExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                    //     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // //if //ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) then
                        //     //ApprovalsMgmt.OnSendCustomerForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        // //ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                        //  WorkflowWebhookManagement.FindAndCancel(RecordId);
                    end;
                }
                group(Flow)
                {
                    Caption = 'Flow';
                    action(CreateFlow)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create a Flow';
                        Image = Flow;
                        ToolTip = 'Create a new Flow from a list of relevant Flow templates.';
                        Visible = IsSaaS;

                        trigger OnAction()
                        var
                            FlowServiceManagement: Codeunit "Flow Service Management";
                            FlowTemplateSelector: Page "Flow Service Configuration";
                        begin
                            // Opens page 6400 where the user can use filtered templates to create new flows.
                            // FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetCustomerTemplateFilter);
                            FlowTemplateSelector.Run;
                        end;
                    }
                    action(SeeFlows)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'See my Flows';
                        Image = Flow;
                        RunObject = Page "Flow Service Configuration";
                        ToolTip = 'View and configure Flows that you created.';
                    }
                }
            }
            group(Workflow)
            {
                Caption = 'Workflow';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Create Approval Workflow';
                    Enabled = not EnabledApprovalWorkflowsExist;
                    Image = CreateWorkflow;
                    ToolTip = 'Set up an approval workflow for creating or changing customers, by going through a few pages that will guide you.';

                    trigger OnAction()
                    begin
                        Page.RunModal(Page::"Cust. Approval WF Setup Wizard");
                    end;
                }
                action(ManageApprovalWorkflows)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Manage Approval Workflows';
                    Enabled = EnabledApprovalWorkflowsExist;
                    Image = WorkflowSetup;
                    ToolTip = 'View or edit existing approval workflows for creating or changing customers.';

                    trigger OnAction()
                    var
                        WorkflowManagement: Codeunit "Workflow Management";
                    begin
                        WorkflowManagement.NavigateToWorkflows(Database::Customer, EventFilter);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Templates)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Templates';
                    Image = Template;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Config Templates";
                    RunPageLink = "Table ID" = const(18);
                    ToolTip = 'View or edit customer templates.';
                }
                action(ApplyTemplate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Apply a template to update the entity with your standard settings for a certain type of entity.';

                    trigger OnAction()
                    var
                    //  MiniCustomerTemplate: Record "Mini Customer Template";
                    begin
                        // MiniCustomerTemplate.UpdateCustomerFromTemplate(Rec);
                    end;
                }
                action(SaveAsTemplate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Save as Template';
                    Ellipsis = true;
                    Image = Save;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    ToolTip = 'Save the customer card as a template that can be reused to create new customer cards. Customer templates contain preset information to help you fill fields on customer cards.';

                    trigger OnAction()
                    var
                    // TempMiniCustomerTemplate: Record "Mini Customer Template" temporary;
                    begin
                        // TempMiniCustomerTemplate.SaveAsTemplate(Rec);
                    end;
                }
            }
            action("Post Cash Receipts")
            {
                ApplicationArea = Advanced;
                Caption = 'Post Cash Receipts';
                Ellipsis = true;
                Image = CashReceiptJournal;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Cash Receipt Journal";
                ToolTip = 'Create a cash receipt journal line for the customer, for example, to post a payment receipt.';
            }
            action("Sales Journal")
            {
                ApplicationArea = Advanced;
                Caption = 'Sales Journal';
                Image = Journals;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Journal";
                ToolTip = 'Post any sales transaction for the customer.';
            }
        }
        area(reporting)
        {
            action("Report Customer Detailed Aging")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer Detailed Aging';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'View a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';

                trigger OnAction()
                begin
                    RunReport(Report::"Customer Detailed Aging", Rec."No.");
                end;
            }
            action("Report Customer - Labels")
            {
                ApplicationArea = Advanced;
                Caption = 'Customer - Labels';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category9;
                ToolTip = 'View mailing labels with the customers'' names and addresses.';

                trigger OnAction()
                begin
                    RunReport(Report::"Customer - Labels", Rec."No.");
                end;
            }
            action("Report Customer - Balance to Date")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - Balance to Date';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category9;
                ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';

                trigger OnAction()
                begin
                    RunReport(Report::"Customer - Balance to Date", Rec."No.");
                end;
            }
            action("Report Statement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Statement';
                Image = "Report";
                RunObject = Codeunit "Customer Layout - Statement";
                ToolTip = 'View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.';
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'New Document', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(NewSalesQuote_Promoted; NewSalesQuote)
                {
                }
                actionref(NewSalesInvoice_Promoted; NewSalesInvoice)
                {
                }
                actionref(NewSalesOrder_Promoted; NewSalesOrder)
                {
                }
                actionref(NewSalesCreditMemo_Promoted; NewSalesCreditMemo)
                {
                }
                actionref(NewSalesQuoteAddin_Promoted; NewSalesQuoteAddin)
                {
                }
                actionref(NewSalesInvoiceAddin_Promoted; NewSalesInvoiceAddin)
                {
                }
                actionref(NewSalesOrderAddin_Promoted; NewSalesOrderAddin)
                {
                }
                actionref(NewSalesCreditMemoAddin_Promoted; NewSalesCreditMemoAddin)
                {
                }
                actionref(NewReminder_Promoted; NewReminder)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(CreateFlow_Promoted; CreateFlow)
                {
                }
                actionref(SeeFlows_Promoted; SeeFlows)
                {
                }
                actionref(ApprovalEntries_Promoted; ApprovalEntries)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Prices and Discounts', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category8)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Category9)
            {
                Caption = 'Customer', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref("Bank Accounts_Promoted"; "Bank Accounts")
                {
                }
                actionref(ShipToAddresses_Promoted; ShipToAddresses)
                {
                }
                actionref(Contact_Promoted; Contact)
                {
                }
                actionref("Direct Debit Mandates_Promoted"; "Direct Debit Mandates")
                {
                }
                actionref(CRMSynchronizeNow_Promoted; CRMSynchronizeNow)
                {
                }
                actionref(ManageCRMCoupling_Promoted; ManageCRMCoupling)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
    begin
        CreateCustomerFromTemplate;
        ActivateFields;
        StyleTxt := Rec.SetStyle;
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
            if Rec."No." <> xRec."No." then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;
        //  OpenApprovalEntriesExistCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);

        if FoundationOnly then
            GetSalesPricesAndSalesLineDisc;

        //  CanCancelApprovalForRecord := //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        EventFilter := WorkflowEventHandling.RunWorkflowOnSendCustomerForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnCustomerChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(Database::Customer, EventFilter);

        WorkflowWebhookManagement.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);

        if Rec."No." <> '' then begin
            if ShowCharts then
                CurrPage.AgedAccReceivableChart.Page.UpdateChartForCustomer(Rec."No.");
            if IsOfficeAddin then
                CurrPage.AgedAccReceivableChart2.Page.UpdateChartForCustomer(Rec."No.");
        end;
    end;

    trigger OnAfterGetRecord()
    var
        AgedAccReceivable: Codeunit "Aged Acc. Receivable";
    begin

        //fred:=fred::"5";
        ActivateFields;
        StyleTxt := Rec.SetStyle;
        BalanceExhausted := 10000 <= Rec.CalcCreditLimitLCYExpendedPct;
        DaysPastDueDate := AgedAccReceivable.InvoicePaymentDaysAverage(Rec."No.");
        AttentionToPaidDay := DaysPastDueDate > 0;
    end;

    trigger OnInit()
    var
        ApplicationAreaSetup: Record "Application Area Setup";
    begin
        // FoundationOnly := ApplicationAreaSetup.IsFoundationEnabled;

        SetCustomerNoVisibilityOnFactBoxes;

        ContactEditable := true;

        OpenApprovalEntriesExistCurrUser := true;

        CaptionTxt := CurrPage.Caption;
        SetCaption(CaptionTxt);
        CurrPage.Caption(CaptionTxt);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        //fred:=fred::"5";
        // Rec."Customer Type" := Rec."Customer Type"::Tenant;

        if GuiAllowed then
            if Rec."No." = '' then
                if DocumentNoVisibility.CustomerNoSeriesIsDefault then
                    NewMode := true;
    end;

    trigger OnOpenPage()
    var
        OfficeManagement: Codeunit "Office Management";
        PermissionManager: Codeunit "Permission Manager";
    begin

        //fred:=fred::;
        ActivateFields;

        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;

        SetNoFieldVisible;
        IsOfficeAddin := OfficeManagement.IsAvailable;
        //  IsSaaS := PermissionManager.SoftwareAsAService;

        if FoundationOnly then
            CurrPage.PriceAndLineDisc.Page.InitPage(false);

        ShowCharts := Rec."No." <> '';
        Rec.SetFilter("Date Filter", CustomerMgt.GetCurrentYearFilter);
    end;

    var
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        CalendarMgmt: Codeunit "Calendar Management";
        ////ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CustomerMgt: Codeunit "Customer Mgt.";
        StyleTxt: Text;
        [InDataSet]
        ContactEditable: Boolean;
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        [InDataSet]
        ShowCharts: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        NoFieldVisible: Boolean;
        BalanceExhausted: Boolean;
        AttentionToPaidDay: Boolean;
        IsOfficeAddin: Boolean;
        NoPostedInvoices: Integer;
        NoPostedCrMemos: Integer;
        NoOutstandingInvoices: Integer;
        NoOutstandingCrMemos: Integer;
        Totals: Decimal;
        AmountOnPostedInvoices: Decimal;
        AmountOnPostedCrMemos: Decimal;
        AmountOnOutstandingInvoices: Decimal;
        AmountOnOutstandingCrMemos: Decimal;
        AdjmtCostLCY: Decimal;
        AdjCustProfit: Decimal;
        CustProfit: Decimal;
        AdjProfitPct: Decimal;
        CustInvDiscAmountLCY: Decimal;
        CustPaymentsLCY: Decimal;
        CustSalesLCY: Decimal;
        OverduePaymentsMsg: label 'Overdue Payments as of %1', Comment = 'Overdue Payments as of 27-02-2012';
        DaysPastDueDate: Decimal;
        PostedInvoicesMsg: label 'Posted Invoices (%1)', Comment = 'Invoices (5)';
        CreditMemosMsg: label 'Posted Credit Memos (%1)', Comment = 'Credit Memos (3)';
        OutstandingInvoicesMsg: label 'Ongoing Invoices (%1)', Comment = 'Ongoing Invoices (4)';
        OutstandingCrMemosMsg: label 'Ongoing Credit Memos (%1)', Comment = 'Ongoing Credit Memos (4)';
        ShowMapLbl: label 'Show on Map';
        FoundationOnly: Boolean;
        CanCancelApprovalForRecord: Boolean;
        EnabledApprovalWorkflowsExist: Boolean;
        NewMode: Boolean;
        EventFilter: Text;
        CaptionTxt: Text;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        IsSaaS: Boolean;

    local procedure GetTotalSales(): Decimal
    begin
        NoPostedInvoices := 0;
        NoPostedCrMemos := 0;
        NoOutstandingInvoices := 0;
        NoOutstandingCrMemos := 0;
        Totals := 0;

        AmountOnPostedInvoices := CustomerMgt.CalcAmountsOnPostedInvoices(Rec."No.", NoPostedInvoices);
        AmountOnPostedCrMemos := CustomerMgt.CalcAmountsOnPostedCrMemos(Rec."No.", NoPostedCrMemos);

        AmountOnOutstandingInvoices := CustomerMgt.CalculateAmountsOnUnpostedInvoices(Rec."No.", NoOutstandingInvoices);
        AmountOnOutstandingCrMemos := CustomerMgt.CalculateAmountsOnUnpostedCrMemos(Rec."No.", NoOutstandingCrMemos);

        Totals := AmountOnPostedInvoices + AmountOnPostedCrMemos + AmountOnOutstandingInvoices + AmountOnOutstandingCrMemos;

        CustomerMgt.CalculateStatistic(
          Rec,
          AdjmtCostLCY, AdjCustProfit, AdjProfitPct,
          CustInvDiscAmountLCY, CustPaymentsLCY, CustSalesLCY,
          CustProfit);
        exit(Totals)
    end;

    // local procedure GetAmountOnPostedInvoices(): Decimal
    // begin
    //     exit(AmountOnPostedInvoices)
    // end;

    // local procedure GetAmountOnCrMemo(): Decimal
    // begin
    //     exit(AmountOnPostedCrMemos)
    // end;

    // local procedure GetAmountOnOutstandingInvoices(): Decimal
    // begin
    //     exit(AmountOnOutstandingInvoices)
    // end;

    // local procedure GetAmountOnOutstandingCrMemos(): Decimal
    // begin
    //     exit(AmountOnOutstandingCrMemos)
    // end;

    // local procedure GetMoneyOwedExpected(): Decimal
    // begin
    //     exit(CustomerMgt.CalculateAmountsWithVATOnUnpostedDocuments("No."))
    // end;

    local procedure GetSalesPricesAndSalesLineDisc()
    begin
        if Rec."No." <> CurrPage.PriceAndLineDisc.Page.GetLoadedCustNo then begin
            CurrPage.PriceAndLineDisc.Page.LoadCustomer(Rec);
            CurrPage.PriceAndLineDisc.Page.Update(false);
        end;
    end;

    local procedure ActivateFields()
    begin
        SetSocialListeningFactboxVisibility;
        ContactEditable := Rec."Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    // //SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        // //SocialListeningMgt.GetCustFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.CustomerNoIsVisible;
    end;

    local procedure SetCustomerNoVisibilityOnFactBoxes()
    begin
        // CurrPage.SalesHistSelltoFactBox.Page.SetCustomerNoVisibility(false);
        // CurrPage.SalesHistBilltoFactBox.Page.SetCustomerNoVisibility(false);
        // CurrPage.CustomerStatisticsFactBox.Page.SetCustomerNoVisibility(false);
    end;

    procedure RunReport(ReportNumber: Integer; CustomerNumber: Code[20])
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("No.", CustomerNumber);
        Report.RunModal(ReportNumber, true, true, Customer);
    end;

    local procedure CreateCustomerFromTemplate()
    var
        //MiniCustomerTemplate: Record "Mini Customer Template";
        Customer: Record Customer;
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        EUVATRegistrationNoCheck: Page "EU VAT Registration No Check";
        CustomerRecRef: RecordRef;
    begin
        OnBeforeCreateCustomerFromTemplate(NewMode);

        if NewMode then begin
            // if MiniCustomerTemplate.NewCustomerFromTemplate(Customer) then begin
            //     if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then
            //         if Customer."Validate EU Vat Reg. No." then begin
            //             EUVATRegistrationNoCheck.SetRecordRef(Customer);
            //             Commit;
            //             EUVATRegistrationNoCheck.RunModal;
            //             EUVATRegistrationNoCheck.GetRecordRef(CustomerRecRef);
            //             CustomerRecRef.SetTable(Customer);
            //         end;

            //     Rec.Copy(Customer);
            //     CurrPage.Update;
            // end;
            NewMode := false;
        end;
    end;

    [IntegrationEvent(false, false)]

    procedure SetCaption(var InText: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateCustomerFromTemplate(var NewMode: Boolean)
    begin
    end;
}

#pragma implicitwith restore

