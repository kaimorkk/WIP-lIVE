Page 52193802 "Bench Marking"
{
    PageType = Card;
    SourceTable = "Bench Mark1";
    SourceTableView = where(Status = const(Open));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(ActivityNo; "Activity No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ActivityDescription; "Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field(BestPractice; "Best Practice")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; "Start Date")
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
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; "Employee Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibility';
                }
                field(ResponsibilityName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibility Name';
                }
                field(UserEmail; "User Email")
                {
                    ApplicationArea = Basic;
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                }
                field(Attachement; Attachement)
                {
                    ApplicationArea = Basic;
                }
                field(FiscalYear; "Fiscal Year")
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
                        if InteractTemplLanguage.Get("Activity No", "Language Code(Default)") then
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
                        if not InteractTemplLanguage.Get("Activity No", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Activity No";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := "Activity Description";
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
                        if not InteractTemplLanguage.Get("Activity No", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Language Code(Default)";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := "Activity Description";
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
                        if not InteractTemplLanguage.Get("Activity No", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Activity No";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := "Activity Description";
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
                        if InteractTemplLanguage.Get("Activity No", "Language Code(Default)") then
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
                        if InteractTemplLanguage.Get("Activity No", "Language Code(Default)") then begin
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
                    TestField("Activity Description");
                    TestField("Employee Id");
                    TestField(Department);
                    //TESTFIELD("User Email");
                    if Status <> Status::Open then
                        Error('You have already been send by the user!!')
                    else begin


                        Subject := 'BENCH MARKING REQUEST';
                        Body := 'Please handle the follwoing Bench marking request of Request No ' + "Activity No";
                        ToName := compinfo."CS Email";
                        CCname := compinfo."CS Email";
                        AttachFileName := '';
                        OpenDialog := false;

                        Mail.CreateMessage(ToName, CCname, '', Subject, Body, true, OpenDialog);

                        Status := Status::Vetting;
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Status := Status::Open;
        "CS Email" := compinfo."CS Email";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Status := Status::Open;
        User := UserId;
        Users.Get(UserId);
        "User Email" := Users."E-Mail";
        "Employee Id" := Users."Employee No.";
        emp.Get("Employee Id");
        "Employee Name" := emp."First Name" + ' ' + emp."Last Name";
        compinfo.Get;
        "CS Email" := compinfo."CS Email";
    end;

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        Subject: Text[250];
        Body: Text[250];
        MailSent: Boolean;
        ToName: Text[30];
        CCname: Text[30];
        AttachFileName: Text[30];
        OpenDialog: Boolean;
}

