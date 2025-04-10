
table 70233 "FA Reclass Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Header No."; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = filter("Fixed Asset")) "Fixed Asset" where("Asset Purchase Groups" = filter(false),
                                                                                           "FA Subclass Code" = field("FA SubClass"));

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange("No.", "Account No.");
                if FixedAsset.FindFirst then begin
                    "Account Name" := FixedAsset.Description;
                    "Posting Group" := FixedAsset."FA Posting Group";
                end
            end;
        }
        field(5; "Account Name"; Text[70])
        {
        }
        field(6; "Reclass. Acq Amount"; Decimal)
        {
        }
        field(7; "Reclass. Acq Amount %"; Decimal)
        {
        }
        field(8; "Depreciation Book"; Code[30])
        {
        }
        field(9; "Posting Group"; Code[30])
        {
            TableRelation = "FA Posting Group";
        }
        field(10; "FA SubClass"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Header No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        // FAReclassificationHeader.RESET;
        // FAReclassificationHeader.SETRANGE("No.","Header No.");
        // IF FAReclassificationHeader.FIND ('-') THEN BEGIN
        //    "FA SubClass":=FAReclassificationHeader."FA SubClass";
        //   MODIFY;
        // END;
    end;

    var
        FixedAsset: Record "Fixed Asset";
        FAReclassificationHeader: Record "FA Reclassification Header";
}

