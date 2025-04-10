TableExtension 52193547 tableextension52193547 extends "Excel Buffer" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Row No."(Field 1)".


        //Unsupported feature: Property Deletion (DataClassification) on "xlRowID(Field 2)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Column No."(Field 3)".


        //Unsupported feature: Property Deletion (DataClassification) on "xlColID(Field 4)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Cell Value as Text"(Field 5)".


        //Unsupported feature: Property Deletion (DataClassification) on "Comment(Field 6)".


        //Unsupported feature: Property Deletion (DataClassification) on "Formula(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on "Bold(Field 8)".


        //Unsupported feature: Property Deletion (DataClassification) on "Italic(Field 9)".


        //Unsupported feature: Property Deletion (DataClassification) on "Underline(Field 10)".


        //Unsupported feature: Property Deletion (DataClassification) on "NumberFormat(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on "Formula2(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on "Formula3(Field 13)".


        //Unsupported feature: Property Deletion (DataClassification) on "Formula4(Field 14)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Cell Type"(Field 15)".


        //Unsupported feature: Deletion (FieldCollection) on ""Double Underline"(Field 16)".

    }

    //Unsupported feature: Code Modification on "WriteSheet(PROCEDURE 37)".

    //procedure WriteSheet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        LastUpdate := CURRENTDATETIME;
        ExcelBufferDialogMgt.Open(Text005);

        CRLF := 10;
        RecNo := 1;
        TotalRecNo := COUNT + InfoExcelBuf.COUNT;
        RecNo := 0;

        XlWrkShtWriter.AddPageSetup(OrientationValues.Landscape,9); // 9 - default value for Paper Size - A4

        // commit is required because of the result boolean check of ExcelBufferDialogMgt.RUN
        COMMIT;
        #13..49
          END;

        ExcelBufferDialogMgt.Close;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        XlWrkShtWriter.AddPageSetup(OrientationValues.Landscape);
        #10..52
        */
    //end;


    //Unsupported feature: Code Modification on "WriteCellValue(PROCEDURE 28)".

    //procedure WriteCellValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH ExcelBuffer DO BEGIN
          GetCellDecorator(Bold,Italic,Underline,"Double Underline",Decorator);

          CASE "Cell Type" OF
            "Cell Type"::Number:
        #6..13
              ERROR(Text039)
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WITH ExcelBuffer DO BEGIN
          GetCellDecorator(Bold,Italic,Underline,Decorator);
        #3..16
        */
    //end;


    //Unsupported feature: Code Modification on "WriteCellFormula(PROCEDURE 38)".

    //procedure WriteCellFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH ExcelBuffer DO BEGIN
          GetCellDecorator(Bold,Italic,Underline,"Double Underline",Decorator);

          XlWrkShtWriter.SetCellFormula("Row No.",xlColID,GetFormula,NumberFormat,Decorator);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WITH ExcelBuffer DO BEGIN
          GetCellDecorator(Bold,Italic,Underline,Decorator);
        #3..5
        */
    //end;


    //Unsupported feature: Code Modification on "GetCellDecorator(PROCEDURE 33)".

    //procedure GetCellDecorator();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF IsBold AND IsItalic THEN BEGIN
          IF IsDoubleUnderlined THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultBoldItalicDoubleUnderlinedCellDecorator;
            EXIT;
          END;
          IF IsUnderlined THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
            EXIT;
          END;
        END;

        IF IsBold AND IsItalic THEN BEGIN
          Decorator := XlWrkShtWriter.DefaultBoldItalicCellDecorator;
          EXIT;
        END;

        IF IsBold THEN BEGIN
          IF IsDoubleUnderlined THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultBoldDoubleUnderlinedCellDecorator;
            EXIT;
          END;
          IF IsUnderlined THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
            EXIT;
          END;
        END;

        IF IsBold THEN BEGIN
          Decorator := XlWrkShtWriter.DefaultBoldCellDecorator;
          EXIT;
        END;

        IF IsItalic THEN BEGIN
          IF IsDoubleUnderlined THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultItalicDoubleUnderlinedCellDecorator;
            EXIT;
          END;
          IF IsUnderlined THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
            EXIT;
          END;
        END;

        IF IsItalic THEN BEGIN
          Decorator := XlWrkShtWriter.DefaultItalicCellDecorator;
          EXIT;
        END;

        IF IsDoubleUnderlined THEN
          Decorator := XlWrkShtWriter.DefaultDoubleUnderlinedCellDecorator
        ELSE BEGIN
          IF IsUnderlined THEN
            Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
          ELSE
            Decorator := XlWrkShtWriter.DefaultCellDecorator;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF IsBold AND IsItalic AND IsUnderlined THEN BEGIN
          Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
        #14..16
        #12..16
        IF IsBold AND IsUnderlined THEN BEGIN
          Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
        #30..32
        #28..32
        IF IsItalic AND IsUnderlined THEN BEGIN
          Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
        #46..48
        #44..48
        IF IsUnderlined THEN
          Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
        ELSE
          Decorator := XlWrkShtWriter.DefaultCellDecorator;
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: SheetsList) (VariableCollection) on "SelectSheetsName(PROCEDURE 6)".


    //Unsupported feature: Variable Insertion (Variable: EndOfLoop) (VariableCollection) on "SelectSheetsName(PROCEDURE 6)".


    //Unsupported feature: Variable Insertion (Variable: OptionNo) (VariableCollection) on "SelectSheetsName(PROCEDURE 6)".



    //Unsupported feature: Code Modification on "SelectSheetsName(PROCEDURE 6)".

    //procedure SelectSheetsName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF FileName = '' THEN
          ERROR(Text001);

        XlWrkBkReader := XlWrkBkReader.Open(FileName);

        SelectedSheetName := '';
        SheetNames := SheetNames.ArrayList(XlWrkBkReader.SheetNames);
        IF NOT ISNULL(SheetNames) THEN BEGIN
          FOR i := 0 TO SheetNames.Count - 1 DO BEGIN
            SheetName := SheetNames.Item(i);
            IF SheetName <> '' THEN BEGIN
              TempNameValueBuffer.INIT;
              TempNameValueBuffer.ID := i;
              TempNameValueBuffer.Name := FORMAT(i + 1);
              TempNameValueBuffer.Value := SheetName;
              TempNameValueBuffer.INSERT;
            END;
          END;
          IF NOT TempNameValueBuffer.ISEMPTY THEN
            IF TempNameValueBuffer.COUNT = 1 THEN
              SelectedSheetName := TempNameValueBuffer.Value
            ELSE BEGIN
              TempNameValueBuffer.FINDFIRST;
              IF PAGE.RUNMODAL(PAGE::"Name/Value Lookup",TempNameValueBuffer) = ACTION::LookupOK THEN
                SelectedSheetName := TempNameValueBuffer.Value;
            END;
        END;

        QuitExcel;
        EXIT(SelectedSheetName);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        SheetNames := SheetNames.ArrayList(XlWrkBkReader.SheetNames);
        IF NOT ISNULL(SheetNames) THEN BEGIN
          i := 0;
          EndOfLoop := SheetNames.Count - 1;
          WHILE i <= EndOfLoop DO BEGIN
            SheetName := SheetNames.Item(i);
            IF (SheetName <> '') AND (STRLEN(SheetsList) + STRLEN(SheetName) < 250) THEN
              SheetsList := SheetsList + SheetName + ','
            ELSE
              i := EndOfLoop;
            i := i + 1;
          END;
          IF i > 1 THEN BEGIN
            IF SheetsList <> '' THEN BEGIN
              OptionNo := STRMENU(SheetsList,1,SelectWorksheetMsg);
              IF OptionNo <> 0 THEN
                SelectedSheetName := SELECTSTR(OptionNo,SheetsList);
            END
          END ELSE
            SelectedSheetName := SheetName;
        #27..30
        */
    //end;

    //Unsupported feature: ReturnValue Insertion (ReturnValue: <Blank>) (ReturnValueCollection) on "CreateRange(PROCEDURE 45)".


    //Unsupported feature: Deletion (ParameterCollection) on "GetCellDecorator(PROCEDURE 33).IsDoubleUnderlined(Parameter 1004)".


    //Unsupported feature: Deletion (VariableCollection) on "SelectSheetsName(PROCEDURE 6).TempNameValueBuffer(Variable 1009)".


    var
        SelectWorksheetMsg: label 'Choose the Microsoft Excel worksheet.', Comment='{Locked="Microsoft Excel"}';
}

