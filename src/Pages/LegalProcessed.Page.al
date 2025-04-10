Page 52193806 "Legal Processed"
{
    PageType = Card;
    SourceTable = "Legal Advice1";
    SourceTableView = where(Status = const(Processed));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestID; "Request ID")
                {
                    ApplicationArea = Basic;
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
                field(Reason; Reason)
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
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                }
                field(LegalPersonID; "Legal Person ID")
                {
                    ApplicationArea = Basic;
                }
                field(LegalPersonEmail; "Legal Person Email")
                {
                    ApplicationArea = Basic;
                }
                field(UserEmail; "User Email")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement; Attachement)
                {
                    ApplicationArea = Basic;
                }
                field(LanguageCodeDefault; "Language Code(Default)")
                {
                    ApplicationArea = Basic;
                }
                field(RequestType; "Request Type")
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
            group(Documents)
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
                Caption = 'To Requester';

                trigger OnAction()
                begin
                    TestField("Request Description");
                    TestField("Employee Id");
                    TestField(Department);
                    //TESTFIELD("User Email");
                    /*IF Status<>Status::Procesing  THEN
                    ERROR('You have already been send by the user!!')
                      ELSE BEGIN*/


                    Subject := 'LEGAL ADVICE REQUEST ' + "Request ID";
                    Body := 'Please the follwoing Legal request of Request No ' + "Request ID" + ' has been handled '
                     + 'find the the documents and see the advice';
                    ToName := "User Email";
                    CCname := '';
                    AttachFileName := '';
                    OpenDialog := false;

                    Mail.CreateMessage(ToName, CCname, '', Subject, Body, true, OpenDialog);

                    Status := Status::Adviced;
                    Modify;

                    Message('Request Submitted')

                    //END;

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

