table 96004 "Professional Inst. Membership"
{
    Caption = 'Licence Reg. Membership Summary';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Membership Number"; Code[50])
        {
            Caption = 'Membership Number';
        }
        field(4; "Membership Name"; Text[100])
        {
            Caption = 'Membership Name';
        }
        field(5; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
        }
        field(6; "Licence Number"; Code[50])
        {
            Caption = 'Licence Number';
        }
        field(7; "Annual Licence Date"; Date)
        {
            Caption = 'Annual Licence Date';
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
        Membership.Reset();
        if Membership.FindLast() then
            Rec."Line No." := Membership."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        Membership: Record "Professional Inst. Membership";
}
