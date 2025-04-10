
table 69063 "Benefits Matrix Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Benefit Type"; Code[30])
        {
            TableRelation = "Benefits Types";

            trigger OnValidate()
            begin
                if BenefitsTypes.Get("Benefit Type") then
                    "Benefit Description" := BenefitsTypes.Description;
            end;
        }
        field(3; "Benefit Description"; Text[50])
        {
        }
        field(4; "Beneficiary Category"; Option)
        {
            OptionCaption = 'Spouse,Primary Beneficiary,Child,Biological Parent';
            OptionMembers = Spouse,"Primary Beneficiary",Child,"Biological Parent";
        }
        field(5; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Benefit Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Benefit Description", "Beneficiary Category")
        {
        }
    }

    var
        BenefitsTypes: Record "Benefits Types";
}

