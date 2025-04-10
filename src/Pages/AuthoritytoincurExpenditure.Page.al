Page 52193604 "Authority to incur Expenditure"
{
    PageType = Card;
    SourceTable = "Expenditure Authority";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(DateCreated; "Date Created")
                {
                    ApplicationArea = Basic;
                }
                field(VoteHolderUserID; "Vote Holder User ID")
                {
                    ApplicationArea = Basic;
                }
                field(VoteTitle; "Vote Title")
                {
                    ApplicationArea = Basic;
                }
                field(VoteTitleName; "Vote Title Name")
                {
                    ApplicationArea = Basic;
                }
                field(RequetedExpenditure; "Requeted Expenditure")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonsForExpenditure; "Reasons For Expenditure")
                {
                    ApplicationArea = Basic;
                }
                field(AnnualBudget; "Annual Budget")
                {
                    ApplicationArea = Basic;
                }
                field(MonthBudgetProvision; "Month Budget Provision")
                {
                    ApplicationArea = Basic;
                }
                field(CummMonthlyBudgetBefore; "Cumm. Monthly Budget Before")
                {
                    ApplicationArea = Basic;
                }
                field(CummMonthlyBudgetAfter; "Cumm. Monthly Budget After")
                {
                    ApplicationArea = Basic;
                }
                field(CummExpenditureYTD; "Cumm. Expenditure YTD")
                {
                    ApplicationArea = Basic;
                }
                field(AnnualBudgetBalance; "Annual Budget Balance")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    ExpAuth.Reset;
                    ExpAuth.SetRange(ExpAuth."No.", "No.");
                    Report.Run(51507097, true, true, ExpAuth);
                    //
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    if Confirm('Are sure you want to commit to this transactions') then begin
                        // if ("Requeted Expenditure" + "Commited Funds") > "Annual Budget Balance" then
                        //     ActionPermissions.CheckUserPermision('APPROVEAIEOVER')
                        // else
                        //     ActionPermissions.CheckUserPermision('APPROVEAIE');
                        Approved := true;
                        Commitment := true;
                        Modify;
                    end;
                end;
            }
        }
    }

    var
        GLEntriesForm: Page "General Ledger Entries";
        GLEntries: Record "G/L Entry";
        FisrtDateOfYear: Date;
        AccSchedLine: Record "Acc. Schedule Line";
        ExpAuth: Record "Expenditure Authority";
        AIECommitmentsForm: Page "Expenditure Authority";
        CommittedAIE: Record "Expenditure Authority";
        VBItems: Record "Acc. Schedule Line";
        VBItem: Record "Acc. Schedule Line";
    // ActionPermissions: Codeunit ActionPermisionManagement;
}

