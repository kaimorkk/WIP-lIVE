Codeunit 52193478 "Print Aging Analyses Reports"
{

    trigger OnRun()
    begin
    end;

    var
        CustomerAging: Report "Aged Accounts Receivable";
        VendorAging: Report "Aged Accounts Payable";
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
}

