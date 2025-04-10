PageExtension 52193448 pageextension52193448 extends "Sales Invoice Subform" 
{
    layout
    {

        //Unsupported feature: Code Modification on "Type(Control 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TypeOnAfterValidate;
            NoOnAfterValidate;
            TypeChosen := HasTypeToFillMandatotyFields;

            IF xRec."No." <> '' THEN
              RedistributeTotalsOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TypeOnAfterValidate;
            */
        //end;


        //Unsupported feature: Code Modification on ""No."(Control 4).OnValidate".

        //trigger "(Control 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ShowShortcutDimCode(ShortcutDimCode);
            NoOnAfterValidate;

            IF xRec."No." <> '' THEN
              RedistributeTotalsOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ShowShortcutDimCode(ShortcutDimCode);
            NoOnAfterValidate;
            */
        //end;

        //Unsupported feature: Property Deletion (ShowMandatory) on ""No."(Control 4)".



        //Unsupported feature: Code Modification on ""Cross-Reference No."(Control 58).OnLookup".

        //trigger "(Control 58)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CrossReferenceNoLookUp;
            InsertExtendedText(FALSE);
            NoOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CrossReferenceNoLookUp;
            InsertExtendedText(FALSE);
            */
        //end;


        //Unsupported feature: Code Modification on ""Cross-Reference No."(Control 58).OnValidate".

        //trigger "(Control 58)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CrossReferenceNoOnAfterValidat;
            NoOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CrossReferenceNoOnAfterValidat;
            */
        //end;
        modify("VAT Prod. Posting Group")
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "Quantity(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            QuantityOnAfterValidate;
            RedistributeTotalsOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            QuantityOnAfterValidate;
            */
        //end;

        //Unsupported feature: Property Deletion (ShowMandatory) on "Quantity(Control 8)".



        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Control 34).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            UnitofMeasureCodeOnAfterValida;
            RedistributeTotalsOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            UnitofMeasureCodeOnAfterValida;
            */
        //end;
        modify("Unit Price")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Unit Price"(Control 12)".

        modify("Line Amount")
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = false;
        }
        modify("Line Discount Amount")
        {
            Visible = false;
        }
        modify(Control39)
        {
            Visible = false;
        }
        modify(Control33)
        {
            Visible = false;
        }
        modify("Invoice Discount Amount")
        {
            Visible = false;
        }
        modify("Invoice Disc. Pct.")
        {
            Visible = false;
        }
        modify(Control15)
        {
            Visible = false;
        }
        modify("Total Amount Excl. VAT")
        {
            Visible = false;
        }
        modify("Total VAT Amount")
        {
            Visible = false;
        }
        modify("Total Amount Incl. VAT")
        {
            Visible = false;
        }
        
        addafter(PriceExists)
        {
            field("Levy Type";"Levy Type")
            {
                ApplicationArea = Basic;
            }
            field("Limit Text";"Limit Text")
            {
                ApplicationArea = Basic;
            }
            field("Base Amount";"Base Amount")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Get &Price"(Action 1903079504)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Get Li&ne Discount"(Action 1907415004)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""E&xplode BOM"(Action 1903098604)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Insert &Ext. Texts"(Action 1900206204)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "GetShipmentLines(Action 1900545004)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Location(Action 1904945204)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 1904522204)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Item Charge &Assignment"(Action 1907184504)".

    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1006)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text000 : ENU=Unable to run this function while in View mode.;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text000 : ENU=Unable to execute this function while in view only mode.;
        //Variable type has not been exported.


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        CLEAR(DocumentTotals);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        */
    //end;
}

