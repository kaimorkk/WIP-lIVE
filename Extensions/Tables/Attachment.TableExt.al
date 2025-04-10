TableExtension 52193652 tableextension52193652 extends Attachment 
{

    //Unsupported feature: Code Modification on "ExportAttachmentToClientFile(PROCEDURE 2)".

    //procedure ExportAttachmentToClientFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RMSetup.GET;
        IF RMSetup."Attachment Storage Type" = RMSetup."Attachment Storage Type"::"Disk File" THEN
          RMSetup.TESTFIELD("Attachment Storage Location");
        #4..11
        END;

        FileFilter := UPPERCASE("File Extension") + ' (*.' + "File Extension" + ')|*.' + "File Extension";
        Success := DOWNLOAD(ServerFileName,Text005,Path,FileFilter,ExportToFile);
        FileMgt.DeleteServerFile(ServerFileName);
        EXIT(Success)
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..14
        EXIT(DOWNLOAD(ServerFileName,Text005,Path,FileFilter,ExportToFile));
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "ExportAttachmentToClientFile(PROCEDURE 2).Success(Variable 1004)".

}

