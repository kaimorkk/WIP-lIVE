table 96007 "Licence Reg Proc Professionals"
{
    Caption = 'Procurement Professionals Summary';
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
        field(4; Address; Text[80])
        {
            Caption = 'Address';
        }
        field(5; "Address 2"; Text[80])
        {
            Caption = 'Address 2';
        }
        field(6; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(7; "E-Mail"; Text[80])
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
        Prof.Reset();
        if Prof.FindLast() then
            Rec."Line No." := Prof."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        Prof: Record "Licence Reg Proc Professionals";
}
