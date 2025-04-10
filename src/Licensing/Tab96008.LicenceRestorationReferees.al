table 96008 "Licence Restoration Referees"
{
    Caption = 'Licence Restoration Referees';
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
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(5; "E-Mail"; Text[80])
        {
            Caption = 'EMail';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(6; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(7; "Address 2"; Text[100])
        {
            Caption = 'Address 2';
        }
        field(8; Profession; Text[100])
        {
            Caption = 'Profession';
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
        Referees.Reset();
        if Referees.FindLast() then
            Rec."Line No." := Referees."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        Referees: Record "Licence Restoration Referees";
}
