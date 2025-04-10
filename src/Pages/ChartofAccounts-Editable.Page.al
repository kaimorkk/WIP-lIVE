Page 52193591 "Chart of Accounts - Editable"
{
    Caption = 'Chart of Accounts';
    CardPageID = "G/L Account Card";
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "G/L Account";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = NameIndent;
                IndentationControls = Name;
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = NoEmphasize;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field(IncomeBalance; "Income/Balance")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(DirectPosting; "Direct Posting")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Totaling; Totaling)
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GLaccList: Page "G/L Account List";
                    begin
                        GLaccList.LookupMode(true);
                        if not (GLaccList.RunModal = Action::LookupOK) then
                            exit(false);

                        Text := GLaccList.GetSelectionFilter;
                        exit(true);
                    end;
                }
                field(GenPostingType; "Gen. Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field(GenBusPostingGroup; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(GenProdPostingGroup; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VATProdPostingGroup; "VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NetChange; "Net Change")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                }
                field(BalanceatDate; "Balance at Date")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Visible = false;
                }
                field(Control18; Balance)
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                }
                field(AdditionalCurrencyNetChange; "Additional-Currency Net Change")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Visible = false;
                }
                field(AddCurrencyBalanceatDate; "Add.-Currency Balance at Date")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Visible = false;
                }
                field(AdditionalCurrencyBalance; "Additional-Currency Balance")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    Visible = false;
                }
                field(ConsolDebitAcc; "Consol. Debit Acc.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ConsolCreditAcc; "Consol. Credit Acc.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CostTypeNo; "Cost Type No.")
                {
                    ApplicationArea = Basic;
                }
                field(ConsolTranslationMethod; "Consol. Translation Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(DefaultICPartnerGLAccNo; "Default IC Partner G/L Acc. No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(Control1905532107; "Dimensions FactBox")
            {
                SubPageLink = "Table ID" = const(15),
                              "No." = field("No.");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
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
            group(Account)
            {
                Caption = 'A&ccount';
                Image = ChartOfAccounts;
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = GLRegisters;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "General Ledger Entries";
                    RunPageLink = "G/L Account No." = field("No.");
                    RunPageView = sorting("G/L Account No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const("G/L Account"),
                                  "No." = field("No.");
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
                        RunPageLink = "Table ID" = const(15),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            GLAcc: Record "G/L Account";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(GLAcc);
                            // DefaultDimMultiple.SetMultiGLAcc(GLAcc);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(ExtendedTexts)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xtended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text List";
                    RunPageLink = "Table Name" = const("G/L Account"),
                                  "No." = field("No.");
                    RunPageView = sorting("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                }
                action(ReceivablesPayables)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receivables-Payables';
                    Image = ReceivablesPayables;
                    RunObject = Page "Receivables-Payables";
                }
                action(WhereUsedList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Where-Used List';
                    Image = Track;

                    trigger OnAction()
                    var
                        CalcGLAccWhereUsed: Codeunit "Calc. G/L Acc. Where-Used";
                    begin
                        CalcGLAccWhereUsed.CheckGLAcc("No.");
                    end;
                }
            }
            group(Balance)
            {
                Caption = '&Balance';
                Image = Balance;
                action(GLAccountBalance)
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L &Account Balance';
                    Image = GLAccountBalance;
                    RunObject = Page "G/L Account Balance";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                  "Business Unit Filter" = field("Business Unit Filter");
                }
                action(GLBalance)
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L &Balance';
                    Image = GLBalance;
                    RunObject = Page "G/L Balance";
                    RunPageOnRec = true;
                }
                action(GLBalancebyDimension)
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Balance by &Dimension';
                    Image = GLBalanceDimension;
                    RunObject = Page "G/L Balance by Dimension";
                }
                separator(Action52)
                {
                    Caption = '';
                }
                action(GLAccountBalanceBudget)
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account Balance/Bud&get';
                    Image = Period;
                    RunObject = Page "G/L Account Balance/Budget";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                  "Business Unit Filter" = field("Business Unit Filter"),
                                  "Budget Filter" = field("Budget Filter");
                }
                action(GLBalanceBudget)
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Balance/B&udget';
                    Image = ChartOfAccounts;
                    RunObject = Page "G/L Balance/Budget";
                    RunPageOnRec = true;
                }
                separator(Action55)
                {
                }
                action(ChartofAccountsOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Chart of Accounts &Overview';
                    Image = Accounts;
                    RunObject = Page "Chart of Accounts Overview";
                }
            }
            action(GLRegister)
            {
                ApplicationArea = Basic;
                Caption = 'G/L Register';
                Image = GLRegisters;
                RunObject = Page "G/L Registers";
            }
        }
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(IndentChartOfAccounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Indent Chart of Accounts';
                    Image = IndentChartOfAccounts;
                    RunObject = Codeunit "G/L Account-Indent";
                }
            }
            group(PeriodicActivities)
            {
                Caption = 'Periodic Activities';
                action(RecurringGeneralJournal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Recurring General Journal';
                    Image = Journal;
                    RunObject = Page "Recurring General Journal";
                }
                action(CloseIncomeStatement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Income Statement';
                    Image = CloseYear;
                    RunObject = Report "Close Income Statement";
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
                RunObject = Report "Detail Trial Balance";
            }
            action(TrialBalance)
            {
                ApplicationArea = Basic;
                Caption = 'Trial Balance';
                Image = "Report";
                RunObject = Report "Trial Balance";
            }
            action(TrialBalancebyPeriod)
            {
                ApplicationArea = Basic;
                Caption = 'Trial Balance by Period';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Trial Balance by Period";
            }
            action(Action1900210206)
            {
                ApplicationArea = Basic;
                Caption = 'G/L Register';
                Image = GLRegisters;
                RunObject = Report "G/L Register";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(IndentChartOfAccounts_Promoted; IndentChartOfAccounts)
                {
                }
                actionref(RecurringGeneralJournal_Promoted; RecurringGeneralJournal)
                {
                }
                actionref(CloseIncomeStatement_Promoted; CloseIncomeStatement)
                {
                }
                actionref(GLRegister_Promoted; GLRegister)
                {
                }
            }
            group(Category_Report)
            {
                actionref(DetailTrialBalance_Promoted; DetailTrialBalance)
                {
                }
                actionref(TrialBalance_Promoted; TrialBalance)
                {
                }
                actionref(Action1900210206_Promoted; Action1900210206)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        NoEmphasize := "Account Type" <> "account type"::Posting;
        NameIndent := Indentation;
        NameEmphasize := "Account Type" <> "account type"::Posting;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetupNewGLAcc(xRec, BelowxRec);
    end;

    var

        NoEmphasize: Boolean;

        NameEmphasize: Boolean;

        NameIndent: Integer;
}

