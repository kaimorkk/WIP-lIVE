TableExtension 52193460 tableextension52193460 extends "G/L Budget Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Business Unit Code"(Field 10)".


        //Unsupported feature: Code Modification on ""Global Dimension 1 Code"(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetGLSetup;
        ValidateDimValue(GLSetup."Global Dimension 1 Code","Global Dimension 1 Code");
        UpdateDimensionSetId(GLSetup."Global Dimension 1 Code","Global Dimension 1 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Global Dimension 1 Code" = '' THEN
          EXIT;
        GetGLSetup;
        ValidateDimValue(GLSetup."Global Dimension 1 Code","Global Dimension 1 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Global Dimension 2 Code"(Field 6).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetGLSetup;
        ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
        UpdateDimensionSetId(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Global Dimension 2 Code" = '' THEN
          EXIT;
        GetGLSetup;
        ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
        */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 11)".



        //Unsupported feature: Code Modification on ""Budget Dimension 1 Code"(Field 12).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "Budget Dimension 1 Code" := OnLookupDimCode(2,"Budget Dimension 1 Code");
        ValidateDimValue(GLBudgetName."Budget Dimension 1 Code","Budget Dimension 1 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 1 Code","Budget Dimension 1 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Budget Dimension 1 Code" := OnLookupDimCode(2,"Budget Dimension 1 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Budget Dimension 1 Code"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Budget Dimension 1 Code" = xRec."Budget Dimension 1 Code" THEN
          EXIT;
        IF GLBudgetName.Name <> "Budget Name" THEN
          GLBudgetName.GET("Budget Name");
        ValidateDimValue(GLBudgetName."Budget Dimension 1 Code","Budget Dimension 1 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 1 Code","Budget Dimension 1 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Budget Dimension 1 Code" = '' THEN
        #2..5
        */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Budget Dimension 1 Code"(Field 12)".



        //Unsupported feature: Code Modification on ""Budget Dimension 2 Code"(Field 13).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "Budget Dimension 2 Code" := OnLookupDimCode(3,"Budget Dimension 2 Code");
        ValidateDimValue(GLBudgetName."Budget Dimension 2 Code","Budget Dimension 2 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 2 Code","Budget Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Budget Dimension 2 Code" := OnLookupDimCode(3,"Budget Dimension 2 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Budget Dimension 2 Code"(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Budget Dimension 2 Code" = xRec."Budget Dimension 2 Code" THEN
          EXIT;
        IF GLBudgetName.Name <> "Budget Name" THEN
          GLBudgetName.GET("Budget Name");
        ValidateDimValue(GLBudgetName."Budget Dimension 2 Code","Budget Dimension 2 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 2 Code","Budget Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Budget Dimension 2 Code" = '' THEN
        #2..5
        */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Budget Dimension 2 Code"(Field 13)".



        //Unsupported feature: Code Modification on ""Budget Dimension 3 Code"(Field 14).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "Budget Dimension 3 Code" := OnLookupDimCode(4,"Budget Dimension 3 Code");
        ValidateDimValue(GLBudgetName."Budget Dimension 3 Code","Budget Dimension 3 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 3 Code","Budget Dimension 3 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Budget Dimension 3 Code" := OnLookupDimCode(4,"Budget Dimension 3 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Budget Dimension 3 Code"(Field 14).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Budget Dimension 3 Code" = xRec."Budget Dimension 3 Code" THEN
          EXIT;
        IF GLBudgetName.Name <> "Budget Name" THEN
          GLBudgetName.GET("Budget Name");
        ValidateDimValue(GLBudgetName."Budget Dimension 3 Code","Budget Dimension 3 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 3 Code","Budget Dimension 3 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Budget Dimension 3 Code" = '' THEN
        #2..5
        */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Budget Dimension 3 Code"(Field 14)".



        //Unsupported feature: Code Modification on ""Budget Dimension 4 Code"(Field 15).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "Budget Dimension 4 Code" := OnLookupDimCode(5,"Budget Dimension 4 Code");
        ValidateDimValue(GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Budget Dimension 4 Code" := OnLookupDimCode(5,"Budget Dimension 4 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Budget Dimension 4 Code"(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Budget Dimension 4 Code" = xRec."Budget Dimension 4 Code" THEN
          EXIT;
        IF GLBudgetName.Name <> "Budget Name" THEN
          GLBudgetName.GET("Budget Name");
        ValidateDimValue(GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
        UpdateDimensionSetId(GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Budget Dimension 4 Code" = '' THEN
        #2..5
        */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Budget Dimension 4 Code"(Field 15)".


        //Unsupported feature: Deletion on ""Dimension Set ID"(Field 480).OnValidate".

        field(40007; "Budget Type"; Option)
        {
            OptionCaption = 'Approved,Revised,Suplimentary';
            OptionMembers = Approved,Revised,Suplimentary;
        }
        field(40005; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(40004; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Sub Department Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(40001; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Project Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(40000; "Budget Dimension 5 Code"; Code[10])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 5 Code" <> xRec."Budget Dimension 5 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 5 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 5 Code",4);
                END;
                */

            end;
        }
        field(50001; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 6 Code" <> xRec."Budget Dimension 6 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 6 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 6 Code",5);
                END;
                */

            end;
        }
        field(50002; "Transferred from Item Budget"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'Added';
        }
        field(50003; WorkplanCode; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Added';
        }
        field(50004; Votehead; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = Voteheads.Code;

            trigger OnValidate()
            begin
                // VoteheadRec.Reset;
                // VoteheadRec.SetRange(Code, Votehead);
                // if VoteheadRec.Find('-') then begin
                //     VoteheadRec.TestField("G/L Account");
                //     "G/L Account No." := VoteheadRec."G/L Account";
                // end;
            end;
        }
        field(50005; "Budgeted Amount"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Amount := "Budgeted Amount";
            end;
        }
        field(50006; Quantity; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Revised Estimate" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");

                "Revised Estimate" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");
            end;
        }
        field(50007; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Budgeted Amount" := "Unit Price" * Quantity;
                Validate("Budgeted Amount");
            end;
        }
        field(50008; "Revised Estimate"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Amount := "Budgeted Amount";
            end;
        }
        field(50009; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50010; "Revised 2"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50011; "Amount 2"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50012; "Budgeted 2"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50013; "Global Dimension 1"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Global Dimension 2"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50015; "Budget Dimension 1"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50016; "Budget Dimension 2"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50017; "Budget Dimension 3"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50018; "Budget Dimension 4"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Sub Ledger Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Customer,Vendor';
            OptionMembers = ,Customer,Vendor;
        }
        field(50020; "SL Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = if ("Sub Ledger Type" = const(Customer)) Customer
            else
            if ("Sub Ledger Type" = const(Vendor)) Vendor;
        }
        field(50025; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(50026; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(50027; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(50028; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
        }
        field(50029; "Source Document"; Code[20])
        {
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(50030; "Entry Type"; Option)
        {
            OptionMembers = "Utilization","Allocation","ReAllocation","Supplimentary";
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckIfBlocked;
    DeleteAnalysisViewBudgetEntries;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CheckIfBlocked;
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckIfBlocked;
    TESTFIELD(Date);
    TESTFIELD("G/L Account No.");
    #4..15
    UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 2 Code","Budget Dimension 2 Code");
    UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 3 Code","Budget Dimension 3 Code");
    UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
    VALIDATE("Dimension Set ID",DimMgt.GetDimensionSetID(TempDimSetEntry));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    "Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
    */
    //end;


    //Unsupported feature: Code Insertion (VariableCollection) on "OnModify".

    //trigger (Variable: TempDimSetEntry)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckIfBlocked;
    "User ID" := USERID;
    "Last Date Modified" := TODAY;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3

    GetGLSetup;
    DimMgt.GetDimensionSet(TempDimSetEntry,"Dimension Set ID");
    IF "Global Dimension 1 Code" <> xRec."Global Dimension 1 Code" THEN
      UpdateDimSet(TempDimSetEntry,GLSetup."Global Dimension 1 Code","Global Dimension 1 Code");
    IF "Global Dimension 2 Code" <> xRec."Global Dimension 2 Code" THEN
      UpdateDimSet(TempDimSetEntry,GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
    IF "Budget Dimension 1 Code" <> xRec."Budget Dimension 1 Code" THEN
      UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 1 Code","Budget Dimension 1 Code");
    IF "Budget Dimension 2 Code" <> xRec."Budget Dimension 2 Code" THEN
      UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 2 Code","Budget Dimension 2 Code");
    IF "Budget Dimension 3 Code" <> xRec."Budget Dimension 3 Code" THEN
      UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 3 Code","Budget Dimension 3 Code");
    IF "Budget Dimension 4 Code" <> xRec."Budget Dimension 4 Code" THEN
      UpdateDimSet(TempDimSetEntry,GLBudgetName."Budget Dimension 4 Code","Budget Dimension 4 Code");
    "Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateDimValue(PROCEDURE 5)".

    //procedure ValidateDimValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF DimValueCode = '' THEN
      EXIT;

    DimValue."Dimension Code" := DimCode;
    DimValue.Code := DimValueCode;
    DimValue.FIND('=><');
    IF DimValueCode <> COPYSTR(DimValue.Code,1,STRLEN(DimValueCode)) THEN
      ERROR(Text000,DimValueCode,DimCode);
    DimValueCode := DimValue.Code;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #4..9
    */
    //end;


    //Unsupported feature: Code Modification on "GetCaptionClass(PROCEDURE 7)".

    //procedure GetCaptionClass();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF GETFILTER("Budget Name") <> '' THEN
      IF GLBudgetName.Name <> GETRANGEMIN("Budget Name") THEN
        IF NOT GLBudgetName.GET(GETRANGEMIN("Budget Name")) THEN
          CLEAR(GLBudgetName);
    CASE BudgetDimType OF
      1:
        BEGIN
    #8..31
          EXIT(Text004);
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF GLBudgetName.Name <> "Budget Name" THEN
      IF NOT GLBudgetName.GET("Budget Name") THEN
        EXIT('');
    #5..34
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateDimSet(PROCEDURE 6)".

    //procedure UpdateDimSet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF DimCode = '' THEN
      EXIT;
    IF TempDimSetEntry.GET("Dimension Set ID",DimCode) THEN
      TempDimSetEntry.DELETE;
    IF DimValueCode = '' THEN
      DimVal.INIT
    ELSE
      DimVal.GET(DimCode,DimValueCode);
    TempDimSetEntry.INIT;
    TempDimSetEntry."Dimension Set ID" := "Dimension Set ID";
    TempDimSetEntry."Dimension Code" := DimCode;
    TempDimSetEntry."Dimension Value Code" := DimValueCode;
    TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
    TempDimSetEntry.INSERT;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    IF DimValueCode <> '' THEN BEGIN
      DimVal.GET(DimCode,DimValueCode);
      TempDimSetEntry.INIT;
      TempDimSetEntry."Dimension Set ID" := "Dimension Set ID";
      TempDimSetEntry."Dimension Code" := DimCode;
      TempDimSetEntry."Dimension Value Code" := DimValueCode;
      TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
      TempDimSetEntry.INSERT;
    END;
    */
    //end;

    //Unsupported feature: Property Deletion (Permissions).


    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
}

