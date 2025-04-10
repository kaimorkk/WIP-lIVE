PageExtension 52193488 pageextension52193488 extends "Res. Availability Lines" 
{
    layout
    {
        modify(QtyOnAssemblyOrder)
        {
            Visible = false;
        }
    }

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetDateFilter;
        Res.CALCFIELDS(Capacity,"Qty. on Order (Job)","Qty. Quoted (Job)","Qty. on Service Order","Qty. on Assembly Order");
        CapacityAfterOrders := Res.Capacity - Res."Qty. on Order (Job)";
        CapacityAfterQuotes := CapacityAfterOrders - Res."Qty. Quoted (Job)";
        NetAvailability := CapacityAfterQuotes - Res."Qty. on Service Order" - Res."Qty. on Assembly Order";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetDateFilter;
        Res.CALCFIELDS(Capacity,"Qty. on Order (Job)","Qty. Quoted (Job)","Qty. on Service Order");
        CapacityAfterOrders := Res.Capacity - Res."Qty. on Order (Job)";
        CapacityAfterQuotes := CapacityAfterOrders - Res."Qty. Quoted (Job)";
        NetAvailability := CapacityAfterQuotes - Res."Qty. on Service Order";
        */
    //end;
}

