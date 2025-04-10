Page 52193516 "General Set-Up"
{
    ApplicationArea = Basic;
    Caption = 'General Set-Up';
    PageType = Card;
    SourceTable = "General Set-Up";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RegFeeAccount; "Reg Fee Account")
                {
                    ApplicationArea = Basic;
                }
                field(RegistrationFee; "Registration Fee")
                {
                    ApplicationArea = Basic;
                }
                field(MinMemberAge; "Min. Member Age")
                {
                    ApplicationArea = Basic;
                }
                field(RetirementAge; "Retirement Age")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalFee; "Withdrawal Fee")
                {
                    ApplicationArea = Basic;
                }
                field(MemberCanGuaranteeOwnLoan; "Member Can Guarantee Own Loan")
                {
                    ApplicationArea = Basic;
                }
                field(MinLoanApplicationPeriod; "Min. Loan Application Period")
                {
                    ApplicationArea = Basic;
                }
                field(LoanDefaultingPeriod; "Loan Defaulting Period")
                {
                    ApplicationArea = Basic;
                }
                field(NoofTimeSharestoGuarantee; "No of Time Shares to Guarantee")
                {
                    ApplicationArea = Basic;
                }
                field(MaxLoanstoGuarantee; "Max Loans to Guarantee")
                {
                    ApplicationArea = Basic;
                }
                field(IncomeDeductionsRule; "Income-Deductions Rule")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationAttachmentsUsed; "Application Attachments Used")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Application Attachments Used" then
                            MembAttach := true
                        else
                            MembAttach := false;
                    end;
                }
                field(SendNotificationEmails; "Send Notification Emails")
                {
                    ApplicationArea = Basic;
                }
                field(SendNotificationSMS; "Send Notification SMS")
                {
                    ApplicationArea = Basic;
                }
                field(FuneralExpensesGL; "Funeral Expenses G/L")
                {
                    ApplicationArea = Basic;
                }
                field(FuneralExpensesAmount; "Funeral Expenses Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(SharesBands)
            {
                Caption = 'Shares Bands';
            }
        }
        area(processing)
        {
            action(ResetDataSheet)
            {
                ApplicationArea = Basic;
                Caption = 'Reset Data Sheet';
                Visible = false;

                trigger OnAction()
                begin
                    /*Cust.RESET;
                    Cust.SETRANGE(Cust."Customer Type",Cust."Customer Type"::Member);
                    IF Cust.FIND('-') THEN
                    Cust.MODIFYALL(Cust.Advice,FALSE);
                    
                    
                    Loans.RESET;
                    Loans.SETRANGE(Loans.Source,Loans.Source::BOSA);
                    IF Loans.FIND('-') THEN
                    Loans.MODIFYALL(Loans.Advice,FALSE);
                    
                    
                    MESSAGE('Reset Completed successfully.');*/

                end;
            }
            action("Membership Attachment Items")
            {
                ApplicationArea = Basic;
                Caption = 'Membership Attachment Items';
                Enabled = MembAttach;
                Image = Attach;
                RunObject = Page "Security and Attachment Items";
                RunPageLink = "Used on Member Application" = filter(true);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Membership Attachment Items_Promoted"; "Membership Attachment Items")
                {
                }
                actionref(ResetDataSheet_Promoted; ResetDataSheet)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Validate("Application Attachments Used");
    end;

    trigger OnOpenPage()
    begin
        Validate("Application Attachments Used");
    end;

    var
        Cust: Record Customer;
        //Loans: Record Loans;
        RcptB: Record "Receipts Buffer";
        MembAttach: Boolean;
}

