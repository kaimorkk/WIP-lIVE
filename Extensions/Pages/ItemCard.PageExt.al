PageExtension 52193438 pageextension52193438 extends "Item Card" 
{
    layout
    {

        //Unsupported feature: Property Modification (Name) on "Control8(Control 8)".

        modify(Inventory)
        {
            Caption = 'Inventory';
        }

        //Unsupported feature: Property Modification (SourceExpr) on ""Next Counting Start Date"(Control 194)".


        //Unsupported feature: Property Modification (Name) on ""Next Counting Start Date"(Control 194)".


        //Unsupported feature: Property Deletion (ShowMandatory) on "Description(Control 4)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Base Unit of Measure"(Control 6)".
        addbefore("item category code")
        {
            field("Procurement Category"; Rec."Procurement Category")
            {
                ApplicationArea = Basic;
            }
        }

        modify(StockoutWarningDefaultYes)
        {
            Visible = false;
        }
        modify(StockoutWarningDefaultNo)
        {
            Visible = false;
        }
        modify(PreventNegInventoryDefaultYes)
        {
            Visible = false;
        }
        modify(PreventNegInventoryDefaultNo)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Gen. Prod. Posting Group"(Control 95)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""VAT Prod. Posting Group"(Control 66)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Inventory Posting Group"(Control 40)".

        modify(GTIN)
        {
            Visible = false;
        }
        modify("Next Counting End Date")
        {
            Visible = false;
        }
       
       
        
        addafter("Last Date Modified")
        {
            field("Contract No.";"Contract No.")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Search Description";"Qty. on Purch. Order")
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on ""Assembly BOM"(Action 98)".


        //Unsupported feature: Property Modification (RunPageLink) on ""Production BOM"(Action 88)".


        //Unsupported feature: Property Modification (Name) on "CalculateCountingPeriod(Action 7380)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "ItemsByLocation(Action 68)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Calc. Stan&dard Cost"(Action 94)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Calc. Unit Price"(Action 90)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Action78(Action 78)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Action5(Action 5)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Troubleshooting(Action 17)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Skilled Resources"(Action 188)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""&Create Stockkeeping Unit"(Action 92)".



        //Unsupported feature: Code Modification on "CalculateCountingPeriod(Action 7380).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            Item.SETRANGE("No.","No.");
            PhysInvtCountMgt.UpdateItemPhysInvtCount(Item);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            PhysInvtCountMgt.UpdateItemPhysInvtCount(Rec);
            */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "CalculateCountingPeriod(Action 7380)".

    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        EnablePlanningControls;
        EnableCostingControls;
        SetSocialListeningFactboxVisibility;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        EnablePlanningControls;
        EnableCostingControls;
        */
    //end;

    //Unsupported feature: Property Deletion (Local) on "EnablePlanningControls(PROCEDURE 1)".


    //Unsupported feature: Property Deletion (Local) on "EnableCostingControls(PROCEDURE 3)".

}

