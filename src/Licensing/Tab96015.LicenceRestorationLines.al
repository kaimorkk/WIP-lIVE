table 96015 "Licence Restoration Lines"
{
    Caption = 'Licence Restoration Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "License No."; Code[20])
        {
            Caption = 'License No.';
        }
        field(4; "Category Code"; Code[50])
        {
            Caption = 'Category Code';
        }
        field(5; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(6; "Category Name"; Text[100])
        {
            Caption = 'Category Name';
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount ';
        }
        field(8; "Amount (LCY)"; Decimal)
        {
            Caption = 'Amount (LCY)';
        }
        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
        }
        field(10; "Registration ID"; Code[20])
        {
            Caption = 'Registration ID';
        }
        field(11; "Grounds for Removal"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Deregistered Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Licence Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Licence Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        RestorationLines.Reset();
        if RestorationLines.FindLast() then
            Rec."Line No." := RestorationLines."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        RestorationLines: Record "Licence Restoration Lines";
}
