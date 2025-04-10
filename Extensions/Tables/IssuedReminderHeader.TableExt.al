TableExtension 52193516 tableextension52193516 extends "Issued Reminder Header" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 36)".


        //Unsupported feature: Deletion (FieldCollection) on ""Add. Fee per Line"(Field 44)".

    }

    //Unsupported feature: Code Modification on "PrintRecords(PROCEDURE 1)".

    //procedure PrintRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH IssuedReminderHeader DO BEGIN
          COPY(Rec);
          IF NOT SendAsEmail THEN BEGIN
            ReportSelection.SETRANGE(Usage,ReportSelection.Usage::Reminder);
            ReportSelection.SETFILTER("Report ID",'<>0');
            ReportSelection.FIND('-');
            REPEAT
              REPORT.RUNMODAL(ReportSelection."Report ID",ShowRequestForm,FALSE,IssuedReminderHeader)
            UNTIL ReportSelection.NEXT = 0;
          END ELSE
            SendReport(IssuedReminderHeader);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WITH IssuedReminderHeader DO BEGIN
          COPY(Rec);
          ReportSelection.SETRANGE(Usage,ReportSelection.Usage::Reminder);
          ReportSelection.SETFILTER("Report ID",'<>0');
          ReportSelection.FIND('-');
          REPEAT
            IF NOT SendAsEmail THEN
              REPORT.RUNMODAL(ReportSelection."Report ID",ShowRequestForm,FALSE,IssuedReminderHeader)
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
        DocumentMailing.EmailRecords(IssuedReminderHeader);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ServerAttachmentFilePath := COPYSTR(FileManagement.ServerTempFileName('pdf'),1,250);
        REPORT.SAVEASPDF(ReportId,ServerAttachmentFilePath,IssuedReminderHeader);
        COMMIT;
        DocumentMailing.EmailFileFromIssuedReminder(IssuedReminderHeader,ServerAttachmentFilePath);
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "PrintRecords(PROCEDURE 1).IssuedReminderHeader(Variable 1003)".


    //Unsupported feature: Deletion (ParameterCollection) on "SendReport(PROCEDURE 8).IssuedReminderHeader(Parameter 1000)".


    var
        IssuedReminderHeader: Record "Issued Reminder Header";
}

