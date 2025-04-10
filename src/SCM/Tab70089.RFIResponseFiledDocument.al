
table 70089 "RFI Response Filed Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ',IFP Response,EOI Response';
            OptionMembers = ,"IFP Response","EOI Response";
        }
        field(2; "Document No"; Code[20])
        {
            TableRelation = "RFI Response"."Document No.";

            trigger OnValidate()
            begin
                RFIResponse.Reset;
                RFIResponse.SetRange("Document No.", "Document No");
                if RFIResponse.FindSet then begin
                    "Vendor No" := RFIResponse."Vendor No.";
                end;
            end;
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Date Filed"; Date)
        {
        }
        field(5; "Vendor No"; Code[30])
        {
            TableRelation = Vendor;
        }
        field(6; "Procurement Document Type ID"; Code[100])
        {
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;

            trigger OnValidate()
            begin
                ProcDocType.Reset;
                ProcDocType.SetRange(Code, "Procurement Document Type ID");
                if ProcDocType.FindSet then
                    "Document Description" := ProcDocType.Description
            end;
        }
        field(7; "Document Description"; Text[250])
        {
        }
        field(8; "Certificate No."; Code[30])
        {
            Caption = 'External Document/Certificate No.';
            Description = 'External Document/Certificate No.';
        }
        field(9; "Issue Date"; Date)
        {
        }
        field(10; "Expiry Date"; Date)
        {
        }
        field(11; "File Name"; Text[100])
        {
            Caption = 'Specialized Provider Requirement';
        }
        field(12; "File Type"; Text[30])
        {
        }
        field(13; "File Extension"; Text[30])
        {
        }
        field(14; "Procurement Process"; Option)
        {
            OptionCaption = ',Registration,Prequalification,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional';
            OptionMembers = ,Registration,Prequalification,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional;
        }
        field(15; "Document Link"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RFIResponse: Record "RFI Response";
        ProcDocType: Record "Procurement Document Type";
}

