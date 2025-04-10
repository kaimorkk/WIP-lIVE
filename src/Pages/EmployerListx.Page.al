Page 52193563 "Employer Listx"
{
    ApplicationArea = Basic;
    Caption = 'Employer List';
    CardPageID = "Employers Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bank Account";
    SourceTableView = where(Type=filter(Bank),
                            "Account Type"=filter(Employer));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;"Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CountryRegionCode;"Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PhoneNo;"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Control23;Contact)
                {
                    ApplicationArea = Basic;
                }
                field(NoOfEmployees;"No Of Employees")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedContribution;"Expected Contribution")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000001;Balance)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1905532107;"Dimensions FactBox")
            {
                SubPageLink = "Table ID"=const(270),
                              "No."=field("No.");
                Visible = false;
            }
            systempart(Control1900383207;Links)
            {
            }
            systempart(Control1905767507;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(BankAcc)
            {
                Caption = '&Bank Acc.';
                Image = Bank;
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Bank Account Statistics";
                    RunPageLink = "No."=field("No."),
                                  "Date Filter"=field("Date Filter"),
                                  "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=field("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=const("Bank Account"),
                                  "No."=field("No.");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=const(270),
                                      "No."=field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            BankAcc: Record "Bank Account";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(BankAcc);
                            // DefaultDimMultiple.SetMultiBankAcc(BankAcc);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(Balance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Balance';
                    Image = Balance;
                    RunObject = Page "Bank Account Balance";
                    RunPageLink = "No."=field("No."),
                                  "Date Filter"=field("Date Filter"),
                                  "Global Dimension 1 Filter"=field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=field("Global Dimension 2 Filter");
                }
                action(Statements)
                {
                    ApplicationArea = Basic;
                    Caption = 'St&atements';
                    Image = List;
                    RunObject = Page "Bank Account Statement List";
                    RunPageLink = "Bank Account No."=field("No.");
                }
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = BankAccountLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Bank Account Ledger Entries";
                    RunPageLink = "Bank Account No."=field("No.");
                    RunPageView = sorting("Bank Account No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(CheckLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Chec&k Ledger Entries';
                    Image = CheckLedger;
                    RunObject = Page "Check Ledger Entries";
                    RunPageLink = "Bank Account No."=field("No.");
                    RunPageView = sorting("Bank Account No.");
                }
                action(Contact)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';
                    Image = ContactPerson;

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
            }
        }
        area(reporting)
        {
            action(DetailTrialBalance)
            {
                ApplicationArea = Basic;
                Caption = 'Detail Trial Balance';
                Image = "Report";
                RunObject = Report "Bank Acc. - Detail Trial Bal.";
            }
            action(CheckDetails)
            {
                ApplicationArea = Basic;
                Caption = 'Check Details';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Bank Account - Check Details";
            }
            action(TrialBalancebyPeriod)
            {
                ApplicationArea = Basic;
                Caption = 'Trial Balance by Period';
                Image = "Report";
                RunObject = Report "Trial Balance by Period";
            }
            action(TrialBalance)
            {
                ApplicationArea = Basic;
                Caption = 'Trial Balance';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Trial Balance";
            }
            action(BankAccountStatements)
            {
                ApplicationArea = Basic;
                Caption = 'Bank Account Statements';
                Image = "Report";
                RunObject = Report "Bank Account Statement";
                ToolTip = 'View, print, or save statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref(Balance_Promoted; Balance)
                {
                }
            }
            group(Category_Report)
            {
                actionref(DetailTrialBalance_Promoted; DetailTrialBalance)
                {
                }
                actionref(TrialBalancebyPeriod_Promoted; TrialBalancebyPeriod)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcFields("Check Report Name");
    end;
}

