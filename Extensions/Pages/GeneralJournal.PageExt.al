PageExtension 52193441 pageextension52193441 extends "General Journal"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 1 Code"(Control 61)".


        //Unsupported feature: Property Modification (Visible) on ""Shortcut Dimension 2 Code"(Control 63)".


        //Unsupported feature: Property Modification (Name) on "Applied(Control 3)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Document Date"(Control 83)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Document Type"(Control 4)".

        modify("Incoming Document Entry No.")
        {
            Visible = false;
        }
        modify("Applies-to Ext. Doc. No.")
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on ""Account Type"(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        SetUserInteractions;
        CurrPage.UPDATE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        */
        //end;

        //Unsupported feature: Property Deletion (StyleExpr) on ""Account Type"(Control 8)".



        //Unsupported feature: Code Modification on ""Account No."(Control 10).OnValidate".

        //trigger "(Control 10)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        SetUserInteractions;
        CurrPage.UPDATE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        */
        //end;

        //Unsupported feature: Property Deletion (StyleExpr) on ""Account No."(Control 10)".


        //Unsupported feature: Property Deletion (StyleExpr) on "Description(Control 12)".

        modify("Payer Information")
        {
            Visible = false;
        }
        modify("Transaction Information")
        {
            Visible = false;
        }


        //Unsupported feature: Property Deletion (StyleExpr) on "Amount(Control 18)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Deletion (StyleExpr) on ""Bal. Account No."(Control 55)".

        modify("Applied Automatically")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionML) on "Applied(Control 3)".


        //Unsupported feature: Property Deletion (Visible) on "Applied(Control 3)".

        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        modify(Comment)
        {
            Visible = false;
        }
        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("Posting Group1"; "Posting Group")
            {
                ApplicationArea = Basic;
            }
        }

        addafter("Bal. Account Type")
        {
            field("Line No."; "Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Bal. Gen. Bus. Posting Group")
        {
            field("FA Posting Type"; "FA Posting Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Payment Terms Code")
        {
            field("Employee Code"; "Employee Code")
            {
                ApplicationArea = Basic;
            }
            field("Asset No"; "Asset No")
            {
                ApplicationArea = Basic;
            }
        }

    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "GetStandardJournals(Action 109)".


        //Unsupported feature: Property Modification (Name) on "SaveAsStandardJournal(Action 108)".


        //Unsupported feature: Property Modification (PromotedCategory) on ""Apply Entries"(Action 91)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 76)".

        modify("Renumber Document Numbers")
        {
            Visible = false;
        }
        modify("B&ank")
        {
            Visible = false;
        }
        modify(ImportBankStatement)
        {
            Visible = false;
        }
        modify(ShowStatementLineDetails)
        {
            Visible = false;
        }

        modify(Application)
        {
            Visible = false;
        }
        modify(Match)
        {
            Visible = false;
        }
        modify(AddMappingRule)
        {
            Visible = false;
        }
        modify("Payro&ll")
        {
            Visible = false;
        }

        addafter("F&unctions")
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;

            }
        }
        moveafter("F&unctions"; "Apply Entries")
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    SetUserInteractions;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateBalance;
    SetUpNewLine(xRec,Balance,BelowxRec);
    CLEAR(ShortcutDimCode);
    CLEAR(AccName);
    SetUserInteractions;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    */
    //end;

    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}

