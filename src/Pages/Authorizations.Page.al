Page 52193560 Authorizations
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Transactions;
    SourceTableView = where("Supervisor Checked"=const(false),
                            "Needs Approval"=const(Yes),
                            "Post Attempted"=const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDescription;"Transaction Description")
                {
                    ApplicationArea = Basic;
                }
                field(Overdraft;Overdraft)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDate;"Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionTime;"Transaction Time")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorisationRequirement;"Authorisation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field(Authorised;Authorised)
                {
                    ApplicationArea = Basic;
                }
                field(Select;Select)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000021;Links)
            {
                Visible = true;
            }
            systempart(Control1000000020;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Process)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    if Confirm('Are you sure you want to process the selected transactions?',false) = true then begin


                    if UsersID.Get(UserId) then  begin

                    SupervisorApprovals.Reset;
                    SupervisorApprovals.SetRange(SupervisorApprovals.SupervisorID,UserId);
                    if SupervisorApprovals.Find('-') then begin


                        Transactions.Reset;
                        //Transactions.SETRANGE(Transactions.Select,TRUE);
                        Transactions.SetRange(Transactions."Supervisor Checked",false);
                        Transactions.SetRange(Transactions."Needs Approval",Transactions."needs approval"::Yes);
                        if Transactions.Find('-') then  begin

                        if Transactions.Select then begin
                        repeat

                        //Check authorisation limits
                        if Transactions.Authorised<>Transactions.Authorised::Yes then begin
                        Message(Format( Transactions.Amount));
                        if Transactions.Type = Transactions.Type::"Cash Deposit" then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::"Cash Deposits");
                        if Transactions.Type = Transactions.Type::"Cheque Deposit" then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::"Cheque Deposits");
                        if Transactions.Type = Transactions.Type::Withdrawal then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::Withdrawals);
                        if Transactions.Amount > SupervisorApprovals."Maximum Approval Amount" then begin
                        Error('You cannot approve the transaction because it is above your approval limit.');
                        end;
                        Message(Format(SupervisorApprovals.SupervisorID));
                        if Transactions."Authorisation Requirement" = 'Withdrawal Freq.' then
                        Transactions."Withdrawal FrequencyAuthorised":=Transactions."withdrawal frequencyauthorised"::Yes;
                        Transactions."Supervisor Checked":=true;
                        Transactions."Status Date":=Today;
                        Transactions."Status Time":=Time;
                        Transactions."Checked By":=UserId;
                        Transactions.Authorised:=Transactions.Authorised::Yes;
                        Transactions."Approval User Id":=SupervisorApprovals.SupervisorID;
                        Transactions.Modify;

                        end;

                        until Transactions.Next = 0;
                        end;
                        Message(Format('The selected transactions have been authorized successfully'));
                        end else
                        Error('Select the transaction to Process');
                    end else Message(Format( 'You are not authorized to approve the selected transaction'));

                    end;

                    end;
                end;
            }
            separator(Action1000000017)
            {
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Image = Approve;

                trigger OnAction()
                begin

                    if UsersID.Get(UserId) then  begin

                    SupervisorApprovals.Reset;
                    SupervisorApprovals.SetRange(SupervisorApprovals.SupervisorID,UserId);
                    if SupervisorApprovals.Find('-') then begin
                        Transactions.Reset;
                        Transactions.SetRange(Transactions.Select,true);
                        Transactions.SetRange(Transactions."Supervisor Checked",false);
                        Transactions.SetRange(Transactions."Needs Approval",Transactions."needs approval"::Yes);
                        if Transactions.Find('-') then  begin
                        if Confirm('Are you sure you want to process the selected transactions?',false) = true then begin

                        repeat
                        //Check authorisation limits
                        if Transactions.Authorised<>Transactions.Authorised::Yes then begin

                        if Transactions.Type = Transactions.Type::"Cash Deposit" then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::"Cash Deposits");
                        if Transactions.Type = Transactions.Type::"Cheque Deposit" then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::"Cheque Deposits");
                        if Transactions.Type = Transactions.Type::Withdrawal then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::Withdrawals);
                        if Transactions.Amount > SupervisorApprovals."Maximum Approval Amount" then begin
                        Error('You cannot approve the transaction because it is above your approval limit.');
                        end;

                        if Transactions."Authorisation Requirement" = 'Withdrawal Freq.' then
                        Transactions."Withdrawal FrequencyAuthorised":=Transactions."withdrawal frequencyauthorised"::Yes;
                        Transactions."Supervisor Checked":=true;
                        Transactions."Status Date":=Today;
                        Transactions."Status Time":=Time;
                        Transactions."Checked By":=UserId;
                        Transactions.Authorised:=Transactions.Authorised::Yes;
                        Transactions."Approval User Id":=SupervisorApprovals.SupervisorID;
                        Transactions.Modify;

                        end;

                        until Transactions.Next = 0;
                        Message(Format('The selected transactions have been authorized successfully'));
                        end;
                        end else
                        Error('Select the transaction to Process');

                    end else Message(Format( 'You are not authorized to approve the selected transaction'));

                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;

                trigger OnAction()
                begin

                    if UsersID.Get(UserId) then  begin

                    SupervisorApprovals.Reset;
                    SupervisorApprovals.SetRange(SupervisorApprovals.SupervisorID,UserId);
                    if SupervisorApprovals.Find('-') then begin
                        Transactions.Reset;
                        Transactions.SetRange(Transactions.Select,true);
                        Transactions.SetRange(Transactions."Supervisor Checked",false);
                        Transactions.SetRange(Transactions."Needs Approval",Transactions."needs approval"::Yes);
                        if Transactions.Find('-') then  begin
                        if Confirm('Are you sure you want to process the selected transactions?',false) = true then begin

                        repeat
                        //Check authorisation limits
                        if Transactions.Authorised<>Transactions.Authorised::Yes then begin

                        if Transactions.Type = Transactions.Type::"Cash Deposit" then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::"Cash Deposits");
                        if Transactions.Type = Transactions.Type::"Cheque Deposit" then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::"Cheque Deposits");
                        if Transactions.Type = Transactions.Type::Withdrawal then
                        SupervisorApprovals.SetRange(SupervisorApprovals."Transaction Type",SupervisorApprovals."transaction type"::Withdrawals);
                        if Transactions.Amount > SupervisorApprovals."Maximum Approval Amount" then begin
                        Error('You cannot process the transaction because it is above your approval limit.');
                        end;

                        if Transactions."Authorisation Requirement" = 'Withdrawal Freq.' then
                        Transactions."Withdrawal FrequencyAuthorised":=Transactions."withdrawal frequencyauthorised"::Yes;
                        Transactions."Supervisor Checked":=true;
                        Transactions."Status Date":=Today;
                        Transactions."Status Time":=Time;
                        Transactions."Checked By":=UserId;
                        Transactions.Authorised:=Transactions.Authorised::Rejected;
                        Transactions."Approval User Id":=SupervisorApprovals.SupervisorID;
                        Transactions.Modify;

                        end;

                        until Transactions.Next = 0;
                        Message(Format('The selected transactions have been authorized successfully'));
                        end;
                        end else
                        Error('Select the transaction to Process');

                    end else Message(Format( 'You are not authorized to process the selected transaction'));

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Process_Promoted; Process)
                {
                }
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
            }
        }
    }

    var
        Transactions: Record Transactions;
        SupervisorApprovals: Record "Supervisors Approval Levels";
        UsersID: Record "User Setup";
}

