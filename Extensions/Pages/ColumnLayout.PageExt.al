PageExtension 52193508 pageextension52193508 extends "Column Layout" 
{
    layout
    {

        //Unsupported feature: Code Modification on ""Cost Center Totaling"(Control 3).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
            /*
            EXIT(CostCenter.LookupCostCenterFilter(Text));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            EXIT(LookUpDimFilter(5,Text));
            */
        //end;


        //Unsupported feature: Code Modification on ""Cost Object Totaling"(Control 5).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
            /*
            EXIT(CostObject.LookupCostObjectFilter(Text));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            EXIT(LookUpDimFilter(6,Text));
            */
        //end;
    }
}

