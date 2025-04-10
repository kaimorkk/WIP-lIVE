table 96006 "Licence Reg. Practice Agencies"
{
    Caption = 'Practice Agencies Summary';
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
        field(3; "Firm No."; Code[50])
        {
            Caption = 'Firm No.';
        }
        field(4; "Agency Name"; Text[100])
        {
            Caption = 'Agency Name';
        }
        field(5; "Agency Registration No."; Code[50])
        {
            Caption = 'Agency Registration No.';
        }
        field(6; "Firm Licence No."; Code[50])
        {
            Caption = 'Firm Licence No.';
        }
        field(7; "Firm Annual Licence No."; Code[50])
        {
            Caption = 'Firm Annual Licence No.';
        }
        field(8; Designation; Text[100])
        {
            Caption = 'Designation';
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
        Agencies.Reset();
        if Agencies.FindLast() then
            Rec."Line No." := Agencies."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        Agencies: Record "Licence Reg. Practice Agencies";
}
