TableExtension 52193583 tableextension52193583 extends "Report Inbox" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 2)".

    }

    //Unsupported feature: Code Modification on "ShowReport(PROCEDURE 1)".

    //procedure ShowReport();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CALCFIELDS("Report Output","Report Name");
        IF NOT "Report Output".HASVALUE THEN BEGIN
          Read := TRUE;
          MODIFY;
          COMMIT;
          MESSAGE(ReportIsEmptyMsg);
          EXIT;
        END;
        IF "Report Name" <> '' THEN
          FileName := DELCHR("Report Name",'=','/:*?"<>|') + Suffix
        ELSE
          FileName := DELCHR(Description,'=','/:*?"<>|') + Suffix;

        "Report Output".CREATEINSTREAM(Instr);
        Downloaded := DOWNLOADFROMSTREAM(Instr,FileDownLoadTxt,'','',FileName);

        IF NOT Read AND Downloaded THEN BEGIN
          Read := TRUE;
          MODIFY;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        FileName := DELCHR("Report Name",'=','\/:*?"<>|') + Suffix;
        #14..20
        */
    //end;
}

