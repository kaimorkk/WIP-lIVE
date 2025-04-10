
table 70189 "Vendor Filed Reg Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vendor No"; Code[30])
        {
            TableRelation = Vendor;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Procurement Document Type ID"; Code[30])
        {
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;
        }
        field(4; "Date Filed"; Date)
        {
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Certificate No."; Code[30])
        {
            Caption = 'External Document/Certificate No.';
            Description = 'External Document/Certificate No.';
        }
        field(7; "Issue Date"; Date)
        {
        }
        field(8; "Expiry Date"; Date)
        {
        }
        field(9; "File Name"; Text[50])
        {
            Caption = 'Specialized Provider Requirement';
        }
        field(10; "File Type"; Text[30])
        {
        }
        field(11; "File Extension"; Text[30])
        {
        }
        field(12; "Procurement Process"; Option)
        {
            OptionCaption = ',Registration,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional';
            OptionMembers = ,Registration,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional;
        }
        field(13; FileLink; Text[250])
        {
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1; "Vendor No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

