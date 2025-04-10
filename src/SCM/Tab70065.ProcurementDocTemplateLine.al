
table 70065 "Procurement Doc Template Line"
{
    Caption = 'Procurement Document Template Line';
    DrillDownPageID = "Procurement Doc Template Line";
    LookupPageID = "Procurement Doc Template Line";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[50])
        {
        }
        field(2; "Procurement Process"; Option)
        {
            OptionCaption = ',Registration,Prequalification,EOI Response,RFQ Response,ITT Response,Contract Issuance,Transactional';
            OptionMembers = ,Registration,Prequalification,"EOI Response","RFQ Response","ITT Response","Contract Issuance",Transactional;
        }
        field(3; "Procurement Document Type"; Code[30])
        {
            TableRelation = "Procurement Document Type".Code;

            trigger OnValidate()
            begin
                ProcDocType.Reset;
                ProcDocType.SetRange(Code, "Procurement Document Type");
                if ProcDocType.FindSet then begin
                    Description := ProcDocType.Description;
                end;
            end;
        }
        field(4; Description; Text[100])
        {
            Editable = false;
        }
        field(5; "Requirement Type"; Option)
        {
            OptionCaption = ',Mandatory,Optional';
            OptionMembers = ,Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Procurement Process", "Procurement Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcDocType: Record "Procurement Document Type";
}

