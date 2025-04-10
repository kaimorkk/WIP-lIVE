TableExtension 52193564 tableextension52193564 extends "IC Partner" 
{

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GLEntry.LOCKTABLE;

        GLEntry.SETCURRENTKEY("IC Partner Code");
        #4..19
            ERROR(Text002,Code,Cust.TABLECAPTION,Cust."No.");

        IF "Vendor No." <> '' THEN
          IF Vend.GET("Vendor No.") THEN
            ERROR(Text002,Code,Vend.TABLECAPTION,Vend."No.");

        ICInbox.SETRANGE("IC Partner Code",Code);
        #27..38
        CommentLine.SETRANGE("Table Name",CommentLine."Table Name"::"IC Partner");
        CommentLine.SETRANGE("No.",Code);
        CommentLine.DELETEALL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..22
          IF Vend.GET("Customer No.") THEN
        #24..41
        */
    //end;
}

