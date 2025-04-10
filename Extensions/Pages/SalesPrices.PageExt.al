PageExtension 52193625 pageextension52193625 extends "Sales Prices"
{
    layout
    {
        modify("Sales Code")
        {
            Editable = "Sales CodeEditable";
        }
        modify("Sales Type")
        {
            Visible = false;
        }
    }
    var

        "Sales CodeEditable": Boolean;


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesCodeEditable := SetSalesCodeEditable("Sales Type");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Sales CodeEditable" := "Sales Type" <> "Sales Type"::"All Customers"
    */
    //end;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesCodeFilterCtrlEnable := TRUE;
    SalesCodeEditable := TRUE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesCodeFilterCtrlEnable := TRUE;
    "Sales CodeEditable" := TRUE;
    */
    //end;

    //Unsupported feature: Property Deletion (Local) on "GetRecFilters(PROCEDURE 2)".


    //Unsupported feature: Property Deletion (Local) on "GetCaption(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "GetCaption(PROCEDURE 3)".

    //procedure GetCaption();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetRecFilters;

    SourceTableName := '';
    IF ItemNoFilter <> '' THEN
    #5..36
    IF SalesSrcTableName = Text000 THEN
      EXIT(STRSUBSTNO('%1 %2 %3',SalesSrcTableName,SourceTableName,ItemNoFilter));
    EXIT(STRSUBSTNO('%1 %2 %3 %4 %5',SalesSrcTableName,SalesCodeFilter,Description,SourceTableName,ItemNoFilter));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    GetRecFilters;
    "Sales CodeEditable" := "Sales Type" <> "Sales Type"::"All Customers";
    #2..39
    */
    //end;

    //Unsupported feature: Property Deletion (Local) on "CheckFilters(PROCEDURE 4)".

}

