TableExtension 52193429 tableextension52193429 extends Location 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Require Put-away"(Field 5726).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            WhseRcptHeader.SETCURRENTKEY("Location Code");
            WhseRcptHeader.SETRANGE("Location Code",Code);
            IF WhseRcptHeader.FINDFIRST THEN
            #4..10
                ERROR(Text008,FIELDCAPTION("Require Put-away"),TRUE,WhseActivHeader.TABLECAPTION);
              "Use Cross-Docking" := FALSE;
              "Cross-Dock Bin Code" := '';
            END ELSE
              CreateInboundWhseRequest;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..13
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""Require Receive"(Field 5730).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT "Require Receive" THEN BEGIN
              TESTFIELD("Directed Put-away and Pick",FALSE);
              WhseRcptHeader.SETCURRENTKEY("Location Code");
            #4..11
              WhseActivHeader.SETRANGE("Location Code",Code);
              IF WhseActivHeader.FINDFIRST THEN
                ERROR(Text008,FIELDCAPTION("Require Receive"),FALSE,WhseActivHeader.TABLECAPTION);

              CreateInboundWhseRequest;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..14
            END;
            */
        //end;
    }

    procedure GetBinCode(UseFlushingMethod: Boolean;FlushingMethod: Option Manual,Forward,Backward,"Pick + Forward","Pick + Backward"): Code[20]
    begin
        if not UseFlushingMethod then
          exit("From-Production Bin Code");

        case FlushingMethod of
          Flushingmethod::Manual,
          Flushingmethod::"Pick + Forward",
          Flushingmethod::"Pick + Backward":
            exit("To-Production Bin Code");
          Flushingmethod::Forward,
          Flushingmethod::Backward:
            exit("Open Shop Floor Bin Code");
        end;
    end;
}

