PageExtension 52193457 pageextension52193457 extends "Job Card"
{
    layout
    {
        modify("Currency Code")
        {
            Editable = CurrencyCodeEditable;
        }
        modify("Invoice Currency Code")
        {
            Editable = InvoiceCurrencyCodeEditable;
        }

        //Unsupported feature: Code Insertion on ""Currency Code"(Control 98)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        CurrencyCheck;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Invoice Currency Code"(Control 100)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        CurrencyCheck;
        */
        //end;
    }

    var

        InvoiceCurrencyCodeEditable: Boolean;

        CurrencyCodeEditable: Boolean;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    CurrencyCheck;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //begin
    /*
    CurrencyCodeEditable := TRUE;
    InvoiceCurrencyCodeEditable := TRUE;
    */
    //end;

    procedure CurrencyCheck()
    begin
        if "Currency Code" <> '' then
            InvoiceCurrencyCodeEditable := false
        else
            InvoiceCurrencyCodeEditable := true;

        if "Invoice Currency Code" <> '' then
            CurrencyCodeEditable := false
        else
            CurrencyCodeEditable := true;
    end;
}

