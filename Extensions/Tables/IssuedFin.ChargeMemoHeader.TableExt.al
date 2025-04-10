TableExtension 52193521 tableextension52193521 extends "Issued Fin. Charge Memo Header" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 36)".

    }

    //Unsupported feature: Code Modification on "PrintRecords(PROCEDURE 1)".

    //procedure PrintRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH IssuedFinChrgMemoHeader DO BEGIN
          COPY(Rec);
          IF NOT SendAsEmail THEN BEGIN
            ReportSelection.SETRANGE(Usage,ReportSelection.Usage::"Fin.Charge");
            ReportSelection.SETFILTER("Report ID",'<>0');
            ReportSelection.FIND('-');
            REPEAT
              REPORT.RUNMODAL(ReportSelection."Report ID",ShowRequestForm,FALSE,IssuedFinChrgMemoHeader)
            UNTIL ReportSelection.NEXT = 0;
          END ELSE
            SendReport(IssuedFinChrgMemoHeader);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WITH IssuedFinChrgMemoHeader DO BEGIN
          COPY(Rec);
          ReportSelection.SETRANGE(Usage,ReportSelection.Usage::"Fin.Charge");
          ReportSelection.SETFILTER("Report ID",'<>0');
          ReportSelection.FIND('-');
          REPEAT
            IF NOT SendAsEmail THEN
              REPORT.RUNMODAL(ReportSelection."Report ID",ShowRequestForm,FALSE,IssuedFinChrgMemoHeader)
            ELSE
              SendReport(ReportSelection."Report ID");
          UNTIL ReportSelection.NEXT = 0;
        END;
        */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: ReportId) (ParameterCollection) on "SendReport(PROCEDURE 8)".


    //Unsupported feature: Variable Insertion (Variable: FileManagement) (VariableCollection) on "SendReport(PROCEDURE 8)".


    //Unsupported feature: Variable Insertion (Variable: ServerAttachmentFilePath) (VariableCollection) on "SendReport(PROCEDURE 8)".



    //Unsupported feature: Code Modification on "SendReport(PROCEDURE 8)".

    //procedure SendReport();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DocumentMailing.EmailRecords(IssuedFinChrgMemoHeader);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ServerAttachmentFilePath := COPYSTR(FileManagement.ServerTempFileName('pdf'),1,250);
        REPORT.SAVEASPDF(ReportId,ServerAttachmentFilePath,IssuedFinChrgMemoHeader);
        COMMIT;
        DocumentMailing.EmailFileFromIssuedFinChrgMemo(IssuedFinChrgMemoHeader,ServerAttachmentFilePath);
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "PrintRecords(PROCEDURE 1).IssuedFinChrgMemoHeader(Variable 1003)".


    //Unsupported feature: Deletion (ParameterCollection) on "SendReport(PROCEDURE 8).IssuedFinChrgMemoHeader(Parameter 1004)".


    var
        IssuedFinChrgMemoHeader: Record "Issued Fin. Charge Memo Header";
}

