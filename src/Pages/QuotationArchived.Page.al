Page 52193883 "Quotation Archived"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = Card;
    SourceTable = "Procurement Request1";
    SourceTableView = where("Process Type" = const(RFQ),
                            Status = const(Archived));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionNo; "Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlanNo; "Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate; "Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(SupplierCategory; "Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000016; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(RequestforQuotation)
            {
                Caption = 'Request for Quotation';
                // action(SelectSuppliers)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Select Suppliers';
                //     RunObject = Page "Pending Fleet Requests list";
                //     RunPageLink = "Transport Requisition No" = field(No);
                //     RunPageView = sorting("Transport Requisition No", Commencement);
                // }
                action(RequestforQuotations)
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotations';

                    trigger OnAction()
                    begin
                        PurchSetup.Get;
                        PurchSetup.TestField("PDF Docs Path");
                        // Report.SaveAsPdf(51511025, PurchSetup."PDF Docs Path", Rec);
                        //PDFCreatorTest.Create();
                        //REPORT.RUN(50050,TRUE,TRUE,Rec);
                        //REPORT.SAVEASEXCEL(50050,'C:\ERC\RFP.xls',Rec);
                        //REPORT.SAVEASHTML(50050,'C:\ERC\RFP.html',TRUE,Rec);
                        //REPORT.SAVEASXML(50050,'C:\ERC\RFP.xml',TRUE,Rec);

                        //PrintToBullZip;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    // RunObject = Report "Third Party Deductions";

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter(No, No);
                        Report.Run(51511025, true, true, Rec);
                        Reset;
                    end;
                }
                action(ReOpen1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';

                    trigger OnAction()
                    begin
                        Reopen
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Process Type" := "process type"::RFQ;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Process Type" := "process type"::RFQ;
    end;

    var
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer: Record Customer;
        Customer2: Record Customer;
        SupplierSelect: Record "Supplier Selection1";
        SupplierSelect2: Record "Supplier Selection1";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        GLsetup: Record "General Ledger Setup";
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text[250];
        SenderAddress: Text[250];
        Recipients: Text[250];
        ProcurementRequest: Record "Procurement Request1";
        SearchString: Text[250];
        RecLink: Record "Record Link";
        ProcurementReqRef: RecordRef;
        Archive: Record "Procurement Request1";
        PurchSetup: Record "Purchases & Payables Setup";


    procedure PrintToBullZip()
    begin
        SupplierSelect.SetRange(SupplierSelect."Reference No.", No);
        GLsetup.Get;

        //IF ISCLEAR(BullZipPDF) THEN
        //  CREATE(BullZipPDF);


        //ReportID := REPORT::"Customer - List";
        ReportID := 51511025;
        FileDirectory := GLsetup."Attachments Path";

        Window.Open('processing Supplier ######################1##');

        // Object.Get(Object.Type::Report, '', ReportID);

        if SupplierSelect.FindSet then
            repeat
                Window.Update(1, SupplierSelect."Supplier Name");
                FileName := SupplierSelect."Supplier Name" + '.pdf';
                /*
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
                */
                SupplierSelect2 := SupplierSelect;
                SupplierSelect2.SetRecfilter;
                Report.RunModal(ReportID, false, false, SupplierSelect2);

                TimeOut := 0;
                // while Exists(RunOnceFile) and (TimeOut < 10) do begin
                //     Sleep(1000);
                //     TimeOut := TimeOut + 1;
                // end;



                Subject := 'REQUEST FOR QUOTATION ' + SupplierSelect."Reference No.";
                Body := 'Please find attached Quotation';
                CCName := 'procurement@rba.go.ke';
                //E-mail the files
                PrequalifiedSupRec.Reset;
                PrequalifiedSupRec.SetRange(PrequalifiedSupRec.Name, SupplierSelect."Supplier Name");
                if PrequalifiedSupRec.Find('-') then
                    // Mail.CreateMessage(PrequalifiedSupRec."E-mail", CCName, '', Subject, Body, FileDirectory + FileName, true);
                if MailSent then
                        Message('Message sent')
                    else
                        // MailSent := Mail.Send();


                        if UserSetup.Get("User ID") then begin
                            if Emp.Get(UserSetup."Employee No.") then begin
                                SenderName := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                SenderAddress := UserSetup."E-Mail";
                                Recipients := PrequalifiedSupRec."E-mail";

                            end;
                        end;
                SMTPMail.Create(Recipients, Subject, Body, true);
                //SMTPMail.AddAttachment(FileDirectory + FileName);

                ProcurementReqRef.GetTable(Rec);
                SearchString := Format(ProcurementReqRef.RecordId);
                RecLink.SetFilter(RecLink."Record ID", SearchString);
                if RecLink.Find('-') then
                    repeat
                    //SMTPMail.AddAttachment(RecLink.URL1);
                    until RecLink.Next = 0;













            // SMTPMail.Send();

            until SupplierSelect.Next = 0;

        Window.Close;

    end;


    procedure Reopen()
    begin

        if Rec.Status = Rec.Status::Archived then begin
            Archive.Reset;
            Archive.SetRange(Archive.No, Rec.No);
            Rec.Status := Rec.Status::New;
            Rec."Process Type" := Rec."process type"::RFQ;
            Modify;
            Message('The Store Requisition  has been Re-Opened');
        end;
    end;
}

