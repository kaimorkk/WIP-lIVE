
table 70088 "RFI Required Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
        field(2; "Document No"; Code[20])
        {
            TableRelation = "Request For Information".Code;
        }
        field(3; "Procurement Document Type ID"; Code[30])
        {
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Track Certificate Expiry"; Boolean)
        {
            CalcFormula = lookup("Procurement Document Type"."Track Certificate Expiry" where(Code = field("Procurement Document Type ID")));
            Description = 'Used to mark documents where expiry dates are important hence have to be tracked for each vendor as a compliance requirement during vendor prequalification/registratiand EOI processes. The field shall be updated on validation of the Procurement Document Type ID (System picks value from Procurement Document Type Table)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Requirement Type"; Option)
        {
            OptionCaption = ',Mandatory,Optional';
            OptionMembers = ,Mandatory,Optional;
        }
        field(7; "Special Group Requirement"; Boolean)
        {
            Description = 'All special group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
        field(8; "Specialized Provider Req"; Boolean)
        {
            Caption = 'Specialized Provider Requirement';
            Description = 'All Contractor group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Procurement Document Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

