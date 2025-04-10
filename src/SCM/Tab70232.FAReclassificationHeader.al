
table 70232 "FA Reclassification Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;
        }
        field(2; Date; Date)
        {
        }
        field(3; "No. Series"; Code[20])
        {
        }
        field(4; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(5; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = filter("Fixed Asset")) "Fixed Asset" where("Asset Purchase Groups" = filter(true));

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange("No.", "Account No.");
                if FixedAsset.FindFirst then begin
                    "Account Name" := FixedAsset.Description;
                    "FA SubClass" := FixedAsset."FA Subclass Code";
                    FADepreciationBook.Reset;
                    FADepreciationBook.SetRange("FA No.", "Account No.");
                    if FADepreciationBook.FindFirst then begin
                        FADepreciationBook.CalcFields("Book Value");
                        "Total Amount" := FADepreciationBook."Book Value";
                    end;
                end
            end;
        }
        field(6; "Account Name"; Text[70])
        {
            Editable = false;
        }
        field(7; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(8; Posted; Boolean)
        {
            Editable = false;
        }
        field(9; "Posted By"; Code[50])
        {
            Editable = false;
        }
        field(10; "Posted Date"; Date)
        {
            Editable = false;
        }
        field(11; "Posting Date"; Date)
        {
        }
        field(12; "Total Amount"; Decimal)
        {
            Editable = false;
        }
        field(13; "Total ReClass Amount"; Decimal)
        {
            CalcFormula = sum("FA Reclass Lines"."Reclass. Acq Amount" where("Header No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(15; "FA SubClass"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        FASetup.Get();
        FASetup.TestField("Reclass. Voucher Nos.");
        if "No." = '' then
            NoSeriesMgt.InitSeries(FASetup."Reclass. Voucher Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        "Created By" := UserId;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FixedAsset: Record "Fixed Asset";
        FADepreciationBook: Record "FA Depreciation Book";
}

