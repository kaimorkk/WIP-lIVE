PageExtension 52193440 pageextension52193440 extends "Item Ledger Entries" 
{
    layout
    {
        
        addafter("Entry No.")
        {
            field("Warranty Date";"Warranty Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Job No.")
        {
            field("Country/Region Code";"Country/Region Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 61)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Reservation Entries"(Action 56)".

    }

    //Unsupported feature: Property Insertion (Length) on "GetCaption(PROCEDURE 3).ReturnValue".


    //Unsupported feature: Property Insertion (Length) on "GetCaption(PROCEDURE 3).SourceTableName(Variable 1002)".

}

