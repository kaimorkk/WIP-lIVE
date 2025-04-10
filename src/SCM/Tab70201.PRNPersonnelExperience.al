
table 70201 "PRN Personnel Experience"
{
    Caption = 'IFS Staff Min Experience';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[50])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Staff Role Code"; Code[50])
        {
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Experience Category"; Option)
        {
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(6; "Minimum Years of Experience"; Decimal)
        {
        }
        field(7; "Minimum Experience Req"; Text[100])
        {
            Caption = 'Minimum Experience Requirements';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Staff Role Code", "Experience Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

