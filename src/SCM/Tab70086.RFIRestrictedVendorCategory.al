
table 70086 "RFI Restricted Vendor Category"
{
    DrillDownPageID = "Supplier Category";
    LookupPageID = "Supplier Category";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
            Description = 'Linked to RFI Table (Invitation For Prequalification)';
            NotBlank = true;
        }
        field(2; "Prequalification Category ID"; Code[30])
        {
            Description = 'Linked to Prequalification Category Table';
            TableRelation = "Procurement Category".Code;
        }
        field(3; "Restricted Vendor Category ID"; Code[30])
        {
            Description = 'Linked to Vendor Category Table';
            TableRelation = "Special Vendor Category".Code;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Document Type"; Option)
        {
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Prequalification Category ID", "Restricted Vendor Category ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

