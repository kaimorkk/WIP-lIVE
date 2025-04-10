
table 85040 "BoQ Template Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Boq Header"; Code[30])
        {
            TableRelation = "Boq Template  Header";
        }
        field(3; Examination; Code[10])
        {
            // TableRelation = Courses;
        }
        field(4; Type; Option)
        {
            OptionCaption = ',G/L Account,Item,Charge(Item),Fixed Asset';
            OptionMembers = ,"G/L Account",Item,"Charge(Item)","Fixed Asset";
        }
        field(5; "No."; Code[10])
        {
            TableRelation = if (Type = filter("G/L Account")) "G/L Account"
            else
            if (Type = filter(Item)) Item
            else
            if (Type = filter("Charge(Item)")) Item
            else
            if (Type = filter("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                if Type = Type::"Charge(Item)" then begin
                    if Item.Get("No.") then
                        Description := Item.Description;
                end;
                if Type = Type::"G/L Account" then begin
                    if GLAccount.Get("No.") then
                        Description := GLAccount.Name;
                end;

                if Type = Type::Item then begin
                    if Item.Get("No.") then
                        Description := Item.Description;
                end;

                if Type = Type::"Fixed Asset" then begin
                    if FixedAsset.Get("No.") then
                        Description := FixedAsset.Description;
                end;
            end;
        }
        field(6; Description; Text[30])
        {
        }
        field(7; "Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(8; "Amount Excl. VAT"; Decimal)
        {
        }
        field(9; "Shortcut Dimension 1 Code"; Code[10])
        {
            TableRelation = Dimension;
        }
        field(10; "Shortcut Dimension 2 Code"; Code[10])
        {
            TableRelation = Dimension;
        }
        field(11; Variant; Code[10])
        {
        }
        field(12; "Dimension Set ID"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Boq Header", Examination)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
        FixedAsset: Record "Fixed Asset";
        GLAccount: Record "G/L Account";
}

