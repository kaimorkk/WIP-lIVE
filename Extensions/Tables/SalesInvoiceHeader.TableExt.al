TableExtension 52193465 tableextension52193465 extends "Sales Invoice Header"
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 112)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Canceled By"(Field 1300)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PostSalesLinesDelete.IsDocumentDeletionAllowed("Posting Date");
    TESTFIELD("No. Printed");
    LOCKTABLE;
    PostSalesLinesDelete.DeleteSalesInvLines(Rec);
    #5..7
    SalesCommentLine.DELETEALL;

    ApprovalsMgt.DeletePostedApprovalEntry(DATABASE::"Sales Invoice Header","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #2..10
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: ShowRequestForm) (ParameterCollection) on "EmailRecords(PROCEDURE 17)".



    //Unsupported feature: Code Modification on "EmailRecords(PROCEDURE 17)".

    //procedure EmailRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesInvoiceHeader.COPY(Rec);
    DocumentMailing.EmailRecords(SalesInvoiceHeader);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SendRecords(ShowRequestForm,TRUE);
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: SendAsEmail) (ParameterCollection) on "SendRecords(PROCEDURE 12)".



    //Unsupported feature: Code Modification on "SendRecords(PROCEDURE 12)".

    //procedure SendRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH SalesInvoiceHeader DO BEGIN
      COPY(Rec);
      ReportSelections.SETRANGE(Usage,ReportSelections.Usage::"S.Invoice");
      ReportSelections.SETFILTER("Report ID",'<>0');
      ReportSelections.FIND('-');
      REPEAT
        REPORT.RUNMODAL(ReportSelections."Report ID",ShowRequestForm,FALSE,SalesInvoiceHeader)
      UNTIL ReportSelections.NEXT = 0;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
        IF NOT SendAsEmail THEN
          REPORT.RUNMODAL(ReportSelections."Report ID",ShowRequestForm,FALSE,SalesInvoiceHeader)
        ELSE
          SendReport(ReportSelections."Report ID",SalesInvoiceHeader)
      UNTIL ReportSelections.NEXT = 0;
    END;
    */
    //end;

    procedure PrintRecords(ShowRequestForm: Boolean)
    begin
        //SendRecords(ShowRequestForm,false);
    end;

    local procedure SendReport(ReportId: Integer; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        DocumentMailing: Codeunit "Document-Mailing";
        FileManagement: Codeunit "File Management";
        ServerAttachmentFilePath: Text[250];
        BlobInStream: InStream;
        BlobOutStream: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        RecRef: RecordRef;
    begin
        // ServerAttachmentFilePath := CopyStr(FileManagement.ServerTempFileName('pdf'), 1, 250);
        Report.SaveAs(ReportId, '', ReportFormat::Pdf, BlobOutStream, RecRef);
        // Report.SaveAsPdf(ReportId, ServerAttachmentFilePath, SalesInvoiceHeader);
        Commit;
        // DocumentMailing.EmailFileFromSalesInvoiceHeader(SalesInvoiceHeader,ServerAttachmentFilePath);
    end;

    //Unsupported feature: Deletion (VariableCollection) on "EmailRecords(PROCEDURE 17).SalesInvoiceHeader(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "EmailRecords(PROCEDURE 17).DocumentMailing(Variable 1001)".

}

