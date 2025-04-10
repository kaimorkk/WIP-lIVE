Page 50076 "Doc Approval Delegation Admin"
{
    PageType = Card;
    SourceTable = "Document Approval Delegation";
    SourceTableView = where(Status = const(Open));

    layout
    {
        area(content)
        {
            group(ApprovalDelegation)
            {
                Caption = 'Approval Delegation';
                field(DelegationNo; "Delegation No")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NewApproverID; "New Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(CurrentApproverID; "Current Approver ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(DelegateApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate Approval';

                    trigger OnAction()
                    begin
                        // Delegate(Rec);

                        if UserSetup.Get("Current Approver ID") then begin
                            UserSetup.TestField("E-Mail");
                            SenderAddress := UserSetup."E-Mail";
                            if Employee.Get(UserSetup."Employee No.") then
                                SenderName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;

                        if UserSetup.Get("New Approver ID") then begin
                            UserSetup.TestField("E-Mail");
                            Recipient := UserSetup."E-Mail";
                        end;

                        Subject := StrSubstNo('Document Approval Delegation');
                        Body := 'This is to inform you that I,' + SenderName + 'have delegated my document approval functions to you for a period of ' + Format(Duration) + ' days starting ' + Format("Start Date") + ' to ' + Format("End Date") +
                        '. Please be regularly checking your Approval Entries for any pending requests';

                        SMTPSetup.Create(Recipient, Subject, Body, true);
                        Email.Send(SMTPSetup);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Current Approver ID":=USERID;
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("Current Approver ID",USERID);
    end;

    var
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        UserSetup: Record "User Setup";
        SenderName: Text[50];
        SenderAddress: Text[50];
        Recipient: Text[50];
        Employee: Record Employee;
        Subject: Text[80];
        Body: Text[250];
}

