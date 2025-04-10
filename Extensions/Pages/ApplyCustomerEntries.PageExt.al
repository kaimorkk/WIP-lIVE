PageExtension 52193479 pageextension52193479 extends "Apply Customer Entries" 
{
    layout
    {

        //Unsupported feature: Property Modification (Name) on "ApplyingCustomerNo(Control 71)".


        //Unsupported feature: Property Modification (Name) on "ApplyingDescription(Control 85)".


        //Unsupported feature: Property Modification (Name) on "AppliesToID(Control 22)".


        //Unsupported feature: Property Modification (Name) on "PmtDiscAmount(Control 91)".

        modify(AppliesToID)
        {
            Visible = false;
        }
    }

    //Unsupported feature: Code Modification on "SetApplyingCustLedgEntry(PROCEDURE 9)".

    //procedure SetApplyingCustLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE CalcType OF
          CalcType::SalesHeader:
            BEGIN
        #4..65
              ApplyingCustLedgEntry."Posting Date" := GenJnlLine."Posting Date";
              ApplyingCustLedgEntry."Document Type" := GenJnlLine."Document Type";
              ApplyingCustLedgEntry."Document No." := GenJnlLine."Document No.";
              IF GenJnlLine."Bal. Account Type" = GenJnlLine."Account Type"::Customer THEN BEGIN
                ApplyingCustLedgEntry."Customer No." := GenJnlLine."Bal. Account No.";
                Customer.GET(ApplyingCustLedgEntry."Customer No.");
                ApplyingCustLedgEntry.Description := Customer.Name;
              END ELSE BEGIN
                ApplyingCustLedgEntry."Customer No." := GenJnlLine."Account No.";
                ApplyingCustLedgEntry.Description := GenJnlLine.Description;
              END;
              ApplyingCustLedgEntry."Currency Code" := GenJnlLine."Currency Code";
              ApplyingCustLedgEntry.Amount := GenJnlLine.Amount;
              ApplyingCustLedgEntry."Remaining Amount" := GenJnlLine.Amount;
              CalcApplnAmount;
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..68
              ApplyingCustLedgEntry."Customer No." := GenJnlLine."Account No.";
              ApplyingCustLedgEntry.Description := GenJnlLine.Description;
        #77..82
        */
    //end;


    //Unsupported feature: Code Modification on "HandlChosenEntries(PROCEDURE 14)".

    //procedure HandlChosenEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF AppliedCustLedgEntry.FINDSET(FALSE,FALSE) THEN BEGIN
          REPEAT
            AppliedCustLedgEntryTemp := AppliedCustLedgEntry;
        #4..36
                IF (ABS(CurrentAmount) = ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
                      AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
                THEN BEGIN
                  PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
                    AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  AppliedAmount := AppliedAmount + CorrectionAmount;
                END ELSE
                  IF FromZeroGenJnl THEN BEGIN
                    PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                    CurrentAmount := CurrentAmount +
                      AppliedCustLedgEntryTemp."Remaining Amount" - AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  END ELSE BEGIN
                    PossiblePmtDisc := AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                    RemainingAmountExclDiscounts := AppliedCustLedgEntryTemp."Remaining Amount" - PossiblePmtDisc -
                      AppliedCustLedgEntryTemp."Max. Payment Tolerance";
                    IF ABS(CurrentAmount) + ABS(CalcOppositeEntriesAmount(AppliedCustLedgEntryTemp)) >= ABS(RemainingAmountExclDiscounts)
                    THEN BEGIN
                      PmtDiscAmount := PmtDiscAmount + PossiblePmtDisc;
                      AppliedAmount := AppliedAmount + CorrectionAmount;
                    END;
                    CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
                      AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  END;
            END ELSE BEGIN
              IF ((CurrentAmount + AppliedCustLedgEntryTemp."Amount to Apply") * CurrentAmount) <= 0 THEN
                AppliedAmount := AppliedAmount + CorrectionAmount;
              CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Amount to Apply";
            END;
          END ELSE BEGIN
        #67..87

        UNTIL NOT AppliedCustLedgEntryTemp.FINDFIRST;
        CheckRounding;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..39
                  PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible" + PossiblePmtDisc;
                  CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
                    AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible" - PossiblePmtDisc;
                  PossiblePmtDisc := 0;
        #43..49
                    IF (CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" >= 0) <> (CurrentAmount >= 0) THEN BEGIN
        #55..59
                    PossiblePmtDisc := AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  END;
            END ELSE BEGIN
              IF ((CurrentAmount - PossiblePmtDisc + AppliedCustLedgEntryTemp."Amount to Apply") * CurrentAmount) <= 0 THEN BEGIN
                PmtDiscAmount := PmtDiscAmount + PossiblePmtDisc;
                CurrentAmount := CurrentAmount - PossiblePmtDisc;
                PossiblePmtDisc := 0;
                AppliedAmount := AppliedAmount + CorrectionAmount;
              END;
        #64..90
        */
    //end;


    //Unsupported feature: Code Modification on "PostDirectApplication(PROCEDURE 15)".

    //procedure PostDirectApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CalcType = CalcType::Direct THEN BEGIN
          IF ApplyingCustLedgEntry."Entry No." <> 0 THEN BEGIN
            Rec := ApplyingCustLedgEntry;
        #4..9
            END ELSE
              ERROR(Text019);

            Applied := CustEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

            IF Applied THEN BEGIN
              MESSAGE(Text012);
              PostingDone := TRUE;
              CurrPage.CLOSE;
            END;
          END ELSE
            ERROR(Text002);
        END ELSE
          ERROR(Text003);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
            CustEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

            MESSAGE(Text012);
            PostingDone := TRUE;
            CurrPage.CLOSE;
        #20..23
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SetApplyingCustLedgEntry(PROCEDURE 9).Customer(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "HandlChosenEntries(PROCEDURE 14).RemainingAmountExclDiscounts(Variable 1012)".


    //Unsupported feature: Deletion (VariableCollection) on "PostDirectApplication(PROCEDURE 15).Applied(Variable 1006)".

}

