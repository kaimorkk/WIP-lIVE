TableExtension 52193710 tableextension52193710 extends "Item Cross Reference" 
{

    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("Cross-Reference Type No." <> '') AND
           ("Cross-Reference Type" = "Cross-Reference Type"::" ")
        THEN
          ERROR(Text000,FIELDCAPTION("Cross-Reference Type No."));

        IF ("Cross-Reference Type" = "Cross-Reference Type"::Vendor) AND NOT ItemVendorResetRequired(xRec,Rec) THEN
          UpdateItemVendorNo(xRec,"Cross-Reference No.")
        ELSE BEGIN
          IF xRec."Cross-Reference Type" = "Cross-Reference Type"::Vendor THEN
            DeleteItemVendor(xRec);
          IF "Cross-Reference Type" = "Cross-Reference Type"::Vendor THEN
            CreateItemVendor;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        IF xRec."Cross-Reference Type" = "Cross-Reference Type"::Vendor THEN
          DeleteItemVendor(xRec);
        IF "Cross-Reference Type" = "Cross-Reference Type"::Vendor THEN
          CreateItemVendor;
        */
    //end;


    //Unsupported feature: Code Modification on "CreateItemVendor(PROCEDURE 1)".

    //procedure CreateItemVendor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("Cross-Reference Type" = "Cross-Reference Type"::Vendor) AND
           ItemVend.WRITEPERMISSION
        THEN BEGIN
          ItemVend.RESET;
          ItemVend.SETRANGE("Item No.","Item No.");
          ItemVend.SETRANGE("Vendor No.","Cross-Reference Type No.");
          ItemVend.SETRANGE("Variant Code","Variant Code");
          IF ItemVend.ISEMPTY THEN BEGIN
            ItemVend."Item No." := "Item No.";
            ItemVend."Vendor No." := "Cross-Reference Type No.";
            ItemVend.VALIDATE("Vendor No.");
            ItemVend."Variant Code" := "Variant Code";
            ItemVend."Vendor Item No." := "Cross-Reference No.";
            ItemVend.INSERT;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
          IF NOT ItemVend.FIND('-') THEN BEGIN
        #9..16
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ItemCrossReference2) (VariableCollection) on "DeleteItemVendor(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "DeleteItemVendor(PROCEDURE 2)".

    //procedure DeleteItemVendor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT MultipleCrossReferencesExist(ItemCrossReference) THEN
          IF ItemVend.GET(ItemCrossReference."Cross-Reference Type No.",ItemCrossReference."Item No.",ItemCrossReference."Variant Code") THEN
            IF UPPERCASE(DELCHR(ItemVend."Vendor Item No.",'<',' ')) = ItemCrossReference."Cross-Reference No." THEN
              ItemVend.DELETE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ItemCrossReference2.SETRANGE("Item No.",ItemCrossReference."Item No.");
        ItemCrossReference2.SETRANGE("Variant Code",ItemCrossReference."Variant Code");
        ItemCrossReference2.SETRANGE("Cross-Reference Type",ItemCrossReference."Cross-Reference Type");
        ItemCrossReference2.SETRANGE("Cross-Reference Type No.",ItemCrossReference."Cross-Reference Type No.");
        ItemCrossReference2.SETRANGE("Cross-Reference No.",ItemCrossReference."Cross-Reference No.");
        ItemCrossReference2.SETFILTER("Unit of Measure",'<>%1',ItemCrossReference."Unit of Measure");
        IF NOT ItemCrossReference2.FINDFIRST THEN BEGIN
          ItemVend.RESET;
          ItemVend.SETRANGE("Item No.",ItemCrossReference."Item No.");
          ItemVend.SETRANGE("Vendor No.",ItemCrossReference."Cross-Reference Type No.");
          ItemVend.SETRANGE("Variant Code",ItemCrossReference."Variant Code");
          IF ItemVend.FIND('-') THEN
            REPEAT
              IF UPPERCASE(DELCHR(ItemVend."Vendor Item No.",'<',' ')) = ItemCrossReference."Cross-Reference No." THEN
                ItemVend.DELETE;
            UNTIL ItemVend.NEXT = 0;
        END;
        */
    //end;
}

