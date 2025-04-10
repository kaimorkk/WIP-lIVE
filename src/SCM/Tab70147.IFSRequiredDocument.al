Table 70147 "IFS Required Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Procurement Document Type ID"; Code[30])
        {
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;

            trigger OnValidate()
            begin
                ProcurementDocumentType.Reset;
                ProcurementDocumentType.SetRange(Code, "Procurement Document Type ID");
                if ProcurementDocumentType.FindSet then begin
                    Description := ProcurementDocumentType.Description;
                    "Track Certificate Expiry" := ProcurementDocumentType."Track Certificate Expiry";
                    "Special Group Requirement" := ProcurementDocumentType."Special Group Requirement";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Track Certificate Expiry"; Boolean)
        {
            Description = 'Used to mark documents where expiry dates are important hence have to be tracked for each vendor as a compliance requirement during vendor prequalification/registratiand EOI processes. The field shall be updated on validation of the Procurement Document Type ID (System picks value from Procurement Document Type Table)';
        }
        field(5; "Requirement Type"; Option)
        {
            OptionCaption = ',Mandatory,Optional';
            OptionMembers = ,Mandatory,Optional;
        }
        field(6; "Special Group Requirement"; Boolean)
        {
            Description = 'All special group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
        field(7; "Specialized Provider Req"; Boolean)
        {
            Caption = 'Specialized Provider Requirement';
            Description = 'All Contractor group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
    }

    keys
    {
        key(Key1; "Document No", "Procurement Document Type ID", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementDocumentType: Record "Procurement Document Type";
}

