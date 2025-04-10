TableExtension 52193519 tableextension52193519 extends "Finance Charge Memo Header" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 9000)".

    }

    //Unsupported feature: Code Modification on "InsertLines(PROCEDURE 3)".

    //procedure InsertLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("Fin. Charge Terms Code");
        FinChrgTerms.GET("Fin. Charge Terms Code");
        FinChrgMemoLine.RESET;
        #4..21
          CustPostingGr.GET("Customer Posting Group");
          CustPostingGr.TESTFIELD("Additional Fee Account");
          FinChrgMemoLine.VALIDATE("No.",CustPostingGr."Additional Fee Account");
          FinChrgMemoLine.Description :=
            COPYSTR(
              CaptionManagement.GetTranslatedFieldCaption(
                "Language Code",DATABASE::"Currency for Fin. Charge Terms",
                CurrForFinChrgTerms.FIELDNO("Additional Fee")),1,100);
          IF "Currency Code" = '' THEN
            FinChrgMemoLine.VALIDATE(Amount,FinChrgTerms."Additional Fee (LCY)")
          ELSE BEGIN
        #33..46
        InsertBeginTexts(Rec);
        InsertEndTexts(Rec);
        MODIFY;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..24
          FinChrgMemoLine.Description := CurrForFinChrgTerms.FIELDCAPTION("Additional Fee");
        #30..49
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "InsertLines(PROCEDURE 3).CaptionManagement(Variable 1000)".

}

