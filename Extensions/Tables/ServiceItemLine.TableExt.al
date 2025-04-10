TableExtension 52193734 tableextension52193734 extends "Service Item Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Service Item Line"(Table 5901)".

    fields
    {

        //Unsupported feature: Code Modification on ""Loaner No."(Field 28).OnValidate".

        //trigger "(Field 28)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Loaner No." = '') AND (xRec."Loaner No." <> '') THEN BEGIN
              Loaner.GET(xRec."Loaner No.");
              LoanerEntry.RESET;
            #4..11
                  FIELDCAPTION("Loaner No."))
            END;

            IF "Loaner No." <> xRec."Loaner No." THEN BEGIN
              LoanerEntry.RESET;
              LoanerEntry.SETCURRENTKEY("Document Type","Document No.","Loaner No.",Lent);
            #18..26
                  ServHeader.FIELDCAPTION("No."),ServHeader."No.");
              END;
              CheckIfLoanerOnServOrder;
              IF "Line No." <> 0 THEN
                LendLoanerWithConfirmation;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..14
            IF "Line No." = 0 THEN
              ERROR(Text034,Loaner.TABLECAPTION);

            #15..29
              IF CONFIRM(STRSUBSTNO(Text029,Loaner.TABLECAPTION,"Loaner No."),FALSE) THEN
                ServLoanerMgt.LendLoaner(Rec)
              ELSE
                "Loaner No." := '';
            END;
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ServMgtSetup.GET;
        ServItemLine.RESET;
        ServItemLine.SETRANGE("Document Type","Document Type");
        #4..47
        ServOrderMgt.UpdateResponseDateTime(Rec,FALSE);
        ServOrderMgt.UpdatePriority(Rec,FALSE);

        IF "Line No." = 0 THEN
          LendLoanerWithConfirmation;

        IF "Service Item No." = '' THEN
          "Ship-to Code" := ServHeader."Ship-to Code";
        IF FirstServItemLine AND
        #57..65
              9,"Document No.",0,0,DATABASE::Customer,ServHeader."Bill-to Customer No.",
              ServHeader."Salesperson Code",'',ServHeader.Description,'');
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..50
        #54..68
        */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SourceCodeSetup.GET;

        IF "Document No." = '' THEN
        #4..19
            TableID,No,SourceCodeSetup."Service Management",
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
            ServHeader."Dimension Set ID",DATABASE::"Service Header");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..22
        */
    //end;

    var
        Text034: label 'The line must be created before trying to lend a %1.';
}

