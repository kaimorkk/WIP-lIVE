TableExtension 52193467 tableextension52193467 extends "Sales Cr.Memo Header"
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 112)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PostSalesLinesDelete.IsDocumentDeletionAllowed("Posting Date");
    TESTFIELD("No. Printed");
    LOCKTABLE;
    PostSalesLinesDelete.DeleteSalesCrMemoLines(Rec);
    #5..7
    SalesCommentLine.DELETEALL;

    ApprovalsMgt.DeletePostedApprovalEntry(DATABASE::"Sales Cr.Memo Header","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #2..10
    */
    //end;


    //Unsupported feature: Code Modification on "PrintRecords(PROCEDURE 1)".

    //procedure PrintRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SendRecords(ShowRequestForm);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SendRecords(ShowRequestForm,FALSE);
    */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: ShowRequestForm) (ParameterCollection) on "EmailRecords(PROCEDURE 17)".



    //Unsupported feature: Code Modification on "EmailRecords(PROCEDURE 17)".

    //procedure EmailRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesCrMemoHeader.COPY(Rec);
    DocumentMailing.EmailRecords(SalesCrMemoHeader);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SendRecords(ShowRequestForm,TRUE);
    */
    //end;

    procedure SendRecords(ShowRequestForm: Boolean; SendAsEmail: Boolean)
    var
        ReportSelections: Record "Report Selections";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        with SalesCrMemoHeader do begin
            Copy(Rec);
            ReportSelections.SetRange(Usage, ReportSelections.Usage::"S.Cr.Memo");
            ReportSelections.SetFilter("Report ID", '<>0');
            ReportSelections.Find('-');
            repeat
                if not SendAsEmail then
                    Report.RunModal(ReportSelections."Report ID", ShowRequestForm, false, SalesCrMemoHeader)
                else
                    SendReport(ReportSelections."Report ID", SalesCrMemoHeader)
            until ReportSelections.Next = 0;
        end;
    end;

    local procedure SendReport(ReportId: Integer; SalesCrMemoHeader: Record "Sales Cr.Memo Header")
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

        // Report.SaveAsPdf(ReportId, ServerAttachmentFilePath, SalesCrMemoHeader);
        Commit;
        //DocumentMailing.EmailFileFromSalesCrMemoHeader(SalesCrMemoHeader,ServerAttachmentFilePath);
    end;

    //Unsupported feature: Deletion (VariableCollection) on "EmailRecords(PROCEDURE 17).SalesCrMemoHeader(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "EmailRecords(PROCEDURE 17).DocumentMailing(Variable 1001)".

}

