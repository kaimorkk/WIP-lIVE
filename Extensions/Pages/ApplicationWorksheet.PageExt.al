PageExtension 52193516 pageextension52193516 extends "Application Worksheet" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "UnappliedEntries(Action 16)".


        //Unsupported feature: Property Modification (Name) on "Reapply(Action 42)".


        //Unsupported feature: Code Modification on "Reapply(Action 42).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            UnblockItems;
            Reapplyall;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            Reapplyall;
            */
        //end;
        modify(UndoApplications)
        {
            Visible = false;
        }
    }


    //Unsupported feature: Code Insertion on "OnClosePage".

    //trigger OnClosePage()
    //begin
        /*
        UnblockItems;
        Reapplyall;
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Apply.SetCalledFromApplicationWorksheet(TRUE);
        ReapplyTouchedEntries; // in case OnQueryClosePage trigger was not executed due to a sudden crash

        InventoryPeriod.IsValidDate(InventoryOpenedFrom);
        IF InventoryOpenedFrom <> 0D THEN
          IF GETFILTER("Posting Date") = '' THEN
        #7..11
          END;

        UpdateFilterFields;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #4..14
        */
    //end;


    //Unsupported feature: Code Modification on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Apply.AnyTouchedEntries THEN BEGIN
          IF NOT CONFIRM(Text003) THEN
            EXIT(FALSE);

          Reapplyall;
          UnblockItems;
        END;

        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Apply.AnyTouchedEntries THEN
          IF NOT CONFIRM(Text003) THEN
            EXIT(FALSE);
        EXIT(TRUE);
        */
    //end;


    //Unsupported feature: Code Modification on "Reapplyall(PROCEDURE 1)".

    //procedure Reapplyall();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Apply.RedoApplications;
        Apply.CostAdjust;
        Apply.ClearApplicationLog;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Apply.RedoApplications;
        Apply.CostAdjust;
        */
    //end;
}

