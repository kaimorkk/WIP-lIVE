PageExtension 52193439 pageextension52193439 extends "Item List" 
{
    layout
    {
       

        //Unsupported feature: Property Deletion (SubPageLink) on "Control26(Control 26)".


        //Unsupported feature: Property Deletion (PagePartID) on "Control26(Control 26)".


        //Unsupported feature: Property Deletion (Visible) on "Control26(Control 26)".


        //Unsupported feature: Property Deletion (PartType) on "Control26(Control 26)".

       
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on ""Production BOM"(Action 32)".

        addafter("Item Journal")
        {
            action("Phy. Inv. Journal")
            {
                ApplicationArea = Basic;
                Image = Journals;
                RunObject = Page "Phys. Inventory Journal";
            }
        }
    }
}

