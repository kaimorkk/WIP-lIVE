Page 52193558 "EFT List"
{
    Caption = 'EFT List';
    // CardPageID = "EFT Card";
    Editable = false;
    PageType = List;
    SourceTable = "EFT Header";

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
                field(Transferred; Transferred)
                {
                    ApplicationArea = Basic;
                }
                field(DateTransferred; "Date Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(TimeTransferred; "Time Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(TransferredBy; "Transferred By")
                {
                    ApplicationArea = Basic;
                }
                field(DateEntered; "Date Entered")
                {
                    ApplicationArea = Basic;
                }
                field(TimeEntered; "Time Entered")
                {
                    ApplicationArea = Basic;
                }
                field(EnteredBy; "Entered By")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(PayeeBankName; "Payee Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(BankNo; "Bank  No")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryProcessingNo; "Salary Processing No.")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryOptions; "Salary Options")
                {
                    ApplicationArea = Basic;
                }
                field(Total; Total)
                {
                    ApplicationArea = Basic;
                }
                field(TotalCount; "Total Count")
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
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = field("No. Series");
                Visible = false;
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
            group(Vendor)
            {
                Caption = 'Ven&dor';
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
                            ////DefaultDimMultiple.SetMultiVendor(Vend);
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
                Image = Journals;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Journal";
            }
        }
        area(reporting)
        {
            action(VendorList)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - List';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - List";
            }
            action(VendorRegister)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Register';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor Register";
            }
            action(VendorDetailTrialBalance)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Detail Trial Balance';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Detail Trial Balance";
            }
            action(VendorSummaryAging)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Summary Aging';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Summary Aging";
            }
            action(VendorOrderSummary)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Order Summary';
                RunObject = Report "Vendor - Order Summary";
            }
            action(VendorOrderDetail)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Order Detail';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Order Detail";
            }
            action(VendorPurchaseList)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Purchase List';
                RunObject = Report "Vendor - Purchase List";
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
                actionref(VendorOrderSummary_Promoted; VendorOrderSummary)
                {
                }
                actionref(VendorPurchaseList_Promoted; VendorPurchaseList)
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

