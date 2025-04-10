Table 52193655 "Change Values Field"
{

    fields
    {
        field(1;TableID;Integer)
        {
            Caption = 'TableID';
        }
        field(2;FieldID;Integer)
        {
            Caption = 'FieldID';
        }
        field(3;"Field Name";Text[30])
        {
            CalcFormula = lookup(Field.FieldName where (TableNo=field(TableID),
                                                        "No."=field(FieldID)));
            Caption = 'Field Name';
            FieldClass = FlowField;
        }
        field(4;"Field Caption";Text[250])
        {
            CalcFormula = lookup(Field."Field Caption" where (TableNo=field(TableID),
                                                              "No."=field(FieldID)));
            Caption = 'Field Caption';
            FieldClass = FlowField;
        }
        field(5;Validate;Boolean)
        {
            Caption = 'Validate';

            trigger OnValidate()
            begin
                CalcFields("Field Caption");
                if xRec.Validate and IsKeyField then
                  Error(Text000,"Field Caption");

                UpdateFieldErrors();
            end;
        }
        field(6;Include;Boolean)
        {
            Caption = 'Include';

            trigger OnValidate()
            begin
                CalcFields("Field Caption");
                if xRec.Include and IsKeyField then
                  Error(Text000,"Field Caption");

                UpdateFieldErrors();
            end;
        }
        field(7;Localize;Boolean)
        {
            Caption = 'Localize';
        }
        field(8;Change;Boolean)
        {
        }
        field(9;"Old Value";Text[250])
        {
        }
        field(10;"New Value";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;TableID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: label '%1 is part of primary key and must be included.';
        Text001: label '%1 value ''%2'' does not exist.';


    procedure IsKeyField(): Boolean
    var
        FieldSelection: Record "Config. Package Field";
        RecRef: RecordRef;
        KeyRef: KeyRef;
        FieldRef: FieldRef;
        KeyFieldCount: Integer;
    begin
        RecRef.Open(TableID);
        KeyRef := RecRef.KeyIndex(1);
        for KeyFieldCount := 1 to KeyRef.FieldCount do begin
          FieldRef := KeyRef.FieldIndex(KeyFieldCount);
          if FieldRef.Number = FieldID then
            exit(true);
        end;
    end;


    procedure UpdateFieldErrors()
    var
        MigrationMgt: Codeunit "Config. Package Management";
        MigrationData: Record "Config. Package Data";
        RecRef: RecordRef;
        FieldRef: FieldRef;
    begin
        RecRef.Open(TableID,true);
        FieldRef := RecRef.Field(FieldID);
        
        MigrationData.SetRange(MigrationData."Table ID",TableID);
        MigrationData.SetRange(MigrationData."Field ID",FieldID);
        
        if MigrationData.Find('-') then
          repeat
            MigrationMgt.CleanFieldError(MigrationData);
            if Include then begin
             /* //MigrationMgt.FieldError(MigrationData,MigrationMgt.EvaluateValue(FieldRef,MigrationData.Value));
              IF Validate AND NOT MigrationMgt.ValidateTableRelation(FieldRef) THEN BEGIN
                MigrationMgt.FieldError(MigrationData,STRSUBSTNO(Text001,FieldRef.CAPTION,MigrationData.Value));
              END;*/
            end;
          until MigrationData.Next = 0;

    end;
}

