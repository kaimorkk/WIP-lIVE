Page 52193537 "Posted Transactions List"
{
    ApplicationArea = Basic;
    Caption = 'Posted Transactions List';
    CardPageID = "Posted Transactions List";
    Editable = false;
    PageType = List;
    SourceTable = Transactions;
    SourceTableView = where(Posted = filter(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDate; "Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionTime; "Transaction Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountDescription; "Account Description")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyDenominationalTotals; "Currency Denominational Totals")
                {
                    ApplicationArea = Basic;
                }
                field("10MalotiNotes"; "10 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("20MalotiNotes"; "20 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("50MalotiNotes"; "50 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("100MalotiNotes"; "100 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("200MalotiNotes"; "200 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("1000MalotiNotes"; "1000 Maloti Notes")
                {
                    ApplicationArea = Basic;
                }
                field("5Lisente"; "5 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("10Lisente"; "10 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("20Lisente"; "20 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("50Lisente"; "50 Lisente")
                {
                    ApplicationArea = Basic;
                }
                field("1Loti"; "1 Loti")
                {
                    ApplicationArea = Basic;
                }
                field("2Maloti"; "2 Maloti")
                {
                    ApplicationArea = Basic;
                }
                field("5Maloti"; "5 Maloti")
                {
                    ApplicationArea = Basic;
                }
                field("10RandNotes"; "10 Rand Notes")
                {
                    ApplicationArea = Basic;
                }
                field("20RandNotes"; "20 Rand Notes")
                {
                    ApplicationArea = Basic;
                }
                field("50RandNotes"; "50 Rand Notes")
                {
                    ApplicationArea = Basic;
                }
                field("100RandNotes"; "100 Rand Notes")
                {
                    ApplicationArea = Basic;
                }
                field("200RandNotes"; "200 Rand Notes")
                {
                    ApplicationArea = Basic;
                }
                field("1000RandNotes"; "1000 Rand Notes")
                {
                    ApplicationArea = Basic;
                }
                field("5Cents"; "5 Cents")
                {
                    ApplicationArea = Basic;
                }
                field("10Cents"; "10 Cents")
                {
                    ApplicationArea = Basic;
                }
                field("20Cents"; "20 Cents")
                {
                    ApplicationArea = Basic;
                }
                field("50Cents"; "50 Cents")
                {
                    ApplicationArea = Basic;
                }
                field("1Rand"; "1 Rand")
                {
                    ApplicationArea = Basic;
                }
                field("2Rand"; "2 Rand")
                {
                    ApplicationArea = Basic;
                }
                field("5Rand"; "5 Rand")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("<Action16>")
            {
                Caption = 'Accounts';
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = VendorLedger;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = field("No. Series");
                    RunPageView = sorting("Vendor No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Vendor),
                                  "No." = field("No. Series");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(23),
                                      "No." = field("No. Series");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            Vend: Record Vendor;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Vend);
                            // //DefaultDimMultiple.SetMultiVendor(Vend);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(BankAccounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    RunObject = Page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = field("No. Series");
                }
                action(OrderAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Addresses';
                    RunObject = Page "Order Address List";
                    RunPageLink = "Vendor No." = field("No. Series");
                }
                action(Contact)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';

                    trigger OnAction()
                    begin
                        //ShowContact;
                    end;
                }
                separator(Action55)
                {
                }
            }
        }
        area(creation)
        {
        }
        area(processing)
        {
            action(PaymentJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Payment Journal';
                Image = PaymentJournal;
                RunObject = Page "Payment Journal";
            }
            action(PurchaseJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Journal';
                Enabled = false;
                Image = Journals;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Journal";
                Visible = false;
            }
        }
        area(reporting)
        {
            action("<Action1900518506>")
            {
                ApplicationArea = Basic;
                Caption = 'Accounts - List';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                // RunObject = Report UnknownReport51507678;
            }
            action("<Action1906328906>")
            {
                ApplicationArea = Basic;
                Caption = 'Account Register';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor Register";
            }
            action("<Action1900639206>")
            {
                ApplicationArea = Basic;
                Caption = 'Account - Detail Trial Balance';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Detail Trial Balance";
            }
            action("<Action1905685906>")
            {
                ApplicationArea = Basic;
                Caption = 'Account - Summary Aging';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Summary Aging";
            }
            action("<Action1906294906>")
            {
                ApplicationArea = Basic;
                Caption = 'Account - Order Summary';
                RunObject = Report "Vendor - Order Summary";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PaymentJournal_Promoted; PaymentJournal)
                {
                }
                actionref(LedgerEntries_Promoted; LedgerEntries)
                {
                }
            }
            group(Category_Report)
            {
                actionref("<Action1906294906>_Promoted"; "<Action1906294906>")
                {
                }
            }
        }
    }


    procedure GetSelectionFilter(): Code[80]
    var
        Vend: Record Vendor;
        FirstVend: Code[30];
        LastVend: Code[30];
        SelectionFilter: Code[250];
        VendCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(Vend);
        VendCount := Vend.Count;
        if VendCount > 0 then begin
            Vend.Find('-');
            while VendCount > 0 do begin
                VendCount := VendCount - 1;
                Vend.MarkedOnly(false);
                FirstVend := Vend."No.";
                LastVend := FirstVend;
                More := (VendCount > 0);
                while More do
                    if Vend.Next = 0 then
                        More := false
                    else
                        if not Vend.Mark then
                            More := false
                        else begin
                            LastVend := Vend."No.";
                            VendCount := VendCount - 1;
                            if VendCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstVend = LastVend then
                    SelectionFilter := SelectionFilter + FirstVend
                else
                    SelectionFilter := SelectionFilter + FirstVend + '..' + LastVend;
                if VendCount > 0 then begin
                    Vend.MarkedOnly(true);
                    Vend.Next;
                end;
            end;
        end;
        exit(SelectionFilter);
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;
}

