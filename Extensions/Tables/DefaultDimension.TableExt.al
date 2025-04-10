TableExtension 52193539 tableextension52193539 extends "Default Dimension" 
{
    fields
    {
        modify("No.")
        {
            TableRelation = if ("Table ID"=const(13)) "Salesperson/Purchaser"
                            else if ("Table ID"=const(15)) "G/L Account"
                            else if ("Table ID"=const(18)) Customer
                            else if ("Table ID"=const(23)) Vendor
                            else if ("Table ID"=const(27)) Item
                            else if ("Table ID"=const(152)) "Resource Group"
                            else if ("Table ID"=const(156)) Resource
                            else if ("Table ID"=const(167)) Job
                            else if ("Table ID"=const(270)) "Bank Account"
                            else if ("Table ID"=const(413)) "IC Partner"
                            else if ("Table ID"=const(5071)) Campaign
                            else if ("Table ID"=const(5200)) Employee
                            else if ("Table ID"=const(5600)) "Fixed Asset"
                            else if ("Table ID"=const(5628)) Insurance
                            else if ("Table ID"=const(5903)) "Service Order Type"
                            else if ("Table ID"=const(5904)) "Service Item Group"
                            else if ("Table ID"=const(5940)) "Service Item"
                            else if ("Table ID"=const(5714)) "Responsibility Center"
                            else if ("Table ID"=const(5800)) "Item Charge"
                            else if ("Table ID"=const(99000754)) "Work Center"
                            else if ("Table ID"=const(5965)) "Service Contract Header"
                            else if ("Table ID"=const(5105)) "Customer Templ.";
        }

        //Unsupported feature: Code Modification on ""Dimension Code"(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT DimMgt.CheckDim("Dimension Code") THEN
              ERROR(DimMgt.GetDimErr);
            IF "Dimension Code" <> xRec."Dimension Code" THEN
              VALIDATE("Dimension Value Code",'');
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF NOT DimMgt.CheckDim("Dimension Code") THEN
              ERROR(DimMgt.GetDimErr);
            */
        //end;
    }
}

