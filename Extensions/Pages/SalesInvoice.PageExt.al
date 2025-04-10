PageExtension 52193445 pageextension52193445 extends "Sales Invoice" 
{
    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Sell-to Customer No."(Control 4)".

        modify("Posting Date")
        {
            Visible = false;
        }
        modify("Incoming Document Entry No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""External Document No."(Control 126)".

        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on ""Currency Code"(Control 107).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CLEAR(ChangeExchangeRate);
            IF "Posting Date" <> 0D THEN
              ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
            ELSE
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
            #1..7
              CurrPage.UPDATE;
            END;
            CLEAR(ChangeExchangeRate);
            */
        //end;


        //Unsupported feature: Code Modification on ""Currency Code"(Control 107).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CurrPage.UPDATE;
            SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CurrencyCodeOnAfterValidate;
            */
        //end;
        addafter("Sell-to City")
        {
            field("Invoice Amount";"Invoice Amount")
            {
                ApplicationArea = Basic;
            }
            field(Amount;Amount)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "ActionGroup9(Action 9)".


        //Unsupported feature: Property Modification (Name) on "Release(Action 123)".


        //Unsupported feature: Property Modification (Name) on "CalculateInvoiceDiscount(Action 63)".



        //Unsupported feature: Code Modification on "Statistics(Action 59).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Sales Statistics",Rec);
            SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
            */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 116)".



        //Unsupported feature: Code Modification on "CalculateInvoiceDiscount(Action 63).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ApproveCalcInvDisc;
            SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ApproveCalcInvDisc;
            */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "CalculateInvoiceDiscount(Action 63)".



        //Unsupported feature: Code Modification on ""Copy Document"(Action 64).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CopySalesDoc.SetSalesHeader(Rec);
            CopySalesDoc.RUNMODAL;
            CLEAR(CopySalesDoc);
            IF GET("Document Type","No.") THEN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
            */
        //end;


        //Unsupported feature: Code Modification on "Post(Action 71).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            Post(CODEUNIT::"Sales-Post (Yes/No)");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CALCFIELDS(Amount);
            IF Amount<>"Invoice Amount" THEN
              ERROR('Invoice Amount must be Equal to Total Line Amount');
            IF Status<>Status::Released THEN
              ERROR('Invoice must be Released before Posting');


            Post(CODEUNIT::"Sales-Post (Yes/No)");
            */
        //end;


        //Unsupported feature: Code Modification on ""Post and &Print"(Action 72).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            Post(CODEUNIT::"Sales-Post + Print");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CALCFIELDS(Amount);
            IF Amount<>"Invoice Amount" THEN
              ERROR('Invoice Amount must be Equal to Total Line Amount');
            IF Status<>Status::Released THEN
              ERROR('Invoice must be released before posting and printing');

            Post(CODEUNIT::"Sales-Post + Print");
            */
        //end;
        
        addafter(Approvals)
        {
            action("Import Invoces")
            {
                ApplicationArea = Basic;
                Caption = 'Import Invoces';

                trigger OnAction()
                begin
                     Import.GetRec(Rec);
                     Import.Run;
                end;
            }
        }
    }

    var
        Import: XmlPort "Import Invoices";


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        SetExtDocNoMandatoryCondition;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
          FILTERGROUP(0);
        END;

        SetDocNoVisible;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        */
    //end;


    //Unsupported feature: Code Modification on "ShortcutDimension1CodeOnAfterV(PROCEDURE 19029405)".

    //procedure ShortcutDimension1CodeOnAfterV();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
        */
    //end;


    //Unsupported feature: Code Modification on "ShortcutDimension2CodeOnAfterV(PROCEDURE 19008725)".

    //procedure ShortcutDimension2CodeOnAfterV();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
        */
    //end;

   
}

