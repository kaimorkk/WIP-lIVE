Page 52193910 RFP
{
    PageType = Card;
    SourceTable = "Procurement Request1";
    SourceTableView = where("Process Type" = const(RFP));

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
                action(SelectSuppliers)
                {
                    ApplicationArea = Basic;
                    Caption = 'Select Suppliers';
                    RunObject = Page "Supplier Selection";
                    RunPageLink = "Reference No." = field(No);
                    RunPageView = sorting("Reference No.", "Supplier Name");

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalMgt.SendPurchaseReqApprovalRequest(Rec);
                    end;
                }
                action(RequestforQuotations)
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotations';

                    trigger OnAction()
                    begin
                        //REPORT.SAVEASPDF(50050,'C:\ERC\RFP.pdf',Rec);
                        //PDFCreatorTest.Create();
                        //REPORT.RUN(50050,TRUE,TRUE,Rec);
                        //REPORT.SAVEASEXCEL(50050,'C:\ERC\RFP.xls',Rec);
                        //REPORT.SAVEASHTML(50050,'C:\ERC\RFP.html',TRUE,Rec);
                        //REPORT.SAVEASXML(50050,'C:\ERC\RFP.xml',TRUE,Rec);

                        SupplierSelect.Reset;
                        SupplierSelect.SetFilter("Reference No.", No);
                        Report.Run(51511025, true, true, SupplierSelect);
                        SupplierSelect.Reset;
                    end;
                }
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin

                        // ApprovalMgt.CancelBudgetApprovalRequest(Rec);
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    RunObject = Page Bidders;
                    RunPageLink = "Ref No." = field(No);
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SelectSuppliers_Promoted; SelectSuppliers)
                {
                }
                actionref(RequestforQuotations_Promoted; RequestforQuotations)
                {
                }
                actionref("<Send Approval Request>_Promoted"; "<Send Approval Request>")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Process Type" := "process type"::RFP;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Process Type" := "process type"::RFP;
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


    procedure PrintToBullZip()
    begin
        SupplierSelect.SetRange(SupplierSelect."Reference No.", No);

        ReportID := 51511025;
        //FileDirectory := 'C:\Users\Jake\Desktop';

        // Report.SaveAsPdf(ReportID, FileDirectory, Rec);
        //REPORT.SAVEASPDF(FileDirectory);

        /*
            CREATE(BullZipPDF);
        
        
        //ReportID := REPORT::"Customer - List";
        ReportID :=50050;
        FileDirectory := 'C:\ERC\';
        
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
        
        
        
        Subject:='REQUEST FOR QUOTATION '+SupplierSelect."Reference No.";
        Body:='Please find attached Quotation';
        CCName:='chelimo@erc.go.ke';
        //E-mail the files
        PrequalifiedSupRec.RESET;
        PrequalifiedSupRec.SETRANGE(PrequalifiedSupRec.Name,SupplierSelect."Supplier Name");
        IF  PrequalifiedSupRec.FIND('-') THEN
        
        Mail.CreateMessage(PrequalifiedSupRec."E-mail",CCName,Subject,Body,FileDirectory+FileName,TRUE);
        {IF MailSent THEN
        MESSAGE('Message sent')
        ELSE
        MailSent := Mail.Send();}
        
        UNTIL SupplierSelect.NEXT = 0;
        
        Window.CLOSE;
         */

    end;
}

