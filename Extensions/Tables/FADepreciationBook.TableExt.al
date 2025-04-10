TableExtension 52193697 tableextension52193697 extends "FA Depreciation Book" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""FA Posting Group"(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ModifyDeprFields;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ModifyDeprFields;
            IF FAPostingGroup.GET("FA Posting Group")  THEN
            "Straight-Line %":=FAPostingGroup."Straight-Line %";
            */
        //end;
        field(50001;Quantity;Decimal)
        {
        }
    }

    //Unsupported feature: Variable Insertion (Variable: TempFALedgEntry) (VariableCollection) on "ShowBookValueAfterDisposal(PROCEDURE 12)".



    //Unsupported feature: Code Modification on "ShowBookValueAfterDisposal(PROCEDURE 12)".

    //procedure ShowBookValueAfterDisposal();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Disposal Date" > 0D THEN BEGIN
          DepreciationCalc.SetFAFilter(FALedgEntry,"FA No.","Depreciation Book Code",FALSE);
          SetBookValueAfterDisposalFiltersOnFALedgerEntry(FALedgEntry);
          PAGE.RUN(0,FALedgEntry);
        END ELSE BEGIN
          SetBookValueFiltersOnFALedgerEntry(FALedgEntry);
          PAGE.RUN(0,FALedgEntry);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Disposal Date" > 0D THEN BEGIN
          CLEAR(TempFALedgEntry);
          TempFALedgEntry.DELETEALL;
          TempFALedgEntry.SETCURRENTKEY("FA No.","Depreciation Book Code","FA Posting Date");
          DepreciationCalc.SetFAFilter(FALedgEntry,"FA No.","Depreciation Book Code",FALSE);
          WITH FALedgEntry DO BEGIN
            IF FIND('-') THEN
              REPEAT
                IF (("FA Posting Category" = "FA Posting Category"::Disposal) AND
                    ("FA Posting Type" <> "FA Posting Type"::"Book Value on Disposal") AND
                    ("FA Posting Type" <> "FA Posting Type"::"Salvage Value")) OR
                   "Part of Book Value"
                THEN BEGIN
                  TempFALedgEntry := FALedgEntry;
                  TempFALedgEntry.INSERT;
                END;
              UNTIL NEXT = 0;
            TempFALedgEntry.SETRANGE("FA No.",TempFALedgEntry."FA No.");
            TempFALedgEntry.SETRANGE("Depreciation Book Code",TempFALedgEntry."Depreciation Book Code");
            PAGE.RUN(0,TempFALedgEntry);
          END;
        END ELSE BEGIN
          FALedgEntry.SETCURRENTKEY("FA No.","Depreciation Book Code","Part of Book Value","FA Posting Date");
          FALedgEntry.SETRANGE("FA No.","FA No.");
          FALedgEntry.SETRANGE("Depreciation Book Code","Depreciation Book Code");
          FALedgEntry.SETRANGE("Part of Book Value",TRUE);
          PAGE.RUN(0,FALedgEntry);
        END;
        */
    //end;

    var
        FAPostingGroup: Record "FA Posting Group";
}

