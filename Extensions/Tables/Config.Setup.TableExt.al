TableExtension 52193807 tableextension52193807 extends "Config. Setup" 
{

    //Unsupported feature: Code Modification on "ReadPackageHeader(PROCEDURE 7)".

    //procedure ReadPackageHeader();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Package File Name" <> '' THEN BEGIN
          XMLDOMManagement.LoadXMLDocumentFromFile(DecompressedFileName,PackageXML);
          DocumentElement := PackageXML.DocumentElement;
          "Package Code" :=
            COPYSTR(
        #6..25
          "Package Name" := '';
          "Product Version" := '';
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Package File Name" <> '' THEN BEGIN
          PackageXML := PackageXML.XmlDocument;
          PackageXML.Load(DecompressedFileName);
        #3..28
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "ReadPackageHeader(PROCEDURE 7).XMLDOMManagement(Variable 1004)".

}

