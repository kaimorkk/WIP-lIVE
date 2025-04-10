TableExtension 52193658 tableextension52193658 extends "Segment Line" 
{
    fields
    {
        field(50000;Type;Option)
        {
            OptionMembers = " ",Utility,Media;
        }
    }


    //Unsupported feature: Code Modification on "CheckStatus(PROCEDURE 16)".

    //procedure CheckStatus();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Wizard Step" OF
          "Wizard Step"::"1":
            BEGIN
        #4..24
            ;
          "Wizard Step"::"3":
            BEGIN
              IF AttachmentTemp.FINDFIRST THEN
                AttachmentTemp.CALCFIELDS(Attachment);
              IF ("Correspondence Type" = "Correspondence Type"::"E-Mail") AND
                 NOT AttachmentTemp.Attachment.HASVALUE
              THEN
                ERROR(Text008);
            END;
          "Wizard Step"::"4":
            ;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..27
              IF AttachmentTemp.FIND('-') THEN
                AttachmentTemp.CALCFIELDS(Attachment);
              IF ("Correspondence Type" = "Correspondence Type"::"E-Mail") AND
                 ("Attachment No." = 0)
        #32..37
        */
    //end;


    //Unsupported feature: Code Modification on "FinishWizard(PROCEDURE 18)".

    //procedure FinishWizard();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Flag := FALSE;
        IF IsFinish THEN
          Flag := TRUE
        #4..9
          Subject := Description;
          ProcessPostponedAttachment;
          send := (IsFinish AND ("Correspondence Type" <> "Correspondence Type"::" "));
          SegManagement.LogInteraction(Rec,AttachmentTemp,InterLogEntryCommentLineTmp,send,NOT IsFinish);
          InteractLogEntry.FINDLAST;
          IF InteractLogEntry."Delivery Status" = InteractLogEntry."Delivery Status"::Error THEN
            ERROR(Text025,Mail.GetErrorDesc);
        END;
        DELETE
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
          SegManagement.LogInteraction(Rec,AttachmentTemp,InterLogEntryCommentLineTmp,send,NOT IsFinish)
        END;
        DELETE
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateCorrespondenceType(PROCEDURE 47)".

    //procedure ValidateCorrespondenceType();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Correspondence Type" <> "Correspondence Type"::" " THEN
          IF AttachmentTemp.FINDFIRST THEN BEGIN
            ErrorText := AttachmentTemp.CheckCorrespondenceType("Correspondence Type");
            IF ErrorText <> '' THEN
              ERROR(
                Text024 + ErrorText,
                FIELDCAPTION("Correspondence Type"),"Correspondence Type");
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Correspondence Type" <> "Correspondence Type"::" " THEN
          IF AttachmentTemp.FIND('-') THEN BEGIN
        #3..8
        */
    //end;


    //Unsupported feature: Code Modification on "PerformPostStep3(PROCEDURE 44)".

    //procedure PerformPostStep3();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Wizard Step" OF
          "Wizard Step"::"2":
            IF "Mail Contact" THEN BEGIN
              IF Mail.NewMessage("Contact Via",'','',Subject,'','',TRUE) THEN BEGIN
                "Mail Contact" := FALSE;
                "Time of Interaction" := TIME;
                MODIFY;
              END ELSE
                ERROR(Text025,Mail.GetErrorDesc);
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
              IF Mail.NewMessage("Contact Via",'',Subject,'','',TRUE) THEN BEGIN
        #5..11
        */
    //end;


    //Unsupported feature: Code Modification on "CheckStatus3(PROCEDURE 30)".

    //procedure CheckStatus3();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Wizard Step" = "Wizard Step"::"1" THEN BEGIN
          IF Date = 0D THEN
            ErrorMessage(FIELDCAPTION(Date));
          IF "Mail Contact" AND ("Contact Via" = '') THEN
            ErrorMessage(FIELDCAPTION("Contact Via"));
          IF "Mail Contact" AND ("Contact Via" <> '') THEN BEGIN
            IF NOT ContactThrough.FINDFIRST THEN
              Mail.CollectAddresses("Contact No.",ContactThrough,FALSE);
            IF NOT Mail.ValidateEmail(ContactThrough,"Contact Via") THEN
              ERROR(Text023,"Contact Via",Cont.TABLECAPTION);
        #11..13
          IF "Salesperson Code" = '' THEN
            ErrorMessage(FIELDCAPTION("Salesperson Code"));
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
            IF NOT ContactThrough.FIND('-') THEN
        #8..16
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "FinishWizard(PROCEDURE 18).InteractLogEntry(Variable 1003)".



    //Unsupported feature: Property Modification (TextConstString) on "Text025(Variable 1033)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text025 : ENU=The email could not be sent because of the following error: %1.\Note: if you run Microsoft Dynamics NAV as administrator, you must run Outlook as administrator as well.;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text025 : ENU=Send mail operation failed with message: %1.;
        //Variable type has not been exported.
}

