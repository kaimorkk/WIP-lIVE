TableExtension 52193696 tableextension52193696 extends "FA Posting Group" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Code(Field 1)".

        field(50000;"Depreciation Method";Option)
        {
            Caption = 'Depreciation Method';
            OptionCaption = 'Straight-Line,Declining-Balance 1,Declining-Balance 2,DB1/SL,DB2/SL,User-Defined,Manual';
            OptionMembers = "Straight-Line","Declining-Balance 1","Declining-Balance 2","DB1/SL","DB2/SL","User-Defined",Manual;

            trigger OnValidate()
            begin

                case "Depreciation Method" of
                  "depreciation method"::"Straight-Line":
                   begin
                   end;
                  "depreciation method"::"Declining-Balance 1",
                  "depreciation method"::"Declining-Balance 2":
                    begin
                      "Straight-Line %" := 0;
                    end;
                  "depreciation method"::"DB1/SL",
                  "depreciation method"::"DB2/SL":
                    begin
                    end;
                  "depreciation method"::"User-Defined":
                    begin
                      "Straight-Line %" := 0;
                    end;
                  "depreciation method"::Manual:
                    begin
                      "Straight-Line %" := 0;
                    end;
                end;
            end;
        }
        field(50001;"Straight-Line %";Decimal)
        {
            Caption = 'Straight-Line %';
            DecimalPlaces = 2:8;
            MinValue = 0;
        }
    }
}

