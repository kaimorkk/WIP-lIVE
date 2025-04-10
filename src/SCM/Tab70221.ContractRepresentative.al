
table 70221 "Contract Representative"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Representative Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Designation/Title"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Procuring Entity Authorizer,Procuring Entity Witness,Vendor Authorizer,Vendor Witness';
            OptionMembers = ,"Procuring Entity Authorizer","Procuring Entity Witness","Vendor Authorizer","Vendor Witness";
        }
        field(6; "Contract Signing Role"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Executed on behalf of"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Execution Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

