Page 52194187 "Resources Req. Header"
{
    PageType = Card;
    SourceTable = "Resource Req. Header1";
    SourceTableView = where("Request Status" = filter(Open | "Pending Allocation" | Allocated));

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
                SubPageLink = "Request No." = field("Request No."),
                              "Employee No." = field("Employee Code");
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
                action(SendRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Request';

                    trigger OnAction()
                    begin

                        if "Request Status" <> "request status"::Open then
                            Error('You cannot send this request at this stage');
                        Resource.SetRange(Resource."Request No.", "Request No.");
                        if Resource."In Use" = true then
                            Error('The Resource is in use');

                        compinfo.Get;
                        Subject := 'RESOURCE REQUEST';
                        Body := 'Please do allocation for the Resources requested by ' + "Employee Name";
                        ToName := compinfo."HR Support Email";
                        CCname := '';
                        AttachFileName := '';
                        OpenDialog := false;

                        // MailSent:=Mail.NewMessage(ToName,CCname,'',Subject,Body,AttachFileName,OpenDialog);

                        "Request Status" := "request status"::"Pending Allocation";
                        "Request Date" := Today;

                        Modify;

                        Message('Request Submited');
                    end;
                }
                action(CancelRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Request';

                    trigger OnAction()
                    begin

                        if "Request Status" = "request status"::Open then
                            Error('You cannot send this request at this stage');

                        compinfo.Get;
                        Subject := 'RESOURCE REQUEST CANCELATION';
                        Body := 'Please resource request for ' + "Employee Name" + ' has been canceled';
                        ToName := compinfo."HR Support Email";
                        CCname := '';
                        AttachFileName := '';
                        OpenDialog := false;

                        // MailSent:=Mail.NewMessage(ToName,CCname,'',Subject,Body,AttachFileName,OpenDialog);

                        "Request Status" := "request status"::Canceled;
                        Modify;

                        Message('Request Canceled');
                    end;
                }
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        "Request Status" := "request status"::Open;
        USER := UserId;
        //MESSAGE(USER);
        if Users.Get(UserId) then
            "Employee Code" := Users."Employee No.";
        if emp.Get("Employee Code") then
            "Employee Name" := emp."First Name" + ' ' + emp."Last Name";
    end;

    trigger OnOpenPage()
    begin
        SetRange(USER, UserId);
    end;

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
        emp: Record Employee;
        Resource: Record "Misc. Article Information";
}

