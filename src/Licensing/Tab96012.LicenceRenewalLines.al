table 96012 "Licence Renewal Lines"
{
    Caption = 'Licence Renewal Lines';
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
        field(3; "Licence ID"; Code[20])
        {
            Caption = 'Licence ID';
        }
        field(4; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(5; "Category Code"; Code[50])
        {
            TableRelation = "Licence Practice Categories";

            trigger OnValidate()
            begin
                
            end;
        }
        field(6; "Category Name"; Text[100])
        {
            TableRelation = "Licence Practice Categories".Name;
            ValidateTableRelation = false;
        }
        field(7; "Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Licence Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Licence Expiry Date"; Date)
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
        RenewLines.Reset();
        if RenewLines.FindLast() then
            Rec."Line No." := RenewLines."Line No." + 1
        else
            Rec."Line No." := 1;
    end;

    var
        RenewLines: Record "Licence Renewal Lines";
        
}
