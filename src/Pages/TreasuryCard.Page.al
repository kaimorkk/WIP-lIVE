Page 52193557 "Treasury Card"
{
    Caption = 'Treasury Card';
    PageType = Card;
    SourceTable = "Bank Account";
    SourceTableView = where("Account Type" = const(Treasury));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(BankBranchNo; "Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNo; "Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Control22; Balance)
                {
                    ApplicationArea = Basic;
                }
                field(BalanceLCY; "Balance (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(MinBalance; "Min. Balance")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(CashierID; "Cashier ID")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumTellerWithholding; "Maximum Teller Withholding")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(PostCodeCity; "Post Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Code/City';
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000000; Contact)
                {
                    ApplicationArea = Basic;
                }
                field("<Phone No.1>"; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo; "Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(EMail; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(HomePage; "Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(TransitNo; "Transit No.")
                {
                    ApplicationArea = Basic;
                }
                field(LastStatementNo; "Last Statement No.")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceLastStatement; "Balance Last Statement")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccPostingGroup; "Bank Acc. Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Links)
            {
                Visible = true;
            }
            systempart(Control1000000007; Notes)
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
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Bank Account Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const("Bank Account"),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(270),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action(Balance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Balance';
                    Image = Balance;
                    RunObject = Page "Bank Account Balance";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
                action(Statements)
                {
                    ApplicationArea = Basic;
                    Caption = 'St&atements';
                    RunObject = Page "Bank Account Statement List";
                    RunPageLink = "Bank Account No." = field("No.");
                }
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    RunObject = Page "Bank Account Ledger Entries";
                    RunPageLink = "Bank Account No." = field("No.");
                    RunPageView = sorting("Bank Account No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(CheckLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Chec&k Ledger Entries';
                    Image = CheckLedger;
                    RunObject = Page "Check Ledger Entries";
                    RunPageLink = "Bank Account No." = field("No.");
                    RunPageView = sorting("Bank Account No.");
                }
                action(Contact)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcFields("Check Report Name");
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Account Type" := "account type"::Treasury;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if not MapMgt.TestSetup then
            MapPointVisible := false;

        //Filter based on branch
        //IF UsersID.GET(USERID) THEN BEGIN
        //IF UsersID.Branch <> '' THEN
        //SETRANGE("Global Dimension 2 Code",UsersID.Branch);
        //END;
        //Filter based on branch
    end;

    var
        UsersID: Record User;

        MapPointVisible: Boolean;
}

