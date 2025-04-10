Page 52193800 "Legal Processing Form"
{
    PageType = Card;
    SourceTable = "Legal Advice1";
    SourceTableView = where(Status = const(Procesing));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestID; "Request ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDescription; "Request Description")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeId; "Employee Id")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(RequestClosureDate; "Request Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field(RequestTitle; "Request Title")
                {
                    ApplicationArea = Basic;
                }
                field(Advice; Advice)
                {
                    ApplicationArea = Basic;
                }
                field(Attachement; Attachement)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Document)
            {
                Caption = 'Documents';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Request ID", "Language Code(Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Request ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Request ID";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := "Request Description";
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachement := Attachement::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Request ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Language Code(Default)";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := "Request Description";
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachement := Attachement::Yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Request ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Request ID";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := "Request Description";
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachement := Attachement::Yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Request ID", "Language Code(Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Request ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachement := Attachement::No;
                            Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Request';

                trigger OnAction()
                begin
                    TestField("Request Description");
                    TestField("Employee Id");
                    TestField(Department);
                    //TESTFIELD("User Email");
                    if Status <> Status::Procesing then
                        Error('You have already been send by the user!!')
                    else begin


                        Subject := 'LEGAL ADVICE REQUEST ' + "Request ID";
                        Body := 'Please note that Legal Request No ' + "Request ID" + ' has been handled';
                        ToName := compinfo."CS Email";

                        Users.Reset;
                        if Users.Get(UserId) then
                            CCname := Users."E-Mail";
                        AttachFileName := '';
                        OpenDialog := false;

                        Mail.CreateMessage(ToName, CCname, '', Subject, Body, true, OpenDialog);

                        Status := Status::Processed;
                        Modify;

                        Message('Request Submitted')

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send Request_Promoted"; "Send Request")
                {
                }
            }
        }
    }

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        emp: Record Employee;
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        Users: Record "User Setup";
        Subject: Text[250];
        Body: Text[250];
        MailSent: Boolean;
        ToName: Text[30];
        CCname: Text[30];
        AttachFileName: Text[30];
        OpenDialog: Boolean;
}

