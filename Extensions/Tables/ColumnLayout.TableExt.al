TableExtension 52193531 tableextension52193531 extends "Column Layout" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Comparison Period Formula"(Field 14).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            "Comparison Period Formula LCID" := GLOBALLANGUAGE;
            ParsePeriodFormula(
              "Comparison Period Formula",
              Steps,Type,RangeFromType,RangeToType,RangeFromInt,RangeToInt);
            IF "Comparison Period Formula" <> '' THEN
              CLEAR("Comparison Date Formula");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #2..6
            */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Comparison Period Formula LCID"(Field 30)".

    }

    //Unsupported feature: Variable Insertion (Variable: OriginalFormula) (VariableCollection) on "ParsePeriodFormula(PROCEDURE 26)".



    //Unsupported feature: Code Modification on "ParsePeriodFormula(PROCEDURE 26)".

    //procedure ParsePeriodFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Comparison Period Formula LCID" = 0 THEN
          "Comparison Period Formula LCID" := GLOBALLANGUAGE;

        OldLanguageID := GLOBALLANGUAGE("Comparison Period Formula LCID");
        FormulaParseErrorText := TryParsePeriodFormula(FormulaExpression,Steps,Type,RangeFromType,RangeToType,RangeFromInt,RangeToInt);
        GLOBALLANGUAGE(OldLanguageID);

        IF FormulaParseErrorText <> '' THEN
          ERROR(GETLASTERRORTEXT);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        // <PeriodFormula> ::= <signed integer> <formula> | blank
        // <signed integer> ::= <sign> <positive integer> | blank
        // <sign> ::= + | - | blank
        // <positive integer> ::= <digit 1-9> <digits>
        // <digit 1-9> ::= 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
        // <digits> ::= 0 <digits> | <digit 1-9> <digits> | blank
        // <formula> ::= P | FY <range> | FH <range> | FQ <range>
        // <range> ::= blank | [<range2>]
        // <range2> ::= <index> .. <index> | <index>
        // <index> ::= <positive integer> | CP | LP

        OriginalFormula := Formula;
        Formula := DELCHR(Formula);

        IF NOT ParseFormula(Formula,Steps,Type) THEN
          ERROR(Text001,OriginalFormula);

        IF Type = Type::"Fiscal Year" THEN
          IF NOT ParseRange(Formula,RangeFromType,RangeFromInt,RangeToType,RangeToInt) THEN
            ERROR(Text001,OriginalFormula);

        IF Formula <> '' THEN
          ERROR(Text001,OriginalFormula);
        */
    //end;


    //Unsupported feature: Code Modification on "ParseFormula(PROCEDURE 5)".

    //procedure ParseFormula();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Steps := 0;
        Type := Type::" ";

        IF FormulaExpression = '' THEN
          EXIT(TRUE);

        IF NOT ParseSignedInteger(FormulaExpression,Steps) THEN
          EXIT(FALSE);

        IF FormulaExpression = '' THEN
          EXIT(FALSE);

        IF NOT ParseType(FormulaExpression,Type) THEN
          EXIT(FALSE);

        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        IF Formula = '' THEN
          EXIT(TRUE);

        IF NOT ParseSignedInteger(Formula,Steps) THEN
          EXIT(FALSE);

        IF Formula = '' THEN
          EXIT(FALSE);

        IF NOT ParseType(Formula,Type) THEN
        #14..16
        */
    //end;


    //Unsupported feature: Code Modification on "ParseSignedInteger(PROCEDURE 1)".

    //procedure ParseSignedInteger();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Int := 0;

        CASE COPYSTR(FormulaExpression,1,1) OF
          '-':
            BEGIN
              FormulaExpression := COPYSTR(FormulaExpression,2);
              IF NOT ParseInt(FormulaExpression,Int,FALSE) THEN
                EXIT(FALSE);
              Int := -Int;
            END;
          '+':
            BEGIN
              FormulaExpression := COPYSTR(FormulaExpression,2);
              IF NOT ParseInt(FormulaExpression,Int,FALSE) THEN
                EXIT(FALSE);
            END;
          ELSE BEGIN
            IF NOT ParseInt(FormulaExpression,Int,TRUE) THEN
              EXIT(FALSE);
          END;
        END;
        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Int := 0;

        CASE COPYSTR(Formula,1,1) OF
          '-':
            BEGIN
              Formula := COPYSTR(Formula,2);
              IF NOT ParseInt(Formula,Int,FALSE) THEN
        #8..12
              Formula := COPYSTR(Formula,2);
              IF NOT ParseInt(Formula,Int,FALSE) THEN
        #15..17
            IF NOT ParseInt(Formula,Int,TRUE) THEN
        #19..22
        */
    //end;


    //Unsupported feature: Code Modification on "ParseInt(PROCEDURE 2)".

    //procedure ParseInt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF COPYSTR(FormulaExpression,1,1) IN ['1'..'9'] THEN
          REPEAT
            IntegerStr := IntegerStr + COPYSTR(FormulaExpression,1,1);
            FormulaExpression := COPYSTR(FormulaExpression,2);
            IF FormulaExpression = '' THEN
              EXIT(FALSE);
          UNTIL NOT (COPYSTR(FormulaExpression,1,1) IN ['0'..'9'])
        ELSE
          EXIT(AllowNotInt);
        EVALUATE(Int,IntegerStr);
        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF COPYSTR(Formula,1,1) IN ['1'..'9'] THEN
          REPEAT
            IntegerStr := IntegerStr + COPYSTR(Formula,1,1);
            Formula := COPYSTR(Formula,2);
            IF Formula = '' THEN
              EXIT(FALSE);
          UNTIL NOT (COPYSTR(Formula,1,1) IN ['0'..'9'])
        #8..11
        */
    //end;


    //Unsupported feature: Code Modification on "ParseType(PROCEDURE 3)".

    //procedure ParseType();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE ReadToken(FormulaExpression) OF
          Text002:
            Type := Type::Period;
          Text003:
            Type := Type::"Fiscal Year";
          ELSE
            EXIT(FALSE);
        END;
        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CASE ReadToken(Formula) OF
        #2..9
        */
    //end;


    //Unsupported feature: Code Modification on "ParseRange(PROCEDURE 6)".

    //procedure ParseRange();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FromType := FromType::CP;
        ToType := ToType::CP;

        IF FormulaExpression = '' THEN
          EXIT(TRUE);

        IF NOT ParseToken(FormulaExpression,'[') THEN
          EXIT(FALSE);

        IF NOT ParseIndex(FormulaExpression,FromType,FromInt) THEN
          EXIT(FALSE);
        IF FormulaExpression = '' THEN
          EXIT(FALSE);

        IF COPYSTR(FormulaExpression,1,1) = '.' THEN BEGIN
          IF NOT ParseToken(FormulaExpression,'..') THEN
            EXIT(FALSE);
          IF NOT ParseIndex(FormulaExpression,ToType,ToInt) THEN
            EXIT(FALSE);
        END ELSE BEGIN
          ToType := FromType;
          ToInt := FromInt;
        END;

        IF NOT ParseToken(FormulaExpression,']') THEN
          EXIT(FALSE);

        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        IF Formula = '' THEN
          EXIT(TRUE);

        IF NOT ParseToken(Formula,'[') THEN
          EXIT(FALSE);

        IF NOT ParseIndex(Formula,FromType,FromInt) THEN
          EXIT(FALSE);
        IF Formula = '' THEN
          EXIT(FALSE);

        IF COPYSTR(Formula,1,1) = '.' THEN BEGIN
          IF NOT ParseToken(Formula,'..') THEN
            EXIT(FALSE);
          IF NOT ParseIndex(Formula,ToType,ToInt) THEN
        #19..24
        IF NOT ParseToken(Formula,']') THEN
        #26..28
        */
    //end;


    //Unsupported feature: Code Modification on "ParseIndex(PROCEDURE 11)".

    //procedure ParseIndex();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF FormulaExpression = '' THEN
          EXIT(FALSE);

        IF ParseInt(FormulaExpression,Index,FALSE) THEN
          IndexType := IndexType::Int
        ELSE
          CASE ReadToken(FormulaExpression) OF
            Text004:
              IndexType := IndexType::CP;
            Text005:
        #11..13
          END;

        EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Formula = '' THEN
          EXIT(FALSE);

        IF ParseInt(Formula,Index,FALSE) THEN
          IndexType := IndexType::Int
        ELSE
          CASE ReadToken(Formula) OF
        #8..16
        */
    //end;


    //Unsupported feature: Code Modification on "ParseToken(PROCEDURE 13)".

    //procedure ParseToken();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF COPYSTR(FormulaExpression,1,STRLEN(Token)) <> Token THEN
          EXIT(FALSE);
        FormulaExpression := COPYSTR(FormulaExpression,STRLEN(Token) + 1);
        EXIT(TRUE)
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF COPYSTR(Formula,1,STRLEN(Token)) <> Token THEN
          EXIT(FALSE);
        Formula := COPYSTR(Formula,STRLEN(Token) + 1);
        EXIT(TRUE)
        */
    //end;


    //Unsupported feature: Code Modification on "ReadToken(PROCEDURE 7)".

    //procedure ReadToken();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FOR p := 1 TO STRLEN(FormulaExpression) DO BEGIN
          IF COPYSTR(FormulaExpression,p,1) IN ['[',']','.'] THEN BEGIN
            FormulaExpression := COPYSTR(FormulaExpression,STRLEN(Token) + 1);
            EXIT(Token);
          END;
          Token := Token + COPYSTR(FormulaExpression,p,1);
        END;

        FormulaExpression := '';
        EXIT(Token);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        FOR p := 1 TO STRLEN(Formula) DO BEGIN
          IF COPYSTR(Formula,p,1) IN ['[',']','.'] THEN BEGIN
            Formula := COPYSTR(Formula,STRLEN(Token) + 1);
            EXIT(Token);
          END;
          Token := Token + COPYSTR(Formula,p,1);
        END;

        Formula := '';
        EXIT(Token);
        */
    //end;

    //Unsupported feature: Property Modification (Name) on "ParsePeriodFormula(PROCEDURE 26).FormulaExpression(Parameter 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "ParsePeriodFormula(PROCEDURE 26).OldLanguageID(Variable 1004)".


    //Unsupported feature: Deletion (VariableCollection) on "ParsePeriodFormula(PROCEDURE 26).FormulaParseErrorText(Variable 1005)".


    //Unsupported feature: Property Modification (Name) on "ParseFormula(PROCEDURE 5).FormulaExpression(Parameter 1002)".


    //Unsupported feature: Property Modification (OptionString) on "ParseFormula(PROCEDURE 5).Type(Parameter 1006)".


    //Unsupported feature: Property Modification (Name) on "ParseSignedInteger(PROCEDURE 1).FormulaExpression(Parameter 1000)".


    //Unsupported feature: Property Modification (Name) on "ParseInt(PROCEDURE 2).FormulaExpression(Parameter 1001)".


    //Unsupported feature: Property Modification (Name) on "ParseType(PROCEDURE 3).FormulaExpression(Parameter 1001)".


    //Unsupported feature: Property Modification (Name) on "ParseRange(PROCEDURE 6).FormulaExpression(Parameter 1002)".


    //Unsupported feature: Property Modification (Name) on "ParseIndex(PROCEDURE 11).FormulaExpression(Parameter 1002)".


    //Unsupported feature: Property Modification (Name) on "ParseToken(PROCEDURE 13).FormulaExpression(Parameter 1000)".


    //Unsupported feature: Property Modification (Name) on "ReadToken(PROCEDURE 7).FormulaExpression(Parameter 1000)".



    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text002 : @@@=Period;ENU=P;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text002 : ENU=P;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1001)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text003 : @@@=Fiscal year;ENU=FY;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text003 : ENU=FY;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1005)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text004 : @@@=Current Period;ENU=CP;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text004 : ENU=CP;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1004)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text005 : @@@=Last period;ENU=LP;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text005 : ENU=LP;
        //Variable type has not been exported.

    var
        Text001: label '%1 is not a valid Period Formula';
}

