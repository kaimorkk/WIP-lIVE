Page 52193543 "Account Types List"
{
    ApplicationArea = Basic;
    Caption = 'Account Types List';
    CardPageID = "Account Types";
    Editable = false;
    PageType = List;
    SourceTable = "Account Types";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(MinimumBalance; "Minimum Balance")
                {
                    ApplicationArea = Basic;
                }
                field(ClosureFee; "Closure Fee")
                {
                    ApplicationArea = Basic;
                }
                field(FeeBelowMinimumBalance; "Fee Below Minimum Balance")
                {
                    ApplicationArea = Basic;
                }
                field(DormancyPeriodM; "Dormancy Period (M)")
                {
                    ApplicationArea = Basic;
                }
                field(InterestCalcMinBalance; "Interest Calc Min Balance")
                {
                    ApplicationArea = Basic;
                }
                field(InterestCalculationMethod; "Interest Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field(EarnsInterest; "Earns Interest")
                {
                    ApplicationArea = Basic;
                }
                field(InterestRate; "Interest Rate")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalInterval; "Withdrawal Interval")
                {
                    ApplicationArea = Basic;
                }
                field(BusinessAccServiceCharge; "Business Acc Service Charge")
                {
                    ApplicationArea = Basic;
                }
                field(PersonalAccMaintenenceFee; "Personal Acc Maintenence Fee")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumInterestPeriodM; "Minimum Interest Period (M)")
                {
                    ApplicationArea = Basic;
                }
                field(RequiresClosureNotice; "Requires Closure Notice")
                {
                    ApplicationArea = Basic;
                }
                field(EnteredBy; "Entered By")
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
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(ModifiedBy; "Modified By")
                {
                    ApplicationArea = Basic;
                }
                field(RejectAppPendingPeriod; "Reject App. Pending Period")
                {
                    ApplicationArea = Basic;
                }
                field(MaintenenceDuration; "Maintenence Duration")
                {
                    ApplicationArea = Basic;
                }
                field(OverdraftCharge; "Overdraft Charge")
                {
                    ApplicationArea = Basic;
                }
                field(ChargeClosureBeforeMaturity; "Charge Closure Before Maturity")
                {
                    ApplicationArea = Basic;
                }
                field(PostingGroup; "Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
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
                Caption = '&Account Type';
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Enabled = false;
                    Image = VendorLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = field("No. Series");
                    RunPageView = sorting("Vendor No.");
                    ShortCutKey = 'Ctrl+F7';
                    Visible = false;
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
                separator(Action55)
                {
                }
            }
            group("<Action23>")
            {
                Caption = '&Loan Types';
            }
            action("<Action1900518506>")
            {
                ApplicationArea = Basic;
                Caption = 'Account Type - List';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - List";
            }
        }
        area(Promoted)
        {
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

