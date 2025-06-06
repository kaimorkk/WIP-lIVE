

page 70042 "Request for EOI"
{
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(EOI));


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000016; "Request for EOI Lines")
            {
                SubPageLink = "Requisition No" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Request for EOI")
            {
                Caption = 'Request for EOI';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                }
                action("Technical Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Technical Specifications';
                    RunObject = Page "Tender Specifications";
                    RunPageLink = "Requisition No" = field(No);
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    //  RunObject = Page Bidders;
                    //  RunPageLink = "Ref No." = field(No);
                }
                action("Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening Summary';
                    RunObject = Page "Tender Bidders Summary";
                    RunPageLink = "Ref No." = field(No);
                }
                action("<Page Supplier Selection>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders Supplier Selection';
                    RunObject = Page "Tender Supplier";
                    RunPageLink = "Reference No." = field(No);
                    RunPageView = sorting("Reference No.", "Supplier No");
                }
                action("Page Supplier Selection")
                {
                    ApplicationArea = Basic;
                    Caption = 'Select Prequalified Suppliers';
                    RunObject = Page "Supplier Selection";
                    RunPageLink = "Reference No." = field(No),
                                  "Supplier Category" = field("Supplier Category");
                    RunPageView = sorting("Reference No.", "Supplier Name");
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';

                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalMgt.SendProcApprovalRequest(Rec);
                    end;
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                action("Request for Quotations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotations';

                    trigger OnAction()
                    begin
                        //SupplierSelect.RESET;
                        //SupplierSelect.SETRANGE(SupplierSelect."Reference No.",No);
                        //IF SupplierSelect.FIND('-') THEN BEGIN
                        //REPEAT
                        //REPORT.RUN(51511272,TRUE,TRUE,Rec);
                        //UNTIL SupplierSelect.NEXT=0;
                        //END;

                        SupplierSelect.Reset;
                        SupplierSelect.SetFilter("Reference No.", Rec.No);
                        Report.Run(70002, true, true, SupplierSelect);
                        SupplierSelect.Reset;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    //  RunObject = Report UnknownReport51511025;
                    Visible = false;

                    trigger OnAction()
                    begin

                        //SupplierSelect.RESET;
                        //SupplierSelect.SETRANGE(SupplierSelect."Reference No.",No);
                        //IF SupplierSelect.FIND('-') THEN BEGIN
                        //REPEAT
                        Report.Run(70004, true, true, Rec);
                        //UNTIL SupplierSelect.NEXT=0;
                        //END;
                        //SupplierSelect.RESET;
                    end;
                }
                action("Cost Comparison Sheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison Sheet';

                    trigger OnAction()
                    begin
                        TenderBids.Reset;
                        TenderBids.SetFilter(TenderBids."Requisition No", Rec.No);
                        Report.Run(70003, true, true, TenderBids);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Mandatory Requirements_Promoted"; "Mandatory Requirements")
                {
                }
                actionref("Technical Specifications_Promoted"; "Technical Specifications")
                {
                }
                actionref(Bidders_Promoted; Bidders)
                {
                }
                actionref("<Page Supplier Selection>_Promoted"; "<Page Supplier Selection>")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::EOI;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::EOI;
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
        TenderBids: Record "Tender Bids";


    procedure PrintToBullZip()
    begin
        SupplierSelect.SetRange(SupplierSelect."Reference No.", Rec.No);

        ReportID := 70002;
        FileDirectory := 'C:\Users\Jake\Desktop';

        //Report.SaveAsPdf(ReportID, FileDirectory, Rec);
        ////Report.SaveAsPdf(FileDirectory);

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

#pragma implicitwith restore

