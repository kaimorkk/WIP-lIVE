PageExtension 52193538 pageextension52193538 extends "Available - Assembly Headers" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "Reserve(Action 4)".

    }

    //Unsupported feature: Code Modification on "UpdateReservMgt(PROCEDURE 13)".

    //procedure UpdateReservMgt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(ReservMgt);
        CASE ReservEntry."Source Type" OF
          DATABASE::"Sales Line":
        #4..15
            ReservMgt.SetTransferLine(TransLine,ReservEntry."Source Subtype");
          DATABASE::"Service Line":
            ReservMgt.SetServLine(ServiceLine);
          DATABASE::"Assembly Line":
            ReservMgt.SetAssemblyLine(AssemblyLine);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..18
        END;
        */
    //end;
}

