TableExtension 52193479 tableextension52193479 extends Resource 
{
    fields
    {
      field(50000; Email; Text[50])
        {
            DataClassification = CustomerContent;
        }
field(50029; "M-Pesa Number"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(63; "ID/Passport No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
       

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CheckJobPlanningLine;

        MoveEntries.MoveResEntries(Rec);

        ResCapacityEntry.SETCURRENTKEY("Resource No.");
        #6..40
        ResUnitMeasure.DELETEALL;

        SalesOrderLine.SETCURRENTKEY(Type,"No.");
        SalesOrderLine.SETRANGE(Type,SalesOrderLine.Type::Resource);
        SalesOrderLine.SETRANGE("No.","No.");
        IF SalesOrderLine.FINDFIRST THEN
          ERROR(SalesDocumentExistsErr,"No.",SalesOrderLine."Document Type");

        IF ExistUnprocessedTimeSheets THEN
          ERROR(Text006,TABLECAPTION,"No.");

        DimMgt.DeleteDefaultDim(DATABASE::Resource,"No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #3..43
        SalesOrderLine.SETFILTER("Document Type",'%1|%2',
          SalesOrderLine."Document Type"::Order,
          SalesOrderLine."Document Type"::"Return Order");
        SalesOrderLine.SETRANGE(Type,SalesOrderLine.Type::Resource);
        SalesOrderLine.SETRANGE("No.","No.");
        IF SalesOrderLine.FINDFIRST THEN BEGIN
          IF SalesOrderLine."Document Type" = SalesOrderLine."Document Type"::Order THEN
            ERROR(Text000,TABLECAPTION,"No.");
          IF SalesOrderLine."Document Type" = SalesOrderLine."Document Type"::"Return Order" THEN
            ERROR(Text003,TABLECAPTION,"No.");
        END;
        #48..52
        */
    //end;

    var
        Text000: label 'You cannot delete %1 %2 because there are one or more outstanding Sales Orders that include this resource.';

    var
        Text003: label 'You cannot delete %1 %2 because there are one or more outstanding Sales Return Orders that include this resource.';
}

