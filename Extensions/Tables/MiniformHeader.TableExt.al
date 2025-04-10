TableExtension 52193803 tableextension52193803 extends "Miniform Header" 
{

    //Unsupported feature: Code Modification on "LoadXMLin(PROCEDURE 2)".

    //procedure LoadXMLin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        XMLin.CREATEOUTSTREAM(OutStrm);
        XMLDOMManagement.LoadXMLDocumentFromOutStream(OutStrm,DOMxmlin);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        XMLin.CREATEOUTSTREAM(OutStrm);
        DOMxmlin.Load(OutStrm);
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "LoadXMLin(PROCEDURE 2).XMLDOMManagement(Variable 1002)".

}

