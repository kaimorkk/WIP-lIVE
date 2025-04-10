
table 70063 "Procurement Document Type"
{
    Caption = 'Procurement Document Type';
    LookupPageID = "Procurement Document Type";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Document Category"; Option)
        {
            OptionCaption = ',Statutory,Regulatory,Accreditation/Professional,Supplier-Internal';
            OptionMembers = ,Statutory,Regulatory,"Accreditation/Professional","Supplier-Internal";
        }
        field(4; "Track Certificate Expiry"; Boolean)
        {
            Description = 'Used to mark documents where expiry dates are important hence have to be tracked for each vendor as a compliance requirement during vendor registration and management';
        }
        field(5; "Document Class"; Option)
        {
            Description = 'Used to classify Documents based on what stage they fall under the P2P cycle';
            OptionCaption = 'Pre-Contract Stage,Contract Stage,Post-Contract/Transactional';
            OptionMembers = "Pre-Contract Stage","Contract Stage","Post-Contract/Transactional";
        }
        field(6; "Issuing Agency Code"; Code[20])
        {
            TableRelation = Contact;
        }
        field(7; "Local Verification URL"; Text[250])
        {
        }
        field(8; Blocked; Boolean)
        {
        }
        field(9; "Special Group Requirement"; Boolean)
        {
            Description = 'All special group documents shall automatically update the Requirement Type field to OPTIONAL';
        }
        field(10; "No. of Filed RFI-Response"; Integer)
        {
            CalcFormula = count("RFI Response Filed Document" where("Procurement Document Type ID" = field(Code)));
            Caption = 'No. of Filed RFI-Response Records';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Filed Bid Response"; Integer)
        {
            CalcFormula = count("Bid Filed Document" where("Procurement Document Type ID" = field(Code)));
            Caption = 'No. of Filed Bid Response';
            Description = 'No. of Filed RFI-Response Records';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. of Filed Registration Rec"; Integer)
        {
            CalcFormula = count("Vendor Filed Reg Document" where("Procurement Document Type ID" = field(Code)));
            Caption = 'No. of Filed Registration Records';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

