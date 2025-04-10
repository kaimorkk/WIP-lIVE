Page 52193954 "Active Appr Delegations Admin"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(DelegationNo; "Delegation No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(CurrentApproverID; "Current Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(NewApproverID; "New Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(DelegationLimitsApproverID; "Delegation Limits Approver ID")
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
                field(Status; Status)
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
            group(Line)
            {
                Caption = 'Line';
                action(ResumeApprovalDuties)
                {
                    ApplicationArea = Basic;
                    Caption = 'Resume Approval Duties';

                    trigger OnAction()
                    begin
                        //Resume(Rec);

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

                        Subject := StrSubstNo('Resumption of Delegated Document Approval');
                        Body := 'This is to inform you that I,' + SenderName + 'have resumed the document approval functions I had delegated to you';

                        SMTPSetup.Create(Recipient, Subject, Body, true);
                        Email.Send(SMTPSetup);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        ActiveDelegations(Rec);
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


    procedure ActiveDelegations(var Delegations: Record "Document Approval Delegation")
    begin
        Delegations.Reset;
        Delegations.SetCurrentkey("Delegation No");
        //Delegations.SETRANGE("Current Approver ID",USERID);
        //Delegations.SETFILTER("Start Date",'<=%1',TODAY);
        //Delegations.SETFILTER("End Date",'>=%1',TODAY);
        Delegations.SetRange(Status, Delegations.Status::Processed);
    end;
}

