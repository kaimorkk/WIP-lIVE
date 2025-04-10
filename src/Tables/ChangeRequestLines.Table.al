Table 52193657 "Change Request Lines"
{

    fields
    {
        field(1;"Change Request No";Code[20])
        {
            TableRelation = "Change Request";
        }
        field(2;"Primary Key";Code[20])
        {

            trigger OnLookup()
            begin
                
                case "Table ID" of
                  Database::Customer:
                   begin
                      // MemberRec.SETRANGE("Vendor Type",MemberRec."Vendor Type"::Member);
                    if Page.RunModal(22,MemberRec)=Action::LookupOK then begin
                       RecRef.Open(23);
                       FldRef:=RecRef.Field(1);
                       FldRef.SetRange(MemberRec."No.");
                       RecRef.Find('-');
                       FldRef:=RecRef.Field(Field);
                        /*IF FORMAT(FldRef.TYPE) = 'Option' THEN
                          "Old Value" := MigrationMgt.GetRelationInfo;
                        ELSE
                          "Old Value" := FORMAT(FldRef.VALUE); */
                      RecRef.Close;
                      "Primary Key":=MemberRec."No.";
                    end;
                   end;
                 end;

            end;
        }
        field(3;"Old Value";Text[250])
        {
            Editable = false;
        }
        field(4;"New Value";Text[250])
        {

            trigger OnValidate()
            begin
                RecRef.Open("Table ID",true);
                FldRef:=RecRef.Field(Field);
                //ErrorText := MigrationMgt.EvaluateValue(FldRef,"New Value");
                if (ErrorText <> '') then
                  Error(ErrorText);
                
                /*IF FORMAT(FldRef.TYPE) = 'Option' THEN
                  "New Value" := MigrationMgt.GetOptionString(FldRef,FORMAT(FldRef.VALUE))
                ELSE
                  "New Value" := FORMAT(FldRef.VALUE); */

            end;
        }
        field(5;"Table ID";Integer)
        {
        }
        field(6;"Line No";Integer)
        {
        }
        field(7;"Field";Integer)
        {
            TableRelation = "Change Values Field".FieldID where (Include=const(true),
                                                                 TableID=field("Table ID"));

            trigger OnValidate()
            begin
                if ChangeValuesField.Get("Table ID",Field) then begin
                   ChangeValuesField.CalcFields("Field Name");
                   "Field Name":=ChangeValuesField."Field Name";
                end;
            end;
        }
        field(8;"Field Name";Text[80])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Change Request No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ChangeValuesField: Record "Change Values Field";
        MemberRec: Record Customer;
        FldRef: FieldRef;
        RecRef: RecordRef;
        MigrationMgt: Codeunit "Config. Package Management";
        ErrorText: Text[250];
}

