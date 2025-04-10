PageExtension 52193523 pageextension52193523 extends "Approval Entries" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Document(Action 38).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ShowDocument;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*


            ShowDocument;
            */
        //end;
    }

    var
        Filterstring: Text;


    //Unsupported feature: Code Insertion (VariableCollection) on "OnOpenPage".

    //trigger (Variable: Filterstring)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FILTERGROUP(0);
        SETRANGE(Status,Status::Open);
        ApproverSenderFiltering;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Usersetup.GET(USERID) THEN BEGIN
          FILTERGROUP(2);
          Filterstring := GETFILTERS;
          FILTERGROUP(0);
          IF STRLEN(Filterstring) = 0 THEN BEGIN
            FILTERGROUP(2);
            SETCURRENTKEY("Approver ID");
            IF Overdue = Overdue::Yes THEN
              SETRANGE("Approver ID",Usersetup."User ID");
            SETRANGE(Status,Status::Open);
            FILTERGROUP(0);
          END ELSE
            SETCURRENTKEY("Table ID","Document Type","Document No.");
        END;
        */
    //end;
}

