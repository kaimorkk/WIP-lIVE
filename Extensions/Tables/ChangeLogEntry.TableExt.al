TableExtension 52193562 tableextension52193562 extends "Change Log Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 4)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Record ID"(Field 22)".

    }

    //Unsupported feature: Code Modification on "GetLocalValue(PROCEDURE 5)".

    //procedure GetLocalValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        // The culture neutral storage format was added simultaneously with the Record ID field
        HasCultureNeutralValues := FORMAT("Record ID") <> '';
        Object.SETRANGE(Type,Object.Type::Table);
        Object.SETRANGE(ID,"Table No.");

        IF NOT Object.ISEMPTY AND (Value <> '') AND HasCultureNeutralValues THEN BEGIN
          RecordRef.OPEN("Table No.");
          IF RecordRef.FIELDEXIST("Field No.") THEN BEGIN
            FieldRef := RecordRef.FIELD("Field No.");
            IF ChangeLogManagement.EvaluateTextToFieldRef(Value,FieldRef) THEN
              EXIT(FORMAT(FieldRef.VALUE,0,1));
          END;
        END;

        EXIT(Value);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        // The culture neutral storage format was added simultaneously with the Record ID field
        HasCultureNeutralValues := FORMAT("Record ID") <> '';

        IF (Value <> '') AND HasCultureNeutralValues THEN BEGIN
          RecordRef.OPEN("Table No.");
          FieldRef := RecordRef.FIELD("Field No.");
          IF ChangeLogManagement.EvaluateTextToFieldRef(Value,FieldRef) THEN
            EXIT(FORMAT(FieldRef.VALUE,0,1));
        #13..15
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "GetLocalValue(PROCEDURE 5).Object(Variable 1005)".

}

