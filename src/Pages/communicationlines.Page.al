Page 52193837 communicationlines
{
    PageType = ListPart;
    SourceTable = "external mails1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ExternalmailsNo; "External mails No.")
                {
                    ApplicationArea = Basic;
                }
                field(CommiteeCode; "Commitee Code")
                {
                    ApplicationArea = Basic;
                }
                field(StakeholderID; "Stakeholder ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; "E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(TelephoneNo; "Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field(MobileNo; "Mobile No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(notify)
            {
                ApplicationArea = Basic;
                Caption = 'Notify';

                trigger OnAction()
                begin

                    CCName := '';
                    if FindSet then
                        repeat

                            Subject := 'Requested to return the book/article borrowed';
                            Body := 'You are reminded  that you have the book library book:  to library';

                            //empl.GET("Borrower No.");

                            CCName := 'navadmin@erc.go.ke';
                            text1 := 'external mails: 02';
                            LinkLead.SetFilter("Record ID", text1);
                            //LinkLead.GET('external mails: 02','');
                            text2 := LinkLead.URL1;
                            //E-mail the files
                            //PrequalifiedSupRec.RESET;
                            //PrequalifiedSupRec.SETRANGE(PrequalifiedSupRec.Name,SupplierSelect."Supplier Name");
                            //IF  PrequalifiedSupRec.FIND('-') THEN
                            Message('%1', LinkLead.URL1);
                            Mail.CreateMessage(CCName, '', '', Subject, Body,
                            true, true);
                            if MailSent then
                                // MailSent:=Mail.Send()
                                Message('Sent')
                            else
                                Mail.CreateMessage(CCName, '', '', Subject, Body,
                            true, true);
                        until Rec.Next = 0;
                    //UNTIL SupplierSelect.NEXT = 0;

                    //Window.CLOSE;
                    //M:\Legal\
                end;
            }
        }
    }

    var
        Mail: Codeunit Mail;
        MailSent: Boolean;
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        empl: Record Employee;
        LinkLead: Record "Record Link";
        text1: Text[30];
        text2: Text[30];
}

