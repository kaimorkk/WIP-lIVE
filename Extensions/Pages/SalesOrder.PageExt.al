PageExtension 52193444 pageextension52193444 extends "Sales Order" 
{
    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Sell-to Customer No."(Control 4)".

        modify("Posting Date")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""External Document No."(Control 155)".


        //Unsupported feature: Property Deletion (Editable) on "SalesLines(Control 58)".

        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on ""Currency Code"(Control 111).OnAssistEdit".

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


        //Unsupported feature: Code Modification on ""Currency Code"(Control 111).OnValidate".

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

        //Unsupported feature: Property Modification (Name) on "PrepmtInvoices(Action 234)".


        //Unsupported feature: Property Modification (Name) on "PrepmtCrMemos(Action 235)".


        //Unsupported feature: Property Modification (Name) on "CalculateInvoiceDiscount(Action 67)".


        //Unsupported feature: Property Modification (Name) on "MoveNegativeLines(Action 154)".

        modify("Create Inventor&y Put-away/Pick")
        {
            Caption = 'Create Inventor&y Put-away / Pick';

            //Unsupported feature: Property Modification (Name) on ""Create Inventor&y Put-away/Pick"(Action 148)".

        }
        modify("Print Confirmation")
        {
            Caption = 'Order Confirmation';

            //Unsupported feature: Property Modification (Name) on ""Print Confirmation"(Action 224)".

        }


        //Unsupported feature: Code Modification on "Statistics(Action 61).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            OpenSalesOrderStatistics;
            SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
            */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 122)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Assembly Orders"(Action 11)".



        //Unsupported feature: Code Modification on "CalculateInvoiceDiscount(Action 67).OnAction".

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


        //Unsupported feature: Code Modification on "CopyDocument(Action 68).OnAction".

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

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Send IC Sales Order Cnfmn."(Action 204)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Order &Promising"(Action 197)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Create Inventor&y Put-away/Pick"(Action 148)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Create &Whse. Shipment"(Action 149)".



        //Unsupported feature: Code Modification on "Post(Action 75).OnAction".

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
            Post(CODEUNIT::"Sales-Post (Yes/No)");
            */
        //end;


        //Unsupported feature: Code Modification on ""Post and &Print"(Action 76).OnAction".

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

            Post(CODEUNIT::"Sales-Post + Print");
            */
        //end;
        
        modify("&Order Confirmation")
        {
            Visible = false;
        }
        
        moveafter("&Print";"Print Confirmation")
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text000 : ENU=Unable to run this function while in View mode.;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text000 : ENU=Unable to execute this function while in view only mode.;
        //Variable type has not been exported.


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

        SETRANGE("Date Filter",0D,WORKDATE - 1);

        SetDocNoVisible;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
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

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.SalesLines.Page.UpdateForm(true);
    end;
}

