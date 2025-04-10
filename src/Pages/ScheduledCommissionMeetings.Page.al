Page 52193936 "Scheduled Commission Meetings"
{
    Caption = 'Campaign Card';
    PageType = Card;
    PopulateAllFields = true;
    SourceTable = Campaign;
    SourceTableView = where("Meeting Type" = const(Meeting));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Enabled = true;
                field(No; "No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeCode; "Committee Code")
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeName; "Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field(StartingDate; "Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndingDate; "Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime; "Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(EndTime; "End Time")
                {
                    ApplicationArea = Basic;
                }
                field(NotificationDate; "Notification Date")
                {
                    ApplicationArea = Basic;
                }
                field(AgendasDate; "Agendas Date")
                {
                    ApplicationArea = Basic;
                }
                field(CommisionerNotice; "Commisioner Notice")
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Activated; Activated)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Commisioners)
            {
                Caption = 'Commisioners';
                part(Control1000000000; "Board Committees")
                {
                    SubPageLink = "Meeting Code" = field("No.");
                }
            }
            group(HeadofDep)
            {
                Caption = 'Head of Dep';
                part(Control1000000020; "Director/HOD Committees")
                {
                    SubPageLink = "Meeting Code" = field("No.");
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                Enabled = false;
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Mobile)
            {
                Caption = 'Mobile';
                Enabled = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Agenda)
            {
                Caption = 'Agenda';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code(Default)") then
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
                        if not InteractTemplLanguage.Get("No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
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
                        if not InteractTemplLanguage.Get("No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
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
                        if not InteractTemplLanguage.Get("No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
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
                        if InteractTemplLanguage.Get("No.", "Language Code(Default)") then
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
                        if InteractTemplLanguage.Get("No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
            }
            group(Meeting)
            {
                Caption = 'Meeting';
                action(Entries)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&ntries';
                    RunObject = Page "Campaign Entries";
                    RunPageLink = "Campaign No." = field("No.");
                    RunPageView = sorting("Campaign No.");
                    ShortCutKey = 'Ctrl+F7';
                    Visible = false;
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = "Table Name" = const(Campaign),
                                  "No." = field("No."),
                                  "Sub No." = const(0);
                    Visible = false;
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Campaign Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    Visible = false;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5071),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                }
                action(Todos)
                {
                    ApplicationArea = Basic;
                    Caption = 'T&o-dos';
                    RunObject = Page "Task List";
                    RunPageLink = "Campaign No." = field("No."),
                                  "System To-do Type" = filter(Organizer);
                    RunPageView = sorting("Campaign No.");
                    Visible = false;
                }
                action(Segments)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&egments';
                    Image = Segment;
                    RunObject = Page "Segment List";
                    RunPageLink = "Campaign No." = field("No.");
                    RunPageView = sorting("Campaign No.");
                    Visible = false;
                }
                group(Opportunities)
                {
                    Caption = 'Oppo&rtunities';
                    Visible = false;
                    action(List)
                    {
                        ApplicationArea = Basic;
                        Caption = 'List';
                        RunObject = Page "Opportunity List";
                        RunPageLink = "Campaign No." = field("No.");
                        RunPageView = sorting("Campaign No.");
                        Visible = false;
                    }
                    action(BarChart)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Bar Chart';
                        Visible = false;

                        trigger OnAction()
                        begin
                            //OpportunityBarChart.SetCampaignFilter("No.");
                            //OpportunityBarChart.RUN;
                        end;
                    }
                }
                action(SalesPrices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Prices';
                    Image = SalesPrices;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type" = const(Campaign),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    Visible = false;
                }
                action(SalesLineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Line Discounts';
                    Image = SalesLineDisc;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type" = const(Campaign),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    Visible = false;
                }
                action(MailHODforAgenda)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mail HOD for Agenda';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //attendees.RESET;

                        HodCommittee.SetRange(HodCommittee."Meeting Code", "No.");
                        ComCommittee.SetRange(ComCommittee."Meeting Code", "No.");

                        Empl.Reset;
                        if HodCommittee.Find('-') then
                            repeat

                                if Empl.Get(HodCommittee."HoD code") then begin

                                    Email := Empl."E-Mail";
                                    subject := 'Meeting Type ' + Description;
                                    Body := 'Please send the agendas regarding the meeting in the subject above';
                                    ////Mail.NewIncidentMail(Email, subject, Body);
                                    Sent := true;
                                    Message('%1 code and %2 email', HodCommittee."Committee Code", Email);

                                    SenderAddress := 'nathan.kimutai@attain-es.com';
                                    Recipients := 'nathankims@yahoo.com';
                                    HtmlFormatted := true;
                                    SMTPMail.Create(Recipients, subject, Body, HtmlFormatted);
                                    Emails.Send(SMTPMail);


                                end;
                            until HodCommittee.Next = 0;
                    end;
                }
                action(ViewMeetings)
                {
                    ApplicationArea = Basic;
                    Caption = 'View Meetings';
                    RunObject = Page "Scheduled Meeting";
                }
            }
        }
        area(processing)
        {
            action("Commisioners Invitation")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //attendees.RESET;

                    attendees.SetRange(attendees."Meeting ID", "No.");
                    attendees.SetRange(attendees.Attended, true);
                    //attendees.SETRANGE();
                    if Find('-') then
                        repeat
                            Empl.Reset;
                            if Empl.Get(attendees."Commissioner Code") then begin


                                Email := Empl."E-Mail";
                                subject := 'Meeting Type ' + Description;
                                Body := 'Please send the agendas regarding the meeting in the subject above';
                                // //Mail.NewIncidentMail(Email, subject, Body);
                                Sent := true;
                                Message('%1 code and %2 email', attendees."Commissioner Code", Email);

                                SenderAddress := '';
                                Recipients := '';
                                HtmlFormatted := true;
                                // SMTPMail.Create(Recipients, subject, Body, HtmlFormatted);
                                // SMTPMail.Send();


                            end;
                        until attendees.Next = 0;
                    /*
                    SupplierSelect.SETRANGE(SupplierSelect."Reference No.","No.");
                    GLsetup.GET;
                    
                    IF ISCLEAR(BullZipPDF) THEN
                      CREATE(BullZipPDF);
                    
                    
                    //ReportID := REPORT::"Customer - List";
                    ReportID :=50050;
                    FileDirectory :=GLsetup."Attachments Path";
                    
                    Window.OPEN('processing Supplier ######################1##');
                    
                    Object.GET(Object.Type::Report,'',ReportID);
                    
                    IF SupplierSelect.FINDSET THEN REPEAT
                      Window.UPDATE(1,SupplierSelect."Supplier Name");
                      FileName := SupplierSelect."Supplier Name" + '.pdf';
                      BullZipPDF.Init;
                      BullZipPDF.LoadSettings;
                      RunOnceFile := BullZipPDF.GetSettingsFileName(TRUE);
                      BullZipPDF.SetValue('Output',FileDirectory+FileName);
                      BullZipPDF.SetValue('Showsettings', 'never');
                      BullZipPDF.SetValue('ShowPDF', 'no');
                      BullZipPDF.SetValue('ShowProgress', 'no');
                      BullZipPDF.SetValue('ShowProgressFinished', 'no');
                      BullZipPDF.SetValue('SuppressErrors', 'yes');
                      BullZipPDF.SetValue('ConfirmOverwrite', 'no');
                      BullZipPDF.WriteSettings(TRUE);
                      SupplierSelect2 := SupplierSelect;
                      SupplierSelect2.SETRECFILTER;
                      REPORT.RUNMODAL(ReportID,FALSE,FALSE,SupplierSelect2);
                    
                      TimeOut := 0;
                      WHILE EXISTS(RunOnceFile) AND (TimeOut < 10) DO BEGIN
                          SLEEP(1000);
                          TimeOut := TimeOut + 1;
                      END;
                    
                    
                    {
                    Subject:='REQUEST FOR QUOTATION '+SupplierSelect."Reference No.";
                    Body:='Please find attached Quotation';
                    CCName:='chelimo@erc.go.ke';
                    //E-mail the files
                    PrequalifiedSupRec.RESET;
                    PrequalifiedSupRec.SETRANGE(PrequalifiedSupRec.Name,SupplierSelect."Supplier Name");
                    IF  PrequalifiedSupRec.FIND('-') THEN
                    
                    //Mail.CreateMessage(PrequalifiedSupRec."E-mail",CCName,Subject,Body,FileDirectory+FileName,TRUE);
                    IF MailSent THEN
                    MESSAGE('Message sent')
                    ELSE
                    MailSent := Mail.Send();}
                    
                    
                    IF UserSetup.GET(USERID) THEN
                    BEGIN
                    IF Emp.GET(UserSetup."Employee No.") THEN
                    BEGIN
                    SenderName:=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";
                    SenderAddress:=UserSetup."E-Mail";
                    Recipients:=PrequalifiedSupRec."E-mail";
                    
                    END;
                    END;
                    SMTPMail.Create(SenderName,SenderAddress,Recipients,Subject,Body,TRUE);
                    SMTPMail.AddAttachment(FileDirectory+FileName);
                    
                    ProcurementReqRef.GETTABLE(Rec);
                    SearchString:=FORMAT(ProcurementReqRef.RECORDID);
                    RecLink.SETFILTER(RecLink."Record ID",SearchString);
                    IF RecLink.FIND('-') THEN
                    
                    REPEAT
                    SMTPMail.AddAttachment(RecLink.URL1);
                    UNTIL RecLink.NEXT=0;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SMTPMail.Send();
                    UNTIL SupplierSelect.NEXT = 0;
                    
                    Window.CLOSE;
                    
                    
                    */

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Commisioners Invitation_Promoted"; "Commisioners Invitation")
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }

    var
        CampaignMgmt: Codeunit "Campaign Target Group Mgt";
        attendees: Record "Commisioner Attendance1";
        Empl: Record Employee;
        Email: Text[100];
        subject: Text[100];
        Body: Text[250];
        mail: Codeunit Mail;
        HtmlFormatted: Boolean;
        Sent: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        MailSent: Boolean;
        CCName: Text[30];
        GLsetup: Record "General Ledger Setup";
        SMTPMail: Codeunit "Email Message";
        Emails: Codeunit Email;
        UserSetup: Record "User Setup";
        SenderName: Text[250];
        SenderAddress: Text[250];
        Recipients: Text[250];
        SearchString: Text[250];
        RecLink: Record "Record Link";
        HodCommittee: Record "HoD Committee1";
        ComCommittee: Record "Commisioner Committee1";
        DimValue: Record "Dimension Value";
}

