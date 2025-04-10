TableExtension 52193708 tableextension52193708 extends "Stockkeeping Unit" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Item No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Item No." = xRec."Item No." THEN
              EXIT;

            #4..27
              "Overflow Level" := Item."Overflow Level";
              "Last Direct Cost" := Item."Last Direct Cost";
              "Standard Cost" := Item."Standard Cost";
              "Unit Cost" := Item."Unit Cost";
            END;
            CALCFIELDS(Description,"Description 2","Assembly BOM",Inventory);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..30
            END;
            CALCFIELDS(Description,"Description 2","Assembly BOM",Inventory);
            */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Location Code" = '' THEN
              VALIDATE("Replenishment System");
            CheckTransferRoute;
            CALCFIELDS(
              Inventory,"Qty. on Purch. Order","Qty. on Prod. Order","Qty. in Transit",
              "Qty. on Component Lines","Qty. on Sales Order","Qty. on Service Order","Qty. on Job Order",
              "Qty. on Assembly Order","Qty. on Asm. Component");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Location Code" = '' THEN
              VALIDATE("Replenishment System");
            #4..7
            */
        //end;

        //Unsupported feature: Deletion on ""Lead Time Calculation"(Field 33).OnValidate".



        //Unsupported feature: Code Modification on ""Transfer-from Code"(Field 5700).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            FromSKU.SETRANGE("Location Code","Transfer-from Code");
            FromSKU.SETRANGE("Item No.","Item No.");
            FromSKU.SETRANGE("Variant Code","Variant Code");
            #4..6
              "Transfer-Level Code" := FromSKU."Transfer-Level Code" - 1;
            FromLocation := "Transfer-from Code";
            MODIFY(TRUE);

            CheckTransferRoute;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
            IF NOT UpdateTransferLevels(Rec) THEN
              ShowLoopError;

            IF "Transfer-from Code" <> '' THEN
              IF NOT TransferRouteExists("Transfer-from Code","Location Code") THEN
                ERROR(
                  Text005,
                  TransferRoute.TABLECAPTION,
                  FIELDCAPTION("Location Code"),
                  "Transfer-from Code",
                  "Location Code");
            */
        //end;
    }
}

