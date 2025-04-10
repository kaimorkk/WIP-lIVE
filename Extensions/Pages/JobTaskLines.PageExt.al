PageExtension 52193543 pageextension52193543 extends "Job Task Lines" 
{
    layout
    {

        //Unsupported feature: Code Modification on ""Outstanding Orders"(Control 1000).OnDrillDown".

        //trigger OnDrillDown()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetPurchLineFilters(PurchLine);
            PurchLine.SETFILTER("Outstanding Amount (LCY)",'<> 0');
            PAGE.RUNMODAL(PAGE::"Purchase Lines",PurchLine);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            PurchLine.SETCURRENTKEY("Document Type","Job No.","Job Task No.");
            PurchLine.SETRANGE("Document Type",PurchLine."Document Type"::Order);
            PurchLine.SETRANGE("Job No.","Job No.");
            PurchLine.SETRANGE("Job Task No.","Job Task No.");
            PurchLine.SETFILTER("Outstanding Amount (LCY)",'<> 0');
            PAGE.RUNMODAL(PAGE::"Purchase Lines",PurchLine);
            */
        //end;


        //Unsupported feature: Code Modification on ""Amt. Rcd. Not Invoiced"(Control 1002).OnDrillDown".

        //trigger  Rcd()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetPurchLineFilters(PurchLine);
            PurchLine.SETFILTER("Amt. Rcd. Not Invoiced (LCY)",'<> 0');
            PAGE.RUNMODAL(PAGE::"Purchase Lines",PurchLine);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            PurchLine.SETCURRENTKEY("Document Type","Job No.","Job Task No.");
            PurchLine.SETRANGE("Document Type",PurchLine."Document Type"::Order);
            PurchLine.SETRANGE("Job No.","Job No.");
            PurchLine.SETRANGE("Job Task No.","Job Task No.");
            PurchLine.SETFILTER("Amt. Rcd. Not Invoiced (LCY)",'<> 0');
            PAGE.RUNMODAL(PAGE::"Purchase Lines",PurchLine);
            */
        //end;
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "JobPlanningLines(Action 20)".

    }
}

