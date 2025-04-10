TableExtension 52193496 tableextension52193496 extends "Requisition Line" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Production BOM Version Code"(Field 99000885)".


        //Unsupported feature: Property Modification (Data type) on ""Routing Version Code"(Field 99000886)".


        //Unsupported feature: Code Modification on ""No."(Field 5).OnValidate".

        //trigger "(Field 5)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckActionMessageNew;
            ReserveReqLine.VerifyChange(Rec,xRec);
            DeleteRelations;
            #4..53
                  "Accept Action Message" := TRUE;
                  "Product Group Code" := Item."Product Group Code";
                  GetDirectCost(FIELDNO("No."));
                  SetFromBinCode;
                END;
            END;

            #61..68
            CreateDim(
              DimMgt.TypeToTableID3(Type),
              "No.",DATABASE::Vendor,"Vendor No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..56
                  IF ("Location Code" <> '') AND ("No." <> '') THEN BEGIN
                    IF ("Bin Code" = '') AND ("Ref. Order Type" = "Ref. Order Type"::"Prod. Order") THEN
                      "Bin Code" := WMSManagement.GetLastOperationFromBinCode("Routing No.","Routing Version Code","Location Code",FALSE,0);
                    GetLocation("Location Code");
                    IF ("Bin Code" = '') AND ("Ref. Order Type" = "Ref. Order Type"::"Prod. Order") THEN
                      "Bin Code" := Location.GetBinCode(FALSE,0);
                    IF ("Bin Code" = '') AND Location."Bin Mandatory" AND NOT Location."Directed Put-away and Pick" THEN
                      WMSManagement.GetDefaultBin("No.","Variant Code","Location Code","Bin Code")
                  END;
            #58..71
            */
        //end;


        //Unsupported feature: Code Modification on ""Vendor No."(Field 9).OnValidate".

        //trigger "(Field 9)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckActionMessageNew;
            IF "Vendor No." <> '' THEN
              IF Vend.GET("Vendor No.") THEN BEGIN
                IF Vend."Privacy Blocked" THEN BEGIN
                  IF PlanningResiliency THEN
                    TempPlanningErrorLog.SetError(
                      STRSUBSTNO(Text031,Vend.TABLECAPTION,Vend."No."),
                      DATABASE::Vendor,Vend.GETPOSITION);
                  Vend.VendPrivacyBlockedErrorMessage(Vend,FALSE);
                END;
                IF Vend.Blocked = Vend.Blocked::All THEN BEGIN
                  IF PlanningResiliency THEN
                    TempPlanningErrorLog.SetError(
            #14..48
            CreateDim(
              DATABASE::Vendor,"Vendor No.",
              DimMgt.TypeToTableID3(Type),"No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
            #11..51
            */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 17).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ValidateLocationChange;
            CheckActionMessageNew;
            "Bin Code" := '';
            #4..8
                SKU."Replenishment System" := SKU."Replenishment System"::"Prod. Order";
              VALIDATE("Replenishment System",SKU."Replenishment System");
              IF "Location Code" <> xRec."Location Code" THEN BEGIN
                IF ("Location Code" <> '') AND ("No." <> '') AND NOT IsDropShipment THEN BEGIN
                  GetLocation("Location Code");
                  IF Location."Bin Mandatory" AND NOT Location."Directed Put-away and Pick" THEN
                    WMSManagement.GetDefaultBin("No.","Variant Code","Location Code","Bin Code");
            #16..20
                "Vendor Item No." := ItemVend."Vendor Item No.";
            END;
            GetDirectCost(FIELDNO("Location Code"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..11
                IF ("Location Code" <> '') AND ("No." <> '') THEN BEGIN
            #13..23
            */
        //end;


        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckActionMessageNew;
            IF (Type = Type::Item) AND
               ("No." <> '') AND
            #4..9
              IF "Unit of Measure Code" <> '' THEN BEGIN
                "Qty. per Unit of Measure" := UOMMgt.GetQtyPerUnitOfMeasure(Item,"Unit of Measure Code");
                "Unit Cost" := ROUND(Item."Unit Cost" * "Qty. per Unit of Measure",0.00001);
              END ELSE
                "Qty. per Unit of Measure" := 1;
            END ELSE
            #16..22
              SetSupplyQty("Demand Quantity (Base)","Needed Quantity (Base)")
            ELSE
              VALIDATE(Quantity);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..12
                "Overhead Rate" := ROUND(Item."Overhead Rate" * "Qty. per Unit of Measure",0.00001);
            #13..25
            */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 5590)".



        //Unsupported feature: Code Modification on ""Routing No."(Field 99000750).OnValidate".

        //trigger "(Field 99000750)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckActionMessageNew;
            "Routing Version Code" := '';

            #4..7
              RtngDate := "Starting Date"
            ELSE
              RtngDate := "Ending Date";
            IF RtngDate = 0D THEN
              RtngDate := "Order Date";

            VALIDATE("Routing Version Code",VersionMgt.GetRtngVersion("Routing No.",RtngDate,TRUE));
            IF "Routing Version Code" = '' THEN BEGIN
            #16..20
              RtngHeader.TESTFIELD(Status,RtngHeader.Status::Certified);
              "Routing Type" := RtngHeader.Type;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
            #13..23
            */
        //end;


        //Unsupported feature: Code Modification on ""Work Center No."(Field 99000752).OnValidate".

        //trigger "(Field 99000752)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GetWorkCenter;
            VALIDATE("Vendor No.",WorkCenter."Subcontractor No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            WorkCenter.GET("Work Center No.");
            VALIDATE("Vendor No.",WorkCenter."Subcontractor No.");
            */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Starting Date"(Field 99000894).OnValidate".

        //trigger (Variable: IsSubcontracting)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on ""Starting Date"(Field 99000894).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF Type = Type::Item THEN BEGIN
              GetWorkCenter;
              IF NOT Subcontracting THEN BEGIN
                VALIDATE("Production BOM No.");
                VALIDATE("Routing No.");
              END;
              VALIDATE("Starting Time");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF Type = Type::Item THEN BEGIN
              IF WorkCenter.GET("Work Center No.") THEN
                IF WorkCenter."Subcontractor No." <> '' THEN
                  IsSubcontracting := TRUE;
              IF NOT IsSubcontracting THEN BEGIN
            #4..8
            */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Ending Date"(Field 99000896).OnValidate".

        //trigger (Variable: IsSubcontracting)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on ""Ending Date"(Field 99000896).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckEndingDate(ValidateFields);

            IF Type = Type::Item THEN BEGIN
              VALIDATE("Ending Time");
              GetWorkCenter;
              IF NOT Subcontracting THEN BEGIN
                VALIDATE("Production BOM No.");
                VALIDATE("Routing No.");
              END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
              IF WorkCenter.GET("Work Center No.") THEN
                IF WorkCenter."Subcontractor No." <> '' THEN
                  IsSubcontracting := TRUE;
              IF NOT IsSubcontracting THEN BEGIN
            #7..10
            */
        //end;


        //Unsupported feature: Code Modification on ""Replenishment System"(Field 99000903).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Type,Type::Item);
            CheckActionMessageNew;
            IF ValidateFields AND
            #4..36
              "Replenishment System"::"Prod. Order":
                BEGIN
                  IF ReqWkshTmpl.GET("Worksheet Template Name") AND (ReqWkshTmpl.Type = ReqWkshTmpl.Type::"Req.") AND
                     (ReqWkshTmpl.Name <> '') AND NOT SourceDropShipment
                  THEN
                    ERROR(ReplenishmentErr);
                  IF PlanningResiliency AND (Item."Base Unit of Measure" = '') THEN
            #44..67
                  VALIDATE("Vendor No.",'');

                  IF NOT Subcontracting THEN BEGIN
                    VALIDATE("Production BOM No.",Item."Production BOM No.");
                    VALIDATE("Routing No.",Item."Routing No.");
                  END ELSE BEGIN
            #74..118
                  VALIDATE("Unit of Measure Code",Item."Base Unit of Measure");
                END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..39
                     (ReqWkshTmpl.Name <> '')
            #41..70
                    IF PlanningResiliency AND
                       ProdBOMHeader.GET(Item."Production BOM No.") AND
                       (ProdBOMHeader.Status <> ProdBOMHeader.Status::Certified)
                    THEN
                      TempPlanningErrorLog.SetError(
                        STRSUBSTNO(
                          Text033,ProdBOMHeader.TABLECAPTION,
                          ProdBOMHeader.FIELDCAPTION("No."),ProdBOMHeader."No."),
                        DATABASE::"Production BOM Header",ProdBOMHeader.GETPOSITION);
            #71..121
            */
        //end;
    }

    //Unsupported feature: Variable Insertion (Variable: ItemVend) (VariableCollection) on "UpdateDescription(PROCEDURE 8)".


    //Unsupported feature: Property Insertion (Local) on "UpdateDescription(PROCEDURE 8)".



    //Unsupported feature: Code Modification on "UpdateDescription(PROCEDURE 8)".

    //procedure UpdateDescription();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (Type <> Type::Item) OR ("No." = '') THEN
          EXIT;
        IF "Variant Code" = '' THEN BEGIN
          GetItem;
          Description := Item.Description;
          "Description 2" := Item."Description 2";
        END ELSE BEGIN
          ItemVariant.GET("No.","Variant Code");
          Description := ItemVariant.Description;
          "Description 2" := ItemVariant."Description 2";
        END;

        IF SalesLine.GET(SalesLine."Document Type"::Order,"Sales Order No.","Sales Order Line No.") THEN BEGIN
          Description := SalesLine.Description;
          "Description 2" := SalesLine."Description 2";
        END;

        IF "Vendor No." <> '' THEN
          IF ItemCrossRef.GetItemDescription(
               Description,"No.","Variant Code","Unit of Measure Code",ItemCrossRef."Cross-Reference Type"::Vendor,"Vendor No.")
          THEN
            "Description 2" := ''
          ELSE BEGIN
            Vend.GET("Vendor No.");
            IF Vend."Language Code" <> '' THEN
              IF ItemTranslation.GET("No.","Variant Code",Vend."Language Code") THEN BEGIN
                Description := ItemTranslation.Description;
                "Description 2" := ItemTranslation."Description 2";
              END;
          END;

        IF (CurrFieldNo <> 0) AND (CurrFieldNo <> FIELDNO("Location Code")) AND
           ("Planning Line Origin" = "Planning Line Origin"::" ")
        THEN
          IF ("Vendor No." <> '') AND NOT IsDropShipment THEN
            "Location Code" := Vend."Location Code"
          ELSE
            "Location Code" := '';
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..11
        IF "Vendor No." <> '' THEN BEGIN
          Vend.GET("Vendor No.");
          IF Vend."Language Code" <> '' THEN
            IF ItemTranslation.GET("No.","Variant Code",Vend."Language Code") THEN BEGIN
              Description := ItemTranslation.Description;
              "Description 2" := ItemTranslation."Description 2";
            END;
        END;
        IF (CurrFieldNo <> 0) AND (CurrFieldNo <> FIELDNO("Location Code")) THEN BEGIN
          ReserveReqLine.FilterReservFor(ReservEntry,Rec);
          IF ReservEntry.ISEMPTY THEN
            IF "Vendor No." <> '' THEN BEGIN
              "Location Code" := Vend."Location Code";
              IF ItemVend.GET("Vendor No.","No.","Variant Code") THEN
                IF ItemCrossRef.GET(
                     "No.","Variant Code","Unit of Measure Code",
                     ItemCrossRef."Cross-Reference Type"::Vendor,
                     "Vendor No.",ItemVend."Vendor Item No.")
                THEN
                  Description := ItemCrossRef.Description;
            END ELSE
              "Location Code" := '';
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "GetDirectCost(PROCEDURE 12)".

    //procedure GetDirectCost();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetWorkCenter;
        IF ("Replenishment System" = "Replenishment System"::Purchase) AND NOT Subcontracting THEN BEGIN
          PurchPriceCalcMgt.FindReqLineDisc(Rec);
          PurchPriceCalcMgt.FindReqLinePrice(Rec,CalledByFieldNo);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Replenishment System" = "Replenishment System"::Purchase THEN BEGIN
        #3..5
        */
    //end;


    //Unsupported feature: Code Modification on "CalcEndingDate(PROCEDURE 37)".

    //procedure CalcEndingDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Ref. Order Type" OF
          "Ref. Order Type"::Purchase:
            IF LeadTime = '' THEN
              LeadTime := LeadTimeMgt.PurchaseLeadTime("No.","Location Code","Variant Code","Vendor No.");
          "Ref. Order Type"::"Prod. Order",
          "Ref. Order Type"::Assembly:
            BEGIN
              IF RoutingLineExists THEN
                EXIT;

              IF LeadTime = '' THEN
                LeadTime := LeadTimeMgt.ManufacturingLeadTime("No.","Location Code","Variant Code");
            END;
        #14..19
        "Ending Date" :=
          LeadTimeMgt.PlannedEndingDate2(
            "No.","Location Code","Variant Code","Vendor No.",LeadTime,"Ref. Order Type","Starting Date");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
              IF "Routing No." <> '' THEN
                EXIT;
        #11..22
        */
    //end;


    //Unsupported feature: Code Modification on "CalcStartingDate(PROCEDURE 51)".

    //procedure CalcStartingDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Ref. Order Type" OF
          "Ref. Order Type"::Purchase:
            IF LeadTime = '' THEN
        #4..6
          "Ref. Order Type"::"Prod. Order",
          "Ref. Order Type"::Assembly:
            BEGIN
              IF RoutingLineExists THEN
                EXIT;

              IF LeadTime = '' THEN
                LeadTime := LeadTimeMgt.ManufacturingLeadTime("No.","Location Code","Variant Code");
            END;
        #16..20
          LeadTimeMgt.PlannedStartingDate(
            "No.","Location Code","Variant Code","Vendor No.",LeadTime,"Ref. Order Type","Ending Date");

        VALIDATE("Order Date","Starting Date");

        IF "Ref. Order Type" = "Ref. Order Type"::Transfer THEN
          CalcTransferShipmentDate;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
              IF "Routing No." <> '' THEN
                EXIT;
        #13..23
        "Order Date" := "Starting Date";
        #25..27
        */
    //end;


    //Unsupported feature: Code Modification on "TransferFromUnplannedDemand(PROCEDURE 46)".

    //procedure TransferFromUnplannedDemand();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        INIT;
        "Line No." := "Line No." + 10000;
        "Planning Line Origin" := "Planning Line Origin"::"Order Planning";
        #4..7
        "Bin Code" := UnplannedDemand."Bin Code";
        VALIDATE("No.");
        VALIDATE("Variant Code",UnplannedDemand."Variant Code");
        UpdateDescription;
        "Unit Of Measure Code (Demand)" := UnplannedDemand."Unit of Measure Code";
        "Qty. per UOM (Demand)" := UnplannedDemand."Qty. per Unit of Measure";
        Reserve := UnplannedDemand.Reserve;
        #15..28
        "Demand Order No." := UnplannedDemand."Demand Order No.";
        "Demand Line No." := UnplannedDemand."Demand Line No.";
        "Demand Ref. No." := UnplannedDemand."Demand Ref. No.";

        Status := UnplannedDemand.Status;

        Level := 1;
        "Action Message" := ReqLine."Action Message"::New;
        "User ID" := USERID;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10
        Description := UnplannedDemand.Description;
        #12..31
        IF UnplannedDemand."Special Order" THEN BEGIN
          "Sales Order No." := UnplannedDemand."Demand Order No.";
          "Sales Order Line No." := UnplannedDemand."Demand Line No.";
          "Sell-to Customer No." := UnplannedDemand."Sell-to Customer No.";
          "Purchasing Code" := UnplannedDemand."Purchasing Code";
        END;
        #32..37
        */
    //end;

    //Unsupported feature: Property Modification (Name) on "SetDropShipment(PROCEDURE 58)".



    //Unsupported feature: Code Modification on "SetDropShipment(PROCEDURE 58)".

    //procedure SetDropShipment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SourceDropShipment := NewDropShipment;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrentFieldNo := NewCurrFieldNo;
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "UpdateDescription(PROCEDURE 8).SalesLine(Variable 1000)".


    //Unsupported feature: Property Modification (Name) on "SetDropShipment(PROCEDURE 58).NewDropShipment(Parameter 1000)".


    //Unsupported feature: Property Modification (Data type) on "SetDropShipment(PROCEDURE 58).NewDropShipment(Parameter 1000)".


    
}

