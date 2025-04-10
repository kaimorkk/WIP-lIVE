PageExtension 52193681 pageextension52193681 extends "Firm Planned Prod. Orders" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "ProdOrderJobCard(Action 1903594306)".


        //Unsupported feature: Property Insertion (RunObject) on "ProdOrderJobCard(Action 1903594306)".


        //Unsupported feature: Property Modification (Name) on "ProdOrderMaterialRequisition(Action 1902917606)".


        //Unsupported feature: Property Insertion (RunObject) on "ProdOrderMaterialRequisition(Action 1902917606)".


        //Unsupported feature: Property Modification (Name) on "ProdOrderShortageList(Action 1903746906)".


        //Unsupported feature: Property Insertion (RunObject) on "ProdOrderShortageList(Action 1903746906)".

        modify(ProdOrderJobCard)
        {
            Visible = false;
        }
        modify(ProdOrderMaterialRequisition)
        {
            Visible = false;
        }
        modify(ProdOrderShortageList)
        {
            Visible = false;
        }
    }
}

