TableExtension 52193741 tableextension52193741 extends "Service Item" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Customer No."(Field 8).OnValidate".

        //trigger "(Field 8)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Customer No." <> xRec."Customer No." THEN BEGIN
              IF CheckifActiveServContLineExist THEN
                ERROR(
                  Text004,
                  FIELDCAPTION("Customer No."),"Customer No.",TABLECAPTION,"No.");
              ServItemLinesExistErr(FIELDCAPTION("Customer No."));
              IF ServLedgEntryExist THEN
                IF NOT CONFIRM(
                     Text017,
            #10..19
              ServLogMgt.ServItemCustChange(Rec,xRec);
              ServLogMgt.ServItemShipToCodeChange(Rec,xRec);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..5
              ErrMessageIfServItemLinesExist(FIELDCAPTION("Customer No."));
            #7..22
            */
        //end;


        //Unsupported feature: Code Modification on ""Ship-to Code"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Ship-to Code" <> xRec."Ship-to Code" THEN BEGIN
              IF CheckifActiveServContLineExist THEN
                ERROR(
                  Text004,
                  FIELDCAPTION("Ship-to Code"),"Ship-to Code",TABLECAPTION,"No.");
              ServItemLinesExistErr(FIELDCAPTION("Ship-to Code"));
              IF ServLedgEntryExist THEN
                IF NOT CONFIRM(
                     Text017,
            #10..13
                END;
              ServLogMgt.ServItemShipToCodeChange(Rec,xRec);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..5
              ErrMessageIfServItemLinesExist(FIELDCAPTION("Ship-to Code"));
            #7..16
            */
        //end;
    }

    //Unsupported feature: Property Deletion (Local) on "ServItemLinesExistErr(PROCEDURE 7)".


    //Unsupported feature: Property Modification (Name) on "ServItemLinesExistErr(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "ServItemLinesExistErr(PROCEDURE 7)".

    //procedure ServItemLinesExistErr();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ServItemLinesExist THEN
          ERROR(
            ChgCustomerErr,
            ChangedFieldName,
            ServItemLine."Document No.",ServItemLine."Line No.",ServItemLine."Service Item No.",
            ServItemLine."Serial No.",ServItemLine."Customer No.",ServItemLine."Ship-to Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ServItemLinesExist THEN
          ERROR(
            Text016,
            ChangedFieldName);
        */
    //end;

    //Unsupported feature: Property Insertion (Length) on "CheckIfCanBeDeleted(PROCEDURE 5).ReturnValue".



    //Unsupported feature: Code Modification on "CheckIfCanBeDeleted(PROCEDURE 5)".

    //procedure CheckIfCanBeDeleted();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ServItemLinesExist THEN
          EXIT(
            STRSUBSTNO(
        #4..21
          IF ServContract.GET(ServContractLine."Contract Type",ServContractLine."Contract No.") THEN
            EXIT(
              STRSUBSTNO(Text002,TABLECAPTION,"No."));

        EXIT(MoveEntries.CheckIfServiceItemCanBeDeleted(ServiceLedgerEntry,"No."));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..24
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CheckIfCanBeDeleted(PROCEDURE 5).ServiceLedgerEntry(Variable 1000)".


    var
        Text016: label 'You cannot change the %1 because there are outstanding service orders/quotes attached to it.';
}

