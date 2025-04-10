PageExtension 52193442 pageextension52193442 extends "Item Journal" 
{
    layout
    {
        addafter("Country/Region Code")
        {
            
            field("Item Expiration Date";"Item Expiration Date")
            {
                ApplicationArea = Basic;
            }
            field("New Item Expiration Date";"New Item Expiration Date")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 82)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Location(Action 76)".

    }
}

