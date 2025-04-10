Page 52193614 Unallocated
{
    AutoSplitKey = false;
    Caption = 'Unallocated';
    PageType = Card;
    SaveValues = false;
    SourceTable = Receipts;
    SourceTableView = where(Posted = filter(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UnallocatedReceipt; "Unallocated Receipt")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode; "Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom; "Received From")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedAmount; "Received Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TotalLineAmount; "Total Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Variance; Variance)
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedTotalAmount; "Expected Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReceiptDate; "Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    HideValue = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Receipt Lines"; "Reallocation Linesx")
            {
                SubPageLink = No = field(No);
                Visible = false;
            }
            part(Control1000000003; "Reallocation Total Lines")
            {
                SubPageLink = No = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Links)
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
        area(creation)
        {
            group(Functions)
            {
            }
            action("Import Schedule")
            {
                ApplicationArea = Basic;
                Image = Import;

                trigger OnAction()
                begin

                    TestField(Status, Status::Open);
                    Contribution.GetRecHeader(Rec);
                    Contribution.Run;
                    ClearAll;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin

                    ContributionMgt.PostReceipts(Rec);
                    CurrPage.Close;
                    //CODEUNIT.RUN(CODEUNIT::"Contribution Management",Rec);
                end;
            }
            separator(Action1000000027)
            {
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelImprestApprovalRequest(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    //ApprovalMgt.FindApproverImprest(Rec, true, true);
                end;
            }
            separator(Action1000000030)
            {
            }
            action("Check Duplicate Member No")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    ContributionMgt.CheckDuplicateNumbers(Rec);
                end;
            }
            action(Reverse)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    GLRegister.Reset;
                    GLRegister.SetRange(GLRegister."Journal Batch Name", No);
                    if GLRegister.Find('-') then begin
                        GLRegister.TestField(GLRegister."No.");
                        ReversalEntry.ReverseRegister(GLRegister."No.");

                    end;
                end;
            }
            separator(Action1000000033)
            {
            }
            action("Clear Contribution List")
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000035)
            {
            }
            action(List)
            {
                ApplicationArea = Basic;
                Image = List;
                RunObject = Page "Member Contribution List";
            }
            separator(Action1000000038)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Receipt;

                trigger OnAction()
                var
                    BankLedgerEntry: Record "Bank Account Ledger Entry";
                begin

                    /*IF Posted=FALSE THEN
                    ERROR('Post the receipt before printing.');
                    RESET;
                    SETFILTER(No,No);
                    REPORT.RUN(51507031,TRUE,TRUE,Rec);
                    RESET;
                    */
                    if Posted = false then
                        Error('Receipt No %1 has not been posted', No);
                    Reset;
                    BankLedgerEntry.SetRange(BankLedgerEntry."Document No.", No);
                    Report.Run(51507701, true, true, BankLedgerEntry);
                    Reset;

                end;
            }
            action(Post1)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(List_Promoted; List)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Import Schedule_Promoted"; "Import Schedule")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        "member name": Text[100];
        StaffNo: Code[20];
        Cust: Record Customer;
        Gnljnline: Record "Gen. Journal Line";
        GenBatches: Record "Gen. Journal Batch";
        RecLine: Record "Receipts Lines";
        "cashier receipt": Record Receipts;
        name: Text[30];
        "GL Account": Record "G/L Account";
        LoanApp: Record Charges;
        MonthlyInt: Decimal;
        ContributionMgt: Codeunit "Receipt Management";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        GLRegister: Record "G/L Register";
        ReversalEntry: Record "Reversal Entry";
        "R&P": Record "Receipts and Payments Types";
        RequestHeader: Record Receipts;
        Contribution: XmlPort "Monthly Contributions";
}

