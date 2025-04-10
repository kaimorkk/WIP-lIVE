table 96001 "Licence Practice Categories"
{
    Caption = 'Licence Practice Categories';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(4; "Practice Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Renewal Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Restoration Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        LicenseProcessing.fnCreateCategoryAsItem(Rec);
    end;

    trigger OnModify()
    begin
        LicenseProcessing.fnCreateCategoryAsItem(Rec);
    end;

    trigger OnDelete()
    begin

    end;

    var
        LicenseProcessing: Codeunit "Licensing Portal";
}
