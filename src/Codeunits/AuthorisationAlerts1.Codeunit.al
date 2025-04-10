Codeunit 52193425 "Authorisation Alerts 1"
{

    trigger OnRun()
    begin
        Transactions.Reset;
        Transactions.SetRange("Supervisor Checked",false);
        Transactions.SetRange("Needs Approval",Transactions."needs approval"::Yes);
        Transactions.SetRange("Transacting Branch",'NAIROBI');
        Transactions.SetRange("Post Attempted",true);
        if Transactions.Find('-') then
        Message('You have pending authorisation request on your inbox.');
    end;

    var
        Transactions: Record Transactions;
}

