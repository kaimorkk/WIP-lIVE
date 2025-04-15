Page 52193681 "Employers Card"
{
    Caption = 'Employers Card';
    PageType = Card;
    SourceTable = "Bank Account";
    SourceTableView = where(Type = filter(Bank),
                            "Account Type" = filter(Employer));

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
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; "Post Code")
                {
                    ApplicationArea = Basic;
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
                field(Control18; Contact)
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
                    Importance = Promoted;
                }
                field(BalanceLCY; "Balance (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(MinBalance; "Min. Balance")
                {
                    ApplicationArea = Basic;
                }
                field(OurContactCode; "Our Contact Code")
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


            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FaxNo; "Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(EMail; "E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(HomePage; "Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field(BalanceLastStatement; "Balance Last Statement")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        if "Balance Last Statement" <> xRec."Balance Last Statement" then
                            if not Confirm(Text001, false, "No.") then
                                Error(Text002);
                    end;
                }
                field(BankAccPostingGroup; "Bank Acc. Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
            }
            // part(Control1000000001; "Member List - Emp")
            // {
            //     Caption = 'Members';
            //     SubPageLink = "Employer Code" = field("No.");
            // }
        }
        area(factboxes)
        {
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
                    Image = "Report";
                    RunObject = Page "Bank Account Statement List";
                    RunPageLink = "Bank Account No." = field("No.");
                }
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = BankAccountLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
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
                    Image = ContactPerson;
                    Visible = ContactActionVisible;

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
                separator(Action81)
                {
                }
                action(OnlineMap)
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        DisplayMap;
                    end;
                }
            }
            action(BankAccountReconciliations)
            {
                ApplicationArea = Basic;
                Caption = 'Bank Account Reconciliations';
                Image = BankAccountRec;
                RunObject = Page "Bank Acc. Reconciliation List";
                RunPageLink = "Bank Account No." = field("No.");
                RunPageView = sorting("Bank Account No.");
            }
            action(EmployerMemberShares)
            {
                ApplicationArea = Basic;
                Caption = 'Employer Member Shares';
                Image = BankAccountRec;
                RunObject = Report "Register Per Emp Per Product";

                trigger OnAction()
                begin

                    Emp.Reset;
                    Emp.SetFilter(Emp."No.", "No.");
                    Report.Run(51507263, true, false, Emp);
                    Reset;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    // if "Account Type" = "account type"::Employer then
                    //     ApprovalMgt.LeaveAppRelease(Rec);
                    //******************************End of Code
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    // if "Account Type" = "account type"::Employer then
                    //if ApprovalMgt.FinishApprovalEntryLeave(Rec, true, true) then;
                end;
            }
            action("Departments List")
            {
                ApplicationArea = Basic;
                Caption = 'Departments List';
                Image = List;
                RunObject = Page "Departments - Employer List111";
                RunPageLink = "Employer Code" = field("No.");
            }
        }
        area(reporting)
        {
            action(List)
            {
                ApplicationArea = Basic;
                Caption = 'List';
                Image = OpportunitiesList;
                RunObject = Report "Bank Account - List";
            }
            action(DetailTrialBalance)
            {
                ApplicationArea = Basic;
                Caption = 'Detail Trial Balance';
                Image = "Report";
                RunObject = Report "Bank Acc. - Detail Trial Bal.";
            }
            action(ReceivablesPayables)
            {
                ApplicationArea = Basic;
                Caption = 'Receivables-Payables';
                Image = ReceivablesPayables;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Receivables-Payables";
            }
            action(CheckDetails)
            {
                ApplicationArea = Basic;
                Caption = 'Check Details';
                Image = "Report";
                RunObject = Report "Bank Account - Check Details";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref(Statements_Promoted; Statements)
                {
                }
                actionref(BankAccountReconciliations_Promoted; BankAccountReconciliations)
                {
                }
                actionref(EmployerMemberShares_Promoted; EmployerMemberShares)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref("Departments List_Promoted"; "Departments List")
                {
                }
            }
            group(Category_Report)
            {
                actionref(List_Promoted; List)
                {
                }
                actionref(DetailTrialBalance_Promoted; DetailTrialBalance)
                {
                }
                actionref(CheckDetails_Promoted; CheckDetails)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Type := Type::Bank;
        "Account Type" := "account type"::Employer;
    end;

    trigger OnAfterGetRecord()
    begin
        CalcFields("Check Report Name");
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Account Type" := "account type"::Employer;
        Type := Type::Bank;
    end;

    trigger OnOpenPage()
    var
        Contact: Record Contact;
        MapMgt: Codeunit "Online Map Management";
    begin
        if not MapMgt.TestSetup then
            MapPointVisible := false;
        ContactActionVisible := Contact.ReadPermission;
    end;

    var

        MapPointVisible: Boolean;
        Text001: label 'There may be a statement using the %1.\\Do you want to change Balance Last Statement?';
        Text002: label 'Canceled.';

        ContactActionVisible: Boolean;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Emp: Record Employee;
}

