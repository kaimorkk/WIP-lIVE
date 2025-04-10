PageExtension 52193449 pageextension52193449 extends "Purchase Quote"
{
    layout
    {

        //Unsupported feature: Property Modification (SubPageLink) on "Control1904651607(Control 1904651607)".


        //Unsupported feature: Property Modification (SubPageLink) on "Control5(Control 5)".


        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".

        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on ""Currency Code"(Control 102).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CLEAR(ChangeExchangeRate);
        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
          SaveInvoiceDiscountAmount;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
          CurrPage.UPDATE;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;


        //Unsupported feature: Code Modification on ""Currency Code"(Control 102).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.UPDATE;
        PurchCalcDiscByType.ApplyDefaultInvoiceDiscount(0,Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrencyCodeOnAfterValidate;
        */
        //end;
        addafter(Status)
        {
            field("Plan Item No"; "Plan Item No")
            {
                ApplicationArea = Basic;
            }
            field("Request Ref No"; "Request Ref No")
            {
                ApplicationArea = Basic;
            }
            field("Contract No"; "Contract No")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Plan Year"; "Procurement Plan Year")
            {
                ApplicationArea = Basic;
            }
            field("Requisition No"; "Requisition No")
            {
                ApplicationArea = Basic;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Linked IFS No." := Rec.GetFilter("Linked IFS No.");
    end;

}

