
table 72024 "BoQ Template2"
{
    Caption = 'Standard Purchase Code';
    DataCaptionFields = "Code", Description;
    //LookupPageID = "BoQ Templates1";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Status; Option)
        {
            OptionCaption = ' ,New,Certified,Blocked';
            OptionMembers = " ",New,Certified,Blocked;
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            var
                Currency: Record Currency;
                Currency2: Record Currency;
                ConfirmManagement: Codeunit "Confirm Management";
            begin
                // if not Currency.Get(Status) then
                //   Currency.InitRoundingPrecision;
                // if not Currency2.Get(xRec.Status) then
                //   Currency2.InitRoundingPrecision;

                // if Currency."Amount Rounding Precision" <> Currency2."Amount Rounding Precision" then begin
                //   StdPurchLine.Reset;
                //   StdPurchLine.SetRange("Standard Purchase Code",Code);
                //   StdPurchLine.SetRange(Type,StdPurchLine.Type::"G/L Account");
                //   StdPurchLine.SetFilter("Amount Excl. VAT",'<>%1',0);
                //   if StdPurchLine.Find('-') then begin
                //     // if not ConfirmManagement.ConfirmProcess(
                //     //      StrSubstNo(
                //     //        Text001,FieldCaption(Status),StdPurchLine.FieldCaption("Amount Excl. VAT"),
                //     //        FieldCaption(Status)),true)
                //     then
                //       Error(Text002);
                //     repeat
                //       StdPurchLine."Amount Excl. VAT" :=
                //         ROUND(StdPurchLine."Amount Excl. VAT",Currency."Amount Rounding Precision");
                //       StdPurchLine.Modify;
                //     until StdPurchLine.Next = 0;
                //   end;
                // end;
                // MODIFY;
            end;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        StdPurchLine.Reset;
        StdPurchLine.SetRange("Standard Purchase Code", Code);
        StdPurchLine.DeleteAll(true);
    end;

    var
        StdPurchLine: Record "Standard Purchase Line";
        Text001: label 'If you change the %1, the %2 will be rounded according to the new %3.';
        Text002: label 'The update has been interrupted to respect the warning.';
}

