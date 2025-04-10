PageExtension 52193627 pageextension52193627 extends "Purchase Line Discounts" 
{
    var
        Vend: Record Vendor;


    //Unsupported feature: Code Modification on "GetCaption(PROCEDURE 3)".

    //procedure GetCaption();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetRecFilters;

        IF ItemNoFilter <> '' THEN
          SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table,DATABASE::Item)
        ELSE
          SourceTableName := '';

        IF VendNoFilter = '' THEN
          Description := ''
        ELSE BEGIN
          Vendor.SETFILTER("No.",VendNoFilter);
          IF Vendor.FINDFIRST THEN
            Description := Vendor.Name;
        END;

        EXIT(STRSUBSTNO('%1 %2 %3 %4 ',VendNoFilter,Description,SourceTableName,ItemNoFilter));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
          SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table,27)
        #5..7
        Vend.SETFILTER("No.",VendNoFilter);
        IF Vend.FINDFIRST THEN
          Description := Vend.Name;

        EXIT(STRSUBSTNO('%1 %2 %3 %4 ',VendNoFilter,Description,SourceTableName,ItemNoFilter));
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "GetCaption(PROCEDURE 3).Vendor(Variable 1003)".

}

