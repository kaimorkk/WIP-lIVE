Page 52194188 "Resources Issue. Header"
{
    PageType = Card;
    SourceTable = "Resource Req. Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(USER; USER)
                {
                    ApplicationArea = Basic;
                }
                field(RequestStatus; "Request Status")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(IssueDate; "Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field(Returneddate; "Returned date")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerID; "Issuer ID")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerName; "Issuer Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000022; "M. Article Information")
            {
                SubPageLink = "Request No." = field("Request No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Requisition)
            {
                Caption = 'Requisition ';
                action(Allocate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Allocate';

                    trigger OnAction()
                    begin

                        if "Request Status" = "request status"::Open then
                            Error('You cannot send this request at this stage');



                        Subject := 'RESOURCE REQUEST ALLOCATION';
                        Body := 'You have been allocated the resource as requested in Resource request No:' + "Request No.";

                        if Users.Get(USER) then
                            ToName := Users."E-Mail";
                        CCname := '';
                        AttachFileName := '';
                        OpenDialog := false;


                        // MailSent:=Mail.NewMessage(ToName,CCname,'',Subject,Body,AttachFileName,OpenDialog);
                        Resources.SetRange(Resources."Request No.", "Request No.");
                        Resources."In Use" := true;
                        Resources.Modify;

                        Articles.SetRange(Articles."Misc. Article", Resources."Misc. Article Code");
                        Articles."In Use" := true;
                        Articles.Modify;
                        "Request Status" := "request status"::Allocated;

                        "Request Date" := Today;

                        Modify;

                        Message('Request Submited');
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Reject;

                    trigger OnAction()
                    begin
                        if "Request Status" = "request status"::Allocated then
                            Error('You cannot send this request at this stage');



                        Subject := 'RESOURCE REQUEST REJECTION';
                        Body := 'Your Resource request No:' + "Request No." + ' has been rejected, see Remarks';

                        if Users.Get(USER) then
                            ToName := Users."E-Mail";
                        CCname := '';
                        AttachFileName := '';
                        OpenDialog := false;

                        // MailSent:=Mail.NewMessage(ToName,CCname,'',Subject,Body,AttachFileName,OpenDialog);
                        Resources.SetRange(Resources."Request No.", "Request No.");
                        // Resources."In Use":=FALSE;
                        "Request Status" := "request status"::Rejected;

                        "Request Date" := Today;

                        Modify;

                        Message('Request Submited');
                    end;
                }
                action(Returned)
                {
                    ApplicationArea = Basic;
                    Caption = 'Returned';

                    trigger OnAction()
                    begin
                        Resources.SetRange(Resources."Request No.", "Request No.");
                        Resources."In Use" := false;
                        Resources.Modify;

                        Articles.SetRange(Articles."Misc. Article", Resources."Misc. Article Code");
                        Articles."In Use" := false;
                        Articles.Modify;
                        "Request Status" := "request status"::Returned;

                        "Returned date" := Today;

                        Modify;
                    end;
                }
            }
        }
    }

    var
        KPACode: Code[20];
        Mail: Codeunit Mail;
        Subject: Text[250];
        Body: Text[250];
        MailSent: Boolean;
        ToName: Text[30];
        CCname: Text[30];
        AttachFileName: Text[30];
        OpenDialog: Boolean;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        Resources: Record "Misc. Article Information";
        Articles: Record Articles1;
}

