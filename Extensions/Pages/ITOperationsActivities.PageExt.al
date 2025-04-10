PageExtension 52193646 pageextension52193646 extends "IT Operations Activities" 
{
    layout
    {
        modify("Data Privacy")
        {
            Visible = false;
        }
        modify(UnclassifiedFields)
        {
            Visible = false;
        }
    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        DataSensitivity.SETRANGE("Company Name",COMPANYNAME);
        DataSensitivity.SETRANGE("Data Sensitivity",DataSensitivity."Data Sensitivity"::Unclassified);
        UnclassifiedFields := DataSensitivity.COUNT;

        SETFILTER("Date Filter2",'<=%1',CREATEDATETIME(TODAY,0T));
        SETFILTER("Date Filter3",'>%1',CREATEDATETIME(TODAY,0T));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        SETFILTER("Date Filter2",'<=%1',CREATEDATETIME(TODAY,0T));
        SETFILTER("Date Filter3",'>%1',CREATEDATETIME(TODAY,0T));
        */
    //end;

    //Unsupported feature: Property Deletion (RefreshOnActivate).

}

