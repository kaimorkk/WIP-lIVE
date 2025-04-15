Page 52193494 "General Journal - Not Posted"
{
    AutoSplitKey = true;
    Caption = 'General Journal';
    DataCaptionExpression = DataCaption;
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Gen. Journal Line";
    // SourceTableView = sorting("Document No.", "Posting Date")
    //                   where(Status = filter(<> Verified));

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                ApplicationArea = Basic;
                Caption = 'Batch Name';
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord;
                    GenJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin
                    GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(Control1)
            {
                field(PostingDate; "Posting Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                    Visible = false;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(IncomingDocumentEntryNo; "Incoming Document Entry No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if "Incoming Document Entry No." > 0 then
                            Hyperlink(GetIncomingDocumentURL);
                    end;
                }
                field(ExternalDocumentNo; "External Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AppliestoExtDocNo; "Applies-to Ext. Doc. No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        SetUserInteractions;
                    end;
                }
                field(AccountNo; "Account No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        ShowShortcutDimCode(ShortcutDimCode);
                        SetUserInteractions;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(PayerInformation; "Payer Information")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                    Visible = false;
                }
                field(TransactionInformation; "Transaction Information")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                    Visible = false;
                }
                field(BusinessUnitCode; "Business Unit Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(SalespersPurchCode; "Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CampaignNo; "Campaign No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                    AssistEdit = true;
                    Visible = false;

                    trigger OnAssistEdit()
                    begin
                        ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Posting Date");
                        if ChangeExchangeRate.RunModal = Action::OK then
                            Validate("Currency Factor", ChangeExchangeRate.GetParameter);

                        Clear(ChangeExchangeRate);
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
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(DebitAmount; "Debit Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CreditAmount; "Credit Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VATAmount; "VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VATDifference; "VAT Difference")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BalVATAmount; "Bal. VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BalVATDifference; "Bal. VAT Difference")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BalAccountType; "Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(BalAccountNo; "Bal. Account No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field(BalGenPostingType; "Bal. Gen. Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field(BalGenBusPostingGroup; "Bal. Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(BalGenProdPostingGroup; "Bal. Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(BalVATBusPostingGroup; "Bal. VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BalVATProdPostingGroup; "Bal. VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BilltoPaytoNo; "Bill-to/Pay-to No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShiptoOrderAddressCode; "Ship-to/Order Address Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode4; ShortcutDimCode[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode6; ShortcutDimCode[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode7; ShortcutDimCode[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode8; ShortcutDimCode[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field(PaymentTermsCode; "Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AppliedAutomatically; "Applied Automatically")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Applied; IsApplied)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AppliestoDocType; "Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AppliestoDocNo; "Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AppliestoID; "Applies-to ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(OnHold; "On Hold")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BankPaymentType; "Bank Payment Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ReasonCode; "Reason Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control30)
            {
                fixed(Control1901776101)
                {
                    group(AccountName)
                    {
                        Caption = 'Account Name';
                        field(AccName; AccName)
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                        }
                    }
                    group(BalAccountName)
                    {
                        Caption = 'Bal. Account Name';
                        field(BalAccName; BalAccName)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Bal. Account Name';
                            Editable = false;
                        }
                    }
                    group(Control1902759701)
                    {
                        Caption = 'Balance';
                        field(Balance; Balance + "Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            Visible = BalanceVisible;
                        }
                    }
                    group(Control1901652501)
                    {
                        Caption = 'Total Balance';
                        field(TotalBalance; TotalBalance + "Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Total Balance';
                            Editable = false;
                            Visible = TotalBalanceVisible;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control1900919607; "Dimension Set Entries FactBox")
            {
                SubPageLink = "Dimension Set ID" = field("Dimension Set ID");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Line)
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                        CurrPage.SaveRecord;
                    end;
                }
            }
            group(Account)
            {
                Caption = 'A&ccount';
                Image = ChartOfAccounts;
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Codeunit "Gen. Jnl.-Show Card";
                    ShortCutKey = 'Shift+F7';
                }
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = GLRegisters;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Codeunit "Gen. Jnl.-Show Entries";
                    ShortCutKey = 'Ctrl+F7';
                }
            }
        }
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(RenumberDocumentNumbers)
                {
                    ApplicationArea = Basic;
                    Caption = 'Renumber Document Numbers';
                    Image = EditLines;

                    trigger OnAction()
                    begin
                        RenumberDocumentNo
                    end;
                }
                action(InsertConvLCYRndgLines)
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert Conv. LCY Rndg. Lines';
                    Image = InsertCurrency;
                    RunObject = Codeunit "Adjust Gen. Journal Balance";
                }
                separator(Action107)
                {
                    Caption = '-';
                }
                action(GetStandardJournals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Get Standard Journals';
                    Ellipsis = true;
                    Image = GetStandardJournal;

                    trigger OnAction()
                    var
                        StdGenJnl: Record "Standard General Journal";
                    begin
                        StdGenJnl.FilterGroup := 2;
                        StdGenJnl.SetRange("Journal Template Name", "Journal Template Name");
                        StdGenJnl.FilterGroup := 0;

                        if Page.RunModal(Page::"Standard General Journals", StdGenJnl) = Action::LookupOK then begin
                            StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl, CurrentJnlBatchName);
                            Message(Text000, StdGenJnl.Code);
                        end;

                        CurrPage.Update(true);
                    end;
                }
                action(SaveAsStandardJournal)
                {
                    ApplicationArea = Basic;
                    Caption = '&Save as Standard Journal';
                    Ellipsis = true;
                    Image = SaveasStandardJournal;

                    trigger OnAction()
                    var
                        GenJnlBatch: Record "Gen. Journal Batch";
                        GeneralJnlLines: Record "Gen. Journal Line";
                        StdGenJnl: Record "Standard General Journal";
                        SaveAsStdGenJnl: Report "Save as Standard Gen. Journal";
                    begin
                        GeneralJnlLines.SetFilter("Journal Template Name", "Journal Template Name");
                        GeneralJnlLines.SetFilter("Journal Batch Name", CurrentJnlBatchName);
                        CurrPage.SetSelectionFilter(GeneralJnlLines);
                        GeneralJnlLines.CopyFilters(Rec);

                        GenJnlBatch.Get("Journal Template Name", CurrentJnlBatchName);
                        SaveAsStdGenJnl.Initialise(GeneralJnlLines, GenJnlBatch);
                        SaveAsStdGenJnl.RunModal;
                        if not SaveAsStdGenJnl.GetStdGeneralJournal(StdGenJnl) then
                            exit;

                        Message(Text001, StdGenJnl.Code);
                    end;
                }
                action(TestReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintGenJnlLine(Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Rec);
                        CurrentJnlBatchName := GetRangemax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action(PostandPrint)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post+Print", Rec);
                        CurrentJnlBatchName := GetRangemax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
            group(Bank)
            {
                Caption = 'B&ank';
                action(ImportBankStatement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Bank Statement';
                    Image = Import;
                    Visible = false;

                    trigger OnAction()
                    var
                        ImportBankStatement: Codeunit "Import Bank Statement";
                    begin
                        if FindLast then;
                        // ImportBankStatement.SelectAndImportBankStatementGL(Rec);
                    end;
                }
                action(ShowStatementLineDetails)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Statement Details';
                    Image = ExternalDocument;
                    RunObject = Page "Bank Statement Line Details";
                    // RunPageLink = "Posting Exch. No."=field("Posting Exch. Entry No."),
                    //               "Line No."=field("Posting Exch. Line No.");
                    Visible = false;
                }
                action(Reconcile)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reconcile';
                    Image = Reconcile;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction()
                    begin
                        GLReconcile.SetGenJnlLine(Rec);
                        GLReconcile.Run;
                    end;
                }
            }
            group(Application)
            {
                Caption = 'Application';
                action("Apply Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Manually';
                    Ellipsis = true;
                    Image = ApplyEntries;
                    RunObject = Codeunit "Gen. Jnl.-Apply";
                    ShortCutKey = 'Shift+F11';
                }
                action(Match)
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Automatically';
                    Image = MapAccounts;
                    RunObject = Codeunit "Match General Journal Lines";
                }
                action(AddMappingRule)
                {
                    ApplicationArea = Basic;
                    Caption = 'Map Text to Account';
                    Image = CheckRulesSyntax;

                    trigger OnAction()
                    var
                        AccountMapping: Record "Text-to-Account Mapping";
                    begin
                        AccountMapping.InsertRec(Rec);
                    end;
                }
            }
            group(Payroll)
            {
                Caption = 'Payro&ll';
                action(ImportPayrollTransaction)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Payroll Transaction';
                    Image = Import;
                    Visible = false;

                    trigger OnAction()
                    var
                        GeneralLedgerSetup: Record "General Ledger Setup";
                        ImportPayrollTransaction: Codeunit "Import Payroll Transaction";
                    begin
                        GeneralLedgerSetup.Get;
                        GeneralLedgerSetup.TestField("Payroll Trans. Import Format");
                        if FindLast then;
                        ImportPayrollTransaction.SelectAndImportPayrollDataToGL(Rec, GeneralLedgerSetup."Payroll Trans. Import Format");
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Post_Promoted; Post)
                {
                }
                actionref(PostandPrint_Promoted; PostandPrint)
                {
                }
                actionref(GetStandardJournals_Promoted; GetStandardJournals)
                {
                }
                actionref(SaveAsStandardJournal_Promoted; SaveAsStandardJournal)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Bank', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(ImportBankStatement_Promoted; ImportBankStatement)
                {
                }
                actionref(ShowStatementLineDetails_Promoted; ShowStatementLineDetails)
                {
                }
                actionref(Reconcile_Promoted; Reconcile)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Application', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Match_Promoted; Match)
                {
                }
                actionref(AddMappingRule_Promoted; AddMappingRule)
                {
                }
                actionref("Apply Entries_Promoted"; "Apply Entries")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Payroll', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(ImportPayrollTransaction_Promoted; ImportPayrollTransaction)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        UpdateBalance;
    end;

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        SetUserInteractions;
    end;

    trigger OnInit()
    begin
        TotalBalanceVisible := true;
        BalanceVisible := true;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        SetUserInteractions;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UpdateBalance;
        SetUpNewLine(xRec, Balance, BelowxRec);
        Clear(ShortcutDimCode);
        Clear(AccName);
        SetUserInteractions;
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        BalAccName := '';
        OpenedFromBatch := ("Journal Batch Name" <> '') and ("Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := "Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            exit;
        end;
        GenJnlManagement.TemplateSelection(Page::"General Journal", 0, false, Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        GLReconcile: Page Reconciliation;
        GenJnlManagement: Codeunit GenJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[10];
        AccName: Text[50];
        BalAccName: Text[50];
        Balance: Decimal;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        Text000: label 'General Journal lines have been successfully inserted from Standard General Journal %1.';
        Text001: label 'Standard General Journal %1 has been successfully created.';
        OpenedFromBatch: Boolean;

        BalanceVisible: Boolean;

        TotalBalanceVisible: Boolean;
        StyleTxt: Text;

    local procedure UpdateBalance()
    begin
        GenJnlManagement.CalcBalance(Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
        BalanceVisible := ShowBalance;
        TotalBalanceVisible := ShowTotalBalance;
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;


    procedure SetUserInteractions()
    begin
        StyleTxt := GetStyle;
    end;
}

