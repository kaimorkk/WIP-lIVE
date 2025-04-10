Table 52193654 "Change Values Table"
{

    fields
    {
        field(1; TableID; Integer)
        {
            Caption = 'TableID';
            NotBlank = true;
            // TableRelation = Object.ID where(Type = const(Table));

            trigger OnLookup()
            var
                //"Object": Record "Object";
                Objects: Page Objects;
            begin
                // Object.SetRange(Object.Type, Object.Type::Table);
                // Objects.SetTableview(Object);
                // Objects.LookupMode := true;
                // if Objects.RunModal = Action::LookupOK then begin
                //     Objects.GetRecord(Object);
                //     Validate(TableID, Object.ID);
                // end;
            end;
        }
        field(2; "Table Name"; Text[30])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object Type" = const(Table),
                                                                        "Object ID" = field(TableID)));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "No. of Migration Records"; Integer)
        {
            CalcFormula = count("Config. Package Record" where("Table ID" = field(TableID),
                                                                Invalid = filter(false)));
            Caption = 'No. of Migration Records';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "No. of Migration Errors"; Integer)
        {
            CalcFormula = count("Config. Package Record" where("Table ID" = field(TableID),
                                                                Invalid = filter(true)));
            Caption = 'No. of Migration Errors';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "No. of Database Records"; Integer)
        {
            // CalcFormula = lookup("Table Information"."No. of Records" where("Company Name" = field("Company Filter (Source Table)"),
            //                                                                  "Table No." = field(TableID),
            //                                                                  "No. of Records" = filter(<> 0)));
            Caption = 'No. of Database Records';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Fields Included"; Boolean)
        {
            CalcFormula = exist("Config. Package Field" where("Table ID" = field(TableID)));
            Caption = 'Fields Included';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Imported Date Time"; DateTime)
        {
            Caption = 'Imported Date Time';
            Editable = false;
        }
        field(8; "Exported Date Time"; DateTime)
        {
            Caption = 'Exported Date Time';
            Editable = false;
        }
        field(9; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(10; "Company Type"; Text[250])
        {
            Caption = 'Company Type';
            Editable = false;
        }
        field(11; "Company Filter (Source Table)"; Text[30])
        {
            Caption = 'Company Filter (Source Table)';
            FieldClass = FlowFilter;
            TableRelation = Company;
        }
        field(12; "Table Caption"; Text[250])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Table),
                                                                           "Object ID" = field(TableID)));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Data Template"; Code[10])
        {
            Caption = 'Data Template';
        }
        field(14; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Not Started,In Progress,Completed';
            OptionMembers = "Not Started","In Progress",Completed;
        }
        field(15; "Form ID"; Integer)
        {
            Caption = 'Form ID';
            TableRelation = AllObj."Object ID" where("Object Type" = const(Page));
        }
    }

    keys
    {
        key(Key1; TableID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    procedure IsKeyField(TableID: Integer; FieldID: Integer): Boolean
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

        exit(false);
    end;
}

