PageExtension 52193529 pageextension52193529 extends "VAT Report List" 
{
    Caption = 'VAT Report List';
    layout
    {

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Report Config. Code"(Control 4)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Report Config. Code"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Report Type"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Start Date"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""End Date"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 12)".

    }
    actions
    {
        
        modify("Create From VAT Return Period")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Card(Action 18)".

        modify("Open VAT Return Period Card")
        {
            Visible = false;
        }
        modify("Report Setup")
        {
            Visible = false;
        }
    }

    //Unsupported feature: Property Deletion (DeleteAllowed).


    //Unsupported feature: Property Deletion (SourceTableView).

}

